using Servicio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication
{
    public partial class ControlFormulario : System.Web.UI.UserControl
    {

        public string tbtituloResultado
        {
            get
            {
                return tbtitulo.Text;
            }
            set
            {
                tbtitulo.Text = value;
            }
        }

        public string ddgeneroResultado
        {
            get
            {
                return ddgenero.Text;
            }
            set
            {
                ddgenero.Items.Add(value);
                ddgenero.SelectedValue = value;
            }

        }

        public string tbestrenoResultado
        {
            get
            {
                return tbestreno.Text;
            }
            set
            {
                tbestreno.Text = value;
            }
        }

        public string tbpaisResultado
        {
            get
            {
                return tbpais.Text;
            }
            set
            {
                tbpais.Text = value;
            }
        }

        public string tbproductoraResultado
        {
            get
            {
                return tbproductora.Text;
            }
            set
            {
                tbproductora.Text = value;
            }
        }

        public string tbduracionResultado
        {
            get
            {
                return tbduracion.Text;
            }
            set
            {
                tbduracion.Text = value;
            }
        }

        public string tbdirectorResultado
        {
            get
            {
                return tbdirector.Text;
            }
            set
            {
                tbdirector.Text = value;
            }
        }

        public string tbcalificacionResultado
        {
            get
            {
                return tbcalificacion.Text;
            }
            set
            {
                tbcalificacion.Text = value;
            }
        }

        public string tbidiomaResultado
        {
            get
            {
                return tbidioma.Text;
            }
            set
            {
                tbidioma.Text = value;
            }
        }

        public string tbrestriccionResultado
        {
            get
            {
                return tbrestriccion.Text;
            }
            set
            {
                tbrestriccion.Text = value;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var generosService = new GeneroService();

                var generos = generosService.getGenerosDes();
                foreach (string genero in generos)
                {
                    ddgenero.Items.Add(genero);
                }

            }

        }
        protected void IrAGeneros(object sender, EventArgs e)
        {
            Response.Redirect("Generos.aspx");
        }
    }
}