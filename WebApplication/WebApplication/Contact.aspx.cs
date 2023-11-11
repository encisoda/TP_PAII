﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Datos;
using Servicio;

namespace WebApplication
{
    public partial class Contact : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            var p = new Pelicula()
            {
                titulo = "primera",
                genero = "Terror",
                Estreno = "20/12/2021",
                Pais = "Argentina",
                Duracion = 120,
                Director = "Daniel",
                Calificacion = "9",
                Idioma = "Español",
                Restriccion = 13,
                Productora = "La mejor"
            };

        PeliculaService.agregarPelicula(p);
            
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            var p2 = new Pelicula()
            {
                idPelicula = 1,
                titulo = "primera",
                genero = "Terror",
                Estreno = "20/12/2021",
                Pais = "Bolivia",
                Duracion = 120,
                Director = "Daniel",
                Calificacion = "9",
                Idioma = "Español",
                Restriccion = 18,
                Productora = "Laaaaaaaa"
            };

            PeliculaService.actualizarPelicula(p2);
        }


        protected void Button3_Click1(object sender, EventArgs e)
        {
            PeliculaService.eliminarPelicula(1);
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            var pelis = "";
            foreach (Pelicula peli in PeliculaService.listarPeliculas())
                pelis += peli.titulo;
            
            TextLista.Text = pelis;
        }
    }
}