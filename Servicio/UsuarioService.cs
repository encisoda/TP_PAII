using Datos;
using System;
using System.Data.Entity.Validation;
using System.Linq;
using System.Security.Cryptography;
using System.Text;

namespace Servicio
{
    public class UsuarioService
    {

        private readonly Context _context;

        public UsuarioService()
        {
            _context = new Context();
        }

        public (string, bool) validarLogin(string usuario, string password)
        {

            var usu = this.getUsuario(usuario);

            if (usu is null)
            {
                return ("El usuario no existe.", false);
            }
            else
            {

                //if (usu.pass == password){
                //  return (usuario, true);
                //}

                if (HashPassword(password) == usu.pass)
                {
                    return (usuario, true);
                }
            }

            return ("La password ingresada es incorrecta", false);

        }

        public Usuarios getUsuario(string usuario)
        {

            Usuarios usu = (from u in _context.Usuarios
                            where u.usuario == usuario
                            select u).FirstOrDefault();
            return usu;
        }

        public bool UsuarioExists(string usuario)
        {
            return _context.Usuarios.Any(u => u.usuario == usuario);
        }

        public bool RegistrarUsuario(string usuario, string password)
        {
            if (UsuarioExists(usuario))
            {
                return false;
            }

            string hashedPassword = HashPassword(password);

            Generos newGenero = new Generos();

            var nuevoUsuario = new Usuarios
            {
                usuario = usuario,
                pass = hashedPassword
            };

            int? ultId = _context.Usuarios.Max(u => (int?)u.idUsuario);

            nuevoUsuario.idUsuario = ultId.HasValue ? ultId.Value + 1 : 1;

            System.Diagnostics.Debug.WriteLine($"Nuevo Usuario: idUsuario = {nuevoUsuario.idUsuario}, Usuario = {nuevoUsuario.usuario}, Password = {nuevoUsuario.pass}");

            _context.Usuarios.Add(nuevoUsuario);

            try
            {
                _context.SaveChanges();
                return true;
            }
            catch (DbEntityValidationException ex)
            {
                foreach (var entityValidationError in ex.EntityValidationErrors)
                {
                    foreach (var validationError in entityValidationError.ValidationErrors)
                    {
                        System.Diagnostics.Debug.WriteLine($"Error en propiedad {validationError.PropertyName}: {validationError.ErrorMessage}");
                    }
                }

                System.Diagnostics.Debug.WriteLine(ex);

                throw;
            }
        }

        public static string HashPassword(string password)
        {
            using (SHA256 sha256 = SHA256.Create())
            {
                byte[] hashedBytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(password));
                string hashedPassword = BitConverter.ToString(hashedBytes).Replace("-", "").ToLower();

                string truncatedHash = hashedPassword.Substring(0, Math.Min(49, hashedPassword.Length));

                return truncatedHash;
            }
        }

    }
}

