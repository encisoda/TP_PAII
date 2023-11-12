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
                if (Request.QueryString["id"] != null)
                {
                    sID = Request.QueryString["id"].ToString();
                    CargarDatos(sID);
                    //tbdate.TextMode = TextBoxMode.DateTime;
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
                        case "D":
                            this.lbltitulo.Text = "Eliminar usuario";
                            this.BtnDelete.Visible = true;
                            break;
                    }
                }
            }
        }


        protected void BtnAgregar_Click(object sender, EventArgs e)
        {
            var p = new Pelicula()
            {
                //titulo = tbtitulo.Text,
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

            PeliculaService.agregarPelicula(p);
            Response.Redirect("About.aspx");

        }

        protected void BtnActualizar_Click(object sender, EventArgs e)
        {

            var pelicula = new Pelicula()
            {
                idPelicula = int.Parse(Request.QueryString["id"]),
                //titulo = tbtitulo.Text,
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

            PeliculaService.actualizarPelicula(pelicula);
            Response.Redirect("About.aspx");

        }

        protected void BtnEliminar_Click(object sender, EventArgs e)
        {

        }

        protected void CargarDatos(string id)
        {
            var ListaPeliculas = new List<Pelicula>();
            Pelicula pelicula;

            foreach (Pelicula peli in PeliculaService.listarPeliculas())
                ListaPeliculas.Add(peli);

            pelicula = ListaPeliculas.Where(p => p.idPelicula == int.Parse(id)).FirstOrDefault();

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

        protected void BtnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("About.aspx");
        }
    }
}