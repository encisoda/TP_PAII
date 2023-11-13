using Servicio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                if (Session["Logeado"] != null && (bool)Session["Logeado"])
                {
                    Response.Redirect("Peliculas.aspx");
                }

            }
        }

        protected void BtnIngreso_Click(object sender, EventArgs e)
        {

            var resultadoLogin = UsuarioService.validarLogin(TextBoxUsuario.Text, TextBoxFilterPassword.Text);

            Session["Usuario"] = resultadoLogin.Item1.ToString();
            Session["Logeado"] = resultadoLogin.Item2;

            if ((bool)Session["Logeado"])
            {
                Response.Redirect("Peliculas.aspx");
            }
            else
            {
                LblMensajeError.Text = "Usuario o contraseña incorrecta";
            }

        }
    }
}