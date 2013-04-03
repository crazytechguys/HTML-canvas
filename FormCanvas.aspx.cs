using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HTML_Canvas
{
   // [ScriptService]
    public partial class FormCanvas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        [WebMethod()]
        public static void Salvar(string Desenho)
        {

            var CaminhoImagem = "Desenho_" + DateTime.Now.ToString().Replace('/', '_').Replace(':','_') + ".png";

          
            using (FileStream fs = new FileStream( HttpContext.Current.Server.MapPath(CaminhoImagem), FileMode.Create))
            {
                using (BinaryWriter bw = new BinaryWriter(fs))
                {
                    byte[] bin = Convert.FromBase64String(Desenho);
                    bw.Write(bin);
                    bw.Close();
                }
            }
        }

    }
}