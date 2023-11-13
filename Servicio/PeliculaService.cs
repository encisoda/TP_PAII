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
    //Esta Clase la usamos para crear el objeto persona con los datos
    //que vienen de la vista
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

        public static void agregarPelicula(Pelicula pelicula)
        {
            Context ctx = new Context();
            Peliculas newPeli = new Peliculas();

            Generos gen = GeneroService.getGeneroByDesc(pelicula.genero);
                       
            Peliculas peli = PeliculaService.setDatosPeli(newPeli, pelicula, gen.idGenero);

            ctx.Peliculas.Add(peli);
            ctx.SaveChanges();  
        }

        public static void actualizarPelicula(Pelicula pelicula) 
        {
            Context ctx = new Context();

            Generos gen = GeneroService.getGeneroByDesc(pelicula.genero);

            Peliculas peli = PeliculaService.getPeliculaById(ctx, pelicula.idPelicula);

            PeliculaService.setDatosPeli(peli, pelicula, gen.idGenero);

            ctx.SaveChanges();
        }

        public static void eliminarPelicula(int idPeli)
        {
            Context ctx = new Context();

            Peliculas peli = PeliculaService.getPeliculaById(ctx, idPeli);
            
            ctx.Peliculas.Remove(peli);
            ctx.SaveChanges();
        }

        public static List<Pelicula> listarPeliculas()
        {
            Context ctx = new Context();
            List<Peliculas> pelis = (from p in ctx.Peliculas
                              select p).ToList();

            var peliculas = new List<Pelicula>();

            //Levanto todos los generos y luego en el for solo filtro el List 
            // sino deberia invocar dentro del for al contexto para pedir el Genero indicado
            // pero seria menos performante
            List<Generos> generos = GeneroService.getGeneros();

            foreach (Peliculas item in pelis) 
            { 
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

        private static Peliculas getPeliculaById(Context ctx, int idPeli)
        {

            Peliculas peli = (from p in ctx.Peliculas
                              where p.idPelicula == idPeli
                              select p).FirstOrDefault();
            return peli;
        }

        public static Pelicula getPeliculaID(int idPelicula) 
        {
            Context ctx = new Context();
            var peli = PeliculaService.getPeliculaById(ctx, idPelicula);

            var gen = GeneroService.getGeneroById(peli.idGenero);

            //List<Generos> generos = GeneroService.getGeneros();

            var p = new Pelicula();
            p.idPelicula = peli.idPelicula;
            //p.genero = generos.Where(g => g.idGenero == peli.idGenero).FirstOrDefault().descripcion;
            p.genero = gen.descripcion;
            p.titulo = peli.titulo;
            p.Estreno = peli.estreno.ToString();
            p.Pais = peli.pais;
            p.Duracion = (int)peli.duracion;
            p.Director = peli.director;
            p.Calificacion = peli.calificación;
            p.Idioma = peli.Idioma;
            p.Restriccion = (int)peli.restricción;
            p.Productora = peli.productora;

            return p;
        }

    }
}
