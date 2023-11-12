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
                this.actualziarTabla();
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
            var ListaPeliculas = new List<Pelicula>();

            foreach (Pelicula peli in PeliculaService.listarPeliculas())
                ListaPeliculas.Add(peli);

            GridViewPeliculas.DataSource = ListaPeliculas;
            GridViewPeliculas.DataBind();
        }

        private void filtrarTabla()
        {
            var ListaPeliculas = new List<Pelicula>();

            foreach (Pelicula peli in PeliculaService.listarPeliculas())
                ListaPeliculas.Add(peli);

            var listaFiltra = ListaPeliculas.Where(p => p.titulo.IndexOf(TextBoxFilterTitulo.Text, StringComparison.OrdinalIgnoreCase) >= 0
            && p.genero.IndexOf(DropDownListFiltro.Text, StringComparison.OrdinalIgnoreCase) >= 0).ToList();   

            GridViewPeliculas.DataSource = listaFiltra;
            GridViewPeliculas.DataBind();
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