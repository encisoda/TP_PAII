USE [PELICULAS]
GO
/****** Object:  Table [dbo].[Generos]    Script Date: 11/11/2023 15:58:24 ******/
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
/****** Object:  Table [dbo].[Peliculas]    Script Date: 11/11/2023 15:58:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Peliculas](
	[idPelicula] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object:  Table [dbo].[Usuarios]    Script Date: 11/11/2023 15:58:25 ******/
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
INSERT [dbo].[Generos] ([idGenero], [descripcion]) VALUES (1, N'Terror')
GO
SET IDENTITY_INSERT [dbo].[Peliculas] ON 

INSERT [dbo].[Peliculas] ([idPelicula], [idGenero], [titulo], [estreno], [pais], [duracion], [director], [calificación], [Idioma], [restricción], [productora]) VALUES (3, 1, N'tercera Pelicula', CAST(N'2023-11-10T00:00:00.000' AS DateTime), N'Bolivia', 120, N'tito', N'mala', N'español', 13, N'micho')
INSERT [dbo].[Peliculas] ([idPelicula], [idGenero], [titulo], [estreno], [pais], [duracion], [director], [calificación], [Idioma], [restricción], [productora]) VALUES (4, 1, N'primera', CAST(N'2021-12-20T00:00:00.000' AS DateTime), N'Argentina', 120, N'Daniel', N'9', N'Español', 13, N'La mejor')
SET IDENTITY_INSERT [dbo].[Peliculas] OFF
GO
ALTER TABLE [dbo].[Peliculas]  WITH CHECK ADD FOREIGN KEY([idGenero])
REFERENCES [dbo].[Generos] ([idGenero])
GO
ALTER TABLE [dbo].[Peliculas]  WITH CHECK ADD FOREIGN KEY([idGenero])
REFERENCES [dbo].[Generos] ([idGenero])
GO
ALTER TABLE [dbo].[Peliculas]  WITH CHECK ADD  CONSTRAINT [FK_Peliculas_Peliculas] FOREIGN KEY([idPelicula])
REFERENCES [dbo].[Peliculas] ([idPelicula])
GO
ALTER TABLE [dbo].[Peliculas] CHECK CONSTRAINT [FK_Peliculas_Peliculas]
GO
