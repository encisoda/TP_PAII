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
        private readonly IApplicationDbContext _context;
        private GeneroService _generoService;

        private Peliculas setDatosPeli(Peliculas peli, Pelicula pelicula, int idGenero) {

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

        //public PeliculaService(IApplicationDbContext context)
        //{
        //    _context = context;
        //}

        public PeliculaService()
        {
            _context = new Context();
            _generoService = new GeneroService();
        }

        public void agregarPelicula(Pelicula pelicula)
        {
            Peliculas newPeli = new Peliculas();

            Generos gen = _generoService.getGeneroByDesc(pelicula.genero);
                       
            Peliculas peli = this.setDatosPeli(newPeli, pelicula, gen.idGenero);

            _context.Peliculas.Add(peli);
            _context.SaveChanges();  
        }

        public void actualizarPelicula(Pelicula pelicula) 
        {

            Generos gen = _generoService.getGeneroByDesc(pelicula.genero);

            Peliculas peli = this.getPeliculaById(pelicula.idPelicula);

            this.setDatosPeli(peli, pelicula, gen.idGenero);

            _context.SaveChanges();
        }

        public void eliminarPelicula(int idPeli)
        {

            Peliculas peli = this.getPeliculaById(idPeli);

            _context.Peliculas.Remove(peli);
            _context.SaveChanges();
        }

        public List<Pelicula> listarPeliculas()
        {
            List<Peliculas> pelis = (from p in _context.Peliculas
                              select p).ToList();

            var peliculas = new List<Pelicula>();

            //Levanto todos los generos y luego en el for solo filtro el List 
            // sino deberia invocar dentro del for al contexto para pedir el Genero indicado
            // pero seria menos performante
            List<Generos> generos = _generoService.getGeneros();

            foreach (Peliculas item in pelis) 
            { 
                var p = new Pelicula();
                p.idPelicula = item.idPelicula;
                p.genero = generos.Where(g => g.idGenero == item.idGenero).FirstOrDefault().descripcion;
                p.titulo = item.titulo;
                p.Estreno = item.estreno?.ToString("dd/MM/yyyy");
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

        private Peliculas getPeliculaById(int idPeli)
        {

            Peliculas peli = (from p in _context.Peliculas
                              where p.idPelicula == idPeli
                              select p).FirstOrDefault();
            return peli;
        }

        public Pelicula getPeliculaID(int idPelicula) 
        {

            var peli = this.getPeliculaById(idPelicula);

            var gen = _generoService.getGeneroById(peli.idGenero);

            var p = new Pelicula();
            p.idPelicula = peli.idPelicula;
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
