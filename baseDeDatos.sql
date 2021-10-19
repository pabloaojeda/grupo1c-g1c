USE [master]
GO
/****** Object:  Database [PilWallet]    Script Date: 04-Oct-21 10:22:16 PM ******/
CREATE DATABASE [PilWallet]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PilWallet', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PilWallet.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PilWallet_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PilWallet_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PilWallet] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PilWallet].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PilWallet] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PilWallet] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PilWallet] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PilWallet] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PilWallet] SET ARITHABORT OFF 
GO
ALTER DATABASE [PilWallet] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PilWallet] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PilWallet] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PilWallet] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PilWallet] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PilWallet] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PilWallet] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PilWallet] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PilWallet] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PilWallet] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PilWallet] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PilWallet] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PilWallet] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PilWallet] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PilWallet] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PilWallet] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PilWallet] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PilWallet] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PilWallet] SET  MULTI_USER 
GO
ALTER DATABASE [PilWallet] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PilWallet] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PilWallet] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PilWallet] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PilWallet] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PilWallet] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [PilWallet] SET QUERY_STORE = OFF
GO
USE [PilWallet]
GO
/****** Object:  Table [dbo].[Balance]    Script Date: 04-Oct-21 10:22:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Balance](
	[ID_Balance] [int] NOT NULL,
	[ID_Tipo_Cuenta] [int] NOT NULL,
	[Balance1] [int] NOT NULL,
 CONSTRAINT [PK_Balance] PRIMARY KEY CLUSTERED 
(
	[ID_Balance] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 04-Oct-21 10:22:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[Cuit_Cuil] [bigint] NOT NULL,
	[Nombre] [text] NULL,
	[Apellido] [text] NULL,
	[Password] [varchar](15) NULL,
	[Mail] [text] NULL,
	[ID_Localidad] [int] NULL,
	[Foto_Frontal] [varchar](max) NULL,
	[DNI_delante] [varchar](max) NULL,
	[DNI_detras] [varchar](max) NULL,
	[Domicilio] [text] NULL,
	[ID_Cliente] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Cliente_1] PRIMARY KEY CLUSTERED 
(
	[ID_Cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cuenta]    Script Date: 04-Oct-21 10:22:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cuenta](
	[ID_Cuenta] [int] NOT NULL,
	[CBU] [varchar](25) NOT NULL,
	[ID_Tipo_Cuenta] [int] NOT NULL,
	[ID_Balance] [int] NOT NULL,
	[ID_Cliente] [int] NOT NULL,
 CONSTRAINT [PK__Cuenta__820D611F2C69BC92] PRIMARY KEY CLUSTERED 
(
	[ID_Cuenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Localidad]    Script Date: 04-Oct-21 10:22:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Localidad](
	[ID_Localidad] [int] NOT NULL,
	[Localidad] [text] NULL,
	[Codigo_Postal] [varchar](10) NULL,
	[ID_Provincia] [int] NULL,
 CONSTRAINT [PK_Localidad] PRIMARY KEY CLUSTERED 
(
	[ID_Localidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movimientos]    Script Date: 04-Oct-21 10:22:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movimientos](
	[ID_movimiento] [int] NOT NULL,
	[ID_tipo_Movimiento] [int] NULL,
	[Descripción] [text] NULL,
	[Fecha_Hora] [datetime] NULL,
	[Monto] [decimal](12, 2) NULL,
	[ID_cuenta_origen] [int] NULL,
	[ID_cuenta_final] [int] NULL,
	[ID_Cuenta] [int] NOT NULL,
 CONSTRAINT [PK__Movimien__D2AC63C92D0C421E] PRIMARY KEY CLUSTERED 
(
	[ID_movimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provincia]    Script Date: 04-Oct-21 10:22:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provincia](
	[ID_Provincia] [int] NOT NULL,
	[Provincia] [text] NULL,
 CONSTRAINT [PK_Provincia] PRIMARY KEY CLUSTERED 
(
	[ID_Provincia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipo_Cuenta]    Script Date: 04-Oct-21 10:22:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipo_Cuenta](
	[ID_Tipo_Cuenta] [int] NOT NULL,
	[Tipo_Cuenta] [text] NULL,
 CONSTRAINT [PK__Tipo_Cue__38A0A22A0E7135EA] PRIMARY KEY CLUSTERED 
(
	[ID_Tipo_Cuenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipo_Movimientos]    Script Date: 04-Oct-21 10:22:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipo_Movimientos](
	[ID_tipo_Movimiento] [int] NOT NULL,
	[Tipo_Movimiento] [text] NULL,
 CONSTRAINT [PK__Tipo_Mov__CC03D69FFF72CABD] PRIMARY KEY CLUSTERED 
(
	[ID_tipo_Movimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Balance] ([ID_Balance], [ID_Tipo_Cuenta], [Balance1]) VALUES (0, 0, 0)
GO
INSERT [dbo].[Balance] ([ID_Balance], [ID_Tipo_Cuenta], [Balance1]) VALUES (1, 0, 0)
GO
INSERT [dbo].[Balance] ([ID_Balance], [ID_Tipo_Cuenta], [Balance1]) VALUES (2, 0, 0)
GO
INSERT [dbo].[Balance] ([ID_Balance], [ID_Tipo_Cuenta], [Balance1]) VALUES (3, 1, 0)
GO
INSERT [dbo].[Balance] ([ID_Balance], [ID_Tipo_Cuenta], [Balance1]) VALUES (4, 1, 0)
GO
INSERT [dbo].[Balance] ([ID_Balance], [ID_Tipo_Cuenta], [Balance1]) VALUES (5, 2, 0)
GO
SET IDENTITY_INSERT [dbo].[Cliente] ON 
GO
INSERT [dbo].[Cliente] ([Cuit_Cuil], [Nombre], [Apellido], [Password], [Mail], [ID_Localidad], [Foto_Frontal], [DNI_delante], [DNI_detras], [Domicilio], [ID_Cliente]) VALUES (12334444423, N'Juan ', N'Perez', N'1234567', N'juanperez@noreply.com', 1, N'1', N'2', N'3', N'123', 1)
GO
INSERT [dbo].[Cliente] ([Cuit_Cuil], [Nombre], [Apellido], [Password], [Mail], [ID_Localidad], [Foto_Frontal], [DNI_delante], [DNI_detras], [Domicilio], [ID_Cliente]) VALUES (20317420758, N'Matias', N'Palacio', N'Sf124578', N'MPSS@noreply.com', 12, N'3', N'4', N'5', N'1234', 2)
GO
INSERT [dbo].[Cliente] ([Cuit_Cuil], [Nombre], [Apellido], [Password], [Mail], [ID_Localidad], [Foto_Frontal], [DNI_delante], [DNI_detras], [Domicilio], [ID_Cliente]) VALUES (20378255067, N'Pablo Andres', N'Ojeda', N'123456', N'pabloaojeda@gmail.com', 22, N'1', N'2', N'3', N'123', 3)
GO
INSERT [dbo].[Cliente] ([Cuit_Cuil], [Nombre], [Apellido], [Password], [Mail], [ID_Localidad], [Foto_Frontal], [DNI_delante], [DNI_detras], [Domicilio], [ID_Cliente]) VALUES (23423423456, N'Carlos', N'Garcia', N'878787878', N'carlosgarcia@noreply.com', 5, N'1', N'2', N'3', N'123', 4)
GO
INSERT [dbo].[Cliente] ([Cuit_Cuil], [Nombre], [Apellido], [Password], [Mail], [ID_Localidad], [Foto_Frontal], [DNI_delante], [DNI_detras], [Domicilio], [ID_Cliente]) VALUES (23423747477, N'Andres', N'Calamaro', N'12312345', N'andrescalamaro@noreply.com', 4, N'1', N'2', N'3', N'123', 5)
GO
INSERT [dbo].[Cliente] ([Cuit_Cuil], [Nombre], [Apellido], [Password], [Mail], [ID_Localidad], [Foto_Frontal], [DNI_delante], [DNI_detras], [Domicilio], [ID_Cliente]) VALUES (67672837586, N'Tino', N'Pichetti', N'57577475', N'TinoPichetti@noreply.com', 3, N'1', N'2', N'3', N'123', 6)
GO
INSERT [dbo].[Cliente] ([Cuit_Cuil], [Nombre], [Apellido], [Password], [Mail], [ID_Localidad], [Foto_Frontal], [DNI_delante], [DNI_detras], [Domicilio], [ID_Cliente]) VALUES (87534534112, N'Carlos', N'Solari', N'854311111', N'solaricarlos@noreply.com', 6, N'1', N'2', N'3', N'123', 7)
GO
INSERT [dbo].[Cliente] ([Cuit_Cuil], [Nombre], [Apellido], [Password], [Mail], [ID_Localidad], [Foto_Frontal], [DNI_delante], [DNI_detras], [Domicilio], [ID_Cliente]) VALUES (98471236366, N'Franco', N'Pepe', N'5858585', N'Francopepe@noreply.com', 2, N'1', N'2', N'3', N'123', 8)
GO
SET IDENTITY_INSERT [dbo].[Cliente] OFF
GO
INSERT [dbo].[Cuenta] ([ID_Cuenta], [CBU], [ID_Tipo_Cuenta], [ID_Balance], [ID_Cliente]) VALUES (0, N'0987654321', 0, 0, 3)
GO
INSERT [dbo].[Cuenta] ([ID_Cuenta], [CBU], [ID_Tipo_Cuenta], [ID_Balance], [ID_Cliente]) VALUES (1, N'0823455556', 0, 1, 1)
GO
INSERT [dbo].[Cuenta] ([ID_Cuenta], [CBU], [ID_Tipo_Cuenta], [ID_Balance], [ID_Cliente]) VALUES (2, N'0823455556', 1, 3, 1)
GO
INSERT [dbo].[Cuenta] ([ID_Cuenta], [CBU], [ID_Tipo_Cuenta], [ID_Balance], [ID_Cliente]) VALUES (4, N'0987654321', 1, 4, 3)
GO
INSERT [dbo].[Cuenta] ([ID_Cuenta], [CBU], [ID_Tipo_Cuenta], [ID_Balance], [ID_Cliente]) VALUES (5, N'0987654321', 2, 5, 3)
GO
INSERT [dbo].[Cuenta] ([ID_Cuenta], [CBU], [ID_Tipo_Cuenta], [ID_Balance], [ID_Cliente]) VALUES (6, N'0323455556', 0, 2, 8)
GO
INSERT [dbo].[Localidad] ([ID_Localidad], [Localidad], [Codigo_Postal], [ID_Provincia]) VALUES (0, N'Mar del Plata', N'B7600', 1)
GO
INSERT [dbo].[Localidad] ([ID_Localidad], [Localidad], [Codigo_Postal], [ID_Provincia]) VALUES (1, N'La Plata', N'B1900', 1)
GO
INSERT [dbo].[Localidad] ([ID_Localidad], [Localidad], [Codigo_Postal], [ID_Provincia]) VALUES (2, N'Caballito', N'0', 2)
GO
INSERT [dbo].[Localidad] ([ID_Localidad], [Localidad], [Codigo_Postal], [ID_Provincia]) VALUES (3, N'Palermo', N'0', 2)
GO
INSERT [dbo].[Localidad] ([ID_Localidad], [Localidad], [Codigo_Postal], [ID_Provincia]) VALUES (4, N'Recoleta', N'0', 2)
GO
INSERT [dbo].[Localidad] ([ID_Localidad], [Localidad], [Codigo_Postal], [ID_Provincia]) VALUES (5, N'Belgrano', N'0', 2)
GO
INSERT [dbo].[Localidad] ([ID_Localidad], [Localidad], [Codigo_Postal], [ID_Provincia]) VALUES (6, N'Andalgala', N'0', 3)
GO
INSERT [dbo].[Localidad] ([ID_Localidad], [Localidad], [Codigo_Postal], [ID_Provincia]) VALUES (7, N'Tinogasta', N'0', 3)
GO
INSERT [dbo].[Localidad] ([ID_Localidad], [Localidad], [Codigo_Postal], [ID_Provincia]) VALUES (8, N'Resistencia', N'0', 4)
GO
INSERT [dbo].[Localidad] ([ID_Localidad], [Localidad], [Codigo_Postal], [ID_Provincia]) VALUES (9, N'Chacabuco', N'0', 4)
GO
INSERT [dbo].[Localidad] ([ID_Localidad], [Localidad], [Codigo_Postal], [ID_Provincia]) VALUES (10, N'Trelew', N'00', 5)
GO
INSERT [dbo].[Localidad] ([ID_Localidad], [Localidad], [Codigo_Postal], [ID_Provincia]) VALUES (11, N'Puerto Madryn', N'0', 5)
GO
INSERT [dbo].[Localidad] ([ID_Localidad], [Localidad], [Codigo_Postal], [ID_Provincia]) VALUES (12, N'Cordoba', N'0', 6)
GO
INSERT [dbo].[Localidad] ([ID_Localidad], [Localidad], [Codigo_Postal], [ID_Provincia]) VALUES (13, N'Rio Cuarto', N'0', 6)
GO
INSERT [dbo].[Localidad] ([ID_Localidad], [Localidad], [Codigo_Postal], [ID_Provincia]) VALUES (14, N'Paso de los Libres', N'0', 7)
GO
INSERT [dbo].[Localidad] ([ID_Localidad], [Localidad], [Codigo_Postal], [ID_Provincia]) VALUES (15, N'Bella Vista', N'0', 7)
GO
INSERT [dbo].[Localidad] ([ID_Localidad], [Localidad], [Codigo_Postal], [ID_Provincia]) VALUES (16, N'Concordia', N'0', 8)
GO
INSERT [dbo].[Localidad] ([ID_Localidad], [Localidad], [Codigo_Postal], [ID_Provincia]) VALUES (17, N'Colon', N'0', 8)
GO
INSERT [dbo].[Localidad] ([ID_Localidad], [Localidad], [Codigo_Postal], [ID_Provincia]) VALUES (18, N'Las Lomitas', N'0', 9)
GO
INSERT [dbo].[Localidad] ([ID_Localidad], [Localidad], [Codigo_Postal], [ID_Provincia]) VALUES (19, N'El Colorado', N'0', 9)
GO
INSERT [dbo].[Localidad] ([ID_Localidad], [Localidad], [Codigo_Postal], [ID_Provincia]) VALUES (20, N'San Salvador de Jujuy', N'0', 10)
GO
INSERT [dbo].[Localidad] ([ID_Localidad], [Localidad], [Codigo_Postal], [ID_Provincia]) VALUES (21, N'Purmamarca', N'0', 10)
GO
INSERT [dbo].[Localidad] ([ID_Localidad], [Localidad], [Codigo_Postal], [ID_Provincia]) VALUES (22, N'Santa Rosa', N'0', 11)
GO
INSERT [dbo].[Localidad] ([ID_Localidad], [Localidad], [Codigo_Postal], [ID_Provincia]) VALUES (23, N'Gral Pico', N'0', 11)
GO
INSERT [dbo].[Localidad] ([ID_Localidad], [Localidad], [Codigo_Postal], [ID_Provincia]) VALUES (24, N'Chilecito', N'0', 12)
GO
INSERT [dbo].[Localidad] ([ID_Localidad], [Localidad], [Codigo_Postal], [ID_Provincia]) VALUES (25, N'La Rioja Capital', N'0', 12)
GO
INSERT [dbo].[Localidad] ([ID_Localidad], [Localidad], [Codigo_Postal], [ID_Provincia]) VALUES (26, N'San Rafael', N'0', 13)
GO
INSERT [dbo].[Localidad] ([ID_Localidad], [Localidad], [Codigo_Postal], [ID_Provincia]) VALUES (27, N'Maipu', N'0', 13)
GO
INSERT [dbo].[Localidad] ([ID_Localidad], [Localidad], [Codigo_Postal], [ID_Provincia]) VALUES (28, N'Puerto Iguazu', N'0', 14)
GO
INSERT [dbo].[Localidad] ([ID_Localidad], [Localidad], [Codigo_Postal], [ID_Provincia]) VALUES (29, N'El Dorado', N'0', 14)
GO
INSERT [dbo].[Localidad] ([ID_Localidad], [Localidad], [Codigo_Postal], [ID_Provincia]) VALUES (30, N'Neuquen Capital', N'0', 15)
GO
INSERT [dbo].[Localidad] ([ID_Localidad], [Localidad], [Codigo_Postal], [ID_Provincia]) VALUES (31, N'San Martin de los Andes', N'0', 15)
GO
INSERT [dbo].[Localidad] ([ID_Localidad], [Localidad], [Codigo_Postal], [ID_Provincia]) VALUES (32, N'Viedma', N'0', 16)
GO
INSERT [dbo].[Localidad] ([ID_Localidad], [Localidad], [Codigo_Postal], [ID_Provincia]) VALUES (33, N'Bariloche', N'0', 16)
GO
INSERT [dbo].[Localidad] ([ID_Localidad], [Localidad], [Codigo_Postal], [ID_Provincia]) VALUES (34, N'Salta Capital', N'0', 17)
GO
INSERT [dbo].[Localidad] ([ID_Localidad], [Localidad], [Codigo_Postal], [ID_Provincia]) VALUES (35, N'Tartagal', N'0', 17)
GO
INSERT [dbo].[Localidad] ([ID_Localidad], [Localidad], [Codigo_Postal], [ID_Provincia]) VALUES (36, N'San Juan Capital', N'0', 18)
GO
INSERT [dbo].[Localidad] ([ID_Localidad], [Localidad], [Codigo_Postal], [ID_Provincia]) VALUES (37, N'Rivadavia', N'0', 18)
GO
INSERT [dbo].[Localidad] ([ID_Localidad], [Localidad], [Codigo_Postal], [ID_Provincia]) VALUES (38, N'Merlo', N'0', 19)
GO
INSERT [dbo].[Localidad] ([ID_Localidad], [Localidad], [Codigo_Postal], [ID_Provincia]) VALUES (39, N'Villa Mercedes', N'0', 19)
GO
INSERT [dbo].[Localidad] ([ID_Localidad], [Localidad], [Codigo_Postal], [ID_Provincia]) VALUES (40, N'Caleta Olivia', N'0', 20)
GO
INSERT [dbo].[Localidad] ([ID_Localidad], [Localidad], [Codigo_Postal], [ID_Provincia]) VALUES (41, N'Rio Gallegos', N'0', 20)
GO
INSERT [dbo].[Localidad] ([ID_Localidad], [Localidad], [Codigo_Postal], [ID_Provincia]) VALUES (42, N'Rosario', N'0', 21)
GO
INSERT [dbo].[Localidad] ([ID_Localidad], [Localidad], [Codigo_Postal], [ID_Provincia]) VALUES (43, N'Venado Tuerto', N'0', 21)
GO
INSERT [dbo].[Localidad] ([ID_Localidad], [Localidad], [Codigo_Postal], [ID_Provincia]) VALUES (44, N'Sgo. del Estero Capital', N'0', 22)
GO
INSERT [dbo].[Localidad] ([ID_Localidad], [Localidad], [Codigo_Postal], [ID_Provincia]) VALUES (45, N'La Banda', N'0', 22)
GO
INSERT [dbo].[Localidad] ([ID_Localidad], [Localidad], [Codigo_Postal], [ID_Provincia]) VALUES (46, N'Ushuaia', N'0', 23)
GO
INSERT [dbo].[Localidad] ([ID_Localidad], [Localidad], [Codigo_Postal], [ID_Provincia]) VALUES (47, N'Rio Grande', N'0', 23)
GO
INSERT [dbo].[Localidad] ([ID_Localidad], [Localidad], [Codigo_Postal], [ID_Provincia]) VALUES (48, N'Tafi del valle', N'0', 24)
GO
INSERT [dbo].[Localidad] ([ID_Localidad], [Localidad], [Codigo_Postal], [ID_Provincia]) VALUES (49, N'Concepcion', N'0', 24)
GO
INSERT [dbo].[Provincia] ([ID_Provincia], [Provincia]) VALUES (0, N'Seleccione una Provincia')
GO
INSERT [dbo].[Provincia] ([ID_Provincia], [Provincia]) VALUES (1, N'Buenos Aires')
GO
INSERT [dbo].[Provincia] ([ID_Provincia], [Provincia]) VALUES (2, N'Capital Federal')
GO
INSERT [dbo].[Provincia] ([ID_Provincia], [Provincia]) VALUES (3, N'Catamarca')
GO
INSERT [dbo].[Provincia] ([ID_Provincia], [Provincia]) VALUES (4, N'Chaco')
GO
INSERT [dbo].[Provincia] ([ID_Provincia], [Provincia]) VALUES (5, N'Chubut')
GO
INSERT [dbo].[Provincia] ([ID_Provincia], [Provincia]) VALUES (6, N'Cordoba')
GO
INSERT [dbo].[Provincia] ([ID_Provincia], [Provincia]) VALUES (7, N'Corrientes')
GO
INSERT [dbo].[Provincia] ([ID_Provincia], [Provincia]) VALUES (8, N'Entre Rios')
GO
INSERT [dbo].[Provincia] ([ID_Provincia], [Provincia]) VALUES (9, N'Formosa')
GO
INSERT [dbo].[Provincia] ([ID_Provincia], [Provincia]) VALUES (10, N'Jujuy')
GO
INSERT [dbo].[Provincia] ([ID_Provincia], [Provincia]) VALUES (11, N'La Pampa')
GO
INSERT [dbo].[Provincia] ([ID_Provincia], [Provincia]) VALUES (12, N'La Rioja')
GO
INSERT [dbo].[Provincia] ([ID_Provincia], [Provincia]) VALUES (13, N'Mendoza')
GO
INSERT [dbo].[Provincia] ([ID_Provincia], [Provincia]) VALUES (14, N'Misiones')
GO
INSERT [dbo].[Provincia] ([ID_Provincia], [Provincia]) VALUES (15, N'Neuquen')
GO
INSERT [dbo].[Provincia] ([ID_Provincia], [Provincia]) VALUES (16, N'Rio Negro')
GO
INSERT [dbo].[Provincia] ([ID_Provincia], [Provincia]) VALUES (17, N'Salta')
GO
INSERT [dbo].[Provincia] ([ID_Provincia], [Provincia]) VALUES (18, N'San Juan')
GO
INSERT [dbo].[Provincia] ([ID_Provincia], [Provincia]) VALUES (19, N'San Luis')
GO
INSERT [dbo].[Provincia] ([ID_Provincia], [Provincia]) VALUES (20, N'Santa Cruz')
GO
INSERT [dbo].[Provincia] ([ID_Provincia], [Provincia]) VALUES (21, N'Santa Fe')
GO
INSERT [dbo].[Provincia] ([ID_Provincia], [Provincia]) VALUES (22, N'Santiago Del Estero')
GO
INSERT [dbo].[Provincia] ([ID_Provincia], [Provincia]) VALUES (23, N'Tierra del Fuego')
GO
INSERT [dbo].[Provincia] ([ID_Provincia], [Provincia]) VALUES (24, N'Tucuman')
GO
INSERT [dbo].[Tipo_Cuenta] ([ID_Tipo_Cuenta], [Tipo_Cuenta]) VALUES (0, N'Pesos')
GO
INSERT [dbo].[Tipo_Cuenta] ([ID_Tipo_Cuenta], [Tipo_Cuenta]) VALUES (1, N'Dolares')
GO
INSERT [dbo].[Tipo_Cuenta] ([ID_Tipo_Cuenta], [Tipo_Cuenta]) VALUES (2, N'BTC')
GO
INSERT [dbo].[Tipo_Movimientos] ([ID_tipo_Movimiento], [Tipo_Movimiento]) VALUES (0, N'Extraccion')
GO
INSERT [dbo].[Tipo_Movimientos] ([ID_tipo_Movimiento], [Tipo_Movimiento]) VALUES (1, N'Transferencia')
GO
INSERT [dbo].[Tipo_Movimientos] ([ID_tipo_Movimiento], [Tipo_Movimiento]) VALUES (2, N'Deposito')
GO
ALTER TABLE [dbo].[Balance]  WITH CHECK ADD  CONSTRAINT [FK_Balance_Tipo_Cuenta] FOREIGN KEY([ID_Tipo_Cuenta])
REFERENCES [dbo].[Tipo_Cuenta] ([ID_Tipo_Cuenta])
GO
ALTER TABLE [dbo].[Balance] CHECK CONSTRAINT [FK_Balance_Tipo_Cuenta]
GO
ALTER TABLE [dbo].[Cliente]  WITH CHECK ADD  CONSTRAINT [FK_Cliente_Localidad] FOREIGN KEY([ID_Localidad])
REFERENCES [dbo].[Localidad] ([ID_Localidad])
GO
ALTER TABLE [dbo].[Cliente] CHECK CONSTRAINT [FK_Cliente_Localidad]
GO
ALTER TABLE [dbo].[Cuenta]  WITH CHECK ADD  CONSTRAINT [FK_Cuenta.ID_Tipo_Cuenta] FOREIGN KEY([ID_Tipo_Cuenta])
REFERENCES [dbo].[Tipo_Cuenta] ([ID_Tipo_Cuenta])
GO
ALTER TABLE [dbo].[Cuenta] CHECK CONSTRAINT [FK_Cuenta.ID_Tipo_Cuenta]
GO
ALTER TABLE [dbo].[Cuenta]  WITH CHECK ADD  CONSTRAINT [FK_Cuenta_Balance] FOREIGN KEY([ID_Balance])
REFERENCES [dbo].[Balance] ([ID_Balance])
GO
ALTER TABLE [dbo].[Cuenta] CHECK CONSTRAINT [FK_Cuenta_Balance]
GO
ALTER TABLE [dbo].[Cuenta]  WITH CHECK ADD  CONSTRAINT [FK_Cuenta_Cliente] FOREIGN KEY([ID_Cliente])
REFERENCES [dbo].[Cliente] ([ID_Cliente])
GO
ALTER TABLE [dbo].[Cuenta] CHECK CONSTRAINT [FK_Cuenta_Cliente]
GO
ALTER TABLE [dbo].[Localidad]  WITH CHECK ADD  CONSTRAINT [FK_Localidad_Provincia] FOREIGN KEY([ID_Provincia])
REFERENCES [dbo].[Provincia] ([ID_Provincia])
GO
ALTER TABLE [dbo].[Localidad] CHECK CONSTRAINT [FK_Localidad_Provincia]
GO
ALTER TABLE [dbo].[Movimientos]  WITH CHECK ADD  CONSTRAINT [FK_Movimientos.ID_tipo_Movimiento] FOREIGN KEY([ID_tipo_Movimiento])
REFERENCES [dbo].[Tipo_Movimientos] ([ID_tipo_Movimiento])
GO
ALTER TABLE [dbo].[Movimientos] CHECK CONSTRAINT [FK_Movimientos.ID_tipo_Movimiento]
GO
ALTER TABLE [dbo].[Movimientos]  WITH CHECK ADD  CONSTRAINT [FK_Movimientos_Cuenta] FOREIGN KEY([ID_Cuenta])
REFERENCES [dbo].[Cuenta] ([ID_Cuenta])
GO
ALTER TABLE [dbo].[Movimientos] CHECK CONSTRAINT [FK_Movimientos_Cuenta]
GO
USE [master]
GO
ALTER DATABASE [PilWallet] SET  READ_WRITE 
GO
