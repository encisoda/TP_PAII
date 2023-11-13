using Servicio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication
{
    public partial class ABM : System.Web.UI.Page
    {
        public static string sID = "-1";
        public static string sOpc = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                var generos = GeneroService.getGenerosDes();
                foreach (string genero in generos)
                {
                    ddgenero.Items.Add(genero);
                }

                if (Request.QueryString["id"] != null)
                {
                    sID = Request.QueryString["id"].ToString();
                    CargarDatos(sID);
                }

                if (Request.QueryString["op"] != null)
                {
                    sOpc = Request.QueryString["op"].ToString();

                    switch (sOpc)
                    {
                        case "A":
                            this.lbltitulo.Text = "Ingresar nuevo usuario";
                            this.BtnCreate.Visible = true;
                            break;
                        case "M":
                            this.lbltitulo.Text = "Modificar usuario";
                            this.BtnUpdate.Visible = true;
                            break;
                    }
                }
            }
        }

        protected void BtnAgregar_Click(object sender, EventArgs e)
        {

            var pelicula = this.PeliculaSeteada();

            PeliculaService.agregarPelicula(pelicula);
            Response.Redirect("About.aspx");

        }

        protected void BtnActualizar_Click(object sender, EventArgs e)
        {


            var pelicula = this.PeliculaSeteada();
            pelicula.idPelicula = int.Parse(Request.QueryString["id"]);

            PeliculaService.actualizarPelicula(pelicula);
            Response.Redirect("About.aspx");

        }

        protected void CargarDatos(string id)
        {

            Pelicula pelicula;
            pelicula = PeliculaService.getPeliculaID(int.Parse(id));          

            ControlFormulario.tbtituloResultado = pelicula.titulo;
            //tbtitulo.Text = pelicula.titulo;
            ddgenero.SelectedValue = pelicula.genero;
            //tbestreno.Text = pelicula.Estreno.ToString("yyyy-MM-dd");
            tbestreno.Text = DateTime.Now.ToString(pelicula.Estreno);
            tbpais.Text = pelicula.Pais;
            tbproductora.Text = pelicula.Productora;
            tbduracion.Text = (pelicula.Duracion).ToString();
            tbdirector.Text = pelicula.Director;
            tbcalificacion.Text = pelicula.Calificacion;
            tbidioma.Text = pelicula.Idioma;
            tbrestriccion.Text = (pelicula.Restriccion).ToString();

        }

        private Pelicula PeliculaSeteada()
        {
            var pelicula = new Pelicula()
            {
                titulo = ControlFormulario.tbtituloResultado,
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

            return pelicula;
        }

    }
}