using Servicio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication
{
    public partial class ABMGeneros : System.Web.UI.Page
    {
        public static string sID = "-1";
        public static string sOpc = "";
        private GeneroService _generoService;

        protected void Page_Load(object sender, EventArgs e)
        {
            _generoService = new GeneroService();

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
                            this.lbltitulo.Text = "Agregar genero";
                            this.BtnCreate.Visible = true;
                            break;
                        case "M":
                            this.lbltitulo.Text = "Modificar genero";
                            this.BtnUpdate.Visible = true;
                            break;
                    }
                }
            }
        }

        protected void CargarDatos(string id)
        {

            GeneroDTO genero = _generoService.getGeneroDTOById(int.Parse(id));

            ddgenero.Text = genero.genero;

        }

        protected void BtnAgregar_Click(object sender, EventArgs e)
        {

            var exist = _generoService.getGeneroByDesc(ddgenero.Text);

            if (exist == null)
            {
                var generoDTO = new GeneroDTO();
                generoDTO.genero = ddgenero.Text;

                _generoService.agregarGenero(generoDTO);
                Response.Redirect("Generos.aspx");
                return;
            }

            msjError.Text = "El Genero ingresado ya existe!";
            return;


        }

        protected void BtnActualizar_Click(object sender, EventArgs e)
        {

            var idGenero = int.Parse(Request.QueryString["id"]);
            var generoDTO = new GeneroDTO();

            generoDTO.idGenero = idGenero;
            generoDTO.genero = ddgenero.Text;

            _generoService.actualizarGenero(generoDTO);
            Response.Redirect("Generos.aspx");

        }
    }
}