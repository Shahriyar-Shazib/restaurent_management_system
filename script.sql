USE [master]
GO
/****** Object:  Database [Restaurant Management]    Script Date: 10/18/2020 8:33:22 PM ******/
CREATE DATABASE [Restaurant Management]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Restaurant Management', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Restaurant Management.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Restaurant Management_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Restaurant Management_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Restaurant Management] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Restaurant Management].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Restaurant Management] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Restaurant Management] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Restaurant Management] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Restaurant Management] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Restaurant Management] SET ARITHABORT OFF 
GO
ALTER DATABASE [Restaurant Management] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Restaurant Management] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Restaurant Management] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Restaurant Management] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Restaurant Management] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Restaurant Management] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Restaurant Management] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Restaurant Management] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Restaurant Management] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Restaurant Management] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Restaurant Management] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Restaurant Management] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Restaurant Management] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Restaurant Management] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Restaurant Management] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Restaurant Management] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Restaurant Management] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Restaurant Management] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Restaurant Management] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Restaurant Management] SET  MULTI_USER 
GO
ALTER DATABASE [Restaurant Management] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Restaurant Management] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Restaurant Management] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Restaurant Management] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Restaurant Management]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 10/18/2020 8:33:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[empid] [nvarchar](20) NULL,
	[name] [nvarchar](50) NULL,
	[address] [nvarchar](50) NULL,
	[phonenum] [nchar](11) NULL,
	[sal] [float] NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FoodItem]    Script Date: 10/18/2020 8:33:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FoodItem](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[foodid] [nvarchar](10) NULL,
	[type] [nvarchar](30) NOT NULL,
	[name] [nvarchar](50) NULL,
	[price] [float] NULL,
 CONSTRAINT [PK_FoodItem] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FoodType]    Script Date: 10/18/2020 8:33:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FoodType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[typeId] [nchar](10) NULL,
	[typeName] [nchar](50) NULL,
 CONSTRAINT [PK_FoodType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ManagerDetail]    Script Date: 10/18/2020 8:33:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ManagerDetail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[managerid] [nchar](10) NULL,
	[name] [nchar](50) NULL,
	[address] [nchar](50) NULL,
	[phonenum] [nchar](11) NULL,
	[sal] [float] NULL,
 CONSTRAINT [PK_Manager] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 10/18/2020 8:33:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[orderId] [nchar](10) NULL,
	[tableName] [nchar](20) NULL,
	[empId] [nchar](10) NULL,
	[date] [date] NULL,
	[totalBill] [float] NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TableDetail]    Script Date: 10/18/2020 8:33:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableDetail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](20) NULL,
	[numOfChair] [int] NULL,
	[status] [nvarchar](20) NULL,
 CONSTRAINT [PK_Table] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserDetail]    Script Date: 10/18/2020 8:33:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserDetail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userid] [nchar](20) NULL,
	[pass] [nchar](20) NULL,
	[designation] [nchar](10) NULL,
 CONSTRAINT [PK_UserDetail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([id], [empid], [name], [address], [phonenum], [sal]) VALUES (3, N'E-9090', N'Hafiz', N'Chittigong', N'01812337443', 10000)
INSERT [dbo].[Employee] ([id], [empid], [name], [address], [phonenum], [sal]) VALUES (5, N'E-1112', N'Preety', N'Old Dhaka', N'01954648646', 15000)
INSERT [dbo].[Employee] ([id], [empid], [name], [address], [phonenum], [sal]) VALUES (16, N'E-1113', N'Pranto', N'Faridpur', N'01578615212', 5000)
INSERT [dbo].[Employee] ([id], [empid], [name], [address], [phonenum], [sal]) VALUES (18, N'E-1114', N'sifat', N'dhaka', N'0175658421 ', 2000)
SET IDENTITY_INSERT [dbo].[Employee] OFF
SET IDENTITY_INSERT [dbo].[FoodItem] ON 

INSERT [dbo].[FoodItem] ([id], [foodid], [type], [name], [price]) VALUES (1, N'F-1101', N'Fast Food', N'Chicken Sandwich', 150)
INSERT [dbo].[FoodItem] ([id], [foodid], [type], [name], [price]) VALUES (2, N'F-1999', N'Fast Food', N'Chicken Fry', 100)
INSERT [dbo].[FoodItem] ([id], [foodid], [type], [name], [price]) VALUES (9, N'F-1113', N'Soft Drings', N'cocacola', 30)
INSERT [dbo].[FoodItem] ([id], [foodid], [type], [name], [price]) VALUES (10, N'F-1114', N'Set Menu 1', N'Rice Bowl ,Chicken Fry(3Pic),Cocacola', 450)
INSERT [dbo].[FoodItem] ([id], [foodid], [type], [name], [price]) VALUES (13, N'F-1116', N'Fast Food', N'burger', 200)
INSERT [dbo].[FoodItem] ([id], [foodid], [type], [name], [price]) VALUES (15, N'F-1117', N'Dessert', N'MilkShake', 60)
INSERT [dbo].[FoodItem] ([id], [foodid], [type], [name], [price]) VALUES (18, N'F-1118', N'Breakfast', N'Nun Paratha(per)', 20)
INSERT [dbo].[FoodItem] ([id], [foodid], [type], [name], [price]) VALUES (19, N'F-1119', N'Breakfast', N'Paratha (normal)', 10)
INSERT [dbo].[FoodItem] ([id], [foodid], [type], [name], [price]) VALUES (23, N'F-1120', N'Soft Drings                   ', N'merinda', 25)
INSERT [dbo].[FoodItem] ([id], [foodid], [type], [name], [price]) VALUES (24, N'F-1121', N'Soft Drings                   ', N'Merinda', 30)
SET IDENTITY_INSERT [dbo].[FoodItem] OFF
SET IDENTITY_INSERT [dbo].[FoodType] ON 

INSERT [dbo].[FoodType] ([id], [typeId], [typeName]) VALUES (1, N'T-0000    ', N'                                                  ')
INSERT [dbo].[FoodType] ([id], [typeId], [typeName]) VALUES (2, N'T-0011    ', N'Fast Food                                         ')
INSERT [dbo].[FoodType] ([id], [typeId], [typeName]) VALUES (3, N'T-0012    ', N'Breakfast                                         ')
INSERT [dbo].[FoodType] ([id], [typeId], [typeName]) VALUES (4, N'T-0013    ', N'Lunch                                             ')
INSERT [dbo].[FoodType] ([id], [typeId], [typeName]) VALUES (5, N'T-0014    ', N'Dinner                                            ')
INSERT [dbo].[FoodType] ([id], [typeId], [typeName]) VALUES (6, N'T-0015    ', N'Soft Drings                                       ')
INSERT [dbo].[FoodType] ([id], [typeId], [typeName]) VALUES (7, N'T-0016    ', N'Dessert                                           ')
INSERT [dbo].[FoodType] ([id], [typeId], [typeName]) VALUES (8, N'T-0017    ', N'Set Menu 1                                        ')
INSERT [dbo].[FoodType] ([id], [typeId], [typeName]) VALUES (9, N'T-0018    ', N'Set Menu 2                                        ')
INSERT [dbo].[FoodType] ([id], [typeId], [typeName]) VALUES (10, N'T-0019    ', N'Set Menu 3                                        ')
SET IDENTITY_INSERT [dbo].[FoodType] OFF
SET IDENTITY_INSERT [dbo].[ManagerDetail] ON 

INSERT [dbo].[ManagerDetail] ([id], [managerid], [name], [address], [phonenum], [sal]) VALUES (1, N'M-1101    ', N'shahriyar                                         ', N'gazipur                                           ', N'01956424568', 25000)
INSERT [dbo].[ManagerDetail] ([id], [managerid], [name], [address], [phonenum], [sal]) VALUES (2, N'M-1542    ', N'Syeda                                             ', N'dhaka                                             ', N'01910045755', 20000)
INSERT [dbo].[ManagerDetail] ([id], [managerid], [name], [address], [phonenum], [sal]) VALUES (3, N'M-1543    ', N'Shazib                                            ', N'Gazipur                                           ', N'01861670601', 50000)
INSERT [dbo].[ManagerDetail] ([id], [managerid], [name], [address], [phonenum], [sal]) VALUES (7, N'M-1544    ', N'ishu                                              ', N'Bashabo                                           ', N'01594685211', 20000)
SET IDENTITY_INSERT [dbo].[ManagerDetail] OFF
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([id], [orderId], [tableName], [empId], [date], [totalBill]) VALUES (1, N'O-1999    ', N'The Professor       ', N'E-1111    ', CAST(0xBE400B00 AS Date), 1500)
INSERT [dbo].[OrderDetail] ([id], [orderId], [tableName], [empId], [date], [totalBill]) VALUES (2, N'O-1985    ', N'Nairobi             ', N'E-9090    ', CAST(0x84400B00 AS Date), 1000)
INSERT [dbo].[OrderDetail] ([id], [orderId], [tableName], [empId], [date], [totalBill]) VALUES (3, N'O-1986    ', N'Berlin              ', N'E-1113    ', CAST(0x10410B00 AS Date), 147)
INSERT [dbo].[OrderDetail] ([id], [orderId], [tableName], [empId], [date], [totalBill]) VALUES (4, N'O-1987    ', N'Berlin              ', N'E-1113    ', CAST(0x11410B00 AS Date), 1291.5)
INSERT [dbo].[OrderDetail] ([id], [orderId], [tableName], [empId], [date], [totalBill]) VALUES (5, N'O-1988    ', N'Berlin              ', N'E-1113    ', CAST(0x14410B00 AS Date), 199.5)
INSERT [dbo].[OrderDetail] ([id], [orderId], [tableName], [empId], [date], [totalBill]) VALUES (6, N'O-1989    ', N'Nairobi             ', N'E-1113    ', CAST(0x14410B00 AS Date), 220.5)
INSERT [dbo].[OrderDetail] ([id], [orderId], [tableName], [empId], [date], [totalBill]) VALUES (7, N'O-1990    ', N'The Professor       ', N'E-1113    ', CAST(0x14410B00 AS Date), 241.5)
INSERT [dbo].[OrderDetail] ([id], [orderId], [tableName], [empId], [date], [totalBill]) VALUES (8, N'O-1991    ', N'Berlin              ', N'E-1113    ', CAST(0x15410B00 AS Date), 199.5)
INSERT [dbo].[OrderDetail] ([id], [orderId], [tableName], [empId], [date], [totalBill]) VALUES (1008, N'O-1992    ', N'The Professor       ', N'E-1113    ', CAST(0x18410B00 AS Date), 409.5)
INSERT [dbo].[OrderDetail] ([id], [orderId], [tableName], [empId], [date], [totalBill]) VALUES (1009, N'O-1993    ', N'Berlin              ', N'E-1113    ', CAST(0x18410B00 AS Date), 483)
INSERT [dbo].[OrderDetail] ([id], [orderId], [tableName], [empId], [date], [totalBill]) VALUES (1010, N'O-1994    ', N'The Professor       ', N'E-1113    ', CAST(0x18410B00 AS Date), 1617)
INSERT [dbo].[OrderDetail] ([id], [orderId], [tableName], [empId], [date], [totalBill]) VALUES (1011, N'O-1995    ', N'Berlin              ', N'E-1113    ', CAST(0x1E410B00 AS Date), 273)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
SET IDENTITY_INSERT [dbo].[TableDetail] ON 

INSERT [dbo].[TableDetail] ([id], [name], [numOfChair], [status]) VALUES (17, N'Berlin', 3, N'Not Booked')
INSERT [dbo].[TableDetail] ([id], [name], [numOfChair], [status]) VALUES (18, N'The Professor', 5, N'Not Booked')
INSERT [dbo].[TableDetail] ([id], [name], [numOfChair], [status]) VALUES (19, N'Nairobi', 5, N'Not Booked')
INSERT [dbo].[TableDetail] ([id], [name], [numOfChair], [status]) VALUES (20, N'Oslo', 5, N'Not Booked')
INSERT [dbo].[TableDetail] ([id], [name], [numOfChair], [status]) VALUES (21, N'Walter White', 2, N'Not Booked')
INSERT [dbo].[TableDetail] ([id], [name], [numOfChair], [status]) VALUES (22, N'Tokyo', 3, N'Booked')
SET IDENTITY_INSERT [dbo].[TableDetail] OFF
SET IDENTITY_INSERT [dbo].[UserDetail] ON 

INSERT [dbo].[UserDetail] ([id], [userid], [pass], [designation]) VALUES (1, N'M-1101              ', N'1                   ', N'Manager   ')
INSERT [dbo].[UserDetail] ([id], [userid], [pass], [designation]) VALUES (2, N'M-1542              ', N'syeda               ', N'Manager   ')
INSERT [dbo].[UserDetail] ([id], [userid], [pass], [designation]) VALUES (4, N'E-9090              ', N'hafiz               ', N'Employee  ')
INSERT [dbo].[UserDetail] ([id], [userid], [pass], [designation]) VALUES (5, N'E-1112              ', N'preety              ', N'Employee  ')
INSERT [dbo].[UserDetail] ([id], [userid], [pass], [designation]) VALUES (6, N'E-1113              ', N'1113                ', N'Employee  ')
INSERT [dbo].[UserDetail] ([id], [userid], [pass], [designation]) VALUES (7, N'M-1543              ', N'Shazib              ', N'Manager   ')
INSERT [dbo].[UserDetail] ([id], [userid], [pass], [designation]) VALUES (9, N'M-1543              ', N'Shazib              ', N'Manager   ')
INSERT [dbo].[UserDetail] ([id], [userid], [pass], [designation]) VALUES (10, N'M-1543              ', N'Shazib              ', N'Manager   ')
INSERT [dbo].[UserDetail] ([id], [userid], [pass], [designation]) VALUES (12, N'M-1542              ', N'Syeda               ', N'Manager   ')
INSERT [dbo].[UserDetail] ([id], [userid], [pass], [designation]) VALUES (13, N'M-1542              ', N'Syeda               ', N'Manager   ')
INSERT [dbo].[UserDetail] ([id], [userid], [pass], [designation]) VALUES (14, N'E-1113              ', N'Pranto              ', N'Employee  ')
INSERT [dbo].[UserDetail] ([id], [userid], [pass], [designation]) VALUES (15, N'M-1542              ', N'Syeda               ', N'Manager   ')
INSERT [dbo].[UserDetail] ([id], [userid], [pass], [designation]) VALUES (16, N'M-1542              ', N'Syeda               ', N'Manager   ')
INSERT [dbo].[UserDetail] ([id], [userid], [pass], [designation]) VALUES (17, N'E-9090              ', N'Hafiz               ', N'Employee  ')
INSERT [dbo].[UserDetail] ([id], [userid], [pass], [designation]) VALUES (21, N'E-1114              ', N'sifat               ', N'Employee  ')
INSERT [dbo].[UserDetail] ([id], [userid], [pass], [designation]) VALUES (22, N'M-1544              ', N'ishu                ', N'Manager   ')
SET IDENTITY_INSERT [dbo].[UserDetail] OFF
USE [master]
GO
ALTER DATABASE [Restaurant Management] SET  READ_WRITE 
GO
