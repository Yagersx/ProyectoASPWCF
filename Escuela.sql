USE [Escuela]
GO
/****** Object:  Table [dbo].[AA]    Script Date: 30/07/2018 22:26:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AA](
	[IdAA] [int] IDENTITY(1,1) NOT NULL,
	[IdAsesoria] [int] NULL,
	[Matricula] [int] NULL,
	[Nombre] [varchar](50) NULL,
	[Tema] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdAA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Asesorias]    Script Date: 30/07/2018 22:26:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Asesorias](
	[IdAsesoria] [int] IDENTITY(1,1) NOT NULL,
	[IdAsignacion] [int] NULL,
	[Cupo] [int] NULL,
	[Dia] [varchar](20) NULL,
	[IdHora] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdAsesoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Asignacion]    Script Date: 30/07/2018 22:26:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Asignacion](
	[IdAsignacion] [int] IDENTITY(1,1) NOT NULL,
	[IdCuatrimestre] [int] NULL,
	[IdGrupo] [int] NULL,
	[IdMateria] [int] NULL,
	[IdProfesor] [int] NULL,
	[Turno] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdAsignacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cuatrimestre]    Script Date: 30/07/2018 22:26:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cuatrimestre](
	[IdCuatrimestre] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[FechaInicio] [datetime] NULL,
	[FechaFinal] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCuatrimestre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dias]    Script Date: 30/07/2018 22:26:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dias](
	[IdDia] [int] NOT NULL,
	[Dia] [nchar](20) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Grupo]    Script Date: 30/07/2018 22:26:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grupo](
	[IdGrupo] [int] IDENTITY(1,1) NOT NULL,
	[Grado] [int] NULL,
	[Letra] [varchar](1) NULL,
	[Nivel] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdGrupo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hora]    Script Date: 30/07/2018 22:26:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hora](
	[IdHora] [int] IDENTITY(1,1) NOT NULL,
	[HoraInicio] [time](7) NULL,
	[HoraFin] [time](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdHora] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Horario]    Script Date: 30/07/2018 22:26:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Horario](
	[IdHorario] [int] IDENTITY(1,1) NOT NULL,
	[IdAsignacion] [int] NULL,
	[IdHora] [int] NULL,
	[IdDia] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdHorario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Materia]    Script Date: 30/07/2018 22:26:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Materia](
	[IdMateria] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdMateria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Profesor]    Script Date: 30/07/2018 22:26:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Profesor](
	[IdProfesor] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](20) NULL,
	[Apellidos] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdProfesor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ubicacion]    Script Date: 30/07/2018 22:26:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ubicacion](
	[IdUbicacion] [int] IDENTITY(1,1) NOT NULL,
	[Aula] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdUbicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AA]  WITH CHECK ADD FOREIGN KEY([IdAsesoria])
REFERENCES [dbo].[Asesorias] ([IdAsesoria])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Asesorias]  WITH CHECK ADD FOREIGN KEY([IdAsignacion])
REFERENCES [dbo].[Asignacion] ([IdAsignacion])
GO
ALTER TABLE [dbo].[Asignacion]  WITH CHECK ADD FOREIGN KEY([IdCuatrimestre])
REFERENCES [dbo].[Cuatrimestre] ([IdCuatrimestre])
GO
ALTER TABLE [dbo].[Asignacion]  WITH CHECK ADD FOREIGN KEY([IdCuatrimestre])
REFERENCES [dbo].[Cuatrimestre] ([IdCuatrimestre])
GO
ALTER TABLE [dbo].[Asignacion]  WITH CHECK ADD FOREIGN KEY([IdGrupo])
REFERENCES [dbo].[Grupo] ([IdGrupo])
GO
ALTER TABLE [dbo].[Asignacion]  WITH CHECK ADD FOREIGN KEY([IdGrupo])
REFERENCES [dbo].[Grupo] ([IdGrupo])
GO
ALTER TABLE [dbo].[Asignacion]  WITH CHECK ADD FOREIGN KEY([IdMateria])
REFERENCES [dbo].[Materia] ([IdMateria])
GO
ALTER TABLE [dbo].[Asignacion]  WITH CHECK ADD FOREIGN KEY([IdMateria])
REFERENCES [dbo].[Materia] ([IdMateria])
GO
ALTER TABLE [dbo].[Asignacion]  WITH CHECK ADD FOREIGN KEY([IdProfesor])
REFERENCES [dbo].[Profesor] ([IdProfesor])
GO
ALTER TABLE [dbo].[Asignacion]  WITH CHECK ADD FOREIGN KEY([IdProfesor])
REFERENCES [dbo].[Profesor] ([IdProfesor])
GO
ALTER TABLE [dbo].[Horario]  WITH CHECK ADD FOREIGN KEY([IdAsignacion])
REFERENCES [dbo].[Asignacion] ([IdAsignacion])
GO
ALTER TABLE [dbo].[Horario]  WITH CHECK ADD FOREIGN KEY([IdAsignacion])
REFERENCES [dbo].[Asignacion] ([IdAsignacion])
GO
ALTER TABLE [dbo].[Horario]  WITH CHECK ADD FOREIGN KEY([IdHora])
REFERENCES [dbo].[Hora] ([IdHora])
GO
ALTER TABLE [dbo].[Horario]  WITH CHECK ADD FOREIGN KEY([IdHora])
REFERENCES [dbo].[Hora] ([IdHora])
GO
