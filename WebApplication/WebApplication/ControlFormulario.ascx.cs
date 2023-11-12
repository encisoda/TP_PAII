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
        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}