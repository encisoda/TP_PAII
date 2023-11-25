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
    public class GeneroDTO
    {
        public int idGenero { get; set; }
        public string genero { get; set; }

    }
    public class GeneroService
    {
        private readonly IApplicationDbContext _context;
        public GeneroService()
        {
            _context = new Context(); 
        }

        // Devulve un objeto Generos filtrando por descripcion
        public Generos getGeneroByDesc(string generoDesc) { 

            Generos gen = (from g in _context.Generos
                           where g.descripcion == generoDesc
                           select g).FirstOrDefault();

            return gen;
        }

        //Devulve un objeto Generos filtrando por idGenero
        public Generos getGeneroById(int idGenero){

            Generos gen = (from g in _context.Generos
                           where g.idGenero == idGenero
                           select g).FirstOrDefault();

            return gen;
        }

        //Devulve una lista de objetos generos
        public List<Generos> getGeneros(){

            var generos = (from g in _context.Generos                           
                           select g).ToList();

            return generos;
        }

        //Devuelve una lista de las descripciones de los generos
        public List<string> getGenerosDes()
        {

            var generos = (from g in _context.Generos
                           select g).ToList();

            var descripciones = new List<string>();

            foreach (var g in generos)
            {
                descripciones.Add(g.descripcion);
            }

            return descripciones;
        }
        public List<GeneroDTO> getGenerosDTO()
        {
            List<Generos> generos = this.getGeneros();
            List<GeneroDTO> generosDTO = new List<GeneroDTO>();

            foreach (Generos gen in generos)
            {
                var g = new GeneroDTO();
                g.idGenero = gen.idGenero;
                g.genero = gen.descripcion;

                generosDTO.Add(g);
            }

            return generosDTO;
        }

        public void agregarGenero(GeneroDTO genero)
        {
            Generos newGenero = new Generos();

            int ultId = _context.Generos.Max(u => u.idGenero);

            newGenero.idGenero = ultId + 1;
            newGenero.descripcion = genero.genero;

            _context.Generos.Add(newGenero);
            _context.SaveChanges();
        }

        public void actualizarGenero(GeneroDTO genero)
        {
            Generos gen = this.getGeneroById(genero.idGenero);

            gen.descripcion = genero.genero;

            _context.SaveChanges();
        }

        public void eliminarGenero(int idGenero)
        {
            Generos gen = this.getGeneroById(idGenero);

            _context.Generos.Remove(gen);
            _context.SaveChanges();
        }


        public bool generoIsUsed(int idGenero)
        {
            Peliculas peli = (from p in _context.Peliculas
                              where p.idGenero == idGenero
                              select p).FirstOrDefault();
            return peli != null;

        }

        //Devulve un objeto Generos filtrando por idGenero
        public GeneroDTO getGeneroDTOById(int idGenero)
        {
            var gen = this.getGeneroById(idGenero);

            var generoDTO = new GeneroDTO();

            generoDTO.idGenero = gen.idGenero;
            generoDTO.genero = gen.descripcion;

            return generoDTO;
        }

    }
}
