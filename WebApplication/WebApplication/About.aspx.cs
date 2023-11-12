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

        protected void Button1_Click(object sender, EventArgs e)
        {
            var p = new Pelicula()
            {
                titulo = tbtitulo.Text,
                genero = ddgenero.Text,
                Estreno = tbestreno.Text,
                Pais = tbpais.Text,
                Duracion = int.Parse(tbduracion.Text),
                Director = tbdirector.Text,
                Calificacion = tbcalificacion.Text,
                Idioma = tbidioma.Text,
                Restriccion = int.Parse(tbrestriccion.Text),
                Productora = tbproductora.Text
            };

            PeliculaService.agregarPelicula(p);
            this.actualziarTabla();

        }

        protected void ButtonEliminar_Click(object sender, EventArgs e)
        {
            PeliculaService.eliminarPelicula(4);
            this.actualziarTabla();
        }


        protected void ButtonFiltrar_Click(object sender, EventArgs e)
        {
            this.filtrarTabla();
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

            var listaFiltra = ListaPeliculas.Where(p => p.titulo.IndexOf(TextBoxFilterTitulo.Text, StringComparison.OrdinalIgnoreCase) >= 0).ToList();   

            GridViewPeliculas.DataSource = listaFiltra;
            GridViewPeliculas.DataBind();
        }

    }
}