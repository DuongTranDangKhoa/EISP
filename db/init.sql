USE [master]
go
	DROP DATABASE [EIPS]
go	
	CREATE DATABASE [EIPS]
go
USE [EIPS]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 7/16/2023 11:55:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[Username] [varchar](100) NOT NULL,
	[Password] [varchar](100) NOT NULL,
	[Name] [nvarchar](500) NULL,
	[Role] [varchar](100) NOT NULL,
	[Status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AccountShop]    Script Date: 7/16/2023 11:55:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountShop](
	[Username] [varchar](100) NOT NULL,
	[ShopId] [varchar](100) NOT NULL,
	[Status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Username] ASC,
	[ShopId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Card]    Script Date: 7/16/2023 11:55:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Card](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EventId] [int] NOT NULL,
	[Balance] [real] NULL,
	[Username] [varchar](500) NULL,
	[PhoneNumber] [varchar](10) NULL,
	[Status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Combo]    Script Date: 7/16/2023 11:55:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Combo](
	[No] [int] IDENTITY(1,1) NOT NULL,
	[Id] [int] NULL,
	[IdMake] [int] NULL,
	[Quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Event]    Script Date: 7/16/2023 11:55:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Event](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[BeginDate] [date] NULL,
	[EndDate] [date] NULL,
	[Area] [varchar](500) NULL,
	[Username] [varchar](100) NOT NULL,
	[Status] [bit] NULL,
	[Image] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ImageEvent]    Script Date: 7/16/2023 11:55:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImageEvent](
	[No] [int] IDENTITY(1,1) NOT NULL,
	[EventId] [int] NOT NULL,
	[Image] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Order]    Script Date: 7/16/2023 11:55:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] NOT NULL,
	[Date] [datetime] NULL,
	[ShopId] [varchar](100) NULL,
	[CardId] [int] NULL,
	[Total] [real] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 7/16/2023 11:55:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[No] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NULL,
	[Price] [real] NULL,
	[Total] [real] NULL,
PRIMARY KEY CLUSTERED 
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 7/16/2023 11:55:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ShopId] [varchar](100) NOT NULL,
	[Name] [nvarchar](500) NOT NULL,
	[Price] [real] NOT NULL,
	[Image] [nvarchar](max) NULL,
	[Description] [nvarchar](700) NULL,
	[Category] [varchar](10) NOT NULL,
	[Status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Shop]    Script Date: 7/16/2023 11:55:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shop](
	[Id] [varchar](100) NOT NULL,
	[EventId] [int] NOT NULL,
	[Name] [nvarchar](500) NOT NULL,
	[Description] [nvarchar](700) NULL,
	[Area] [varchar](100) NULL,
	[Status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Transaction]    Script Date: 7/16/2023 11:55:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaction](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CardId] [int] NOT NULL,
	[OrderId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Account] ([Username], [Password], [Name], [Role], [Status]) VALUES (N'admin', N'12345', N'anh khoa', N'admin', 1)
INSERT [dbo].[Account] ([Username], [Password], [Name], [Role], [Status]) VALUES (N'user1', N'12345', N'u1', N'sale', 1)
INSERT [dbo].[Account] ([Username], [Password], [Name], [Role], [Status]) VALUES (N'user2', N'12345', N'u2', N'sale', 1)
INSERT [dbo].[Account] ([Username], [Password], [Name], [Role], [Status]) VALUES (N'user3', N'12345', N'u3', N'sale', 1)
INSERT [dbo].[Account] ([Username], [Password], [Name], [Role], [Status]) VALUES (N'user34', N'12345', N'khoane', N'sale', 1)
INSERT [dbo].[Account] ([Username], [Password], [Name], [Role], [Status]) VALUES (N'user4', N'12345', N'khoa', N'cashier', 1)
INSERT [dbo].[Account] ([Username], [Password], [Name], [Role], [Status]) VALUES (N'user5', N'12345', N'u4', N'sale', 1)
INSERT [dbo].[Account] ([Username], [Password], [Name], [Role], [Status]) VALUES (N'user7', N'12345', N'u7', N'sale', 1)
INSERT [dbo].[Account] ([Username], [Password], [Name], [Role], [Status]) VALUES (N'user8', N'12345', N'u8', N'sale', 1)
INSERT [dbo].[AccountShop] ([Username], [ShopId], [Status]) VALUES (N'user1', N'FEV', 1)
INSERT [dbo].[AccountShop] ([Username], [ShopId], [Status]) VALUES (N'user2', N'FFC', 0)
INSERT [dbo].[AccountShop] ([Username], [ShopId], [Status]) VALUES (N'user3', N'FVC', 0)
INSERT [dbo].[AccountShop] ([Username], [ShopId], [Status]) VALUES (N'user5', N'CSG', 0)
INSERT [dbo].[AccountShop] ([Username], [ShopId], [Status]) VALUES (N'user7', N'FEV', 0)
INSERT [dbo].[AccountShop] ([Username], [ShopId], [Status]) VALUES (N'user8', N'CSG', 0)
INSERT [dbo].[AccountShop] ([Username], [ShopId], [Status]) VALUES (N'user8', N'FEV', NULL)
SET IDENTITY_INSERT [dbo].[Card] ON 

INSERT [dbo].[Card] ([Id], [EventId], [Balance], [Username], [PhoneNumber], [Status]) VALUES (1, 2, 8625000, N'Khoane1', N'0909090909', 1)
INSERT [dbo].[Card] ([Id], [EventId], [Balance], [Username], [PhoneNumber], [Status]) VALUES (2, 2, 100000, N'hieut2', N'0987654321', 1)
INSERT [dbo].[Card] ([Id], [EventId], [Balance], [Username], [PhoneNumber], [Status]) VALUES (3, 3, 0, NULL, NULL, 1)
INSERT [dbo].[Card] ([Id], [EventId], [Balance], [Username], [PhoneNumber], [Status]) VALUES (4, 3, 0, NULL, NULL, 1)
INSERT [dbo].[Card] ([Id], [EventId], [Balance], [Username], [PhoneNumber], [Status]) VALUES (5, 3, 0, NULL, NULL, 1)
INSERT [dbo].[Card] ([Id], [EventId], [Balance], [Username], [PhoneNumber], [Status]) VALUES (1003, 1, 0, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Card] OFF
SET IDENTITY_INSERT [dbo].[Combo] ON 

INSERT [dbo].[Combo] ([No], [Id], [IdMake], [Quantity]) VALUES (1, 3, 1, 2)
INSERT [dbo].[Combo] ([No], [Id], [IdMake], [Quantity]) VALUES (2, 3, 2, 1)
INSERT [dbo].[Combo] ([No], [Id], [IdMake], [Quantity]) VALUES (3, 6, 4, 2)
INSERT [dbo].[Combo] ([No], [Id], [IdMake], [Quantity]) VALUES (4, 6, 5, 2)
INSERT [dbo].[Combo] ([No], [Id], [IdMake], [Quantity]) VALUES (5, 9, 7, 2)
INSERT [dbo].[Combo] ([No], [Id], [IdMake], [Quantity]) VALUES (6, 9, 8, 1)
INSERT [dbo].[Combo] ([No], [Id], [IdMake], [Quantity]) VALUES (7, 12, 10, 1)
INSERT [dbo].[Combo] ([No], [Id], [IdMake], [Quantity]) VALUES (8, 12, 11, 2)
INSERT [dbo].[Combo] ([No], [Id], [IdMake], [Quantity]) VALUES (9, 16, 2, 3)
INSERT [dbo].[Combo] ([No], [Id], [IdMake], [Quantity]) VALUES (10, 16, 1, 3)
INSERT [dbo].[Combo] ([No], [Id], [IdMake], [Quantity]) VALUES (11, 16, 13, 2)
INSERT [dbo].[Combo] ([No], [Id], [IdMake], [Quantity]) VALUES (12, 17, 2, 2)
INSERT [dbo].[Combo] ([No], [Id], [IdMake], [Quantity]) VALUES (13, 17, 13, 5)
INSERT [dbo].[Combo] ([No], [Id], [IdMake], [Quantity]) VALUES (14, 17, 14, 2)
INSERT [dbo].[Combo] ([No], [Id], [IdMake], [Quantity]) VALUES (1009, 1014, 1, 1)
INSERT [dbo].[Combo] ([No], [Id], [IdMake], [Quantity]) VALUES (1010, 1014, 2, 7)
INSERT [dbo].[Combo] ([No], [Id], [IdMake], [Quantity]) VALUES (1011, 1014, 13, 3)
INSERT [dbo].[Combo] ([No], [Id], [IdMake], [Quantity]) VALUES (1012, 1014, 14, 3)
SET IDENTITY_INSERT [dbo].[Combo] OFF
SET IDENTITY_INSERT [dbo].[Event] ON 

INSERT [dbo].[Event] ([ID], [Name], [Description], [BeginDate], [EndDate], [Area], [Username], [Status], [Image]) VALUES (1, N'Hội xuân .....', N'hooi xuan lang lordaaaaa', CAST(N'2023-01-10' AS Date), CAST(N'2023-01-16' AS Date), N'FPT', N'admin', 0, N'https://firebasestorage.googleapis.com/v0/b/carmanaager-upload-file.appspot.com/o/Package%2F351996642_984933112940699_787881922217360425_n.jpg?alt=media&token=e0908d88-1201-4e86-a55e-9a726d4a3bb9')
INSERT [dbo].[Event] ([ID], [Name], [Description], [BeginDate], [EndDate], [Area], [Username], [Status], [Image]) VALUES (2, N'back to school', N'Back to school 2020=2023', CAST(N'2023-02-10' AS Date), CAST(N'2023-02-17' AS Date), N'FPT', N'admin', 0, N'https://firebasestorage.googleapis.com/v0/b/carmanaager-upload-file.appspot.com/o/Package%2Fne.png?alt=media&token=8dc124de-dd70-4acb-ab15-be781f29cc66')
INSERT [dbo].[Event] ([ID], [Name], [Description], [BeginDate], [EndDate], [Area], [Username], [Status], [Image]) VALUES (3, N'Trại hè nè', N'hahahahahaha', CAST(N'2023-07-21' AS Date), CAST(N'2023-07-26' AS Date), N'FPT Q9 ha', N'user5', 0, N'https://firebasestorage.googleapis.com/v0/b/carmanaager-upload-file.appspot.com/o/Package%2F6.jfif?alt=media&token=a3bd32d1-a5dc-452f-b8f2-cfc5889beebd')
INSERT [dbo].[Event] ([ID], [Name], [Description], [BeginDate], [EndDate], [Area], [Username], [Status], [Image]) VALUES (1003, N'Trại Xuân', N'hahahahaha', CAST(N'2023-07-26' AS Date), CAST(N'2023-07-30' AS Date), N'FPT Q9 ha', N'admin', 1, N'https://firebasestorage.googleapis.com/v0/b/carmanaager-upload-file.appspot.com/o/Package%2F4.png?alt=media&token=41e77fa2-5fb6-4f46-8314-8b4cd819a566')
INSERT [dbo].[Event] ([ID], [Name], [Description], [BeginDate], [EndDate], [Area], [Username], [Status], [Image]) VALUES (1004, N'Trại Xuân nè ', N'hahahahaha', CAST(N'2023-07-26' AS Date), CAST(N'2023-07-30' AS Date), N'FPT Q9 ha', N'admin', 0, N'https://firebasestorage.googleapis.com/v0/b/carmanaager-upload-file.appspot.com/o/Package%2F6.jfif?alt=media&token=1bf038ef-3f3b-4a69-97af-683af4f1e0d8')
SET IDENTITY_INSERT [dbo].[Event] OFF
SET IDENTITY_INSERT [dbo].[ImageEvent] ON 

INSERT [dbo].[ImageEvent] ([No], [EventId], [Image]) VALUES (1, 1, N'https://scontent.fsgn17-1.fna.fbcdn.net/v/t39.30808-6/324270488_3435578490021254_1109975506766971237_n.jpg?_nc_cat=111&cb=99be929b-59f725be&ccb=1-7&_nc_sid=0debeb&_nc_ohc=y2hGXFO3JfcAX_rqy7D&_nc_ht=scontent.fsgn17-1.fna&oh=00_AfDlIYwsru5uZy_p9xC403XpsSpnge30C-pC6SJjthx5Xw&oe=64B7B743')
INSERT [dbo].[ImageEvent] ([No], [EventId], [Image]) VALUES (2, 1, N'https://scontent.fsgn17-1.fna.fbcdn.net/v/t39.30808-6/324270488_3435578490021254_1109975506766971237_n.jpg?_nc_cat=111&cb=99be929b-59f725be&ccb=1-7&_nc_sid=0debeb&_nc_ohc=y2hGXFO3JfcAX_rqy7D&_nc_ht=scontent.fsgn17-1.fna&oh=00_AfDlIYwsru5uZy_p9xC403XpsSpnge30C-pC6SJjthx5Xw&oe=64B7B743')
INSERT [dbo].[ImageEvent] ([No], [EventId], [Image]) VALUES (3, 1, N'https://scontent.fsgn17-1.fna.fbcdn.net/v/t39.30808-6/324270488_3435578490021254_1109975506766971237_n.jpg?_nc_cat=111&cb=99be929b-59f725be&ccb=1-7&_nc_sid=0debeb&_nc_ohc=y2hGXFO3JfcAX_rqy7D&_nc_ht=scontent.fsgn17-1.fna&oh=00_AfDlIYwsru5uZy_p9xC403XpsSpnge30C-pC6SJjthx5Xw&oe=64B7B743')
INSERT [dbo].[ImageEvent] ([No], [EventId], [Image]) VALUES (4, 1, N'https://scontent.fsgn17-1.fna.fbcdn.net/v/t39.30808-6/324270488_3435578490021254_1109975506766971237_n.jpg?_nc_cat=111&cb=99be929b-59f725be&ccb=1-7&_nc_sid=0debeb&_nc_ohc=y2hGXFO3JfcAX_rqy7D&_nc_ht=scontent.fsgn17-1.fna&oh=00_AfDlIYwsru5uZy_p9xC403XpsSpnge30C-pC6SJjthx5Xw&oe=64B7B743')
INSERT [dbo].[ImageEvent] ([No], [EventId], [Image]) VALUES (5, 1, N'https://scontent.fsgn17-1.fna.fbcdn.net/v/t39.30808-6/324270488_3435578490021254_1109975506766971237_n.jpg?_nc_cat=111&cb=99be929b-59f725be&ccb=1-7&_nc_sid=0debeb&_nc_ohc=y2hGXFO3JfcAX_rqy7D&_nc_ht=scontent.fsgn17-1.fna&oh=00_AfDlIYwsru5uZy_p9xC403XpsSpnge30C-pC6SJjthx5Xw&oe=64B7B743')
SET IDENTITY_INSERT [dbo].[ImageEvent] OFF
INSERT [dbo].[Order] ([Id], [Date], [ShopId], [CardId], [Total]) VALUES (12312, CAST(N'2023-07-14T00:00:00.000' AS DateTime), N'FEV', 1, 200000)
INSERT [dbo].[Order] ([Id], [Date], [ShopId], [CardId], [Total]) VALUES (12345, CAST(N'2023-07-14T00:00:00.000' AS DateTime), N'FEV', 1, 100000)
INSERT [dbo].[Order] ([Id], [Date], [ShopId], [CardId], [Total]) VALUES (23456, CAST(N'2023-07-15T00:00:00.000' AS DateTime), N'CSG', 1, 100000)
INSERT [dbo].[Order] ([Id], [Date], [ShopId], [CardId], [Total]) VALUES (561285, CAST(N'2023-07-16T01:24:52.120' AS DateTime), N'FEV', 1, 120000)
INSERT [dbo].[Order] ([Id], [Date], [ShopId], [CardId], [Total]) VALUES (999691, CAST(N'2023-07-15T15:36:21.937' AS DateTime), N'CSG', 1, 255000)
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([No], [OrderId], [ProductId], [Quantity], [Price], [Total]) VALUES (1, 12345, 1, 3, 20000, 60000)
INSERT [dbo].[OrderDetail] ([No], [OrderId], [ProductId], [Quantity], [Price], [Total]) VALUES (2, 12345, 2, 8, 50000, 400000)
INSERT [dbo].[OrderDetail] ([No], [OrderId], [ProductId], [Quantity], [Price], [Total]) VALUES (3, 12312, 1, 5, 20000, 100000)
INSERT [dbo].[OrderDetail] ([No], [OrderId], [ProductId], [Quantity], [Price], [Total]) VALUES (1002, 23456, 11, 3, 15000, 45000)
INSERT [dbo].[OrderDetail] ([No], [OrderId], [ProductId], [Quantity], [Price], [Total]) VALUES (1003, 23456, 10, 2, 20000, 40000)
INSERT [dbo].[OrderDetail] ([No], [OrderId], [ProductId], [Quantity], [Price], [Total]) VALUES (1004, 999691, 10, 3, 20000, 60000)
INSERT [dbo].[OrderDetail] ([No], [OrderId], [ProductId], [Quantity], [Price], [Total]) VALUES (1005, 999691, 11, 1, 15000, 15000)
INSERT [dbo].[OrderDetail] ([No], [OrderId], [ProductId], [Quantity], [Price], [Total]) VALUES (1006, 999691, 10, 4, 20000, 80000)
INSERT [dbo].[OrderDetail] ([No], [OrderId], [ProductId], [Quantity], [Price], [Total]) VALUES (1007, 999691, 11, 8, 15000, 120000)
INSERT [dbo].[OrderDetail] ([No], [OrderId], [ProductId], [Quantity], [Price], [Total]) VALUES (2002, 561285, 13, 1, 30000, 30000)
INSERT [dbo].[OrderDetail] ([No], [OrderId], [ProductId], [Quantity], [Price], [Total]) VALUES (2003, 561285, 14, 3, 30000, 90000)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [ShopId], [Name], [Price], [Image], [Description], [Category], [Status]) VALUES (1, N'FEV', N'Bánh tráng nướng', 200000, N'https://firebasestorage.googleapis.com/v0/b/carmanaager-upload-file.appspot.com/o/Package%2F6.jfif?alt=media&token=0d8f46d3-37c8-4c60-b37b-bf2528507e26', N'banh trang cu?n bơ', N'Food', 1)
INSERT [dbo].[Product] ([Id], [ShopId], [Name], [Price], [Image], [Description], [Category], [Status]) VALUES (2, N'FEV', N'Teramisu', 50000, N'teramisu chanh leo.jpg', N'teramisu chanh leo', N'Food', 1)
INSERT [dbo].[Product] ([Id], [ShopId], [Name], [Price], [Image], [Description], [Category], [Status]) VALUES (3, N'FEV', N'combo1', 80000, N'comboFEV1.jpg', N'2 Bánh tráng + Teramisu', N'Combo', 1)
INSERT [dbo].[Product] ([Id], [ShopId], [Name], [Price], [Image], [Description], [Category], [Status]) VALUES (4, N'FVC', N'Hambuger', 30000, N'Hambuger.jpg', N'Hambuger b? x?t cay', N'Food', 1)
INSERT [dbo].[Product] ([Id], [ShopId], [Name], [Price], [Image], [Description], [Category], [Status]) VALUES (5, N'FVC', N'Coca', 10000, N'cocacola.jpg', N'nư?c ng?t có gas cocke', N'Drink', 1)
INSERT [dbo].[Product] ([Id], [ShopId], [Name], [Price], [Image], [Description], [Category], [Status]) VALUES (6, N'FVC', N'combo1', 45000, N'burka.jpg', N'cocacola + hamburger b?', N'Combo', 1)
INSERT [dbo].[Product] ([Id], [ShopId], [Name], [Price], [Image], [Description], [Category], [Status]) VALUES (7, N'FFC', N'bánh m? kem', 20000, N'banhmikem.jpg', N'bánh m? nhân k?p vani', N'Food', 1)
INSERT [dbo].[Product] ([Id], [ShopId], [Name], [Price], [Image], [Description], [Category], [Status]) VALUES (8, N'FFC', N'xoài l?c', 15000, N'huxoailac.jpg', N'xoài l?c siêu cay sieu ngonn', N'Food', 1)
INSERT [dbo].[Product] ([Id], [ShopId], [Name], [Price], [Image], [Description], [Category], [Status]) VALUES (9, N'FFC', N'combo1', 32000, N'comboFFC', N'2 bánh m? kem + 1 h? xoài', N'Combo', 1)
INSERT [dbo].[Product] ([Id], [ShopId], [Name], [Price], [Image], [Description], [Category], [Status]) VALUES (10, N'CSG', N'Trà s?a', 20000, N'lytraf.jpg', N'trà s?a trân châu đư?ng  đen', N'Drink', 1)
INSERT [dbo].[Product] ([Id], [ShopId], [Name], [Price], [Image], [Description], [Category], [Status]) VALUES (11, N'CSG', N'Nư?c cam', 15000, N'nuoccam.jpg', N'cam ép', N'Drink', 1)
INSERT [dbo].[Product] ([Id], [ShopId], [Name], [Price], [Image], [Description], [Category], [Status]) VALUES (12, N'CSG', N'Combo nư?c', 45000, N'nuoc.jpg', N'2nươc cam + 1tra s?a', N'Combo', 1)
INSERT [dbo].[Product] ([Id], [ShopId], [Name], [Price], [Image], [Description], [Category], [Status]) VALUES (13, N'FEV', N'xoài lắc', 30000, N'https://firebasestorage.googleapis.com/v0/b/carmanaager-upload-file.appspot.com/o/Package%2F350816030_483780067245140_657194694346022686_n.jpg?alt=media&token=1f572e98-4281-402b-9d26-a4d728fffbe4', N'asdasd', N'asdasd', 1)
INSERT [dbo].[Product] ([Id], [ShopId], [Name], [Price], [Image], [Description], [Category], [Status]) VALUES (14, N'FEV', N'khoa ne', 30000, N'https://firebasestorage.googleapis.com/v0/b/carmanaager-upload-file.appspot.com/o/Package%2F5.jfif?alt=media&token=33307346-7bd3-4847-b6b3-2d7c79622874', N'alaba trap', N'alaba trap', 1)
INSERT [dbo].[Product] ([Id], [ShopId], [Name], [Price], [Image], [Description], [Category], [Status]) VALUES (15, N'FEV', N'khoa ne', 30000, N'https://firebasestorage.googleapis.com/v0/b/carmanaager-upload-file.appspot.com/o/Package%2F5.jfif?alt=media&token=33307346-7bd3-4847-b6b3-2d7c79622874', N'alaba trap', N'alaba trap', 1)
INSERT [dbo].[Product] ([Id], [ShopId], [Name], [Price], [Image], [Description], [Category], [Status]) VALUES (16, N'FEV', N'Combo Đã', 30000, N'', N'khoane', N'Combo', 1)
INSERT [dbo].[Product] ([Id], [ShopId], [Name], [Price], [Image], [Description], [Category], [Status]) VALUES (17, N'FEV', N'combo mới', 100000, N'https://firebasestorage.googleapis.com/v0/b/carmanaager-upload-file.appspot.com/o/Package%2F1.jfif?alt=media&token=a0a43347-5621-40ed-b4dc-9414855facc5', N'số 1', N'Combo', 1)
INSERT [dbo].[Product] ([Id], [ShopId], [Name], [Price], [Image], [Description], [Category], [Status]) VALUES (1013, N'FEV', N'cơm chiên nè', 40000, N'https://firebasestorage.googleapis.com/v0/b/carmanaager-upload-file.appspot.com/o/Package%2F5.jfif?alt=media&token=5ec0c5e0-2af6-47a6-83d1-39bb084ac50a', N'cơm chiên nè', N'Food', 1)
INSERT [dbo].[Product] ([Id], [ShopId], [Name], [Price], [Image], [Description], [Category], [Status]) VALUES (1014, N'FEV', N'combo mới', 100000, N'https://firebasestorage.googleapis.com/v0/b/carmanaager-upload-file.appspot.com/o/Package%2F4.png?alt=media&token=5565bd27-09e9-4818-ae41-7e3915bfdc2a', N'cơm chiên + nước', N'Combo', 1)
SET IDENTITY_INSERT [dbo].[Product] OFF
INSERT [dbo].[Shop] ([Id], [EventId], [Name], [Description], [Area], [Status]) VALUES (N'CSG', 2, N'clb 1', N'ádasdasd', N't?ng 1', 0)
INSERT [dbo].[Shop] ([Id], [EventId], [Name], [Description], [Area], [Status]) VALUES (N'ESC', 3, N'chủa tể chiếc nhẫn', N'123124', N'q9 haa', 1)
INSERT [dbo].[Shop] ([Id], [EventId], [Name], [Description], [Area], [Status]) VALUES (N'ESCNE', 1, N'clb game', N'1231245123', N'S?nh 123', 1)
INSERT [dbo].[Shop] ([Id], [EventId], [Name], [Description], [Area], [Status]) VALUES (N'FEV', 1, N'CLb to chuc su kien', N'sự kiện vui vẻ ha', N's?nh 1', 1)
INSERT [dbo].[Shop] ([Id], [EventId], [Name], [Description], [Area], [Status]) VALUES (N'FFC', 2, N'clb bóng đá', N'đá bóng đ? ghi th?t nhi?u bàn th?ng', N't?ng 4', 1)
INSERT [dbo].[Shop] ([Id], [EventId], [Name], [Description], [Area], [Status]) VALUES (N'FVC', 1, N'CLb vovinam 12', N'th? d?c th? thao s?c kh?e là s? 1 ', N't?ng G', 1)
SET IDENTITY_INSERT [dbo].[Transaction] ON 

INSERT [dbo].[Transaction] ([Id], [CardId], [OrderId]) VALUES (1, 1, 999691)
INSERT [dbo].[Transaction] ([Id], [CardId], [OrderId]) VALUES (2, 1, 561285)
SET IDENTITY_INSERT [dbo].[Transaction] OFF
ALTER TABLE [dbo].[Account] ADD  DEFAULT ('true') FOR [Status]
GO
ALTER TABLE [dbo].[Card] ADD  DEFAULT ((0)) FOR [Balance]
GO
ALTER TABLE [dbo].[Card] ADD  DEFAULT ('true') FOR [Status]
GO
ALTER TABLE [dbo].[Event] ADD  DEFAULT ('true') FOR [Status]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT ('true') FOR [Status]
GO
ALTER TABLE [dbo].[Shop] ADD  DEFAULT ('true') FOR [Status]
GO
ALTER TABLE [dbo].[AccountShop]  WITH CHECK ADD  CONSTRAINT [FKAccountSho285522] FOREIGN KEY([ShopId])
REFERENCES [dbo].[Shop] ([Id])
GO
ALTER TABLE [dbo].[AccountShop] CHECK CONSTRAINT [FKAccountSho285522]
GO
ALTER TABLE [dbo].[AccountShop]  WITH CHECK ADD  CONSTRAINT [FKAccountSho782127] FOREIGN KEY([Username])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[AccountShop] CHECK CONSTRAINT [FKAccountSho782127]
GO
ALTER TABLE [dbo].[Card]  WITH CHECK ADD  CONSTRAINT [FKCard585247] FOREIGN KEY([EventId])
REFERENCES [dbo].[Event] ([ID])
GO
ALTER TABLE [dbo].[Card] CHECK CONSTRAINT [FKCard585247]
GO
ALTER TABLE [dbo].[Combo]  WITH CHECK ADD  CONSTRAINT [FKCombo475967] FOREIGN KEY([Id])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[Combo] CHECK CONSTRAINT [FKCombo475967]
GO
ALTER TABLE [dbo].[Combo]  WITH CHECK ADD  CONSTRAINT [FKCombo475968] FOREIGN KEY([IdMake])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[Combo] CHECK CONSTRAINT [FKCombo475968]
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD  CONSTRAINT [FKEvent534795] FOREIGN KEY([Username])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [FKEvent534795]
GO
ALTER TABLE [dbo].[ImageEvent]  WITH CHECK ADD  CONSTRAINT [FKImageEvent227803] FOREIGN KEY([EventId])
REFERENCES [dbo].[Event] ([ID])
GO
ALTER TABLE [dbo].[ImageEvent] CHECK CONSTRAINT [FKImageEvent227803]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FKOrderDetai221089] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FKOrderDetai221089]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FKOrderDetai559638] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FKOrderDetai559638]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FKProduct527516] FOREIGN KEY([ShopId])
REFERENCES [dbo].[Shop] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FKProduct527516]
GO
ALTER TABLE [dbo].[Shop]  WITH CHECK ADD  CONSTRAINT [FKShop68550] FOREIGN KEY([EventId])
REFERENCES [dbo].[Event] ([ID])
GO
ALTER TABLE [dbo].[Shop] CHECK CONSTRAINT [FKShop68550]
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [FKTransactio473547] FOREIGN KEY([CardId])
REFERENCES [dbo].[Card] ([Id])
GO
ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [FKTransactio473547]
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [FKTransactio687479] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Id])
GO
ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [FKTransactio687479]
GO
