using Servicio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication
{
    public partial class Registro : Page
    {

        private UsuarioService _usuarioService;

        protected void Page_Load(object sender, EventArgs e)
        {
            _usuarioService = new UsuarioService();

            if (!IsPostBack)
            {

                if (Session["Logeado"] != null && (bool)Session["Logeado"])
                {
                    Response.Redirect("Peliculas.aspx");
                }

            }
        }

        protected void BtnRegistrar_Click(object sender, EventArgs e)
        {

            string usuario = TextBoxUsuario.Text;
            string password = TextBoxFilterPassword.Text;


            if (_usuarioService.UsuarioExists(usuario))
            {
                LblMensajeError.Text = "Error: El usuario ya existe.";
            }
            else
            {
                if (_usuarioService.RegistrarUsuario(usuario, password))
                {
                    LblMensajeError.Text = "Registro exitoso. ¡Bienvenido!";
                }
                else
                {
                    LblMensajeError.Text = "Error: No se pudo registrar al usuario.";
                }
            }

        }

        private bool IsValidUserRegistration(string usuario, string password)
        {

            if (string.IsNullOrEmpty(usuario))
            {
                LblMensajeError.Text = "Error: Por favor, ingrese un nombre de usuario.";
                return false;
            }

            if (password.Length < 6)
            {
                LblMensajeError.Text = "Error: La contraseña debe tener al menos 6 caracteres.";
                return false;
            }

            return true;

        }


    }
}
