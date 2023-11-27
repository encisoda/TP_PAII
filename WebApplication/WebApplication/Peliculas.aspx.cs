using Datos;
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
        private PeliculaService _peliculaService;
        private GeneroService _generoService;

        protected void Page_Load(object sender, EventArgs e)
        {
            _peliculaService = new PeliculaService();
            _generoService = new GeneroService();
            TextBoxFilterTitulo.Focus();

            if (!IsPostBack)
            {             
                if (!(bool)Session["Logeado"])
                {
                    Response.Redirect("Default.aspx");
                }

                this.actualziarTabla();
                var generos = _generoService.getGenerosDes();
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

            List<Pelicula> ListaPeliculas = _peliculaService.listarPeliculas();
            GridViewPeliculas.DataSource = ListaPeliculas;
            GridViewPeliculas.DataBind();
        }

        private void filtrarTabla()
        {
            List<Pelicula> ListaPeliculas = _peliculaService.listarPeliculas();
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
            _peliculaService.eliminarPelicula(id);
            this.actualziarTabla();
        }

    }
}