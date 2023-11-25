using Datos;
using System;
using System.Linq;

namespace Servicio
{
    public class UsuarioService {

        private readonly IApplicationDbContext _context;
        
        public UsuarioService()
        {
            _context = new Context();
            
        }
        public (string, bool) validarLogin(string usuario, string password){

            var usu = this.getUsuario(usuario);

            if (usu is null) {
                return ("El usuario no existe.", false);
            }else{ 
                if (usu.pass == password){
                    return (usuario, true);
                }
            }   

            return ("La password ingresada es incorrecta", false);
            
        }

        private Usuarios getUsuario(string usuario){

            Usuarios usu= (from u in _context.Usuarios
                           where u.usuario == usuario
                           select u).FirstOrDefault();
            return usu;
        }

    }
}
