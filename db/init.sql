USE [master]
go
	/*DROP DATABASE [EIPS] */
go	
	CREATE DATABASE [EIPS]
go
/*USE [EIPS]*/
GO
/****** Object:  Table [dbo].[Account]    Script Date: 7/18/2023 9:43:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[Username] [varchar](100) NOT NULL,
	[Password] [varchar](100) NOT NULL,
	[Image] [nvarchar](max) NULL,
	[Name] [nvarchar](500) NULL,
	[Role] [varchar](100) NOT NULL,
	[Status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AccountShop]    Script Date: 7/18/2023 9:43:08 PM ******/
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
/****** Object:  Table [dbo].[Card]    Script Date: 7/18/2023 9:43:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Card](
	[NO] [int] IDENTITY(1,1) NOT NULL,
	[ID] [int] NOT NULL,
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
/****** Object:  Table [dbo].[Combo]    Script Date: 7/18/2023 9:43:09 PM ******/
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
/****** Object:  Table [dbo].[Event]    Script Date: 7/18/2023 9:43:09 PM ******/
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
/****** Object:  Table [dbo].[ImageEvent]    Script Date: 7/18/2023 9:43:09 PM ******/
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
/****** Object:  Table [dbo].[Order]    Script Date: 7/18/2023 9:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[No] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 7/18/2023 9:43:10 PM ******/
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
/****** Object:  Table [dbo].[Product]    Script Date: 7/18/2023 9:43:10 PM ******/
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
/****** Object:  Table [dbo].[Shop]    Script Date: 7/18/2023 9:43:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shop](
	[Id] [varchar](100) NOT NULL,
	[EventId] [int] NOT NULL,
	[Image] [nvarchar](max) NULL,
	[Name] [nvarchar](500) NOT NULL,
	[Description] [nvarchar](700) NULL,
	[Area] [varchar](100) NULL,
	[Status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Transaction]    Script Date: 7/18/2023 9:43:10 PM ******/
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
INSERT [dbo].[Account] ([Username], [Password], [Image], [Name], [Role], [Status]) VALUES (N'admin', N'12345', NULL, N'truong', N'admin', 1)
INSERT [dbo].[Account] ([Username], [Password], [Image], [Name], [Role], [Status]) VALUES (N'khoa', N'12345', N'https://firebasestorage.googleapis.com/v0/b/carmanaager-upload-file.appspot.com/o/Package%2FAVT.png?alt=media&token=727ace91-ae85-430c-8eb7-229f1818c14c', N'vdk123', N'admin', 1)
INSERT [dbo].[Account] ([Username], [Password], [Image], [Name], [Role], [Status]) VALUES (N'user1', N'12345', NULL, N'u1', N'sale', 1)
INSERT [dbo].[Account] ([Username], [Password], [Image], [Name], [Role], [Status]) VALUES (N'user2', N'12345', N'https://firebasestorage.googleapis.com/v0/b/carmanaager-upload-file.appspot.com/o/Package%2F339135711_321858083623623_6668565926008596782_n.jpg?alt=media&token=c4d94517-a656-4211-940e-846998d08b2c', N'khoadang', N'sale', 1)
INSERT [dbo].[Account] ([Username], [Password], [Image], [Name], [Role], [Status]) VALUES (N'user3', N'12345', NULL, N'u3', N'sale', 1)
INSERT [dbo].[Account] ([Username], [Password], [Image], [Name], [Role], [Status]) VALUES (N'user4', N'12345', NULL, N'khoa', N'cashier', 1)
INSERT [dbo].[Account] ([Username], [Password], [Image], [Name], [Role], [Status]) VALUES (N'user5', N'12345', NULL, N'KV', N'sale', 1)
INSERT [dbo].[AccountShop] ([Username], [ShopId], [Status]) VALUES (N'user1', N'FEV', 1)
INSERT [dbo].[AccountShop] ([Username], [ShopId], [Status]) VALUES (N'user2', N'FFC', 1)
INSERT [dbo].[AccountShop] ([Username], [ShopId], [Status]) VALUES (N'user3', N'FVC', 1)
INSERT [dbo].[AccountShop] ([Username], [ShopId], [Status]) VALUES (N'user5', N'ESCNE', 0)

SET IDENTITY_INSERT [dbo].[Combo] ON 

INSERT [dbo].[Combo] ([No], [Id], [IdMake], [Quantity]) VALUES (1, 3, 1, 2)
INSERT [dbo].[Combo] ([No], [Id], [IdMake], [Quantity]) VALUES (2, 3, 2, 1)
INSERT [dbo].[Combo] ([No], [Id], [IdMake], [Quantity]) VALUES (3, 6, 4, 2)
INSERT [dbo].[Combo] ([No], [Id], [IdMake], [Quantity]) VALUES (4, 6, 5, 2)
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
INSERT [dbo].[Combo] ([No], [Id], [IdMake], [Quantity]) VALUES (1015, 1022, 1018, 2)
INSERT [dbo].[Combo] ([No], [Id], [IdMake], [Quantity]) VALUES (1016, 1022, 7, 2)
INSERT [dbo].[Combo] ([No], [Id], [IdMake], [Quantity]) VALUES (1017, 1022, 1021, 1)
SET IDENTITY_INSERT [dbo].[Combo] OFF
SET IDENTITY_INSERT [dbo].[Event] ON 

INSERT [dbo].[Event] ([ID], [Name], [Description], [BeginDate], [EndDate], [Area], [Username], [Status], [Image]) VALUES (1, N'Hội xuân Làng Cóc', N'Hội Xuân Làng Cóc', CAST(N'2023-07-20' AS Date), CAST(N'2023-07-22' AS Date), N'FPT', N'admin', 0, N'https://firebasestorage.googleapis.com/v0/b/carmanaager-upload-file.appspot.com/o/Package%2F324088349_906487807190365_1822405884823009665_n.jpg?alt=media&token=4e54825f-3f76-44c9-ae3f-c6284049261c')
INSERT [dbo].[Event] ([ID], [Name], [Description], [BeginDate], [EndDate], [Area], [Username], [Status], [Image]) VALUES (2, N'Back2School', N'Sinh Viên trở lại trường học', CAST(N'2023-09-05' AS Date), CAST(N'2023-09-06' AS Date), N'FPT', N'admin', 0, N'https://firebasestorage.googleapis.com/v0/b/carmanaager-upload-file.appspot.com/o/Package%2F154786800_3549487075174259_2573061176000509919_n.jpg?alt=media&token=1ed8232c-0aab-41fc-9599-a4c61d46ff54')
INSERT [dbo].[Event] ([ID], [Name], [Description], [BeginDate], [EndDate], [Area], [Username], [Status], [Image]) VALUES (3, N'Xuân Ấm Áp', N'Phát quà từ thiện', CAST(N'2024-02-10' AS Date), CAST(N'2024-02-24' AS Date), N'FPT Q9 ha', N'admin', 0, N'https://firebasestorage.googleapis.com/v0/b/carmanaager-upload-file.appspot.com/o/Package%2F135224036_3400697020053266_8902511975498351834_n.png?alt=media&token=40e05b34-281f-4091-b25b-a5322314176d')
INSERT [dbo].[Event] ([ID], [Name], [Description], [BeginDate], [EndDate], [Area], [Username], [Status], [Image]) VALUES (1003, N'Ngày Hội Ẩm Thực', N'Giao lưu văn hóa ẩm thực', CAST(N'2023-07-26' AS Date), CAST(N'2023-07-30' AS Date), N'FPT Q9 ha', N'admin', 0, N'https://firebasestorage.googleapis.com/v0/b/carmanaager-upload-file.appspot.com/o/Package%2F324151952_609396470908269_3591530088654048587_n.jpg?alt=media&token=5281a718-0d73-43af-90eb-b7b1c94c594b')
INSERT [dbo].[Event] ([ID], [Name], [Description], [BeginDate], [EndDate], [Area], [Username], [Status], [Image]) VALUES (1005, N'Campus Tour', N'Chào đón học sinh tham quan', CAST(N'2023-08-15' AS Date), CAST(N'2023-08-19' AS Date), N'FPT', N'admin', 0, N'https://firebasestorage.googleapis.com/v0/b/carmanaager-upload-file.appspot.com/o/Package%2F277782979_2218092158347542_5720904062507112913_n.jpg?alt=media&token=062c471a-d8ad-433f-b4fe-dbdbe3dffac5')
SET IDENTITY_INSERT [dbo].[Event] OFF
SET IDENTITY_INSERT [dbo].[ImageEvent] ON 

INSERT [dbo].[ImageEvent] ([No], [EventId], [Image]) VALUES (1, 1, N'https://scontent.fsgn17-1.fna.fbcdn.net/v/t39.30808-6/324270488_3435578490021254_1109975506766971237_n.jpg?_nc_cat=111&cb=99be929b-59f725be&ccb=1-7&_nc_sid=0debeb&_nc_ohc=y2hGXFO3JfcAX_rqy7D&_nc_ht=scontent.fsgn17-1.fna&oh=00_AfDlIYwsru5uZy_p9xC403XpsSpnge30C-pC6SJjthx5Xw&oe=64B7B743')
INSERT [dbo].[ImageEvent] ([No], [EventId], [Image]) VALUES (2, 1, N'https://scontent.fsgn17-1.fna.fbcdn.net/v/t39.30808-6/324270488_3435578490021254_1109975506766971237_n.jpg?_nc_cat=111&cb=99be929b-59f725be&ccb=1-7&_nc_sid=0debeb&_nc_ohc=y2hGXFO3JfcAX_rqy7D&_nc_ht=scontent.fsgn17-1.fna&oh=00_AfDlIYwsru5uZy_p9xC403XpsSpnge30C-pC6SJjthx5Xw&oe=64B7B743')
INSERT [dbo].[ImageEvent] ([No], [EventId], [Image]) VALUES (3, 1, N'https://scontent.fsgn17-1.fna.fbcdn.net/v/t39.30808-6/324270488_3435578490021254_1109975506766971237_n.jpg?_nc_cat=111&cb=99be929b-59f725be&ccb=1-7&_nc_sid=0debeb&_nc_ohc=y2hGXFO3JfcAX_rqy7D&_nc_ht=scontent.fsgn17-1.fna&oh=00_AfDlIYwsru5uZy_p9xC403XpsSpnge30C-pC6SJjthx5Xw&oe=64B7B743')
INSERT [dbo].[ImageEvent] ([No], [EventId], [Image]) VALUES (4, 1, N'https://scontent.fsgn17-1.fna.fbcdn.net/v/t39.30808-6/324270488_3435578490021254_1109975506766971237_n.jpg?_nc_cat=111&cb=99be929b-59f725be&ccb=1-7&_nc_sid=0debeb&_nc_ohc=y2hGXFO3JfcAX_rqy7D&_nc_ht=scontent.fsgn17-1.fna&oh=00_AfDlIYwsru5uZy_p9xC403XpsSpnge30C-pC6SJjthx5Xw&oe=64B7B743')
INSERT [dbo].[ImageEvent] ([No], [EventId], [Image]) VALUES (5, 1, N'https://scontent.fsgn17-1.fna.fbcdn.net/v/t39.30808-6/324270488_3435578490021254_1109975506766971237_n.jpg?_nc_cat=111&cb=99be929b-59f725be&ccb=1-7&_nc_sid=0debeb&_nc_ohc=y2hGXFO3JfcAX_rqy7D&_nc_ht=scontent.fsgn17-1.fna&oh=00_AfDlIYwsru5uZy_p9xC403XpsSpnge30C-pC6SJjthx5Xw&oe=64B7B743')
SET IDENTITY_INSERT [dbo].[ImageEvent] OFF
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([No], [Id], [Date], [ShopId], [CardId], [Total]) VALUES (1, 361406, CAST(N'2023-07-18T04:34:34.700' AS DateTime), N'FFC', 1, 153000)
SET IDENTITY_INSERT [dbo].[Order] OFF
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([No], [OrderId], [ProductId], [Quantity], [Price], [Total]) VALUES (1, 361406, 7, 1, 25000, 25000)
INSERT [dbo].[OrderDetail] ([No], [OrderId], [ProductId], [Quantity], [Price], [Total]) VALUES (2, 361406, 1018, 1, 18000, 18000)
INSERT [dbo].[OrderDetail] ([No], [OrderId], [ProductId], [Quantity], [Price], [Total]) VALUES (3, 361406, 1018, 2, 18000, 36000)
INSERT [dbo].[OrderDetail] ([No], [OrderId], [ProductId], [Quantity], [Price], [Total]) VALUES (4, 361406, 7, 2, 25000, 50000)
INSERT [dbo].[OrderDetail] ([No], [OrderId], [ProductId], [Quantity], [Price], [Total]) VALUES (5, 361406, 1021, 1, 15000, 15000)
INSERT [dbo].[OrderDetail] ([No], [OrderId], [ProductId], [Quantity], [Price], [Total]) VALUES (6, 361406, 1020, 1, 15000, 15000)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [ShopId], [Name], [Price], [Image], [Description], [Category], [Status]) VALUES (1, N'FEV', N'Bánh tráng nướng', 200000, N'https://firebasestorage.googleapis.com/v0/b/carmanaager-upload-file.appspot.com/o/Package%2FR.jpg?alt=media&token=ea2bdca0-c63f-40e6-91e7-879a0a5756b6', N'banh trang cu?n bơ', N'Food', 1)
INSERT [dbo].[Product] ([Id], [ShopId], [Name], [Price], [Image], [Description], [Category], [Status]) VALUES (2, N'FEV', N'Tiramisu', 50000, N'https://firebasestorage.googleapis.com/v0/b/carmanaager-upload-file.appspot.com/o/Package%2FR%20(1).jpg?alt=media&token=94a78732-84a8-4844-adb3-15354cfb3f50', N'tiramisu chanh leo', N'Food', 1)
INSERT [dbo].[Product] ([Id], [ShopId], [Name], [Price], [Image], [Description], [Category], [Status]) VALUES (3, N'FEV', N'combo1', 80000, N'comboFEV1.jpg', N'2 Bánh tráng + Teramisu', N'Combo', 1)
INSERT [dbo].[Product] ([Id], [ShopId], [Name], [Price], [Image], [Description], [Category], [Status]) VALUES (4, N'FVC', N'Hambuger', 30000, N'Hambuger.jpg', N'Hambuger b? x?t cay', N'Food', 1)
INSERT [dbo].[Product] ([Id], [ShopId], [Name], [Price], [Image], [Description], [Category], [Status]) VALUES (5, N'FVC', N'Coca', 10000, N'cocacola.jpg', N'nư?c ng?t có gas cocke', N'Drink', 1)
INSERT [dbo].[Product] ([Id], [ShopId], [Name], [Price], [Image], [Description], [Category], [Status]) VALUES (6, N'FVC', N'combo1', 45000, N'burka.jpg', N'cocacola + hamburger b?', N'Combo', 1)
INSERT [dbo].[Product] ([Id], [ShopId], [Name], [Price], [Image], [Description], [Category], [Status]) VALUES (7, N'FFC', N'Mì Xào', 25000, N'https://firebasestorage.googleapis.com/v0/b/carmanaager-upload-file.appspot.com/o/Package%2Fmi-xao-2.jpg?alt=media&token=29571000-304f-45ae-b9ea-168103e220eb', N'Mì Xào Xào', N'Food', 1)
INSERT [dbo].[Product] ([Id], [ShopId], [Name], [Price], [Image], [Description], [Category], [Status]) VALUES (8, N'FFC', N'mâmmam', 56000, N'https://firebasestorage.googleapis.com/v0/b/carmanaager-upload-file.appspot.com/o/Package%2F323694807_656078839608122_2797946332502206228_n.jpg?alt=media&token=75e2534c-883b-46d8-a0a0-bfc0a95b7232', N'312321', N'Food', 0)
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
INSERT [dbo].[Product] ([Id], [ShopId], [Name], [Price], [Image], [Description], [Category], [Status]) VALUES (1015, N'FFC', N'Bánh Tráng Nướng', 10000, N'https://firebasestorage.googleapis.com/v0/b/carmanaager-upload-file.appspot.com/o/Package%2FR.jpg?alt=media&token=0c453a53-ba19-4828-9239-88bd5b345a0a', N'Bánh Tráng Nướng', N'Food', 1)
INSERT [dbo].[Product] ([Id], [ShopId], [Name], [Price], [Image], [Description], [Category], [Status]) VALUES (1016, N'FEV', N'uwu uwwu', 123123, N'https://firebasestorage.googleapis.com/v0/b/carmanaager-upload-file.appspot.com/o/Package%2F339135711_321858083623623_6668565926008596782_n.jpg?alt=media&token=06a83285-549f-4df8-adbd-4efe3d5fe775', N'dsfsdf', N'Drink', 1)
INSERT [dbo].[Product] ([Id], [ShopId], [Name], [Price], [Image], [Description], [Category], [Status]) VALUES (1017, N'FEV', N'dfsdfds', 21000, N'https://firebasestorage.googleapis.com/v0/b/carmanaager-upload-file.appspot.com/o/Package%2F_MG_1752.jpg?alt=media&token=286e5172-b8b8-4c4e-89a8-b57ab558446a', N'fdfgdg', N'Drink', 1)
INSERT [dbo].[Product] ([Id], [ShopId], [Name], [Price], [Image], [Description], [Category], [Status]) VALUES (1018, N'FFC', N'Sting', 18000, N'https://firebasestorage.googleapis.com/v0/b/carmanaager-upload-file.appspot.com/o/Package%2FR%20(3).jpg?alt=media&token=4af82ac4-da44-4880-a6a6-38c41a4151a6', N'Sting Dâu Đỏ', N'Drink', 1)
INSERT [dbo].[Product] ([Id], [ShopId], [Name], [Price], [Image], [Description], [Category], [Status]) VALUES (1020, N'FFC', N'Trà Tắc', 15000, N'https://firebasestorage.googleapis.com/v0/b/carmanaager-upload-file.appspot.com/o/Package%2Ftra-tac-giam-can-3.jpg?alt=media&token=13f57152-aabd-417b-91d4-d557cb21cbca', N'Trà Tắc Tắc', N'Drink', 1)
INSERT [dbo].[Product] ([Id], [ShopId], [Name], [Price], [Image], [Description], [Category], [Status]) VALUES (1021, N'FFC', N'Xiên Que', 15000, N'https://firebasestorage.googleapis.com/v0/b/carmanaager-upload-file.appspot.com/o/Package%2FR%20(4).jpg?alt=media&token=279350de-c9dc-41ec-8912-8457d7cc03d0', N'Xiên que que', N'Food', 1)
INSERT [dbo].[Product] ([Id], [ShopId], [Name], [Price], [Image], [Description], [Category], [Status]) VALUES (1022, N'FFC', N'Combo 1', 95000, N'https://firebasestorage.googleapis.com/v0/b/carmanaager-upload-file.appspot.com/o/Package%2FR%20(5).jpg?alt=media&token=a54bccca-11d9-4387-8b29-50b7998412df', N'2 Mì Xào + 2 Sting + 1 Xiên Que', N'Combo', 1)
SET IDENTITY_INSERT [dbo].[Product] OFF
INSERT [dbo].[Shop] ([Id], [EventId], [Image], [Name], [Description], [Area], [Status]) VALUES (N'CSG', 2, N'https://firebasestorage.googleapis.com/v0/b/carmanaager-upload-file.appspot.com/o/Package%2FLogo%20CSG.JPG?alt=media&token=742ba32b-2743-4f3f-9e6c-e4666f0ad361', N'CSG - CLB Truyền Thông Cóc Sài Gòn', N'CLB Truyền thông Cóc Sài Gòn', N'FPT - 711', 1)
INSERT [dbo].[Shop] ([Id], [EventId], [Image], [Name], [Description], [Area], [Status]) VALUES (N'ESCNE', 1, N'https://firebasestorage.googleapis.com/v0/b/carmanaager-upload-file.appspot.com/o/Package%2F308604869_160887326621592_868590596831418680_n.jpg?alt=media&token=4831a8af-2fbe-4666-ad42-d4ebfdda4406', N'ESC - CLB Thể Thao Điện Tử', N'Cộng đồng sinh viên FPT quan tâm đến Games & Esport', N'FPT Floor 1', 1)
INSERT [dbo].[Shop] ([Id], [EventId], [Image], [Name], [Description], [Area], [Status]) VALUES (N'FCode', 2, N'https://firebasestorage.googleapis.com/v0/b/carmanaager-upload-file.appspot.com/o/Package%2FlogoF-Code.png?alt=media&token=3f1be60c-a7cc-4ed7-80be-011ecad58b96', N'F - Code', N'Code Code Code', N'Library', 1)
INSERT [dbo].[Shop] ([Id], [EventId], [Image], [Name], [Description], [Area], [Status]) VALUES (N'FEV', 1, N'https://firebasestorage.googleapis.com/v0/b/carmanaager-upload-file.appspot.com/o/Package%2F45466205_288954738613802_5335745147218952192_n%20(1).png?alt=media&token=f3ca825f-cec2-4824-809a-3d9ab6cad606', N'FEV - CLB Tổ Chức Sự Kiện', N'The Way We Went', N'FPT Floor 2', 1)
INSERT [dbo].[Shop] ([Id], [EventId], [Image], [Name], [Description], [Area], [Status]) VALUES (N'FFC', 2, N'https://firebasestorage.googleapis.com/v0/b/carmanaager-upload-file.appspot.com/o/Package%2FLOGO_FFC_PNG.png?alt=media&token=556e323e-2cc8-4855-9cf6-504e3597a74b', N'FFC - CLB Bóng Đá Đại học FPT', N'Sút là vào !!', N'Football Area', 1)
INSERT [dbo].[Shop] ([Id], [EventId], [Image], [Name], [Description], [Area], [Status]) VALUES (N'FStyle', 3, N'https://firebasestorage.googleapis.com/v0/b/carmanaager-upload-file.appspot.com/o/Package%2FLogo.effect.black.png?alt=media&token=71a167e9-bf66-4665-82f1-6b44cd791dac', N'F - Style', N'Đam mê nhảy', N'Hall A', 1)
INSERT [dbo].[Shop] ([Id], [EventId], [Image], [Name], [Description], [Area], [Status]) VALUES (N'FVC', 1, N'https://firebasestorage.googleapis.com/v0/b/carmanaager-upload-file.appspot.com/o/Package%2Flogo%20FVC.png?alt=media&token=c3275e2b-747e-48a6-ab75-8b45cbb8c3c0', N'FVC - CLB Vovinam Club', N'FVC - Nơi gắn kết niềm đam mê', N'FPT Floor 5', 1)
SET IDENTITY_INSERT [dbo].[Transaction] ON 

INSERT [dbo].[Transaction] ([Id], [CardId], [OrderId]) VALUES (1, 1, 999691)
INSERT [dbo].[Transaction] ([Id], [CardId], [OrderId]) VALUES (2, 1, 561285)
INSERT [dbo].[Transaction] ([Id], [CardId], [OrderId]) VALUES (3, 1, 995974)
INSERT [dbo].[Transaction] ([Id], [CardId], [OrderId]) VALUES (4, 1, 679059)
INSERT [dbo].[Transaction] ([Id], [CardId], [OrderId]) VALUES (5, 1, 832798)
INSERT [dbo].[Transaction] ([Id], [CardId], [OrderId]) VALUES (6, 1, 836287)
INSERT [dbo].[Transaction] ([Id], [CardId], [OrderId]) VALUES (7, 1, 998154)
INSERT [dbo].[Transaction] ([Id], [CardId], [OrderId]) VALUES (8, 1, 772080)
INSERT [dbo].[Transaction] ([Id], [CardId], [OrderId]) VALUES (9, 1, 164359)
INSERT [dbo].[Transaction] ([Id], [CardId], [OrderId]) VALUES (10, 1, 206036)
INSERT [dbo].[Transaction] ([Id], [CardId], [OrderId]) VALUES (11, 0, 85340)
INSERT [dbo].[Transaction] ([Id], [CardId], [OrderId]) VALUES (12, 1, 634493)
INSERT [dbo].[Transaction] ([Id], [CardId], [OrderId]) VALUES (13, 0, 350361)
INSERT [dbo].[Transaction] ([Id], [CardId], [OrderId]) VALUES (14, 1, 976065)
INSERT [dbo].[Transaction] ([Id], [CardId], [OrderId]) VALUES (15, 1, 630199)
INSERT [dbo].[Transaction] ([Id], [CardId], [OrderId]) VALUES (16, 1, 287747)
INSERT [dbo].[Transaction] ([Id], [CardId], [OrderId]) VALUES (17, 1, 361406)
SET IDENTITY_INSERT [dbo].[Transaction] OFF
ALTER TABLE [dbo].[Account] ADD  DEFAULT ('true') FOR [Status]
GO
ALTER TABLE [dbo].[AccountShop] ADD  DEFAULT ('true') FOR [Status]
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
