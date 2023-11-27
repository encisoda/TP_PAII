using Servicio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication
{
    public partial class Generos : System.Web.UI.Page
    {

        private GeneroService _generoService;

        protected void Page_Load(object sender, EventArgs e)
        {
            _generoService = new GeneroService();

            if (!IsPostBack)
            {

                if (!(bool)Session["Logeado"])
                {
                    Response.Redirect("Default.aspx");
                }

                this.actualziarTabla();
            }
        }

        protected void BtnCreate_Click(object sender, EventArgs e)
        {
            Response.Redirect("ABMGeneros.aspx?op=A");
        }

        protected void BtnModificar_Click(object sender, EventArgs e)
        {
            string id;
            LinkButton BtnConsultar = (LinkButton)sender;
            GridViewRow selectedrow = (GridViewRow)BtnConsultar.NamingContainer;
            id = selectedrow.Cells[0].Text;
            Response.Redirect("ABMGeneros.aspx?id=" + id + "&op=M");
        }

        protected void BtnBorrar_Click(object sender, EventArgs e)
        {

            LinkButton BtnConsultar = (LinkButton)sender;
            GridViewRow selectedrow = (GridViewRow)BtnConsultar.NamingContainer;
            int id = int.Parse(selectedrow.Cells[0].Text);

            var isUsed = _generoService.generoIsUsed(id);

            if (!isUsed)
            {
                _generoService.eliminarGenero(id);
                this.actualziarTabla();
                return;
            }

            string Msg = "No se puede eliminar el genero, esta siendo utilizado en una pelicula!";
            Response.Write(@"<script language='javascript'>alert('" + Msg + " .');</script>");

        }

        private void actualziarTabla()
        {
            var generos = _generoService.getGenerosDTO();
            GridViewGeneros.DataSource = generos;
            GridViewGeneros.DataBind();
        }
    }
}