using Datos;
using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Metadata.Edm;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Servicio
{

    public class Pelicula
    {
        public int idPelicula { get; set; }
        public string titulo { get; set; }
        public string genero { get; set; }
        public string Estreno { get; set; }
        public string Pais { get; set; }
        public int Duracion { get; set; }
        public string Director { get; set; }
        public string Calificacion { get; set; }
        public string Idioma { get; set; }
        public int Restriccion { get; set; }
        public string Productora { get; set; }
    }


    public class PeliculaService
    {
        private static Peliculas setDatosPeli(Peliculas peli, Pelicula pelicula, int idGenero) {

            peli.idGenero = idGenero;
            peli.titulo = pelicula.titulo;
            peli.estreno = DateTime.Parse(pelicula.Estreno);
            peli.pais = pelicula.Pais;
            peli.duracion = pelicula.Duracion;
            peli.director = pelicula.Director;
            peli.calificación = pelicula.Calificacion;
            peli.Idioma = pelicula.Idioma;
            peli.restricción = pelicula.Restriccion;
            peli.productora = pelicula.Productora;

            return peli;
        }




        public static void agregarPelicula(Pelicula pelicula){

            Context ctx = new Context();
            Peliculas peli = new Peliculas();

            Generos gen = (from g in ctx.Generos
                       where g.descripcion == pelicula.genero
                       select g).FirstOrDefault();
            

            Peliculas p = PeliculaService.setDatosPeli(peli,pelicula, gen.idGenero);

            ctx.Peliculas.Add(p);
            ctx.SaveChanges();  
        }

        public static void actualizarPelicula(Pelicula pelicula) {
            Context ctx = new Context();

            Generos gen = (from g in ctx.Generos
                           where g.descripcion == pelicula.genero
                           select g).FirstOrDefault();

            Peliculas peli = (from p in ctx.Peliculas
                           where p.idPelicula == pelicula.idPelicula
                           select p).FirstOrDefault();

            PeliculaService.setDatosPeli(peli, pelicula, gen.idGenero);

            ctx.SaveChanges();

        }

        public static void eliminarPelicula(int idPeli){
            Context ctx = new Context();

            Peliculas peli = (from p in ctx.Peliculas
                              where p.idPelicula == idPeli
                              select p).FirstOrDefault();

            ctx.Peliculas.Remove(peli);
            ctx.SaveChanges();

        }

        public static List<Pelicula> listarPeliculas() {
            Context ctx = new Context();
            List<Peliculas> pelis = (from p in ctx.Peliculas
                              select p).ToList();

            var peliculas = new List<Pelicula>();



            List<Generos> generos = (from g in ctx.Generos
                           select g).ToList();

            foreach (Peliculas item in pelis) { 
                var p = new Pelicula();
                p.idPelicula = item.idPelicula;
                p.genero = generos.Where(g => g.idGenero == item.idGenero).FirstOrDefault().descripcion;
                p.titulo = item.titulo;
                p.Estreno = item.estreno.ToString();
                p.Pais = item.pais;
                p.Duracion = (int)item.duracion;
                p.Director = item.director;
                p.Calificacion = item.calificación;
                p.Idioma = item.Idioma;
                p.Restriccion = (int)item.restricción;
                p.Productora = item.productora;

                peliculas.Add(p);
            }

            return peliculas;
        }

    }
}
