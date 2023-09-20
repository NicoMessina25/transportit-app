USE [master]
GO
/****** Object:  Database [transportit]    Script Date: 17/9/2023 21:09:21 ******/
CREATE DATABASE [transportit]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'transportit', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\transportit.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'transportit_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\transportit_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [transportit] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [transportit].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [transportit] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [transportit] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [transportit] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [transportit] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [transportit] SET ARITHABORT OFF 
GO
ALTER DATABASE [transportit] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [transportit] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [transportit] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [transportit] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [transportit] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [transportit] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [transportit] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [transportit] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [transportit] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [transportit] SET  DISABLE_BROKER 
GO
ALTER DATABASE [transportit] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [transportit] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [transportit] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [transportit] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [transportit] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [transportit] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [transportit] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [transportit] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [transportit] SET  MULTI_USER 
GO
ALTER DATABASE [transportit] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [transportit] SET DB_CHAINING OFF 
GO
ALTER DATABASE [transportit] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [transportit] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [transportit] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [transportit] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [transportit] SET QUERY_STORE = ON
GO
ALTER DATABASE [transportit] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [transportit]
GO
/****** Object:  User [sqlserver]    Script Date: 17/9/2023 21:09:21 ******/
CREATE USER [sqlserver] FOR LOGIN [sqlserver] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[_user]    Script Date: 17/9/2023 21:09:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_user](
	[firstname] [varchar](255) NOT NULL,
	[lastname] [varchar](255) NOT NULL,
	[_document] [bigint] NOT NULL,
	[username] [varchar](255) NOT NULL,
	[mail] [varchar](255) NULL,
	[password] [varchar](255) NOT NULL,
	[_user] [bigint] IDENTITY(1,1) NOT NULL,
	[deleted] [datetime] NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[_user] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[city]    Script Date: 17/9/2023 21:09:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[city](
	[cityId] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](40) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cityXcity]    Script Date: 17/9/2023 21:09:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cityXcity](
	[cityFrom] [bigint] NOT NULL,
	[cityTo] [bigint] NOT NULL,
	[feeCoefficient] [numeric](5, 2) NULL,
	[distanceKm] [numeric](7, 2) NULL,
 CONSTRAINT [PK_cityXcity] PRIMARY KEY CLUSTERED 
(
	[cityFrom] ASC,
	[cityTo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customer]    Script Date: 17/9/2023 21:09:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer](
	[customerId] [bigint] IDENTITY(1,1) NOT NULL,
	[firstname] [varchar](20) NOT NULL,
	[lastname] [varchar](20) NOT NULL,
	[address] [varchar](30) NULL,
	[deleted] [datetime] NULL,
	[_document] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[customerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[driver]    Script Date: 17/9/2023 21:09:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[driver](
	[firstname] [varchar](50) NOT NULL,
	[lastname] [varchar](50) NOT NULL,
	[_document] [varchar](50) NOT NULL,
	[address] [varchar](50) NULL,
	[province] [varchar](50) NULL,
	[city] [varchar](50) NULL,
	[phone] [varchar](20) NOT NULL,
	[particular] [bit] NOT NULL,
	[available] [bit] NOT NULL,
	[currentcityid] [bigint] NOT NULL,
	[feeid] [bigint] NULL,
	[deleted] [datetime] NULL,
	[driverId] [bigint] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[driverId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[fee]    Script Date: 17/9/2023 21:09:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fee](
	[kgprice] [numeric](10, 2) NOT NULL,
	[kmprice] [numeric](10, 2) NULL,
	[feetype] [bigint] NOT NULL,
	[cm3price] [numeric](10, 2) NULL,
	[registrationDate] [datetime] NOT NULL,
	[endDate] [datetime] NULL,
	[feeId] [bigint] IDENTITY(1,1) NOT NULL,
	[driverId] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[feeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[feeType]    Script Date: 17/9/2023 21:09:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[feeType](
	[description] [varchar](50) NOT NULL,
	[feeTypeId] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[feeTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[movement]    Script Date: 17/9/2023 21:09:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[movement](
	[movement] [bigint] NOT NULL,
	[amounttopay] [numeric](10, 2) NOT NULL,
	[movementtype] [bigint] NOT NULL,
	[driver] [bigint] NULL,
	[routmap] [bigint] NULL,
	[_package] [bigint] NULL,
	[shippingrequest] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[movement] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[package]    Script Date: 17/9/2023 21:09:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[package](
	[packageId] [bigint] IDENTITY(1,1) NOT NULL,
	[weight] [numeric](7, 2) NULL,
	[size] [numeric](7, 2) NULL,
	[requestId] [bigint] NOT NULL,
	[price] [numeric](8, 2) NULL,
	[state] [bigint] NOT NULL,
	[routeMapId] [bigint] NOT NULL,
	[feePricingId] [bigint] NOT NULL,
	[recipientDocument] [bigint] NOT NULL,
	[recipientFirstname] [bigint] NOT NULL,
	[cityFeeCoefficient] [numeric](5, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[packageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[park]    Script Date: 17/9/2023 21:09:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[park](
	[cityId] [bigint] NOT NULL,
	[parkId] [bigint] NOT NULL,
 CONSTRAINT [PK_parkCity] PRIMARY KEY CLUSTERED 
(
	[cityId] ASC,
	[parkId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[routeMap]    Script Date: 17/9/2023 21:09:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[routeMap](
	[routeMapId] [bigint] IDENTITY(1,1) NOT NULL,
	[state] [int] NOT NULL,
	[payloadVolume] [numeric](12, 2) NOT NULL,
	[price] [numeric](15, 2) NOT NULL,
	[startDate] [date] NOT NULL,
	[driverId] [bigint] NOT NULL,
	[truckId] [bigint] NOT NULL,
	[trailerId] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[routeMapId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[routeMapXCity]    Script Date: 17/9/2023 21:09:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[routeMapXCity](
	[routeMapId] [bigint] NOT NULL,
	[cityId] [bigint] NOT NULL,
	[arrivalDate] [date] NOT NULL,
 CONSTRAINT [PK_routeMapId_cityId_arrivalDate] PRIMARY KEY CLUSTERED 
(
	[routeMapId] ASC,
	[cityId] ASC,
	[arrivalDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[shippingRequest]    Script Date: 17/9/2023 21:09:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shippingRequest](
	[requestId] [bigint] IDENTITY(1,1) NOT NULL,
	[price] [numeric](12, 3) NULL,
	[requestDate] [date] NOT NULL,
	[state] [int] NOT NULL,
	[cityFrom] [bigint] NOT NULL,
	[cityTo] [bigint] NOT NULL,
	[customerId] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[requestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[trailer]    Script Date: 17/9/2023 21:09:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[trailer](
	[trailerId] [bigint] IDENTITY(1,1) NOT NULL,
	[weight] [numeric](7, 2) NOT NULL,
	[payloadWeight] [numeric](7, 2) NOT NULL,
	[registration] [varchar](16) NOT NULL,
	[available] [bit] NOT NULL,
	[parkId] [bigint] NULL,
	[cityId] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[trailerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[truck]    Script Date: 17/9/2023 21:09:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[truck](
	[driver] [bigint] NULL,
	[registrationDate] [datetime] NOT NULL,
	[registration] [varchar](50) NOT NULL,
	[maxweight] [numeric](8, 2) NOT NULL,
	[available] [bit] NOT NULL,
	[city] [bigint] NULL,
	[truckId] [bigint] IDENTITY(1,1) NOT NULL,
	[deleted] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[truckId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[_user] ON 

INSERT [dbo].[_user] ([firstname], [lastname], [_document], [username], [mail], [password], [_user], [deleted]) VALUES (N'h', N'z', 12, N'd', N'z', N'p', 1, NULL)
INSERT [dbo].[_user] ([firstname], [lastname], [_document], [username], [mail], [password], [_user], [deleted]) VALUES (N'Alejandro', N'Pérez', 4323, N'aleperez', N'aleperez@gmail.com', N'1234', 2, NULL)
INSERT [dbo].[_user] ([firstname], [lastname], [_document], [username], [mail], [password], [_user], [deleted]) VALUES (N'María', N'López', 1234, N'marialopez', N'marialopez@gmail.com', N'abcd', 3, NULL)
INSERT [dbo].[_user] ([firstname], [lastname], [_document], [username], [mail], [password], [_user], [deleted]) VALUES (N'Juan', N'Martínez', 5678, N'juanmartinez', N'juanmartinez@gmail.com', N'efgh', 4, NULL)
INSERT [dbo].[_user] ([firstname], [lastname], [_document], [username], [mail], [password], [_user], [deleted]) VALUES (N'Ana', N'García', 9012, N'anagarcia', N'anagarcia@gmail.com', N'ijkl', 5, NULL)
INSERT [dbo].[_user] ([firstname], [lastname], [_document], [username], [mail], [password], [_user], [deleted]) VALUES (N'Carlos', N'Rodríguez', 3456, N'carlosrodriguez', N'carlosrodriguez@gmail.com', N'mnop', 6, NULL)
INSERT [dbo].[_user] ([firstname], [lastname], [_document], [username], [mail], [password], [_user], [deleted]) VALUES (N'Laura', N'Hernández', 7890, N'laurahernandez', N'laurahernandez@gmail.com', N'qrst', 7, NULL)
INSERT [dbo].[_user] ([firstname], [lastname], [_document], [username], [mail], [password], [_user], [deleted]) VALUES (N'Pedro', N'Sánchez', 2345, N'pedrosanchez', N'pedrosanchez@gmail.com', N'uvwx', 8, NULL)
INSERT [dbo].[_user] ([firstname], [lastname], [_document], [username], [mail], [password], [_user], [deleted]) VALUES (N'Javier', N'Díaz', 1234, N'javierdiaz', N'javierdiaz@gmail.com', N'3456', 9, NULL)
INSERT [dbo].[_user] ([firstname], [lastname], [_document], [username], [mail], [password], [_user], [deleted]) VALUES (N'David', N'Vargas', 9012, N'davidvargas', N'davidvargas@gmail.com', N'1234', 10, NULL)
INSERT [dbo].[_user] ([firstname], [lastname], [_document], [username], [mail], [password], [_user], [deleted]) VALUES (N'Marta', N'Ortega', 5678, N'martaortega', N'martaortega@gmail.com', N'7890', 11, NULL)
INSERT [dbo].[_user] ([firstname], [lastname], [_document], [username], [mail], [password], [_user], [deleted]) VALUES (N'Mery', N'Smith', 1234567, N'asmith', N'alice.smith@example.com', N'5678', 10002, NULL)
INSERT [dbo].[_user] ([firstname], [lastname], [_document], [username], [mail], [password], [_user], [deleted]) VALUES (N'Charlie', N'Johnson', 2345678, N'cjohnson', N'charlie.johnson@example.com', N'7890', 10003, NULL)
INSERT [dbo].[_user] ([firstname], [lastname], [_document], [username], [mail], [password], [_user], [deleted]) VALUES (N'Alice', N'Smith', 1234567, N'asmith', N'alice.smith@example.com', N'5678', 10004, NULL)
INSERT [dbo].[_user] ([firstname], [lastname], [_document], [username], [mail], [password], [_user], [deleted]) VALUES (N'Pedro', N'Miguel', 11223344, N'pmiguel', NULL, N'909', 10005, CAST(N'2023-08-22T21:23:30.573' AS DateTime))
SET IDENTITY_INSERT [dbo].[_user] OFF
GO
SET IDENTITY_INSERT [dbo].[city] ON 

INSERT [dbo].[city] ([cityId], [name]) VALUES (8, N'Mar del Plata')
INSERT [dbo].[city] ([cityId], [name]) VALUES (9, N'Buenos Aires')
INSERT [dbo].[city] ([cityId], [name]) VALUES (10, N'Córdoba')
INSERT [dbo].[city] ([cityId], [name]) VALUES (11, N'Rosario')
INSERT [dbo].[city] ([cityId], [name]) VALUES (12, N'Mendoza')
INSERT [dbo].[city] ([cityId], [name]) VALUES (13, N'La Plata')
INSERT [dbo].[city] ([cityId], [name]) VALUES (14, N'San Miguel de Tucumán')
INSERT [dbo].[city] ([cityId], [name]) VALUES (15, N'Salta')
INSERT [dbo].[city] ([cityId], [name]) VALUES (16, N'Santa Fe')
INSERT [dbo].[city] ([cityId], [name]) VALUES (17, N'San Juan')
INSERT [dbo].[city] ([cityId], [name]) VALUES (18, N'Resistencia')
INSERT [dbo].[city] ([cityId], [name]) VALUES (19, N'Neuquén')
INSERT [dbo].[city] ([cityId], [name]) VALUES (20, N'Formosa')
INSERT [dbo].[city] ([cityId], [name]) VALUES (21, N'Corrientes')
INSERT [dbo].[city] ([cityId], [name]) VALUES (22, N'Santiago del Estero')
INSERT [dbo].[city] ([cityId], [name]) VALUES (23, N'Posadas')
INSERT [dbo].[city] ([cityId], [name]) VALUES (24, N'Merlo')
INSERT [dbo].[city] ([cityId], [name]) VALUES (25, N'San Salvador de Jujuy')
INSERT [dbo].[city] ([cityId], [name]) VALUES (26, N'Bahía Blanca')
INSERT [dbo].[city] ([cityId], [name]) VALUES (27, N'Paraná')
INSERT [dbo].[city] ([cityId], [name]) VALUES (28, N'Quilmes')
INSERT [dbo].[city] ([cityId], [name]) VALUES (29, N'Avellaneda')
INSERT [dbo].[city] ([cityId], [name]) VALUES (30, N'Lanús')
INSERT [dbo].[city] ([cityId], [name]) VALUES (31, N'Morón')
INSERT [dbo].[city] ([cityId], [name]) VALUES (32, N'La Matanza')
INSERT [dbo].[city] ([cityId], [name]) VALUES (33, N'Pilar')
INSERT [dbo].[city] ([cityId], [name]) VALUES (34, N'María Grande')
INSERT [dbo].[city] ([cityId], [name]) VALUES (35, N'Tandil')
INSERT [dbo].[city] ([cityId], [name]) VALUES (36, N'Río Cuarto')
INSERT [dbo].[city] ([cityId], [name]) VALUES (37, N'San Rafael')
INSERT [dbo].[city] ([cityId], [name]) VALUES (38, N'San Luis')
INSERT [dbo].[city] ([cityId], [name]) VALUES (39, N'San Carlos de Bariloche')
INSERT [dbo].[city] ([cityId], [name]) VALUES (40, N'Comodoro Rivadavia')
INSERT [dbo].[city] ([cityId], [name]) VALUES (41, N'Trelew')
INSERT [dbo].[city] ([cityId], [name]) VALUES (42, N'Rawson')
INSERT [dbo].[city] ([cityId], [name]) VALUES (43, N'Viedma')
INSERT [dbo].[city] ([cityId], [name]) VALUES (44, N'Ushuaia')
INSERT [dbo].[city] ([cityId], [name]) VALUES (45, N'San Fernando del Valle de Catamarca')
INSERT [dbo].[city] ([cityId], [name]) VALUES (46, N'La Rioja')
INSERT [dbo].[city] ([cityId], [name]) VALUES (47, N'San Fernando')
INSERT [dbo].[city] ([cityId], [name]) VALUES (48, N'San Isidro')
INSERT [dbo].[city] ([cityId], [name]) VALUES (49, N'Vicente López')
INSERT [dbo].[city] ([cityId], [name]) VALUES (50, N'Lomas de Zamora')
INSERT [dbo].[city] ([cityId], [name]) VALUES (51, N'Ezeiza')
INSERT [dbo].[city] ([cityId], [name]) VALUES (52, N'San Nicolás de los Arroyos')
INSERT [dbo].[city] ([cityId], [name]) VALUES (53, N'San Francisco')
INSERT [dbo].[city] ([cityId], [name]) VALUES (54, N'Villa María')
INSERT [dbo].[city] ([cityId], [name]) VALUES (55, N'San Luis del Palmar')
INSERT [dbo].[city] ([cityId], [name]) VALUES (56, N'San Lorenzo')
INSERT [dbo].[city] ([cityId], [name]) VALUES (57, N'Villa Mercedes')
INSERT [dbo].[city] ([cityId], [name]) VALUES (58, N'Rafaela')
INSERT [dbo].[city] ([cityId], [name]) VALUES (59, N'Concordia')
INSERT [dbo].[city] ([cityId], [name]) VALUES (60, N'San José de Jáchal')
INSERT [dbo].[city] ([cityId], [name]) VALUES (61, N'Alta Gracia')
INSERT [dbo].[city] ([cityId], [name]) VALUES (62, N'Río Tercero')
INSERT [dbo].[city] ([cityId], [name]) VALUES (63, N'San Ramón de la Nueva Orán')
INSERT [dbo].[city] ([cityId], [name]) VALUES (64, N'Goya')
INSERT [dbo].[city] ([cityId], [name]) VALUES (65, N'San Martín')
INSERT [dbo].[city] ([cityId], [name]) VALUES (66, N'Villa Allende')
INSERT [dbo].[city] ([cityId], [name]) VALUES (67, N'San Pedro')
INSERT [dbo].[city] ([cityId], [name]) VALUES (68, N'Pergamino')
INSERT [dbo].[city] ([cityId], [name]) VALUES (69, N'Oberá')
INSERT [dbo].[city] ([cityId], [name]) VALUES (70, N'Caleta Olivia')
INSERT [dbo].[city] ([cityId], [name]) VALUES (71, N'Tartagal')
INSERT [dbo].[city] ([cityId], [name]) VALUES (72, N'San Pedro')
INSERT [dbo].[city] ([cityId], [name]) VALUES (73, N'Zárate')
INSERT [dbo].[city] ([cityId], [name]) VALUES (74, N'Campana')
INSERT [dbo].[city] ([cityId], [name]) VALUES (75, N'Escobar')
INSERT [dbo].[city] ([cityId], [name]) VALUES (76, N'San Carlos de Bolívar')
INSERT [dbo].[city] ([cityId], [name]) VALUES (77, N'Lobos')
INSERT [dbo].[city] ([cityId], [name]) VALUES (78, N'San Vicente')
INSERT [dbo].[city] ([cityId], [name]) VALUES (79, N'General Pico')
INSERT [dbo].[city] ([cityId], [name]) VALUES (80, N'Villa Constitución')
INSERT [dbo].[city] ([cityId], [name]) VALUES (81, N'San Justo')
INSERT [dbo].[city] ([cityId], [name]) VALUES (82, N'Cañuelas')
INSERT [dbo].[city] ([cityId], [name]) VALUES (83, N'San Antonio de Areco')
INSERT [dbo].[city] ([cityId], [name]) VALUES (84, N'San Fernando del Valle de Catamarca')
INSERT [dbo].[city] ([cityId], [name]) VALUES (85, N'Nueve de Julio')
INSERT [dbo].[city] ([cityId], [name]) VALUES (86, N'Tres Arroyos')
INSERT [dbo].[city] ([cityId], [name]) VALUES (87, N'General Rodríguez')
INSERT [dbo].[city] ([cityId], [name]) VALUES (88, N'Chivilcoy')
INSERT [dbo].[city] ([cityId], [name]) VALUES (89, N'Olavarría')
INSERT [dbo].[city] ([cityId], [name]) VALUES (90, N'Azul')
INSERT [dbo].[city] ([cityId], [name]) VALUES (91, N'Villa Gesell')
INSERT [dbo].[city] ([cityId], [name]) VALUES (92, N'Junín')
INSERT [dbo].[city] ([cityId], [name]) VALUES (93, N'General Roca')
INSERT [dbo].[city] ([cityId], [name]) VALUES (94, N'Villa Regina')
INSERT [dbo].[city] ([cityId], [name]) VALUES (95, N'San Nicolás de los Arroyos')
INSERT [dbo].[city] ([cityId], [name]) VALUES (96, N'San Pedro')
INSERT [dbo].[city] ([cityId], [name]) VALUES (97, N'Chajarí')
INSERT [dbo].[city] ([cityId], [name]) VALUES (98, N'Gualeguaychú')
INSERT [dbo].[city] ([cityId], [name]) VALUES (99, N'Victoria')
INSERT [dbo].[city] ([cityId], [name]) VALUES (100, N'Concepción del Uruguay')
INSERT [dbo].[city] ([cityId], [name]) VALUES (101, N'Gualeguay')
INSERT [dbo].[city] ([cityId], [name]) VALUES (102, N'La Paz')
INSERT [dbo].[city] ([cityId], [name]) VALUES (103, N'Roque Sáenz Peña')
INSERT [dbo].[city] ([cityId], [name]) VALUES (104, N'Presidencia Roque Sáenz Peña')
INSERT [dbo].[city] ([cityId], [name]) VALUES (105, N'Barranqueras')
INSERT [dbo].[city] ([cityId], [name]) VALUES (106, N'Clorinda')
GO
INSERT [dbo].[city] ([cityId], [name]) VALUES (107, N'Palpalá')
INSERT [dbo].[city] ([cityId], [name]) VALUES (108, N'San Salvador de Jujuy')
INSERT [dbo].[city] ([cityId], [name]) VALUES (109, N'San Pedro')
INSERT [dbo].[city] ([cityId], [name]) VALUES (110, N'Güemes')
INSERT [dbo].[city] ([cityId], [name]) VALUES (111, N'Venado Tuerto')
INSERT [dbo].[city] ([cityId], [name]) VALUES (112, N'Firmat')
INSERT [dbo].[city] ([cityId], [name]) VALUES (113, N'Casilda')
INSERT [dbo].[city] ([cityId], [name]) VALUES (114, N'Villa María')
INSERT [dbo].[city] ([cityId], [name]) VALUES (115, N'Río Tercero')
SET IDENTITY_INSERT [dbo].[city] OFF
GO
INSERT [dbo].[cityXcity] ([cityFrom], [cityTo], [feeCoefficient], [distanceKm]) VALUES (8, 9, CAST(1.40 AS Numeric(5, 2)), CAST(150.50 AS Numeric(7, 2)))
INSERT [dbo].[cityXcity] ([cityFrom], [cityTo], [feeCoefficient], [distanceKm]) VALUES (8, 12, CAST(2.30 AS Numeric(5, 2)), CAST(250.20 AS Numeric(7, 2)))
INSERT [dbo].[cityXcity] ([cityFrom], [cityTo], [feeCoefficient], [distanceKm]) VALUES (8, 15, CAST(2.10 AS Numeric(5, 2)), CAST(205.80 AS Numeric(7, 2)))
INSERT [dbo].[cityXcity] ([cityFrom], [cityTo], [feeCoefficient], [distanceKm]) VALUES (9, 11, CAST(1.80 AS Numeric(5, 2)), CAST(180.70 AS Numeric(7, 2)))
INSERT [dbo].[cityXcity] ([cityFrom], [cityTo], [feeCoefficient], [distanceKm]) VALUES (9, 20, CAST(1.60 AS Numeric(5, 2)), CAST(165.70 AS Numeric(7, 2)))
INSERT [dbo].[cityXcity] ([cityFrom], [cityTo], [feeCoefficient], [distanceKm]) VALUES (10, 12, CAST(2.30 AS Numeric(5, 2)), CAST(250.20 AS Numeric(7, 2)))
INSERT [dbo].[cityXcity] ([cityFrom], [cityTo], [feeCoefficient], [distanceKm]) VALUES (10, 13, CAST(1.50 AS Numeric(5, 2)), CAST(160.30 AS Numeric(7, 2)))
INSERT [dbo].[cityXcity] ([cityFrom], [cityTo], [feeCoefficient], [distanceKm]) VALUES (11, 16, CAST(1.70 AS Numeric(5, 2)), CAST(170.40 AS Numeric(7, 2)))
INSERT [dbo].[cityXcity] ([cityFrom], [cityTo], [feeCoefficient], [distanceKm]) VALUES (11, 18, CAST(1.30 AS Numeric(5, 2)), CAST(140.90 AS Numeric(7, 2)))
INSERT [dbo].[cityXcity] ([cityFrom], [cityTo], [feeCoefficient], [distanceKm]) VALUES (12, 14, CAST(1.90 AS Numeric(5, 2)), CAST(190.00 AS Numeric(7, 2)))
INSERT [dbo].[cityXcity] ([cityFrom], [cityTo], [feeCoefficient], [distanceKm]) VALUES (12, 17, CAST(2.40 AS Numeric(5, 2)), CAST(260.10 AS Numeric(7, 2)))
INSERT [dbo].[cityXcity] ([cityFrom], [cityTo], [feeCoefficient], [distanceKm]) VALUES (13, 19, CAST(2.20 AS Numeric(5, 2)), CAST(230.60 AS Numeric(7, 2)))
INSERT [dbo].[cityXcity] ([cityFrom], [cityTo], [feeCoefficient], [distanceKm]) VALUES (13, 22, CAST(1.80 AS Numeric(5, 2)), CAST(188.20 AS Numeric(7, 2)))
INSERT [dbo].[cityXcity] ([cityFrom], [cityTo], [feeCoefficient], [distanceKm]) VALUES (14, 21, CAST(2.00 AS Numeric(5, 2)), CAST(215.30 AS Numeric(7, 2)))
INSERT [dbo].[cityXcity] ([cityFrom], [cityTo], [feeCoefficient], [distanceKm]) VALUES (14, 23, CAST(2.30 AS Numeric(5, 2)), CAST(255.00 AS Numeric(7, 2)))
INSERT [dbo].[cityXcity] ([cityFrom], [cityTo], [feeCoefficient], [distanceKm]) VALUES (15, 20, CAST(1.60 AS Numeric(5, 2)), CAST(165.70 AS Numeric(7, 2)))
INSERT [dbo].[cityXcity] ([cityFrom], [cityTo], [feeCoefficient], [distanceKm]) VALUES (15, 25, CAST(1.90 AS Numeric(5, 2)), CAST(200.90 AS Numeric(7, 2)))
INSERT [dbo].[cityXcity] ([cityFrom], [cityTo], [feeCoefficient], [distanceKm]) VALUES (16, 24, CAST(1.50 AS Numeric(5, 2)), CAST(155.60 AS Numeric(7, 2)))
INSERT [dbo].[cityXcity] ([cityFrom], [cityTo], [feeCoefficient], [distanceKm]) VALUES (16, 28, CAST(2.40 AS Numeric(5, 2)), CAST(262.70 AS Numeric(7, 2)))
INSERT [dbo].[cityXcity] ([cityFrom], [cityTo], [feeCoefficient], [distanceKm]) VALUES (17, 30, CAST(2.20 AS Numeric(5, 2)), CAST(235.90 AS Numeric(7, 2)))
INSERT [dbo].[cityXcity] ([cityFrom], [cityTo], [feeCoefficient], [distanceKm]) VALUES (17, 34, CAST(2.30 AS Numeric(5, 2)), CAST(252.50 AS Numeric(7, 2)))
INSERT [dbo].[cityXcity] ([cityFrom], [cityTo], [feeCoefficient], [distanceKm]) VALUES (18, 29, CAST(1.30 AS Numeric(5, 2)), CAST(138.40 AS Numeric(7, 2)))
INSERT [dbo].[cityXcity] ([cityFrom], [cityTo], [feeCoefficient], [distanceKm]) VALUES (18, 35, CAST(1.50 AS Numeric(5, 2)), CAST(153.80 AS Numeric(7, 2)))
INSERT [dbo].[cityXcity] ([cityFrom], [cityTo], [feeCoefficient], [distanceKm]) VALUES (19, 36, CAST(1.90 AS Numeric(5, 2)), CAST(198.70 AS Numeric(7, 2)))
INSERT [dbo].[cityXcity] ([cityFrom], [cityTo], [feeCoefficient], [distanceKm]) VALUES (19, 39, CAST(2.40 AS Numeric(5, 2)), CAST(259.40 AS Numeric(7, 2)))
INSERT [dbo].[cityXcity] ([cityFrom], [cityTo], [feeCoefficient], [distanceKm]) VALUES (20, 37, CAST(2.10 AS Numeric(5, 2)), CAST(207.10 AS Numeric(7, 2)))
INSERT [dbo].[cityXcity] ([cityFrom], [cityTo], [feeCoefficient], [distanceKm]) VALUES (20, 41, CAST(2.20 AS Numeric(5, 2)), CAST(233.30 AS Numeric(7, 2)))
INSERT [dbo].[cityXcity] ([cityFrom], [cityTo], [feeCoefficient], [distanceKm]) VALUES (21, 40, CAST(1.30 AS Numeric(5, 2)), CAST(136.10 AS Numeric(7, 2)))
INSERT [dbo].[cityXcity] ([cityFrom], [cityTo], [feeCoefficient], [distanceKm]) VALUES (21, 45, CAST(2.30 AS Numeric(5, 2)), CAST(249.90 AS Numeric(7, 2)))
INSERT [dbo].[cityXcity] ([cityFrom], [cityTo], [feeCoefficient], [distanceKm]) VALUES (22, 44, CAST(1.80 AS Numeric(5, 2)), CAST(183.00 AS Numeric(7, 2)))
INSERT [dbo].[cityXcity] ([cityFrom], [cityTo], [feeCoefficient], [distanceKm]) VALUES (22, 49, CAST(1.70 AS Numeric(5, 2)), CAST(171.90 AS Numeric(7, 2)))
INSERT [dbo].[cityXcity] ([cityFrom], [cityTo], [feeCoefficient], [distanceKm]) VALUES (23, 48, CAST(2.40 AS Numeric(5, 2)), CAST(256.20 AS Numeric(7, 2)))
INSERT [dbo].[cityXcity] ([cityFrom], [cityTo], [feeCoefficient], [distanceKm]) VALUES (23, 50, CAST(1.30 AS Numeric(5, 2)), CAST(134.00 AS Numeric(7, 2)))
INSERT [dbo].[cityXcity] ([cityFrom], [cityTo], [feeCoefficient], [distanceKm]) VALUES (24, 47, CAST(2.20 AS Numeric(5, 2)), CAST(230.60 AS Numeric(7, 2)))
INSERT [dbo].[cityXcity] ([cityFrom], [cityTo], [feeCoefficient], [distanceKm]) VALUES (24, 54, CAST(1.60 AS Numeric(5, 2)), CAST(158.80 AS Numeric(7, 2)))
INSERT [dbo].[cityXcity] ([cityFrom], [cityTo], [feeCoefficient], [distanceKm]) VALUES (25, 51, CAST(2.00 AS Numeric(5, 2)), CAST(205.90 AS Numeric(7, 2)))
INSERT [dbo].[cityXcity] ([cityFrom], [cityTo], [feeCoefficient], [distanceKm]) VALUES (25, 56, CAST(1.90 AS Numeric(5, 2)), CAST(196.40 AS Numeric(7, 2)))
INSERT [dbo].[cityXcity] ([cityFrom], [cityTo], [feeCoefficient], [distanceKm]) VALUES (26, 53, CAST(1.80 AS Numeric(5, 2)), CAST(180.60 AS Numeric(7, 2)))
INSERT [dbo].[cityXcity] ([cityFrom], [cityTo], [feeCoefficient], [distanceKm]) VALUES (26, 57, CAST(2.10 AS Numeric(5, 2)), CAST(201.00 AS Numeric(7, 2)))
INSERT [dbo].[cityXcity] ([cityFrom], [cityTo], [feeCoefficient], [distanceKm]) VALUES (27, 52, CAST(1.70 AS Numeric(5, 2)), CAST(175.10 AS Numeric(7, 2)))
INSERT [dbo].[cityXcity] ([cityFrom], [cityTo], [feeCoefficient], [distanceKm]) VALUES (27, 58, CAST(2.40 AS Numeric(5, 2)), CAST(259.40 AS Numeric(7, 2)))
INSERT [dbo].[cityXcity] ([cityFrom], [cityTo], [feeCoefficient], [distanceKm]) VALUES (28, 55, CAST(1.50 AS Numeric(5, 2)), CAST(151.90 AS Numeric(7, 2)))
INSERT [dbo].[cityXcity] ([cityFrom], [cityTo], [feeCoefficient], [distanceKm]) VALUES (28, 59, CAST(2.10 AS Numeric(5, 2)), CAST(197.90 AS Numeric(7, 2)))
INSERT [dbo].[cityXcity] ([cityFrom], [cityTo], [feeCoefficient], [distanceKm]) VALUES (29, 60, CAST(1.70 AS Numeric(5, 2)), CAST(168.70 AS Numeric(7, 2)))
INSERT [dbo].[cityXcity] ([cityFrom], [cityTo], [feeCoefficient], [distanceKm]) VALUES (29, 62, CAST(1.30 AS Numeric(5, 2)), CAST(129.80 AS Numeric(7, 2)))
INSERT [dbo].[cityXcity] ([cityFrom], [cityTo], [feeCoefficient], [distanceKm]) VALUES (30, 61, CAST(2.20 AS Numeric(5, 2)), CAST(220.80 AS Numeric(7, 2)))
INSERT [dbo].[cityXcity] ([cityFrom], [cityTo], [feeCoefficient], [distanceKm]) VALUES (30, 63, CAST(1.60 AS Numeric(5, 2)), CAST(157.00 AS Numeric(7, 2)))
INSERT [dbo].[cityXcity] ([cityFrom], [cityTo], [feeCoefficient], [distanceKm]) VALUES (31, 64, CAST(2.00 AS Numeric(5, 2)), CAST(210.80 AS Numeric(7, 2)))
INSERT [dbo].[cityXcity] ([cityFrom], [cityTo], [feeCoefficient], [distanceKm]) VALUES (31, 66, CAST(1.80 AS Numeric(5, 2)), CAST(178.20 AS Numeric(7, 2)))
INSERT [dbo].[cityXcity] ([cityFrom], [cityTo], [feeCoefficient], [distanceKm]) VALUES (32, 65, CAST(2.30 AS Numeric(5, 2)), CAST(247.30 AS Numeric(7, 2)))
INSERT [dbo].[cityXcity] ([cityFrom], [cityTo], [feeCoefficient], [distanceKm]) VALUES (32, 68, CAST(1.50 AS Numeric(5, 2)), CAST(148.10 AS Numeric(7, 2)))
INSERT [dbo].[cityXcity] ([cityFrom], [cityTo], [feeCoefficient], [distanceKm]) VALUES (33, 67, CAST(1.90 AS Numeric(5, 2)), CAST(192.00 AS Numeric(7, 2)))
INSERT [dbo].[cityXcity] ([cityFrom], [cityTo], [feeCoefficient], [distanceKm]) VALUES (33, 69, CAST(2.10 AS Numeric(5, 2)), CAST(201.00 AS Numeric(7, 2)))
INSERT [dbo].[cityXcity] ([cityFrom], [cityTo], [feeCoefficient], [distanceKm]) VALUES (34, 70, CAST(1.70 AS Numeric(5, 2)), CAST(170.30 AS Numeric(7, 2)))
INSERT [dbo].[cityXcity] ([cityFrom], [cityTo], [feeCoefficient], [distanceKm]) VALUES (34, 72, CAST(2.40 AS Numeric(5, 2)), CAST(252.00 AS Numeric(7, 2)))
INSERT [dbo].[cityXcity] ([cityFrom], [cityTo], [feeCoefficient], [distanceKm]) VALUES (35, 71, CAST(1.30 AS Numeric(5, 2)), CAST(131.90 AS Numeric(7, 2)))
INSERT [dbo].[cityXcity] ([cityFrom], [cityTo], [feeCoefficient], [distanceKm]) VALUES (35, 74, CAST(2.20 AS Numeric(5, 2)), CAST(228.00 AS Numeric(7, 2)))
INSERT [dbo].[cityXcity] ([cityFrom], [cityTo], [feeCoefficient], [distanceKm]) VALUES (36, 73, CAST(1.60 AS Numeric(5, 2)), CAST(155.30 AS Numeric(7, 2)))
INSERT [dbo].[cityXcity] ([cityFrom], [cityTo], [feeCoefficient], [distanceKm]) VALUES (36, 75, CAST(2.00 AS Numeric(5, 2)), CAST(200.90 AS Numeric(7, 2)))
INSERT [dbo].[cityXcity] ([cityFrom], [cityTo], [feeCoefficient], [distanceKm]) VALUES (37, 76, CAST(1.80 AS Numeric(5, 2)), CAST(176.00 AS Numeric(7, 2)))
INSERT [dbo].[cityXcity] ([cityFrom], [cityTo], [feeCoefficient], [distanceKm]) VALUES (37, 78, CAST(2.30 AS Numeric(5, 2)), CAST(241.50 AS Numeric(7, 2)))
INSERT [dbo].[cityXcity] ([cityFrom], [cityTo], [feeCoefficient], [distanceKm]) VALUES (38, 77, CAST(1.50 AS Numeric(5, 2)), CAST(146.50 AS Numeric(7, 2)))
INSERT [dbo].[cityXcity] ([cityFrom], [cityTo], [feeCoefficient], [distanceKm]) VALUES (38, 79, CAST(1.90 AS Numeric(5, 2)), CAST(189.80 AS Numeric(7, 2)))
INSERT [dbo].[cityXcity] ([cityFrom], [cityTo], [feeCoefficient], [distanceKm]) VALUES (39, 80, CAST(2.10 AS Numeric(5, 2)), CAST(194.90 AS Numeric(7, 2)))
INSERT [dbo].[cityXcity] ([cityFrom], [cityTo], [feeCoefficient], [distanceKm]) VALUES (39, 82, CAST(1.70 AS Numeric(5, 2)), CAST(166.90 AS Numeric(7, 2)))
INSERT [dbo].[cityXcity] ([cityFrom], [cityTo], [feeCoefficient], [distanceKm]) VALUES (40, 81, CAST(2.40 AS Numeric(5, 2)), CAST(246.90 AS Numeric(7, 2)))
INSERT [dbo].[cityXcity] ([cityFrom], [cityTo], [feeCoefficient], [distanceKm]) VALUES (40, 84, CAST(1.30 AS Numeric(5, 2)), CAST(127.80 AS Numeric(7, 2)))
INSERT [dbo].[cityXcity] ([cityFrom], [cityTo], [feeCoefficient], [distanceKm]) VALUES (41, 83, CAST(2.20 AS Numeric(5, 2)), CAST(223.10 AS Numeric(7, 2)))
INSERT [dbo].[cityXcity] ([cityFrom], [cityTo], [feeCoefficient], [distanceKm]) VALUES (41, 86, CAST(1.60 AS Numeric(5, 2)), CAST(153.70 AS Numeric(7, 2)))
INSERT [dbo].[cityXcity] ([cityFrom], [cityTo], [feeCoefficient], [distanceKm]) VALUES (42, 85, CAST(2.00 AS Numeric(5, 2)), CAST(196.00 AS Numeric(7, 2)))
INSERT [dbo].[cityXcity] ([cityFrom], [cityTo], [feeCoefficient], [distanceKm]) VALUES (42, 88, CAST(1.80 AS Numeric(5, 2)), CAST(173.90 AS Numeric(7, 2)))
INSERT [dbo].[cityXcity] ([cityFrom], [cityTo], [feeCoefficient], [distanceKm]) VALUES (43, 87, CAST(2.30 AS Numeric(5, 2)), CAST(238.40 AS Numeric(7, 2)))
INSERT [dbo].[cityXcity] ([cityFrom], [cityTo], [feeCoefficient], [distanceKm]) VALUES (43, 90, CAST(1.50 AS Numeric(5, 2)), CAST(144.90 AS Numeric(7, 2)))
INSERT [dbo].[cityXcity] ([cityFrom], [cityTo], [feeCoefficient], [distanceKm]) VALUES (44, 89, CAST(1.90 AS Numeric(5, 2)), CAST(187.70 AS Numeric(7, 2)))
INSERT [dbo].[cityXcity] ([cityFrom], [cityTo], [feeCoefficient], [distanceKm]) VALUES (44, 91, CAST(2.10 AS Numeric(5, 2)), CAST(192.00 AS Numeric(7, 2)))
INSERT [dbo].[cityXcity] ([cityFrom], [cityTo], [feeCoefficient], [distanceKm]) VALUES (45, 92, CAST(1.70 AS Numeric(5, 2)), CAST(164.90 AS Numeric(7, 2)))
INSERT [dbo].[cityXcity] ([cityFrom], [cityTo], [feeCoefficient], [distanceKm]) VALUES (45, 93, CAST(2.40 AS Numeric(5, 2)), CAST(244.30 AS Numeric(7, 2)))
INSERT [dbo].[cityXcity] ([cityFrom], [cityTo], [feeCoefficient], [distanceKm]) VALUES (46, 95, CAST(1.30 AS Numeric(5, 2)), CAST(125.80 AS Numeric(7, 2)))
INSERT [dbo].[cityXcity] ([cityFrom], [cityTo], [feeCoefficient], [distanceKm]) VALUES (46, 96, CAST(2.20 AS Numeric(5, 2)), CAST(220.80 AS Numeric(7, 2)))
INSERT [dbo].[cityXcity] ([cityFrom], [cityTo], [feeCoefficient], [distanceKm]) VALUES (47, 94, CAST(1.60 AS Numeric(5, 2)), CAST(152.20 AS Numeric(7, 2)))
INSERT [dbo].[cityXcity] ([cityFrom], [cityTo], [feeCoefficient], [distanceKm]) VALUES (47, 97, CAST(2.00 AS Numeric(5, 2)), CAST(191.10 AS Numeric(7, 2)))
INSERT [dbo].[cityXcity] ([cityFrom], [cityTo], [feeCoefficient], [distanceKm]) VALUES (48, 98, CAST(1.80 AS Numeric(5, 2)), CAST(171.70 AS Numeric(7, 2)))
INSERT [dbo].[cityXcity] ([cityFrom], [cityTo], [feeCoefficient], [distanceKm]) VALUES (48, 100, CAST(2.30 AS Numeric(5, 2)), CAST(235.90 AS Numeric(7, 2)))
INSERT [dbo].[cityXcity] ([cityFrom], [cityTo], [feeCoefficient], [distanceKm]) VALUES (49, 99, CAST(1.50 AS Numeric(5, 2)), CAST(143.30 AS Numeric(7, 2)))
INSERT [dbo].[cityXcity] ([cityFrom], [cityTo], [feeCoefficient], [distanceKm]) VALUES (49, 101, CAST(1.90 AS Numeric(5, 2)), CAST(185.60 AS Numeric(7, 2)))
INSERT [dbo].[cityXcity] ([cityFrom], [cityTo], [feeCoefficient], [distanceKm]) VALUES (50, 102, CAST(2.10 AS Numeric(5, 2)), CAST(189.20 AS Numeric(7, 2)))
INSERT [dbo].[cityXcity] ([cityFrom], [cityTo], [feeCoefficient], [distanceKm]) VALUES (50, 104, CAST(1.70 AS Numeric(5, 2)), CAST(162.90 AS Numeric(7, 2)))
INSERT [dbo].[cityXcity] ([cityFrom], [cityTo], [feeCoefficient], [distanceKm]) VALUES (51, 103, CAST(2.40 AS Numeric(5, 2)), CAST(241.10 AS Numeric(7, 2)))
INSERT [dbo].[cityXcity] ([cityFrom], [cityTo], [feeCoefficient], [distanceKm]) VALUES (51, 105, CAST(1.30 AS Numeric(5, 2)), CAST(123.80 AS Numeric(7, 2)))
INSERT [dbo].[cityXcity] ([cityFrom], [cityTo], [feeCoefficient], [distanceKm]) VALUES (52, 106, CAST(2.20 AS Numeric(5, 2)), CAST(218.60 AS Numeric(7, 2)))
INSERT [dbo].[cityXcity] ([cityFrom], [cityTo], [feeCoefficient], [distanceKm]) VALUES (52, 108, CAST(1.60 AS Numeric(5, 2)), CAST(150.70 AS Numeric(7, 2)))
INSERT [dbo].[cityXcity] ([cityFrom], [cityTo], [feeCoefficient], [distanceKm]) VALUES (53, 107, CAST(2.00 AS Numeric(5, 2)), CAST(186.20 AS Numeric(7, 2)))
INSERT [dbo].[cityXcity] ([cityFrom], [cityTo], [feeCoefficient], [distanceKm]) VALUES (53, 109, CAST(1.80 AS Numeric(5, 2)), CAST(169.50 AS Numeric(7, 2)))
INSERT [dbo].[cityXcity] ([cityFrom], [cityTo], [feeCoefficient], [distanceKm]) VALUES (54, 110, CAST(2.30 AS Numeric(5, 2)), CAST(233.30 AS Numeric(7, 2)))
INSERT [dbo].[cityXcity] ([cityFrom], [cityTo], [feeCoefficient], [distanceKm]) VALUES (54, 112, CAST(1.50 AS Numeric(5, 2)), CAST(141.70 AS Numeric(7, 2)))
INSERT [dbo].[cityXcity] ([cityFrom], [cityTo], [feeCoefficient], [distanceKm]) VALUES (55, 111, CAST(1.90 AS Numeric(5, 2)), CAST(183.40 AS Numeric(7, 2)))
INSERT [dbo].[cityXcity] ([cityFrom], [cityTo], [feeCoefficient], [distanceKm]) VALUES (55, 113, CAST(2.10 AS Numeric(5, 2)), CAST(186.50 AS Numeric(7, 2)))
INSERT [dbo].[cityXcity] ([cityFrom], [cityTo], [feeCoefficient], [distanceKm]) VALUES (56, 115, CAST(1.70 AS Numeric(5, 2)), CAST(160.90 AS Numeric(7, 2)))
GO
SET IDENTITY_INSERT [dbo].[customer] ON 

INSERT [dbo].[customer] ([customerId], [firstname], [lastname], [address], [deleted], [_document]) VALUES (1, N'Pepe', N'Gonzalez', NULL, NULL, 11111111)
INSERT [dbo].[customer] ([customerId], [firstname], [lastname], [address], [deleted], [_document]) VALUES (2, N'Roberto', N'Gomez', N'Jara 3345', NULL, 54354346)
INSERT [dbo].[customer] ([customerId], [firstname], [lastname], [address], [deleted], [_document]) VALUES (3, N'Martin', N'Loab', N'mitre 5654', NULL, 56467654)
INSERT [dbo].[customer] ([customerId], [firstname], [lastname], [address], [deleted], [_document]) VALUES (4, N'Jessie', N'Horjeda', N'Direccion', NULL, 87643552)
INSERT [dbo].[customer] ([customerId], [firstname], [lastname], [address], [deleted], [_document]) VALUES (5, N'Marta', N'Jimenez', N'Dirección Reall', NULL, 45636546)
INSERT [dbo].[customer] ([customerId], [firstname], [lastname], [address], [deleted], [_document]) VALUES (6, N'Marcelo', N'Gomez', N'Jara 3346', NULL, 54354346)
INSERT [dbo].[customer] ([customerId], [firstname], [lastname], [address], [deleted], [_document]) VALUES (7, N'Marcelo', N'Gomez', N'Jara 3345', CAST(N'2023-09-06T00:55:09.770' AS DateTime), 54354346)
INSERT [dbo].[customer] ([customerId], [firstname], [lastname], [address], [deleted], [_document]) VALUES (8, N'Roberto', N'Gomez', N'Jara 3345', CAST(N'2023-09-06T01:02:52.153' AS DateTime), 54354346)
INSERT [dbo].[customer] ([customerId], [firstname], [lastname], [address], [deleted], [_document]) VALUES (9, N'Martina', N'Lara', N'JB Justo 3456', NULL, 12345678)
INSERT [dbo].[customer] ([customerId], [firstname], [lastname], [address], [deleted], [_document]) VALUES (10, N'Marcela', N'Gomez', N'Jara 3345', NULL, 54354346)
INSERT [dbo].[customer] ([customerId], [firstname], [lastname], [address], [deleted], [_document]) VALUES (11, N'Ricardo', N'Martinez', N'Fake 4255', NULL, 64564766)
INSERT [dbo].[customer] ([customerId], [firstname], [lastname], [address], [deleted], [_document]) VALUES (12, N'Marty', N'Lara', N'JB Justo 3456', NULL, 54645657)
INSERT [dbo].[customer] ([customerId], [firstname], [lastname], [address], [deleted], [_document]) VALUES (13, N'Lolo', N'Ferrin', NULL, CAST(N'2023-09-06T00:50:02.013' AS DateTime), 65467675)
INSERT [dbo].[customer] ([customerId], [firstname], [lastname], [address], [deleted], [_document]) VALUES (14, N'Reven', N'Mertens', N'La Rioja 2453', NULL, 65475656)
INSERT [dbo].[customer] ([customerId], [firstname], [lastname], [address], [deleted], [_document]) VALUES (15, N'Jose', N'Perez', NULL, CAST(N'2023-09-06T01:02:43.367' AS DateTime), 45654676)
INSERT [dbo].[customer] ([customerId], [firstname], [lastname], [address], [deleted], [_document]) VALUES (16, N'Titi', N'Montaner', NULL, CAST(N'2023-09-11T00:56:57.767' AS DateTime), 32545566)
INSERT [dbo].[customer] ([customerId], [firstname], [lastname], [address], [deleted], [_document]) VALUES (17, N'Pedro', N'Gimenez', NULL, CAST(N'2023-09-11T01:03:25.883' AS DateTime), 45645756)
INSERT [dbo].[customer] ([customerId], [firstname], [lastname], [address], [deleted], [_document]) VALUES (18, N'Héctor', N'Martínez', NULL, CAST(N'2023-09-11T01:05:03.673' AS DateTime), 45534654)
INSERT [dbo].[customer] ([customerId], [firstname], [lastname], [address], [deleted], [_document]) VALUES (19, N'Yoel', N'Gulbirt', N'Falucho 4563', NULL, 54356562)
INSERT [dbo].[customer] ([customerId], [firstname], [lastname], [address], [deleted], [_document]) VALUES (20, N'Lorenzo', N'Turron', N'Sarmiento 1234', NULL, 34254564)
SET IDENTITY_INSERT [dbo].[customer] OFF
GO
SET IDENTITY_INSERT [dbo].[driver] ON 

INSERT [dbo].[driver] ([firstname], [lastname], [_document], [address], [province], [city], [phone], [particular], [available], [currentcityid], [deleted], [driverId]) VALUES (N'Fernando', N'Cuevas', N'132334', NULL, NULL, NULL, N'223-540-7679', 0, 1, 8, NULL, 8)
INSERT [dbo].[driver] ([firstname], [lastname], [_document], [address], [province], [city], [phone], [particular], [available], [currentcityid], [deleted], [driverId]) VALUES (N'Tito', N'Rodriguez', N'645647', NULL, NULL, NULL, N'223-540-3545', 0, 1, 8, NULL, 33)
INSERT [dbo].[driver] ([firstname], [lastname], [_document], [address], [province], [city], [phone], [particular], [available], [currentcityid], [deleted], [driverId]) VALUES (N'Marita', N'Lopez', N'5465467', NULL, NULL, NULL, N'223-654-1543', 1, 1, 76, CAST(N'2023-09-17T18:37:01.983' AS DateTime), 34)
INSERT [dbo].[driver] ([firstname], [lastname], [_document], [address], [province], [city], [phone], [particular], [available], [currentcityid], [deleted], [driverId]) VALUES (N'Cuna', N'Ferra', N'5743654', NULL, NULL, NULL, N'223-555-7476', 1, 0, 10, NULL, 36)
INSERT [dbo].[driver] ([firstname], [lastname], [_document], [address], [province], [city], [phone], [particular], [available], [currentcityid], [deleted], [driverId]) VALUES (N'KikiDo', N'YouLoveMe', N'6545765', NULL, NULL, NULL, N'223-655-7678', 1, 1, 8, NULL, 45)
SET IDENTITY_INSERT [dbo].[driver] OFF
GO
SET IDENTITY_INSERT [dbo].[fee] ON 

INSERT [dbo].[fee] ([kgprice], [kmprice], [feetype], [cm3price], [registrationDate], [endDate], [feeId], [driverId]) VALUES (CAST(1.20 AS Numeric(10, 2)), CAST(1.10 AS Numeric(10, 2)), 1, NULL, CAST(N'2023-09-16T00:00:00.000' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[fee] ([kgprice], [kmprice], [feetype], [cm3price], [registrationDate], [endDate], [feeId], [driverId]) VALUES (CAST(1.30 AS Numeric(10, 2)), NULL, 2, CAST(1.10 AS Numeric(10, 2)), CAST(N'2023-09-16T00:00:00.000' AS DateTime), NULL, 2, NULL)
INSERT [dbo].[fee] ([kgprice], [kmprice], [feetype], [cm3price], [registrationDate], [endDate], [feeId], [driverId]) VALUES (CAST(1.32 AS Numeric(10, 2)), CAST(1.10 AS Numeric(10, 2)), 1, NULL, CAST(N'2023-09-17T00:00:00.000' AS DateTime), CAST(N'2023-09-17T20:54:52.253' AS DateTime), 6, 36)
INSERT [dbo].[fee] ([kgprice], [kmprice], [feetype], [cm3price], [registrationDate], [endDate], [feeId], [driverId]) VALUES (CAST(1.32 AS Numeric(10, 2)), CAST(1.10 AS Numeric(10, 2)), 1, NULL, CAST(N'2023-09-17T16:15:38.420' AS DateTime), NULL, 15, 45)
INSERT [dbo].[fee] ([kgprice], [kmprice], [feetype], [cm3price], [registrationDate], [endDate], [feeId], [driverId]) VALUES (CAST(1.10 AS Numeric(10, 2)), CAST(1.04 AS Numeric(10, 2)), 1, NULL, CAST(N'2023-09-17T16:58:04.987' AS DateTime), CAST(N'2023-09-17T16:58:56.670' AS DateTime), 16, 34)
INSERT [dbo].[fee] ([kgprice], [kmprice], [feetype], [cm3price], [registrationDate], [endDate], [feeId], [driverId]) VALUES (CAST(1.25 AS Numeric(10, 2)), CAST(1.33 AS Numeric(10, 2)), 1, NULL, CAST(N'2023-09-17T16:58:56.670' AS DateTime), CAST(N'2023-09-17T17:03:25.110' AS DateTime), 17, 34)
INSERT [dbo].[fee] ([kgprice], [kmprice], [feetype], [cm3price], [registrationDate], [endDate], [feeId], [driverId]) VALUES (CAST(1.05 AS Numeric(10, 2)), CAST(1.30 AS Numeric(10, 2)), 1, NULL, CAST(N'2023-09-17T18:34:32.153' AS DateTime), CAST(N'2023-09-17T18:37:02.043' AS DateTime), 18, 34)
INSERT [dbo].[fee] ([kgprice], [kmprice], [feetype], [cm3price], [registrationDate], [endDate], [feeId], [driverId]) VALUES (CAST(1.20 AS Numeric(10, 2)), CAST(1.20 AS Numeric(10, 2)), 1, NULL, CAST(N'2023-09-17T20:54:52.253' AS DateTime), NULL, 20, 36)
SET IDENTITY_INSERT [dbo].[fee] OFF
GO
INSERT [dbo].[feeType] ([description], [feeTypeId]) VALUES (N'Tarifa pago', 1)
INSERT [dbo].[feeType] ([description], [feeTypeId]) VALUES (N'Tarifa cobro', 2)
GO
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (8, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (8, 2)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (8, 3)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (9, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (9, 2)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (10, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (10, 2)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (10, 3)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (11, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (11, 2)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (12, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (13, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (13, 2)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (13, 3)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (14, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (14, 2)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (15, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (15, 2)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (15, 3)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (16, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (16, 2)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (17, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (17, 2)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (17, 3)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (18, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (18, 2)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (19, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (19, 2)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (19, 3)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (20, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (20, 2)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (20, 3)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (21, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (22, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (22, 2)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (23, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (23, 2)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (23, 3)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (24, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (24, 2)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (24, 3)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (25, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (25, 2)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (26, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (26, 2)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (26, 3)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (27, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (27, 2)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (27, 3)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (28, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (28, 2)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (29, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (29, 2)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (30, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (30, 2)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (30, 3)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (31, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (31, 2)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (31, 3)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (32, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (33, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (34, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (34, 2)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (34, 3)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (35, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (35, 2)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (35, 3)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (36, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (36, 2)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (37, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (37, 2)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (37, 3)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (38, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (38, 2)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (39, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (39, 2)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (40, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (40, 2)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (41, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (41, 2)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (41, 3)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (42, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (42, 2)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (42, 3)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (43, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (43, 2)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (44, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (44, 2)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (44, 3)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (45, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (45, 2)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (45, 3)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (46, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (46, 2)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (47, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (47, 2)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (47, 3)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (48, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (48, 2)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (49, 1)
GO
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (49, 2)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (49, 3)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (50, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (50, 2)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (51, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (51, 2)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (51, 3)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (52, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (52, 2)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (53, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (53, 2)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (54, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (54, 2)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (54, 3)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (55, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (55, 2)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (55, 3)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (56, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (56, 2)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (57, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (57, 2)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (57, 3)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (58, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (59, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (59, 2)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (59, 3)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (60, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (60, 2)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (61, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (61, 2)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (61, 3)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (62, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (62, 2)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (62, 3)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (63, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (63, 2)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (64, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (64, 2)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (64, 3)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (65, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (65, 2)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (66, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (66, 2)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (66, 3)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (67, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (67, 2)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (67, 3)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (68, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (68, 2)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (69, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (69, 2)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (69, 3)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (70, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (70, 2)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (70, 3)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (71, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (71, 2)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (72, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (72, 2)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (72, 3)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (73, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (73, 2)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (74, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (74, 2)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (74, 3)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (75, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (75, 2)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (76, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (76, 2)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (76, 3)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (77, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (77, 2)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (77, 3)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (78, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (78, 2)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (78, 3)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (79, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (79, 2)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (80, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (81, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (81, 2)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (82, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (82, 2)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (83, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (83, 2)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (83, 3)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (84, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (84, 2)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (85, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (85, 2)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (85, 3)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (86, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (86, 2)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (86, 3)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (87, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (87, 2)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (88, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (88, 2)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (88, 3)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (89, 1)
GO
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (89, 2)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (89, 3)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (90, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (90, 2)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (91, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (92, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (92, 2)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (92, 3)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (93, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (93, 2)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (94, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (94, 2)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (94, 3)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (95, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (95, 2)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (96, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (97, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (97, 2)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (98, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (99, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (99, 2)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (99, 3)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (100, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (100, 2)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (101, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (102, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (102, 2)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (103, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (104, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (104, 2)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (104, 3)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (105, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (105, 2)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (106, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (106, 2)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (106, 3)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (107, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (107, 2)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (107, 3)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (108, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (108, 2)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (109, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (110, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (110, 2)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (110, 3)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (111, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (111, 2)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (111, 3)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (112, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (112, 2)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (113, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (113, 2)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (113, 3)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (114, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (115, 1)
INSERT [dbo].[park] ([cityId], [parkId]) VALUES (115, 2)
GO
SET IDENTITY_INSERT [dbo].[trailer] ON 

INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (1, CAST(12540.34 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'AL4566LM', 1, 1, 8)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (17, CAST(7915.37 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'AP2367ZD', 1, 2, 16)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (22, CAST(13904.26 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'TD7251WJ', 1, 3, 61)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (23, CAST(13307.38 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'MJ8529QO', 1, 2, 23)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (24, CAST(8286.89 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'FS9180BL', 1, 3, 47)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (38, CAST(10858.03 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'GJ3492JH', 1, 1, 40)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (52, CAST(15768.94 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'BA4975YF', 1, 2, 69)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (53, CAST(10284.11 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'XH7328ZC', 1, 1, 64)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (60, CAST(12093.47 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'OQ1265BA', 1, 1, 15)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (73, CAST(14976.08 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'ZP4810KI', 1, 3, 51)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (74, CAST(15142.09 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'WF6841MP', 1, 3, 19)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (75, CAST(14487.89 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'LC9543YP', 1, 2, 66)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (89, CAST(15108.91 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'PJ6028LO', 1, 1, 13)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (90, CAST(11274.68 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'HP3957CG', 1, 2, 28)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (138, CAST(7601.28 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'RV2367AA', 1, 1, 8)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (139, CAST(8323.58 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'GK2367BB', 1, 2, 8)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (140, CAST(10092.97 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'PF2367CC', 1, 3, 8)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (141, CAST(8729.12 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'SK2367DD', 1, 1, 9)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (142, CAST(11744.26 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'MQ2367EE', 1, 2, 9)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (143, CAST(11346.49 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'YI2367FF', 1, 1, 10)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (162, CAST(9022.93 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'JD2367GG', 1, 2, 10)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (163, CAST(9610.63 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'CC2367HH', 1, 3, 10)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (164, CAST(14434.74 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'HC2367II', 1, 1, 11)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (165, CAST(10282.28 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'KK2367JJ', 1, 2, 11)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (166, CAST(7990.36 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'YD2367KK', 1, 1, 12)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (169, CAST(14913.89 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'QQ2367MM', 1, 1, 13)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (170, CAST(10962.06 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'MD2367NN', 1, 2, 13)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (171, CAST(10548.21 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'MI2367OO', 1, 3, 13)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (172, CAST(17539.27 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'XF2367PP', 1, 1, 14)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (173, CAST(14174.64 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'OF2367QQ', 1, 2, 14)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (174, CAST(16244.39 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'QJ2367RR', 1, 1, 15)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (175, CAST(14091.84 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'GE2367SS', 1, 2, 15)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (176, CAST(11862.43 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'NI2367TT', 1, 1, 16)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (177, CAST(13364.67 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'HN2367UU', 1, 2, 16)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (178, CAST(11684.23 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'YB2367VV', 1, 1, 17)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (179, CAST(14247.42 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'OO2367WW', 1, 2, 17)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (180, CAST(10584.46 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'XG2367XX', 1, 1, 18)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (181, CAST(10904.48 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'JD2367YY', 1, 2, 18)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (224, CAST(11509.03 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'CV2367ZZ', 1, 1, 19)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (225, CAST(14613.73 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'JQ2367AA', 1, 2, 19)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (226, CAST(13739.92 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'GG2367BB', 1, 3, 19)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (227, CAST(12438.48 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'HH2367CC', 1, 1, 20)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (228, CAST(15032.57 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'RK2367DD', 1, 2, 20)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (245, CAST(12333.33 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'JR2367EE', 1, 1, 21)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (246, CAST(14734.94 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'IN2367GG', 1, 1, 22)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (247, CAST(9592.07 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'OB2367HH', 1, 2, 22)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (248, CAST(7418.41 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'VK2367II', 1, 1, 23)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (249, CAST(16442.36 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'BD2367JJ', 1, 2, 23)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (250, CAST(12044.09 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'VC2367KK', 1, 1, 24)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (251, CAST(11786.81 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'LK2367LL', 1, 2, 24)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (252, CAST(16174.98 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'JC2367MM', 1, 1, 25)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (257, CAST(10107.61 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'MH2367NN', 1, 2, 25)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (258, CAST(17816.91 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'CN2367PP', 1, 1, 26)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (259, CAST(14293.32 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'GQ2367QQ', 1, 2, 26)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (260, CAST(10558.91 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'GJ2367RR', 1, 1, 27)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (261, CAST(8699.47 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'QD2367SS', 1, 2, 27)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (262, CAST(11010.76 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'ME2367TT', 1, 1, 28)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (263, CAST(15998.57 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'OB2367UU', 1, 2, 28)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (264, CAST(16207.33 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'DS2367VV', 1, 1, 29)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (272, CAST(15858.81 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'OA2367WW', 1, 2, 29)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (273, CAST(12379.16 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'JR2367XX', 1, 1, 30)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (274, CAST(14342.35 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'KK2367YY', 1, 2, 30)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (275, CAST(9861.23 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'FB2367ZZ', 1, 1, 31)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (276, CAST(17482.78 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'SS2367AA', 1, 2, 31)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (277, CAST(17183.75 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'KO2367BB', 1, 1, 32)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (296, CAST(14602.32 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'LC2367EE', 1, 1, 33)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (297, CAST(13794.06 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'QH2367GG', 1, 1, 34)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (298, CAST(14598.88 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'SF2367HH', 1, 2, 34)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (299, CAST(15159.67 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'YI2367II', 1, 1, 35)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (300, CAST(14158.99 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'YB2367JJ', 1, 2, 35)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (301, CAST(12205.49 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'XH2367KK', 1, 1, 36)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (302, CAST(7404.36 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'FK2367LL', 1, 2, 36)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (303, CAST(11239.32 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'OR2367MM', 1, 1, 37)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (304, CAST(9764.56 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'FZ2367NN', 1, 2, 37)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (305, CAST(13575.99 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'MP2367OO', 1, 1, 38)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (306, CAST(13223.73 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'VI2367PP', 1, 2, 38)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (307, CAST(13957.81 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'CF2367QQ', 1, 1, 39)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (308, CAST(15206.36 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'MC2367RR', 1, 2, 39)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (327, CAST(12309.71 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'SK2367SS', 1, 1, 40)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (328, CAST(16979.68 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'OI2367TT', 1, 2, 40)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (329, CAST(13660.42 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'SR2367UU', 1, 1, 41)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (330, CAST(14273.18 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'VN2367VV', 1, 2, 41)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (331, CAST(12222.49 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'GE2367WW', 1, 1, 42)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (332, CAST(9290.38 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'AG2367XX', 1, 2, 42)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (336, CAST(10412.14 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'CC2367YY', 1, 1, 43)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (337, CAST(11961.69 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'KH2367ZZ', 1, 2, 43)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (338, CAST(16114.75 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'FJ2367BB', 1, 1, 44)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (339, CAST(11788.73 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'DI2367CC', 1, 2, 44)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (340, CAST(8660.98 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'KN2367DD', 1, 1, 45)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (341, CAST(10653.15 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'VF2367EE', 1, 2, 45)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (342, CAST(14587.69 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'VA2367FF', 1, 1, 46)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (343, CAST(16664.82 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'HA2367GG', 1, 2, 46)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (344, CAST(12186.87 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'PE2367HH', 1, 1, 47)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (345, CAST(14917.93 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'VO2367II', 1, 2, 47)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (346, CAST(11398.81 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'MK2367JJ', 1, 1, 48)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (347, CAST(15347.36 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'CF2367KK', 1, 2, 48)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (348, CAST(13869.18 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'KL2367LL', 1, 1, 49)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (349, CAST(15602.34 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'OQ2367MM', 1, 2, 49)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (350, CAST(17583.87 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'PM2367NN', 1, 1, 50)
GO
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (351, CAST(15533.95 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'ZJ2367OO', 1, 2, 50)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (352, CAST(14423.54 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'UZ2367PP', 1, 1, 51)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (368, CAST(13336.41 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'XI2367QQ', 1, 2, 51)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (369, CAST(15604.66 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'SC2367RR', 1, 1, 52)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (370, CAST(15672.68 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'YF2367SS', 1, 2, 52)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (371, CAST(17716.75 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'HH2367TT', 1, 1, 53)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (372, CAST(17247.36 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'MK2367UU', 1, 2, 53)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (373, CAST(12977.76 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'DB2367VV', 1, 1, 54)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (374, CAST(9772.18 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'NF2367WW', 1, 2, 54)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (375, CAST(11255.58 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'BD2367XX', 1, 1, 55)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (376, CAST(8579.22 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'FQ2367YY', 1, 2, 55)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (377, CAST(9874.14 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'FR2367ZZ', 1, 1, 56)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (378, CAST(11908.57 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'VD2367AA', 1, 2, 56)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (379, CAST(8538.82 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'LJ2367BB', 1, 1, 57)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (380, CAST(12929.78 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'MJ2367CC', 1, 2, 57)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (385, CAST(8691.16 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'YB2367DD', 1, 1, 58)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (386, CAST(11918.19 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'CC2367FF', 1, 1, 59)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (387, CAST(11721.95 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'NA2367GG', 1, 2, 59)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (388, CAST(17423.35 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'CQ2367HH', 1, 1, 60)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (389, CAST(13407.59 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'RK2367II', 1, 2, 60)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (390, CAST(7463.35 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'SN2367JJ', 1, 1, 61)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (391, CAST(9358.99 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'DN2367KK', 1, 2, 61)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (392, CAST(16236.48 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'JJ2367LL', 1, 1, 62)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (393, CAST(16543.55 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'PE2367MM', 1, 2, 62)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (394, CAST(16867.86 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'BF2367NN', 1, 1, 63)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (395, CAST(10862.99 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'QK2367OO', 1, 2, 63)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (396, CAST(13796.89 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'AC2367PP', 1, 1, 64)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (397, CAST(7628.42 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'NJ2367QQ', 1, 2, 64)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (398, CAST(10036.82 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'DH2367RR', 1, 1, 65)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (399, CAST(15263.73 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'VQ2367SS', 1, 2, 65)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (400, CAST(14096.58 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'CH2367TT', 1, 1, 66)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (401, CAST(16018.66 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'MF2367UU', 1, 2, 66)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (402, CAST(12454.82 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'HJ2367VV', 1, 1, 67)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (403, CAST(10697.79 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'DM2367WW', 1, 2, 67)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (404, CAST(11216.38 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'QI2367XX', 1, 1, 68)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (405, CAST(17239.35 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'XK2367YY', 1, 2, 68)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (406, CAST(15164.55 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'GE2367ZZ', 1, 1, 69)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (407, CAST(9738.54 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'QJ2367AA', 1, 2, 69)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (408, CAST(11988.54 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'JF2367BB', 1, 1, 70)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (409, CAST(9953.15 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'GK2367CC', 1, 2, 70)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (410, CAST(12625.81 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'ZJ2367DD', 1, 1, 71)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (411, CAST(15348.98 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'CZ2367EE', 1, 2, 71)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (412, CAST(8597.67 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'NJ2367FF', 1, 1, 72)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (413, CAST(13379.48 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'KK2367GG', 1, 2, 72)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (426, CAST(11244.75 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'OK2367HH', 1, 1, 73)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (427, CAST(13942.73 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'ZD2367II', 1, 2, 73)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (428, CAST(12323.52 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'LJ2367JJ', 1, 1, 74)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (429, CAST(16286.54 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'QF2367KK', 1, 2, 74)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (440, CAST(12022.78 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'NI2367LL', 1, 1, 75)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (441, CAST(15684.54 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'LO2367NN', 1, 1, 76)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (442, CAST(12973.59 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'ZM2367OO', 1, 2, 76)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (443, CAST(11026.51 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'BB2367PP', 1, 1, 77)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (444, CAST(13861.62 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'KI2367QQ', 1, 2, 77)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (445, CAST(13215.98 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'SD2367RR', 1, 1, 78)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (446, CAST(13766.36 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'FC2367SS', 1, 2, 78)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (467, CAST(10788.56 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'QH2367TT', 1, 1, 79)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (468, CAST(14679.87 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'EG2367UU', 1, 2, 79)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (469, CAST(13360.36 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'ZJ2367VV', 1, 1, 80)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (470, CAST(9889.78 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'MO2367XX', 1, 1, 81)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (471, CAST(10315.51 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'CQ2367YY', 1, 2, 81)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (472, CAST(16335.69 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'CA2367ZZ', 1, 1, 82)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (473, CAST(15620.68 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'SK2367AA', 1, 2, 82)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (474, CAST(9530.59 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'KK2367BB', 1, 1, 83)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (475, CAST(10299.12 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'FC2367CC', 1, 2, 83)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (476, CAST(17607.58 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'LI2367DD', 1, 1, 84)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (477, CAST(15254.92 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'PJ2367EE', 1, 2, 84)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (478, CAST(11988.36 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'VN2367FF', 1, 1, 85)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (479, CAST(16854.67 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'GF2367GG', 1, 2, 85)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (480, CAST(15280.99 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'ZR2367HH', 1, 1, 86)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (481, CAST(15017.49 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'PK2367II', 1, 2, 86)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (482, CAST(11200.37 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'XC2367JJ', 1, 1, 87)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (483, CAST(12158.59 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'OQ2367KK', 1, 2, 87)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (484, CAST(15378.99 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'QJ2367LL', 1, 1, 88)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (485, CAST(11723.54 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'ZG2367MM', 1, 2, 88)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (492, CAST(13192.85 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'BJ2367NN', 1, 1, 89)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (493, CAST(11875.36 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'RJ2367OO', 1, 2, 89)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (494, CAST(12000.23 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'YF2367PP', 1, 1, 90)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (495, CAST(13188.34 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'DI2367QQ', 1, 2, 90)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (498, CAST(12944.85 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'CH2367RR', 1, 1, 91)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (499, CAST(12521.92 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'QK2367TT', 1, 1, 92)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (500, CAST(12168.47 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'OC2367UU', 1, 2, 92)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (501, CAST(15862.84 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'ZK2367VV', 1, 1, 93)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (502, CAST(14417.94 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'JJ2367WW', 1, 2, 93)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (503, CAST(10522.69 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'BB2367XX', 1, 1, 94)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (504, CAST(14484.55 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'ME2367YY', 1, 2, 94)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (505, CAST(15279.62 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'IK2367ZZ', 1, 1, 95)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (518, CAST(7644.23 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'MD2367AA', 1, 2, 95)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (519, CAST(16748.75 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'CK2367BB', 1, 1, 96)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (532, CAST(15789.51 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'AN2367DD', 1, 1, 97)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (533, CAST(13321.62 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'AI2367EE', 1, 2, 97)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (534, CAST(16554.52 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'LQ2367FF', 1, 1, 98)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (547, CAST(15889.72 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'SN2367HH', 1, 1, 99)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (548, CAST(16802.33 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'NC2367II', 1, 2, 99)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (549, CAST(14152.88 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'ND2367JJ', 1, 1, 100)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (550, CAST(15795.12 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'GN2367KK', 1, 2, 100)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (558, CAST(17683.53 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'AE2367LL', 1, 1, 101)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (559, CAST(14894.49 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'OM2367NN', 1, 1, 102)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (560, CAST(13144.42 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'XJ2367OO', 1, 2, 102)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (561, CAST(12057.53 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'KM2367PP', 1, 1, 103)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (571, CAST(14551.76 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'PK2367RR', 1, 1, 104)
GO
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (572, CAST(16193.78 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'HH2367SS', 1, 2, 104)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (573, CAST(16995.74 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'XK2367TT', 1, 1, 105)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (574, CAST(12268.22 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'AB2367UU', 1, 2, 105)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (588, CAST(15601.36 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'DD2367VV', 1, 1, 106)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (589, CAST(15315.12 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'VH2367XX', 1, 1, 107)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (590, CAST(17459.92 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'AM2367YY', 1, 2, 107)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (591, CAST(9525.12 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'SK2367ZZ', 1, 1, 108)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (592, CAST(14175.77 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'SF2367AA', 1, 2, 108)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (599, CAST(12099.38 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'DK2367BB', 1, 1, 109)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (600, CAST(13656.98 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'MH2367DD', 1, 1, 110)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (601, CAST(8552.15 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'RD2367EE', 1, 2, 110)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (602, CAST(11369.75 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'MK2367FF', 1, 1, 111)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (603, CAST(15984.56 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'KB2367GG', 1, 2, 111)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (604, CAST(16507.42 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'BM2367HH', 1, 1, 112)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (605, CAST(17564.57 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'CC2367II', 1, 2, 112)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (606, CAST(16994.67 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'GQ2367JJ', 1, 1, 113)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (613, CAST(13957.38 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'PK2367KK', 1, 2, 113)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (614, CAST(12152.27 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'JG2367LL', 1, 1, 114)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (615, CAST(12049.38 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'RC2367NN', 1, 1, 115)
INSERT [dbo].[trailer] ([trailerId], [weight], [payloadWeight], [registration], [available], [parkId], [cityId]) VALUES (616, CAST(17525.62 AS Numeric(7, 2)), CAST(0.00 AS Numeric(7, 2)), N'CC2367OO', 1, 2, 115)
SET IDENTITY_INSERT [dbo].[trailer] OFF
GO
SET IDENTITY_INSERT [dbo].[truck] ON 

INSERT [dbo].[truck] ([driver], [registrationDate], [registration], [maxweight], [available], [city], [truckId], [deleted]) VALUES (NULL, CAST(N'2023-09-16T00:00:00.000' AS DateTime), N'XY1234AB', CAST(16576.00 AS Numeric(8, 2)), 1, NULL, 1, NULL)
INSERT [dbo].[truck] ([driver], [registrationDate], [registration], [maxweight], [available], [city], [truckId], [deleted]) VALUES (NULL, CAST(N'2023-09-16T00:00:00.000' AS DateTime), N'ZR5678CD', CAST(29482.00 AS Numeric(8, 2)), 1, NULL, 2, NULL)
INSERT [dbo].[truck] ([driver], [registrationDate], [registration], [maxweight], [available], [city], [truckId], [deleted]) VALUES (NULL, CAST(N'2023-09-16T00:00:00.000' AS DateTime), N'FG9012EF', CAST(17134.00 AS Numeric(8, 2)), 1, NULL, 3, NULL)
INSERT [dbo].[truck] ([driver], [registrationDate], [registration], [maxweight], [available], [city], [truckId], [deleted]) VALUES (NULL, CAST(N'2023-09-16T00:00:00.000' AS DateTime), N'OP3456GH', CAST(36567.00 AS Numeric(8, 2)), 1, NULL, 4, NULL)
INSERT [dbo].[truck] ([driver], [registrationDate], [registration], [maxweight], [available], [city], [truckId], [deleted]) VALUES (NULL, CAST(N'2023-09-16T00:00:00.000' AS DateTime), N'LM7890IJ', CAST(22643.00 AS Numeric(8, 2)), 1, NULL, 5, NULL)
INSERT [dbo].[truck] ([driver], [registrationDate], [registration], [maxweight], [available], [city], [truckId], [deleted]) VALUES (NULL, CAST(N'2023-09-16T00:00:00.000' AS DateTime), N'UV2345KL', CAST(22105.00 AS Numeric(8, 2)), 1, NULL, 6, NULL)
INSERT [dbo].[truck] ([driver], [registrationDate], [registration], [maxweight], [available], [city], [truckId], [deleted]) VALUES (NULL, CAST(N'2023-09-16T00:00:00.000' AS DateTime), N'CD6789MN', CAST(23890.00 AS Numeric(8, 2)), 1, NULL, 7, NULL)
INSERT [dbo].[truck] ([driver], [registrationDate], [registration], [maxweight], [available], [city], [truckId], [deleted]) VALUES (NULL, CAST(N'2023-09-16T00:00:00.000' AS DateTime), N'AB0123OP', CAST(20973.00 AS Numeric(8, 2)), 1, NULL, 8, NULL)
INSERT [dbo].[truck] ([driver], [registrationDate], [registration], [maxweight], [available], [city], [truckId], [deleted]) VALUES (NULL, CAST(N'2023-09-16T00:00:00.000' AS DateTime), N'DE4567QR', CAST(19244.00 AS Numeric(8, 2)), 1, NULL, 9, NULL)
INSERT [dbo].[truck] ([driver], [registrationDate], [registration], [maxweight], [available], [city], [truckId], [deleted]) VALUES (NULL, CAST(N'2023-09-16T00:00:00.000' AS DateTime), N'YZ8901ST', CAST(35782.00 AS Numeric(8, 2)), 1, NULL, 10, NULL)
INSERT [dbo].[truck] ([driver], [registrationDate], [registration], [maxweight], [available], [city], [truckId], [deleted]) VALUES (NULL, CAST(N'2023-09-16T00:00:00.000' AS DateTime), N'KL2345UV', CAST(22234.00 AS Numeric(8, 2)), 1, NULL, 11, NULL)
INSERT [dbo].[truck] ([driver], [registrationDate], [registration], [maxweight], [available], [city], [truckId], [deleted]) VALUES (NULL, CAST(N'2023-09-16T00:00:00.000' AS DateTime), N'MN6789WX', CAST(31598.00 AS Numeric(8, 2)), 1, NULL, 12, NULL)
INSERT [dbo].[truck] ([driver], [registrationDate], [registration], [maxweight], [available], [city], [truckId], [deleted]) VALUES (NULL, CAST(N'2023-09-16T00:00:00.000' AS DateTime), N'OP0123YZ', CAST(16723.00 AS Numeric(8, 2)), 1, NULL, 13, NULL)
INSERT [dbo].[truck] ([driver], [registrationDate], [registration], [maxweight], [available], [city], [truckId], [deleted]) VALUES (NULL, CAST(N'2023-09-16T00:00:00.000' AS DateTime), N'QR4567AB', CAST(26490.00 AS Numeric(8, 2)), 1, NULL, 14, NULL)
INSERT [dbo].[truck] ([driver], [registrationDate], [registration], [maxweight], [available], [city], [truckId], [deleted]) VALUES (NULL, CAST(N'2023-09-16T00:00:00.000' AS DateTime), N'ST8901CD', CAST(19076.00 AS Numeric(8, 2)), 1, NULL, 15, NULL)
INSERT [dbo].[truck] ([driver], [registrationDate], [registration], [maxweight], [available], [city], [truckId], [deleted]) VALUES (NULL, CAST(N'2023-09-16T00:00:00.000' AS DateTime), N'UV2345DE', CAST(37345.00 AS Numeric(8, 2)), 1, NULL, 16, NULL)
INSERT [dbo].[truck] ([driver], [registrationDate], [registration], [maxweight], [available], [city], [truckId], [deleted]) VALUES (NULL, CAST(N'2023-09-16T00:00:00.000' AS DateTime), N'WX6789FG', CAST(33467.00 AS Numeric(8, 2)), 1, NULL, 17, NULL)
INSERT [dbo].[truck] ([driver], [registrationDate], [registration], [maxweight], [available], [city], [truckId], [deleted]) VALUES (NULL, CAST(N'2023-09-16T00:00:00.000' AS DateTime), N'YZ0123GH', CAST(26987.00 AS Numeric(8, 2)), 1, NULL, 18, NULL)
INSERT [dbo].[truck] ([driver], [registrationDate], [registration], [maxweight], [available], [city], [truckId], [deleted]) VALUES (NULL, CAST(N'2023-09-16T00:00:00.000' AS DateTime), N'CD8901KL', CAST(18923.00 AS Numeric(8, 2)), 1, NULL, 20, NULL)
INSERT [dbo].[truck] ([driver], [registrationDate], [registration], [maxweight], [available], [city], [truckId], [deleted]) VALUES (NULL, CAST(N'2023-09-16T00:00:00.000' AS DateTime), N'DE2345MN', CAST(15237.00 AS Numeric(8, 2)), 1, NULL, 21, NULL)
INSERT [dbo].[truck] ([driver], [registrationDate], [registration], [maxweight], [available], [city], [truckId], [deleted]) VALUES (NULL, CAST(N'2023-09-16T00:00:00.000' AS DateTime), N'FG6789OP', CAST(32017.00 AS Numeric(8, 2)), 1, NULL, 22, NULL)
INSERT [dbo].[truck] ([driver], [registrationDate], [registration], [maxweight], [available], [city], [truckId], [deleted]) VALUES (NULL, CAST(N'2023-09-16T00:00:00.000' AS DateTime), N'GH0123QR', CAST(26489.00 AS Numeric(8, 2)), 1, NULL, 23, NULL)
INSERT [dbo].[truck] ([driver], [registrationDate], [registration], [maxweight], [available], [city], [truckId], [deleted]) VALUES (NULL, CAST(N'2023-09-16T00:00:00.000' AS DateTime), N'IJ4567ST', CAST(25809.00 AS Numeric(8, 2)), 1, NULL, 24, NULL)
INSERT [dbo].[truck] ([driver], [registrationDate], [registration], [maxweight], [available], [city], [truckId], [deleted]) VALUES (NULL, CAST(N'2023-09-16T00:00:00.000' AS DateTime), N'KL8901UV', CAST(27755.00 AS Numeric(8, 2)), 1, NULL, 25, NULL)
INSERT [dbo].[truck] ([driver], [registrationDate], [registration], [maxweight], [available], [city], [truckId], [deleted]) VALUES (NULL, CAST(N'2023-09-16T00:00:00.000' AS DateTime), N'MN2345WX', CAST(24893.00 AS Numeric(8, 2)), 1, NULL, 26, NULL)
INSERT [dbo].[truck] ([driver], [registrationDate], [registration], [maxweight], [available], [city], [truckId], [deleted]) VALUES (NULL, CAST(N'2023-09-16T00:00:00.000' AS DateTime), N'OP6789YZ', CAST(34672.00 AS Numeric(8, 2)), 1, NULL, 27, NULL)
INSERT [dbo].[truck] ([driver], [registrationDate], [registration], [maxweight], [available], [city], [truckId], [deleted]) VALUES (NULL, CAST(N'2023-09-16T00:00:00.000' AS DateTime), N'QR0123AB', CAST(19346.00 AS Numeric(8, 2)), 1, NULL, 28, NULL)
INSERT [dbo].[truck] ([driver], [registrationDate], [registration], [maxweight], [available], [city], [truckId], [deleted]) VALUES (NULL, CAST(N'2023-09-16T00:00:00.000' AS DateTime), N'ST4567CD', CAST(26984.00 AS Numeric(8, 2)), 1, NULL, 29, NULL)
INSERT [dbo].[truck] ([driver], [registrationDate], [registration], [maxweight], [available], [city], [truckId], [deleted]) VALUES (NULL, CAST(N'2023-09-16T00:00:00.000' AS DateTime), N'UV8901DE', CAST(36921.00 AS Numeric(8, 2)), 1, NULL, 30, NULL)
INSERT [dbo].[truck] ([driver], [registrationDate], [registration], [maxweight], [available], [city], [truckId], [deleted]) VALUES (NULL, CAST(N'2023-09-16T00:00:00.000' AS DateTime), N'WX2345FG', CAST(32546.00 AS Numeric(8, 2)), 1, NULL, 31, NULL)
INSERT [dbo].[truck] ([driver], [registrationDate], [registration], [maxweight], [available], [city], [truckId], [deleted]) VALUES (NULL, CAST(N'2023-09-16T00:00:00.000' AS DateTime), N'YZ6789GH', CAST(18234.00 AS Numeric(8, 2)), 1, NULL, 32, NULL)
INSERT [dbo].[truck] ([driver], [registrationDate], [registration], [maxweight], [available], [city], [truckId], [deleted]) VALUES (NULL, CAST(N'2023-09-16T00:00:00.000' AS DateTime), N'AB0123IJ', CAST(23976.00 AS Numeric(8, 2)), 1, NULL, 33, NULL)
INSERT [dbo].[truck] ([driver], [registrationDate], [registration], [maxweight], [available], [city], [truckId], [deleted]) VALUES (NULL, CAST(N'2023-09-16T00:00:00.000' AS DateTime), N'CD4567KL', CAST(33578.00 AS Numeric(8, 2)), 1, NULL, 34, NULL)
INSERT [dbo].[truck] ([driver], [registrationDate], [registration], [maxweight], [available], [city], [truckId], [deleted]) VALUES (NULL, CAST(N'2023-09-16T00:00:00.000' AS DateTime), N'DE8901MN', CAST(18823.00 AS Numeric(8, 2)), 1, NULL, 35, NULL)
INSERT [dbo].[truck] ([driver], [registrationDate], [registration], [maxweight], [available], [city], [truckId], [deleted]) VALUES (NULL, CAST(N'2023-09-16T00:00:00.000' AS DateTime), N'FG2345OP', CAST(16134.00 AS Numeric(8, 2)), 1, NULL, 36, NULL)
INSERT [dbo].[truck] ([driver], [registrationDate], [registration], [maxweight], [available], [city], [truckId], [deleted]) VALUES (NULL, CAST(N'2023-09-16T00:00:00.000' AS DateTime), N'GH6789QR', CAST(34789.00 AS Numeric(8, 2)), 1, NULL, 37, NULL)
INSERT [dbo].[truck] ([driver], [registrationDate], [registration], [maxweight], [available], [city], [truckId], [deleted]) VALUES (NULL, CAST(N'2023-09-16T00:00:00.000' AS DateTime), N'IJ0123ST', CAST(36091.00 AS Numeric(8, 2)), 1, NULL, 38, NULL)
INSERT [dbo].[truck] ([driver], [registrationDate], [registration], [maxweight], [available], [city], [truckId], [deleted]) VALUES (NULL, CAST(N'2023-09-16T00:00:00.000' AS DateTime), N'KL4567UV', CAST(21348.00 AS Numeric(8, 2)), 1, NULL, 39, NULL)
INSERT [dbo].[truck] ([driver], [registrationDate], [registration], [maxweight], [available], [city], [truckId], [deleted]) VALUES (NULL, CAST(N'2023-09-16T00:00:00.000' AS DateTime), N'MN8901WX', CAST(17392.00 AS Numeric(8, 2)), 1, NULL, 40, NULL)
INSERT [dbo].[truck] ([driver], [registrationDate], [registration], [maxweight], [available], [city], [truckId], [deleted]) VALUES (NULL, CAST(N'2023-09-16T00:00:00.000' AS DateTime), N'OP2345YZ', CAST(29985.00 AS Numeric(8, 2)), 1, NULL, 41, NULL)
INSERT [dbo].[truck] ([driver], [registrationDate], [registration], [maxweight], [available], [city], [truckId], [deleted]) VALUES (NULL, CAST(N'2023-09-16T00:00:00.000' AS DateTime), N'QR6789AB', CAST(25348.00 AS Numeric(8, 2)), 1, NULL, 42, NULL)
INSERT [dbo].[truck] ([driver], [registrationDate], [registration], [maxweight], [available], [city], [truckId], [deleted]) VALUES (NULL, CAST(N'2023-09-16T00:00:00.000' AS DateTime), N'ST0123CD', CAST(26345.00 AS Numeric(8, 2)), 1, NULL, 43, NULL)
INSERT [dbo].[truck] ([driver], [registrationDate], [registration], [maxweight], [available], [city], [truckId], [deleted]) VALUES (NULL, CAST(N'2023-09-16T00:00:00.000' AS DateTime), N'UV4567DE', CAST(31568.00 AS Numeric(8, 2)), 1, NULL, 44, NULL)
INSERT [dbo].[truck] ([driver], [registrationDate], [registration], [maxweight], [available], [city], [truckId], [deleted]) VALUES (NULL, CAST(N'2023-09-16T00:00:00.000' AS DateTime), N'WX8901FG', CAST(15784.00 AS Numeric(8, 2)), 1, NULL, 45, NULL)
INSERT [dbo].[truck] ([driver], [registrationDate], [registration], [maxweight], [available], [city], [truckId], [deleted]) VALUES (NULL, CAST(N'2023-09-16T00:00:00.000' AS DateTime), N'YZ2345GH', CAST(32894.00 AS Numeric(8, 2)), 1, NULL, 46, NULL)
INSERT [dbo].[truck] ([driver], [registrationDate], [registration], [maxweight], [available], [city], [truckId], [deleted]) VALUES (NULL, CAST(N'2023-09-16T00:00:00.000' AS DateTime), N'AB6789IJ', CAST(24167.00 AS Numeric(8, 2)), 1, NULL, 47, NULL)
INSERT [dbo].[truck] ([driver], [registrationDate], [registration], [maxweight], [available], [city], [truckId], [deleted]) VALUES (NULL, CAST(N'2023-09-16T00:00:00.000' AS DateTime), N'CD0123KL', CAST(17042.00 AS Numeric(8, 2)), 1, NULL, 48, NULL)
INSERT [dbo].[truck] ([driver], [registrationDate], [registration], [maxweight], [available], [city], [truckId], [deleted]) VALUES (NULL, CAST(N'2023-09-16T00:00:00.000' AS DateTime), N'DE4567MN', CAST(37285.00 AS Numeric(8, 2)), 1, NULL, 49, NULL)
INSERT [dbo].[truck] ([driver], [registrationDate], [registration], [maxweight], [available], [city], [truckId], [deleted]) VALUES (NULL, CAST(N'2023-09-16T00:00:00.000' AS DateTime), N'FG8901OP', CAST(16097.00 AS Numeric(8, 2)), 1, NULL, 50, NULL)
INSERT [dbo].[truck] ([driver], [registrationDate], [registration], [maxweight], [available], [city], [truckId], [deleted]) VALUES (NULL, CAST(N'2023-09-16T00:00:00.000' AS DateTime), N'GH2345QR', CAST(36159.00 AS Numeric(8, 2)), 1, NULL, 51, NULL)
INSERT [dbo].[truck] ([driver], [registrationDate], [registration], [maxweight], [available], [city], [truckId], [deleted]) VALUES (NULL, CAST(N'2023-09-16T00:00:00.000' AS DateTime), N'IJ6789ST', CAST(30549.00 AS Numeric(8, 2)), 1, NULL, 52, NULL)
INSERT [dbo].[truck] ([driver], [registrationDate], [registration], [maxweight], [available], [city], [truckId], [deleted]) VALUES (NULL, CAST(N'2023-09-16T00:00:00.000' AS DateTime), N'KL0123UV', CAST(22456.00 AS Numeric(8, 2)), 1, NULL, 53, NULL)
INSERT [dbo].[truck] ([driver], [registrationDate], [registration], [maxweight], [available], [city], [truckId], [deleted]) VALUES (NULL, CAST(N'2023-09-16T00:00:00.000' AS DateTime), N'MN4567WX', CAST(31674.00 AS Numeric(8, 2)), 1, NULL, 54, NULL)
INSERT [dbo].[truck] ([driver], [registrationDate], [registration], [maxweight], [available], [city], [truckId], [deleted]) VALUES (NULL, CAST(N'2023-09-16T00:00:00.000' AS DateTime), N'OP8901YZ', CAST(27349.00 AS Numeric(8, 2)), 1, NULL, 55, NULL)
INSERT [dbo].[truck] ([driver], [registrationDate], [registration], [maxweight], [available], [city], [truckId], [deleted]) VALUES (NULL, CAST(N'2023-09-16T00:00:00.000' AS DateTime), N'QR2345AB', CAST(29387.00 AS Numeric(8, 2)), 1, NULL, 56, NULL)
INSERT [dbo].[truck] ([driver], [registrationDate], [registration], [maxweight], [available], [city], [truckId], [deleted]) VALUES (NULL, CAST(N'2023-09-16T00:00:00.000' AS DateTime), N'ST6789CD', CAST(23695.00 AS Numeric(8, 2)), 1, NULL, 57, NULL)
INSERT [dbo].[truck] ([driver], [registrationDate], [registration], [maxweight], [available], [city], [truckId], [deleted]) VALUES (NULL, CAST(N'2023-09-16T00:00:00.000' AS DateTime), N'UV0123DE', CAST(24436.00 AS Numeric(8, 2)), 1, NULL, 58, NULL)
INSERT [dbo].[truck] ([driver], [registrationDate], [registration], [maxweight], [available], [city], [truckId], [deleted]) VALUES (NULL, CAST(N'2023-09-16T00:00:00.000' AS DateTime), N'WX4567FG', CAST(18057.00 AS Numeric(8, 2)), 1, NULL, 59, NULL)
INSERT [dbo].[truck] ([driver], [registrationDate], [registration], [maxweight], [available], [city], [truckId], [deleted]) VALUES (NULL, CAST(N'2023-09-16T00:00:00.000' AS DateTime), N'YZ8901GH', CAST(36073.00 AS Numeric(8, 2)), 1, NULL, 60, NULL)
INSERT [dbo].[truck] ([driver], [registrationDate], [registration], [maxweight], [available], [city], [truckId], [deleted]) VALUES (NULL, CAST(N'2023-09-16T00:00:00.000' AS DateTime), N'AB2345IJ', CAST(34628.00 AS Numeric(8, 2)), 1, NULL, 61, NULL)
INSERT [dbo].[truck] ([driver], [registrationDate], [registration], [maxweight], [available], [city], [truckId], [deleted]) VALUES (NULL, CAST(N'2023-09-16T00:00:00.000' AS DateTime), N'CD6789KL', CAST(21847.00 AS Numeric(8, 2)), 1, NULL, 62, NULL)
INSERT [dbo].[truck] ([driver], [registrationDate], [registration], [maxweight], [available], [city], [truckId], [deleted]) VALUES (NULL, CAST(N'2023-09-16T00:00:00.000' AS DateTime), N'DE0123MN', CAST(33256.00 AS Numeric(8, 2)), 1, NULL, 63, NULL)
INSERT [dbo].[truck] ([driver], [registrationDate], [registration], [maxweight], [available], [city], [truckId], [deleted]) VALUES (NULL, CAST(N'2023-09-16T00:00:00.000' AS DateTime), N'FG4567OP', CAST(22189.00 AS Numeric(8, 2)), 1, NULL, 64, NULL)
INSERT [dbo].[truck] ([driver], [registrationDate], [registration], [maxweight], [available], [city], [truckId], [deleted]) VALUES (NULL, CAST(N'2023-09-16T00:00:00.000' AS DateTime), N'GH8901QR', CAST(27019.00 AS Numeric(8, 2)), 1, NULL, 65, NULL)
INSERT [dbo].[truck] ([driver], [registrationDate], [registration], [maxweight], [available], [city], [truckId], [deleted]) VALUES (NULL, CAST(N'2023-09-16T00:00:00.000' AS DateTime), N'IJ2345ST', CAST(19957.00 AS Numeric(8, 2)), 1, NULL, 66, NULL)
INSERT [dbo].[truck] ([driver], [registrationDate], [registration], [maxweight], [available], [city], [truckId], [deleted]) VALUES (NULL, CAST(N'2023-09-16T00:00:00.000' AS DateTime), N'KL6789UV', CAST(27346.00 AS Numeric(8, 2)), 1, NULL, 67, NULL)
INSERT [dbo].[truck] ([driver], [registrationDate], [registration], [maxweight], [available], [city], [truckId], [deleted]) VALUES (NULL, CAST(N'2023-09-16T00:00:00.000' AS DateTime), N'MN0123WX', CAST(35678.00 AS Numeric(8, 2)), 1, NULL, 68, NULL)
INSERT [dbo].[truck] ([driver], [registrationDate], [registration], [maxweight], [available], [city], [truckId], [deleted]) VALUES (NULL, CAST(N'2023-09-16T00:00:00.000' AS DateTime), N'OP4567YZ', CAST(16792.00 AS Numeric(8, 2)), 1, NULL, 69, NULL)
INSERT [dbo].[truck] ([driver], [registrationDate], [registration], [maxweight], [available], [city], [truckId], [deleted]) VALUES (NULL, CAST(N'2023-09-16T00:00:00.000' AS DateTime), N'QR8901AB', CAST(25784.00 AS Numeric(8, 2)), 1, NULL, 70, NULL)
INSERT [dbo].[truck] ([driver], [registrationDate], [registration], [maxweight], [available], [city], [truckId], [deleted]) VALUES (NULL, CAST(N'2023-09-16T00:00:00.000' AS DateTime), N'BH9255JR', CAST(22598.00 AS Numeric(8, 2)), 1, NULL, 71, NULL)
INSERT [dbo].[truck] ([driver], [registrationDate], [registration], [maxweight], [available], [city], [truckId], [deleted]) VALUES (NULL, CAST(N'2023-09-16T00:00:00.000' AS DateTime), N'DQ1525US', CAST(32095.00 AS Numeric(8, 2)), 1, NULL, 72, NULL)
INSERT [dbo].[truck] ([driver], [registrationDate], [registration], [maxweight], [available], [city], [truckId], [deleted]) VALUES (NULL, CAST(N'2023-09-16T00:00:00.000' AS DateTime), N'CP7412XL', CAST(29467.00 AS Numeric(8, 2)), 1, NULL, 73, NULL)
INSERT [dbo].[truck] ([driver], [registrationDate], [registration], [maxweight], [available], [city], [truckId], [deleted]) VALUES (NULL, CAST(N'2023-09-16T00:00:00.000' AS DateTime), N'BW6691JH', CAST(24987.00 AS Numeric(8, 2)), 1, NULL, 74, NULL)
INSERT [dbo].[truck] ([driver], [registrationDate], [registration], [maxweight], [available], [city], [truckId], [deleted]) VALUES (NULL, CAST(N'2023-09-16T00:00:00.000' AS DateTime), N'PV7476GV', CAST(19157.00 AS Numeric(8, 2)), 1, NULL, 75, NULL)
INSERT [dbo].[truck] ([driver], [registrationDate], [registration], [maxweight], [available], [city], [truckId], [deleted]) VALUES (NULL, CAST(N'2023-09-16T00:00:00.000' AS DateTime), N'EX9176HE', CAST(22763.00 AS Numeric(8, 2)), 1, NULL, 76, NULL)
INSERT [dbo].[truck] ([driver], [registrationDate], [registration], [maxweight], [available], [city], [truckId], [deleted]) VALUES (NULL, CAST(N'2023-09-16T00:00:00.000' AS DateTime), N'ED7927SD', CAST(36097.00 AS Numeric(8, 2)), 1, NULL, 77, NULL)
INSERT [dbo].[truck] ([driver], [registrationDate], [registration], [maxweight], [available], [city], [truckId], [deleted]) VALUES (NULL, CAST(N'2023-09-16T00:00:00.000' AS DateTime), N'LN7878WS', CAST(23487.00 AS Numeric(8, 2)), 1, NULL, 78, NULL)
INSERT [dbo].[truck] ([driver], [registrationDate], [registration], [maxweight], [available], [city], [truckId], [deleted]) VALUES (NULL, CAST(N'2023-09-16T00:00:00.000' AS DateTime), N'FU8155SX', CAST(27349.00 AS Numeric(8, 2)), 1, NULL, 79, NULL)
INSERT [dbo].[truck] ([driver], [registrationDate], [registration], [maxweight], [available], [city], [truckId], [deleted]) VALUES (NULL, CAST(N'2023-09-16T00:00:00.000' AS DateTime), N'NO7989NJ', CAST(35079.00 AS Numeric(8, 2)), 1, NULL, 80, NULL)
INSERT [dbo].[truck] ([driver], [registrationDate], [registration], [maxweight], [available], [city], [truckId], [deleted]) VALUES (NULL, CAST(N'2023-09-16T00:00:00.000' AS DateTime), N'CJ9546LG', CAST(29234.00 AS Numeric(8, 2)), 1, NULL, 81, NULL)
INSERT [dbo].[truck] ([driver], [registrationDate], [registration], [maxweight], [available], [city], [truckId], [deleted]) VALUES (NULL, CAST(N'2023-09-16T00:00:00.000' AS DateTime), N'IT4114ER', CAST(18697.00 AS Numeric(8, 2)), 1, NULL, 82, NULL)
INSERT [dbo].[truck] ([driver], [registrationDate], [registration], [maxweight], [available], [city], [truckId], [deleted]) VALUES (NULL, CAST(N'2023-09-16T00:00:00.000' AS DateTime), N'OW0882NO', CAST(36428.00 AS Numeric(8, 2)), 1, NULL, 83, NULL)
INSERT [dbo].[truck] ([driver], [registrationDate], [registration], [maxweight], [available], [city], [truckId], [deleted]) VALUES (NULL, CAST(N'2023-09-16T00:00:00.000' AS DateTime), N'CU9714JS', CAST(18349.00 AS Numeric(8, 2)), 1, NULL, 84, NULL)
INSERT [dbo].[truck] ([driver], [registrationDate], [registration], [maxweight], [available], [city], [truckId], [deleted]) VALUES (NULL, CAST(N'2023-09-16T00:00:00.000' AS DateTime), N'RH5808NF', CAST(26179.00 AS Numeric(8, 2)), 1, NULL, 85, NULL)
INSERT [dbo].[truck] ([driver], [registrationDate], [registration], [maxweight], [available], [city], [truckId], [deleted]) VALUES (NULL, CAST(N'2023-09-16T00:00:00.000' AS DateTime), N'NL1240DQ', CAST(34128.00 AS Numeric(8, 2)), 1, NULL, 86, NULL)
INSERT [dbo].[truck] ([driver], [registrationDate], [registration], [maxweight], [available], [city], [truckId], [deleted]) VALUES (NULL, CAST(N'2023-09-16T00:00:00.000' AS DateTime), N'FJ7680AR', CAST(21489.00 AS Numeric(8, 2)), 1, NULL, 87, NULL)
INSERT [dbo].[truck] ([driver], [registrationDate], [registration], [maxweight], [available], [city], [truckId], [deleted]) VALUES (NULL, CAST(N'2023-09-16T00:00:00.000' AS DateTime), N'SI5736PM', CAST(27489.00 AS Numeric(8, 2)), 1, NULL, 88, NULL)
INSERT [dbo].[truck] ([driver], [registrationDate], [registration], [maxweight], [available], [city], [truckId], [deleted]) VALUES (45, CAST(N'2023-09-17T16:15:40.890' AS DateTime), N'AS5643DG', CAST(30000.40 AS Numeric(8, 2)), 0, NULL, 104, NULL)
INSERT [dbo].[truck] ([driver], [registrationDate], [registration], [maxweight], [available], [city], [truckId], [deleted]) VALUES (45, CAST(N'2023-09-17T16:15:45.583' AS DateTime), N'FL9922LA', CAST(23002.30 AS Numeric(8, 2)), 0, NULL, 105, NULL)
INSERT [dbo].[truck] ([driver], [registrationDate], [registration], [maxweight], [available], [city], [truckId], [deleted]) VALUES (34, CAST(N'2023-09-17T18:01:15.497' AS DateTime), N'PL9283LL', CAST(23324.00 AS Numeric(8, 2)), 0, NULL, 106, CAST(N'2023-09-17T18:37:02.033' AS DateTime))
INSERT [dbo].[truck] ([driver], [registrationDate], [registration], [maxweight], [available], [city], [truckId], [deleted]) VALUES (34, CAST(N'2023-09-17T18:34:32.193' AS DateTime), N'PL9283LM', CAST(27824.00 AS Numeric(8, 2)), 0, NULL, 115, CAST(N'2023-09-17T18:37:02.037' AS DateTime))
INSERT [dbo].[truck] ([driver], [registrationDate], [registration], [maxweight], [available], [city], [truckId], [deleted]) VALUES (34, CAST(N'2023-09-17T18:34:32.193' AS DateTime), N'JJ54645KK', CAST(42354.00 AS Numeric(8, 2)), 0, NULL, 116, CAST(N'2023-09-17T18:37:02.037' AS DateTime))
SET IDENTITY_INSERT [dbo].[truck] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UN_document]    Script Date: 17/9/2023 21:09:22 ******/
ALTER TABLE [dbo].[driver] ADD  CONSTRAINT [UN_document] UNIQUE NONCLUSTERED 
(
	[_document] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UN_trailer_registration]    Script Date: 17/9/2023 21:09:22 ******/
ALTER TABLE [dbo].[trailer] ADD  CONSTRAINT [UN_trailer_registration] UNIQUE NONCLUSTERED 
(
	[registration] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UN_truck_registration]    Script Date: 17/9/2023 21:09:22 ******/
ALTER TABLE [dbo].[truck] ADD  CONSTRAINT [UN_truck_registration] UNIQUE NONCLUSTERED 
(
	[registration] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[fee] ADD  CONSTRAINT [DF__fee__registratio__37703C52]  DEFAULT (getdate()) FOR [registrationDate]
GO
ALTER TABLE [dbo].[trailer] ADD  CONSTRAINT [DF_trailer_payloadWeight]  DEFAULT ((0)) FOR [payloadWeight]
GO
ALTER TABLE [dbo].[trailer] ADD  DEFAULT ((1)) FOR [available]
GO
ALTER TABLE [dbo].[truck] ADD  CONSTRAINT [DF_truck_registrationDate]  DEFAULT (getdate()) FOR [registrationDate]
GO
ALTER TABLE [dbo].[truck] ADD  CONSTRAINT [DF_truck_available]  DEFAULT ((1)) FOR [available]
GO
ALTER TABLE [dbo].[truck] ADD  DEFAULT (getdate()) FOR [deleted]
GO
ALTER TABLE [dbo].[cityXcity]  WITH CHECK ADD  CONSTRAINT [FK_cityFrom] FOREIGN KEY([cityFrom])
REFERENCES [dbo].[city] ([cityId])
GO
ALTER TABLE [dbo].[cityXcity] CHECK CONSTRAINT [FK_cityFrom]
GO
ALTER TABLE [dbo].[cityXcity]  WITH CHECK ADD  CONSTRAINT [FK_cityTo] FOREIGN KEY([cityTo])
REFERENCES [dbo].[city] ([cityId])
GO
ALTER TABLE [dbo].[cityXcity] CHECK CONSTRAINT [FK_cityTo]
GO
ALTER TABLE [dbo].[driver]  WITH CHECK ADD FOREIGN KEY([currentcityid])
REFERENCES [dbo].[city] ([cityId])
GO
ALTER TABLE [dbo].[driver]  WITH CHECK ADD FOREIGN KEY([feeId])
REFERENCES [dbo].[fee] ([feeId])
GO
ALTER TABLE [dbo].[fee]  WITH CHECK ADD  CONSTRAINT [FK_fee_driverId] FOREIGN KEY([driverId])
REFERENCES [dbo].[driver] ([driverId])
GO
ALTER TABLE [dbo].[fee] CHECK CONSTRAINT [FK_fee_driverId]
GO
ALTER TABLE [dbo].[fee]  WITH CHECK ADD  CONSTRAINT [FK_feetype] FOREIGN KEY([feetype])
REFERENCES [dbo].[feeType] ([feeTypeId])
GO
ALTER TABLE [dbo].[fee] CHECK CONSTRAINT [FK_feetype]
GO
ALTER TABLE [dbo].[movement]  WITH CHECK ADD  CONSTRAINT [FK_movement_driverId] FOREIGN KEY([driver])
REFERENCES [dbo].[driver] ([driverId])
GO
ALTER TABLE [dbo].[movement] CHECK CONSTRAINT [FK_movement_driverId]
GO
ALTER TABLE [dbo].[movement]  WITH CHECK ADD  CONSTRAINT [PackageFKFromMovement] FOREIGN KEY([_package])
REFERENCES [dbo].[package] ([packageId])
GO
ALTER TABLE [dbo].[movement] CHECK CONSTRAINT [PackageFKFromMovement]
GO
ALTER TABLE [dbo].[movement]  WITH CHECK ADD  CONSTRAINT [RouteMapFKFromMovement] FOREIGN KEY([routmap])
REFERENCES [dbo].[routeMap] ([routeMapId])
GO
ALTER TABLE [dbo].[movement] CHECK CONSTRAINT [RouteMapFKFromMovement]
GO
ALTER TABLE [dbo].[movement]  WITH CHECK ADD  CONSTRAINT [ShippingRequestFKFromMovement] FOREIGN KEY([shippingrequest])
REFERENCES [dbo].[shippingRequest] ([requestId])
GO
ALTER TABLE [dbo].[movement] CHECK CONSTRAINT [ShippingRequestFKFromMovement]
GO
ALTER TABLE [dbo].[package]  WITH CHECK ADD  CONSTRAINT [FK_feePricingId] FOREIGN KEY([feePricingId])
REFERENCES [dbo].[fee] ([feeId])
GO
ALTER TABLE [dbo].[package] CHECK CONSTRAINT [FK_feePricingId]
GO
ALTER TABLE [dbo].[package]  WITH CHECK ADD  CONSTRAINT [FK_package_shippingRequest] FOREIGN KEY([requestId])
REFERENCES [dbo].[shippingRequest] ([requestId])
GO
ALTER TABLE [dbo].[package] CHECK CONSTRAINT [FK_package_shippingRequest]
GO
ALTER TABLE [dbo].[park]  WITH CHECK ADD  CONSTRAINT [FK_park_city] FOREIGN KEY([cityId])
REFERENCES [dbo].[city] ([cityId])
GO
ALTER TABLE [dbo].[park] CHECK CONSTRAINT [FK_park_city]
GO
ALTER TABLE [dbo].[routeMap]  WITH CHECK ADD  CONSTRAINT [FK_routeMap_driverId] FOREIGN KEY([driverId])
REFERENCES [dbo].[driver] ([driverId])
GO
ALTER TABLE [dbo].[routeMap] CHECK CONSTRAINT [FK_routeMap_driverId]
GO
ALTER TABLE [dbo].[routeMap]  WITH CHECK ADD  CONSTRAINT [FK_trailerId] FOREIGN KEY([trailerId])
REFERENCES [dbo].[trailer] ([trailerId])
GO
ALTER TABLE [dbo].[routeMap] CHECK CONSTRAINT [FK_trailerId]
GO
ALTER TABLE [dbo].[routeMap]  WITH CHECK ADD  CONSTRAINT [FK_truckId] FOREIGN KEY([truckId])
REFERENCES [dbo].[truck] ([truckId])
GO
ALTER TABLE [dbo].[routeMap] CHECK CONSTRAINT [FK_truckId]
GO
ALTER TABLE [dbo].[routeMapXCity]  WITH CHECK ADD  CONSTRAINT [FK_routeMapXCity_city] FOREIGN KEY([cityId])
REFERENCES [dbo].[city] ([cityId])
GO
ALTER TABLE [dbo].[routeMapXCity] CHECK CONSTRAINT [FK_routeMapXCity_city]
GO
ALTER TABLE [dbo].[routeMapXCity]  WITH CHECK ADD  CONSTRAINT [FK_routeMapXCity_routeMap] FOREIGN KEY([routeMapId])
REFERENCES [dbo].[routeMap] ([routeMapId])
GO
ALTER TABLE [dbo].[routeMapXCity] CHECK CONSTRAINT [FK_routeMapXCity_routeMap]
GO
ALTER TABLE [dbo].[shippingRequest]  WITH CHECK ADD  CONSTRAINT [FK_shippingRequest_cityFrom] FOREIGN KEY([cityFrom])
REFERENCES [dbo].[city] ([cityId])
GO
ALTER TABLE [dbo].[shippingRequest] CHECK CONSTRAINT [FK_shippingRequest_cityFrom]
GO
ALTER TABLE [dbo].[shippingRequest]  WITH CHECK ADD  CONSTRAINT [FK_shippingRequest_cityTo] FOREIGN KEY([cityTo])
REFERENCES [dbo].[city] ([cityId])
GO
ALTER TABLE [dbo].[shippingRequest] CHECK CONSTRAINT [FK_shippingRequest_cityTo]
GO
ALTER TABLE [dbo].[shippingRequest]  WITH CHECK ADD  CONSTRAINT [FK_shippingRequest_customerId] FOREIGN KEY([customerId])
REFERENCES [dbo].[customer] ([customerId])
GO
ALTER TABLE [dbo].[shippingRequest] CHECK CONSTRAINT [FK_shippingRequest_customerId]
GO
ALTER TABLE [dbo].[trailer]  WITH CHECK ADD  CONSTRAINT [FK_trailer_cityPark] FOREIGN KEY([cityId], [parkId])
REFERENCES [dbo].[park] ([cityId], [parkId])
GO
ALTER TABLE [dbo].[trailer] CHECK CONSTRAINT [FK_trailer_cityPark]
GO
ALTER TABLE [dbo].[truck]  WITH CHECK ADD  CONSTRAINT [CityFKFomTruck] FOREIGN KEY([city])
REFERENCES [dbo].[city] ([cityId])
GO
ALTER TABLE [dbo].[truck] CHECK CONSTRAINT [CityFKFomTruck]
GO
ALTER TABLE [dbo].[truck]  WITH CHECK ADD  CONSTRAINT [FK_truck_driverId] FOREIGN KEY([driver])
REFERENCES [dbo].[driver] ([driverId])
GO
ALTER TABLE [dbo].[truck] CHECK CONSTRAINT [FK_truck_driverId]
GO
USE [master]
GO
ALTER DATABASE [transportit] SET  READ_WRITE 
GO
