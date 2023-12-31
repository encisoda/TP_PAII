USE [PELICULAS]
GO
/****** Object:  Table [dbo].[Generos]    Script Date: 10/11/2023 22:03:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Generos](
	[idGenero] [int] NOT NULL,
	[descripcion] [nvarchar](50) NULL,
 CONSTRAINT [PK_Generos] PRIMARY KEY CLUSTERED 
(
	[idGenero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Peliculas]    Script Date: 10/11/2023 22:03:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Peliculas](
	[idPelicula] [int] NOT NULL,
	[idGenero] [int] NOT NULL,
	[titulo] [varchar](50) NULL,
	[estreno] [datetime] NULL,
	[pais] [varchar](50) NULL,
	[duracion] [int] NULL,
	[director] [varchar](50) NULL,
	[calificación] [varchar](50) NULL,
	[Idioma] [varchar](50) NULL,
	[restricción] [int] NULL,
	[productora] [varchar](50) NULL,
 CONSTRAINT [PK_Peliculas] PRIMARY KEY CLUSTERED 
(
	[idPelicula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 10/11/2023 22:03:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[idUsuario] [int] NOT NULL,
	[usuario] [varchar](50) NOT NULL,
	[pass] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Peliculas]  WITH CHECK ADD FOREIGN KEY([idGenero])
REFERENCES [dbo].[Generos] ([idGenero])
GO
ALTER TABLE [dbo].[Peliculas]  WITH CHECK ADD  CONSTRAINT [FK_Peliculas_Peliculas] FOREIGN KEY([idPelicula])
REFERENCES [dbo].[Peliculas] ([idPelicula])
GO
ALTER TABLE [dbo].[Peliculas] CHECK CONSTRAINT [FK_Peliculas_Peliculas]
GO
