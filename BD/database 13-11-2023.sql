USE [PELICULAS]
GO
/****** Object:  Table [dbo].[Generos]    Script Date: 13/11/2023 15:37:24 ******/
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
/****** Object:  Table [dbo].[Peliculas]    Script Date: 13/11/2023 15:37:25 ******/
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
/****** Object:  Table [dbo].[Usuarios]    Script Date: 13/11/2023 15:37:25 ******/
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
INSERT [dbo].[Generos] ([idGenero], [descripcion]) VALUES (2, N'Accion')
INSERT [dbo].[Generos] ([idGenero], [descripcion]) VALUES (3, N'Drama')
INSERT [dbo].[Generos] ([idGenero], [descripcion]) VALUES (4, N'Ciencia Ficcion')
GO
SET IDENTITY_INSERT [dbo].[Peliculas] ON 

INSERT [dbo].[Peliculas] ([idPelicula], [idGenero], [titulo], [estreno], [pais], [duracion], [director], [calificación], [Idioma], [restricción], [productora]) VALUES (26, 2, N'Gladiador', CAST(N'2000-10-10T00:00:00.000' AS DateTime), N'Reino Unido', 155, N'Ridley Scott', N'10', N'Inglés', 13, N'Scott Free Productions')
INSERT [dbo].[Peliculas] ([idPelicula], [idGenero], [titulo], [estreno], [pais], [duracion], [director], [calificación], [Idioma], [restricción], [productora]) VALUES (27, 2, N'Memento', CAST(N'2000-09-05T00:00:00.000' AS DateTime), N'Estados Unidos', 113, N'Christopher Nolan', N'9', N'Inglés', 13, N'Summit Entertainment')
INSERT [dbo].[Peliculas] ([idPelicula], [idGenero], [titulo], [estreno], [pais], [duracion], [director], [calificación], [Idioma], [restricción], [productora]) VALUES (28, 1, N'Aliens', CAST(N'1986-09-03T00:00:00.000' AS DateTime), N'Estados Unidos', 137, N'James Cameron', N'9', N'Inglés', 16, N'Brandywine Productions')
INSERT [dbo].[Peliculas] ([idPelicula], [idGenero], [titulo], [estreno], [pais], [duracion], [director], [calificación], [Idioma], [restricción], [productora]) VALUES (29, 2, N'La naranja mecánica', CAST(N'1971-10-14T00:00:00.000' AS DateTime), N'Reino Unido', 136, N'Stanley Kubrick', N'8', N'Inglés', 16, N'Polaris Productions')
INSERT [dbo].[Peliculas] ([idPelicula], [idGenero], [titulo], [estreno], [pais], [duracion], [director], [calificación], [Idioma], [restricción], [productora]) VALUES (30, 4, N'Interstellar', CAST(N'2014-10-11T00:00:00.000' AS DateTime), N'Estados Unidos', 169, N'Christopher Nolan', N'9', N'Inglés', 13, N'Paramount Pictures')
SET IDENTITY_INSERT [dbo].[Peliculas] OFF
GO
INSERT [dbo].[Usuarios] ([idUsuario], [usuario], [pass]) VALUES (1, N'daniel', N'12345')
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
