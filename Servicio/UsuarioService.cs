using Datos;
using System;
using System.Linq;

namespace Servicio
{
    public class UsuarioService {

        public static (string, bool) validarLogin(string usuario, string password){

            Context ctx = new Context();

            var usu = UsuarioService.getUsuario(ctx, usuario);

            if (usu is null) {
                return ("El usuario no existe.", false);
            }else{ 
                if (usu.pass == password){
                    return (usuario, true);
                }
            }   

            return ("La password ingresada es incorrecta", false);
            
        }

        private static Usuarios getUsuario(Context ctx, string usuario){

            Usuarios usu= (from u in ctx.Usuarios
                           where u.usuario == usuario
                           select u).FirstOrDefault();
            return usu;
        }

    }
}
