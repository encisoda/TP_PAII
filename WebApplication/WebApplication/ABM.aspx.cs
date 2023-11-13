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
                if (!(bool)Session["Logeado"])
                {
                    Response.Redirect("Default.aspx");
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
                            this.lbltitulo.Text = "Agregar nuevo pelicula";
                            this.BtnCreate.Visible = true;
                            break;
                        case "M":
                            this.lbltitulo.Text = "Modificar pelicula";
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
            Response.Redirect("Peliculas.aspx");

        }

        protected void BtnActualizar_Click(object sender, EventArgs e)
        {

            var pelicula = this.PeliculaSeteada();
            pelicula.idPelicula = int.Parse(Request.QueryString["id"]);

            PeliculaService.actualizarPelicula(pelicula);
            Response.Redirect("Peliculas.aspx");

        }

        protected void CargarDatos(string id)
        {

            Pelicula pelicula;
            pelicula = PeliculaService.getPeliculaID(int.Parse(id));          

            ControlFormulario.tbtituloResultado = pelicula.titulo;
            ControlFormulario.ddgeneroResultado = pelicula.genero;
            ControlFormulario.tbestrenoResultado = DateTime.Parse(pelicula.Estreno).ToString("yyyy-MM-dd");
            ControlFormulario.tbpaisResultado = pelicula.Pais;
            ControlFormulario.tbproductoraResultado = pelicula.Productora;
            ControlFormulario.tbduracionResultado = (pelicula.Duracion).ToString();
            ControlFormulario.tbdirectorResultado = pelicula.Director;
            ControlFormulario.tbcalificacionResultado = pelicula.Calificacion;
            ControlFormulario.tbidiomaResultado = pelicula.Idioma;
            ControlFormulario.tbrestriccionResultado = (pelicula.Restriccion).ToString();

        }

        private Pelicula PeliculaSeteada()
        {
            var pelicula = new Pelicula()
            {
                titulo = ControlFormulario.tbtituloResultado,
                genero = ControlFormulario.ddgeneroResultado,
                Estreno = ControlFormulario.tbestrenoResultado,
                Pais = ControlFormulario.tbpaisResultado,
                Productora = ControlFormulario.tbproductoraResultado,
                Duracion = int.Parse(ControlFormulario.tbduracionResultado),
                Director = ControlFormulario.tbdirectorResultado,
                Calificacion = ControlFormulario.tbcalificacionResultado,
                Idioma = ControlFormulario.tbidiomaResultado,
                Restriccion = int.Parse(ControlFormulario.tbrestriccionResultado),

            };

            return pelicula;
        }

    }
}