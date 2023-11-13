using Servicio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication
{
    public partial class About : Page
    {
        public string HiddenFieldEliminarID { get;  set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                if (!(bool)Session["Logeado"])
                {
                    Response.Redirect("Default.aspx");
                }

                this.actualziarTabla();
                var generos = GeneroService.getGenerosDes();
                foreach (string genero in generos)
                {
                    DropDownListFiltro.Items.Add(genero);
                }

            }
        }

        protected void BtnCreate_Click(object sender, EventArgs e)
        {
            Response.Redirect("ABM.aspx?op=A");
        }

        protected void ButtonFiltrar_Click(object sender, EventArgs e)
        {
            this.filtrarTabla();
        }

        protected void BtnModificar_Click(object sender, EventArgs e)
        {
            string id;
            LinkButton BtnConsultar = (LinkButton)sender;
            GridViewRow selectedrow = (GridViewRow)BtnConsultar.NamingContainer;
            id = selectedrow.Cells[0].Text;
            Response.Redirect("ABM.aspx?id=" + id + "&op=M");
        }


        private void actualziarTabla() 
        {

            List<Pelicula> ListaPeliculas = PeliculaService.listarPeliculas();
            GridViewPeliculas.DataSource = ListaPeliculas;
            GridViewPeliculas.DataBind();
        }

        private void filtrarTabla()
        {
            List<Pelicula> ListaPeliculas = PeliculaService.listarPeliculas();
            var listaFiltra = ListaPeliculas.Where(p => p.titulo.IndexOf(TextBoxFilterTitulo.Text, StringComparison.OrdinalIgnoreCase) >= 0
            && p.genero.IndexOf(DropDownListFiltro.Text, StringComparison.OrdinalIgnoreCase) >= 0).ToList();   
            GridViewPeliculas.DataSource = listaFiltra;
            GridViewPeliculas.DataBind();
        }

        protected void ButtonLimpiarFiltrar_Click(object sender, EventArgs e)
        {
            TextBoxFilterTitulo.Text = "";
            DropDownListFiltro.SelectedValue = "";
            this.filtrarTabla();
        }

        protected void BtnBorrar_Click(object sender, EventArgs e)
        {
            int id;
            LinkButton BtnConsultar = (LinkButton)sender;
            GridViewRow selectedrow = (GridViewRow)BtnConsultar.NamingContainer;
            id = int.Parse(selectedrow.Cells[0].Text);
            PeliculaService.eliminarPelicula(id);
            this.actualziarTabla();
        }

    }
}