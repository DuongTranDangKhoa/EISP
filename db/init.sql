drop database EIPS
go

Create database EIPS
go
USE [EIPS]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 7/11/2023 1:16:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
    [Username] [varchar](100) NOT NULL,
    [Password] [varchar](100) NOT NULL,
    [Name] [varchar](500) NULL,
    [Role] [varchar](100) NOT NULL,
    [Status] [bit] NOT NULL,
    PRIMARY KEY CLUSTERED
(
[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]

    GO
/****** Object:  Table [dbo].[AccountShop]    Script Date: 7/11/2023 1:16:19 AM ******/
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
/****** Object:  Table [dbo].[Card]    Script Date: 7/11/2023 1:16:20 AM ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
CREATE TABLE [dbo].[Card](
    [Id] [int] IDENTITY(1,1) NOT NULL,
    [EventId] [int] NOT NULL,
    [Balance] [real] NULL,
    [Usename] [varchar](500) NULL,
    [PhoneNumber] [varchar](10) NULL,
    [Status] [bit] NULL,
    PRIMARY KEY CLUSTERED
(
[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]

    GO
/****** Object:  Table [dbo].[Combo]    Script Date: 7/11/2023 1:16:20 AM ******/
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
/****** Object:  Table [dbo].[Event]    Script Date: 7/11/2023 1:16:20 AM ******/
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
    [Image] [varchar](100) NULL,
    PRIMARY KEY CLUSTERED
(
[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]

    GO
/****** Object:  Table [dbo].[ImageEvent]    Script Date: 7/11/2023 1:16:20 AM ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
CREATE TABLE [dbo].[ImageEvent](
    [No] [int] IDENTITY(1,1) NOT NULL,
    [EventId] [int] NOT NULL,
    [Image] [varchar](1000) NULL,
    PRIMARY KEY CLUSTERED
(
[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]

    GO
/****** Object:  Table [dbo].[Order]    Script Date: 7/11/2023 1:16:20 AM ******/
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
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 7/11/2023 1:16:21 AM ******/
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
/****** Object:  Table [dbo].[Product]    Script Date: 7/11/2023 1:16:21 AM ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
CREATE TABLE [dbo].[Product](
    [Id] [int] IDENTITY(1,1) NOT NULL,
    [ShopId] [varchar](100) NOT NULL,
    [Name] [nvarchar](500) NOT NULL,
    [Price] [real] NOT NULL,
    [Image] [varchar](1000) NULL,
    [Description] [nvarchar](700) NULL,
    [Category] [varchar](10) NOT NULL,
    [Status] [bit] NOT NULL,
    PRIMARY KEY CLUSTERED
(
[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]

    GO
/****** Object:  Table [dbo].[Shop]    Script Date: 7/11/2023 1:16:21 AM ******/
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
/****** Object:  Table [dbo].[Transaction]    Script Date: 7/11/2023 1:16:21 AM ******/
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
    INSERT [dbo].[Account] ([Username], [Password], [Name], [Role], [Status]) VALUES (N'admin', N'12345', N'admin', N'admin', 1)
    INSERT [dbo].[Account] ([Username], [Password], [Name], [Role], [Status]) VALUES (N'user1', N'12345', N'u1', N'sale', 1)
    INSERT [dbo].[Account] ([Username], [Password], [Name], [Role], [Status]) VALUES (N'user2', N'12345', N'u2', N'sale', 1)
    INSERT [dbo].[Account] ([Username], [Password], [Name], [Role], [Status]) VALUES (N'user3', N'12345', N'u3', N'sale', 1)
    INSERT [dbo].[Account] ([Username], [Password], [Name], [Role], [Status]) VALUES (N'user4', N'12345', N'u4', N'cashier', 1)
    INSERT [dbo].[Account] ([Username], [Password], [Name], [Role], [Status]) VALUES (N'user5', N'12345', N'u4', N'sale', 1)
    INSERT [dbo].[AccountShop] ([Username], [ShopId], [Status]) VALUES (N'user1', N'FEV', 1)
    INSERT [dbo].[AccountShop] ([Username], [ShopId], [Status]) VALUES (N'user2', N'FFC', 1)
    INSERT [dbo].[AccountShop] ([Username], [ShopId], [Status]) VALUES (N'user3', N'FVC', 1)
    INSERT [dbo].[AccountShop] ([Username], [ShopId], [Status]) VALUES (N'user5', N'CSG', 1)
    SET IDENTITY_INSERT [dbo].[Combo] ON

    INSERT [dbo].[Combo] ([No], [Id], [IdMake], [Quantity]) VALUES (1, 3, 1, 2)
    INSERT [dbo].[Combo] ([No], [Id], [IdMake], [Quantity]) VALUES (2, 3, 2, 1)
    INSERT [dbo].[Combo] ([No], [Id], [IdMake], [Quantity]) VALUES (3, 6, 4, 2)
    INSERT [dbo].[Combo] ([No], [Id], [IdMake], [Quantity]) VALUES (4, 6, 5, 2)
    INSERT [dbo].[Combo] ([No], [Id], [IdMake], [Quantity]) VALUES (5, 9, 7, 2)
    INSERT [dbo].[Combo] ([No], [Id], [IdMake], [Quantity]) VALUES (6, 9, 8, 1)
    INSERT [dbo].[Combo] ([No], [Id], [IdMake], [Quantity]) VALUES (7, 12, 10, 1)
    INSERT [dbo].[Combo] ([No], [Id], [IdMake], [Quantity]) VALUES (8, 12, 11, 2)
    SET IDENTITY_INSERT [dbo].[Combo] OFF
    SET IDENTITY_INSERT [dbo].[Event] ON

    INSERT [dbo].[Event] ([ID], [Name], [Description], [BeginDate], [EndDate], [Area], [Username], [Status], [Image]) VALUES (1, N'H?i xuân', N'H?i xuân lang cóc năm 2023', CAST(N'2023-01-10' AS Date), CAST(N'2023-01-17' AS Date), N'FPT', N'admin', 1, N'hoi xuan.jpg')
    INSERT [dbo].[Event] ([ID], [Name], [Description], [BeginDate], [EndDate], [Area], [Username], [Status], [Image]) VALUES (2, N'back to school', N'Back to school 2020=2023', CAST(N'2023-02-10' AS Date), CAST(N'2023-02-17' AS Date), N'FPT', N'admin', 1, N'bts.jpg')
    SET IDENTITY_INSERT [dbo].[Event] OFF
    SET IDENTITY_INSERT [dbo].[Product] ON

    INSERT [dbo].[Product] ([Id], [ShopId], [Name], [Price], [Image], [Description], [Category], [Status]) VALUES (1, N'FEV', N'Bánh tráng', 20000, N'banhs trang.jpg', N'banh trang cu?n bơ', N'Food', 1)
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
    SET IDENTITY_INSERT [dbo].[Product] OFF
    INSERT [dbo].[Shop] ([Id], [EventId], [Name], [Description], [Area], [Status]) VALUES (N'CSG', 2, N'CLb truy?n thông Cóc Sài G?n', N'Qu?ng bá FPT đ?n v?i m?i ngư?i', N's?nh 2', 1)
    INSERT [dbo].[Shop] ([Id], [EventId], [Name], [Description], [Area], [Status]) VALUES (N'FEV', 1, N'CLb to chuc su kien', N'to kien this sk that', N's?nh 1', 1)
    INSERT [dbo].[Shop] ([Id], [EventId], [Name], [Description], [Area], [Status]) VALUES (N'FFC', 2, N'clb bóng đá', N'đá bóng đ? ghi th?t nhi?u bàn th?ng', N't?ng 4', 1)
    INSERT [dbo].[Shop] ([Id], [EventId], [Name], [Description], [Area], [Status]) VALUES (N'FVC', 1, N'CLb vovinam', N'th? d?c th? thao s?c kh?e là s? 1 ', N't?ng G', 1)
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
