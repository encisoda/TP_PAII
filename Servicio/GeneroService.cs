using Datos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Runtime.Remoting.Messaging;
using System.Text;
using System.Threading.Tasks;

namespace Servicio
{
    public class GeneroService
    {

        // Devulve un objeto Generos filtrando por descripcion
        public static Generos getGeneroByDesc(string generoDesc) { 
            Context ctx = new Context();

            Generos gen = (from g in ctx.Generos
                           where g.descripcion == generoDesc
                           select g).FirstOrDefault();

            return gen;
        }

        //Devulve un objeto Generos filtrando por idGenero
        public static Generos getGeneroById(int idGenero){
            Context ctx = new Context();

            Generos gen = (from g in ctx.Generos
                           where g.idGenero == idGenero
                           select g).FirstOrDefault();

            return gen;
        }

        //Devulve una lista de objetos generos
        public static List<Generos> getGeneros(){
            Context ctx = new Context();

            var generos = (from g in ctx.Generos                           
                           select g).ToList();

            return generos;
        }

        //Devuelve una lista de las descripciones de los generos
        public static List<string> getGenerosDes()
        {
            Context ctx = new Context();

            var generos = (from g in ctx.Generos
                           select g).ToList();

            var descripciones = new List<string>();

            foreach (var g in generos)
            {
                descripciones.Add(g.descripcion);
            }

            return descripciones;
        }





    }
}
