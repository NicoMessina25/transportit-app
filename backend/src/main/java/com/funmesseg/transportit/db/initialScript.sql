USE [transportit]
GO
/****** Object:  Table [dbo].[_user]    Script Date: 22/8/2023 21:52:25 ******/
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
/****** Object:  Table [dbo].[city]    Script Date: 22/8/2023 21:52:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[city](
	[cityId] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cityXcity]    Script Date: 22/8/2023 21:52:25 ******/
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
/****** Object:  Table [dbo].[customer]    Script Date: 22/8/2023 21:52:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer](
	[customerId] [bigint] IDENTITY(1,1) NOT NULL,
	[firstname] [varchar](20) NOT NULL,
	[lastname] [varchar](20) NOT NULL,
	[document] [bigint] NOT NULL,
	[address] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[customerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[driver]    Script Date: 22/8/2023 21:52:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[driver](
	[driver] [bigint] NOT NULL,
	[firstname] [varchar](50) NOT NULL,
	[lastname] [varchar](50) NOT NULL,
	[dni] [bigint] NOT NULL,
	[adress] [varchar](50) NOT NULL,
	[province] [varchar](50) NOT NULL,
	[city] [varchar](50) NOT NULL,
	[phone] [bigint] NOT NULL,
	[particular] [bit] NOT NULL,
	[available] [bit] NOT NULL,
	[fee] [bigint] NOT NULL,
	[currentcity] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[driver] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[fee]    Script Date: 22/8/2023 21:52:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fee](
	[fee] [bigint] NOT NULL,
	[kgprice] [numeric](18, 0) NOT NULL,
	[kmprice] [numeric](18, 0) NOT NULL,
	[feetype] [bigint] NOT NULL,
	[cm3price] [numeric](18, 0) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[fee] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[movement]    Script Date: 22/8/2023 21:52:25 ******/
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
/****** Object:  Table [dbo].[package]    Script Date: 22/8/2023 21:52:25 ******/
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
/****** Object:  Table [dbo].[park]    Script Date: 22/8/2023 21:52:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[park](
	[parkId] [bigint] IDENTITY(1,1) NOT NULL,
	[cityId] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[parkId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[routeMap]    Script Date: 22/8/2023 21:52:25 ******/
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
/****** Object:  Table [dbo].[routeMapXCity]    Script Date: 22/8/2023 21:52:25 ******/
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
/****** Object:  Table [dbo].[shippingRequest]    Script Date: 22/8/2023 21:52:25 ******/
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
/****** Object:  Table [dbo].[trailer]    Script Date: 22/8/2023 21:52:25 ******/
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
	[parkId] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[trailerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[truck]    Script Date: 22/8/2023 21:52:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[truck](
	[truck] [bigint] NOT NULL,
	[driver] [bigint] NOT NULL,
	[dischargedate] [date] NOT NULL,
	[tuition] [varchar](50) NOT NULL,
	[maxweight] [numeric](18, 0) NOT NULL,
	[available] [bit] NOT NULL,
	[city] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[truck] ASC
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
ALTER TABLE [dbo].[trailer] ADD  DEFAULT ((1)) FOR [available]
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
ALTER TABLE [dbo].[driver]  WITH CHECK ADD  CONSTRAINT [FeeTruckCityFKFomDriver] FOREIGN KEY([fee])
REFERENCES [dbo].[fee] ([fee])
GO
ALTER TABLE [dbo].[driver] CHECK CONSTRAINT [FeeTruckCityFKFomDriver]
GO
ALTER TABLE [dbo].[driver]  WITH CHECK ADD FOREIGN KEY([currentcity])
REFERENCES [dbo].[city] ([cityId])
GO
ALTER TABLE [dbo].[movement]  WITH CHECK ADD  CONSTRAINT [DriverFKFromMovement] FOREIGN KEY([driver])
REFERENCES [dbo].[driver] ([driver])
GO
ALTER TABLE [dbo].[movement] CHECK CONSTRAINT [DriverFKFromMovement]
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
REFERENCES [dbo].[fee] ([fee])
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
ALTER TABLE [dbo].[routeMap]  WITH CHECK ADD  CONSTRAINT [FK_driverId] FOREIGN KEY([driverId])
REFERENCES [dbo].[driver] ([driver])
GO
ALTER TABLE [dbo].[routeMap] CHECK CONSTRAINT [FK_driverId]
GO
ALTER TABLE [dbo].[routeMap]  WITH CHECK ADD  CONSTRAINT [FK_trailerId] FOREIGN KEY([trailerId])
REFERENCES [dbo].[trailer] ([trailerId])
GO
ALTER TABLE [dbo].[routeMap] CHECK CONSTRAINT [FK_trailerId]
GO
ALTER TABLE [dbo].[routeMap]  WITH CHECK ADD  CONSTRAINT [FK_truckId] FOREIGN KEY([truckId])
REFERENCES [dbo].[truck] ([truck])
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
ALTER TABLE [dbo].[trailer]  WITH CHECK ADD  CONSTRAINT [FK_trailer_park] FOREIGN KEY([parkId])
REFERENCES [dbo].[park] ([parkId])
GO
ALTER TABLE [dbo].[trailer] CHECK CONSTRAINT [FK_trailer_park]
GO
ALTER TABLE [dbo].[truck]  WITH CHECK ADD  CONSTRAINT [CityFKFomTruck] FOREIGN KEY([city])
REFERENCES [dbo].[city] ([cityId])
GO
ALTER TABLE [dbo].[truck] CHECK CONSTRAINT [CityFKFomTruck]
GO
ALTER TABLE [dbo].[truck]  WITH CHECK ADD  CONSTRAINT [DriverFKFomTruck] FOREIGN KEY([driver])
REFERENCES [dbo].[driver] ([driver])
GO
ALTER TABLE [dbo].[truck] CHECK CONSTRAINT [DriverFKFomTruck]
GO
