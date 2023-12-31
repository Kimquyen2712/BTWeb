USE [master]
GO
/****** Object:  Database [SachOnline]    Script Date: 11/26/2023 12:26:46 PM ******/
CREATE DATABASE [SachOnline]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SachOnline', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\SachOnline.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SachOnline_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\SachOnline_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [SachOnline] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SachOnline].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SachOnline] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SachOnline] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SachOnline] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SachOnline] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SachOnline] SET ARITHABORT OFF 
GO
ALTER DATABASE [SachOnline] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SachOnline] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SachOnline] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SachOnline] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SachOnline] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SachOnline] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SachOnline] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SachOnline] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SachOnline] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SachOnline] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SachOnline] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SachOnline] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SachOnline] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SachOnline] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SachOnline] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SachOnline] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SachOnline] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SachOnline] SET RECOVERY FULL 
GO
ALTER DATABASE [SachOnline] SET  MULTI_USER 
GO
ALTER DATABASE [SachOnline] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SachOnline] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SachOnline] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SachOnline] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SachOnline] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SachOnline] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'SachOnline', N'ON'
GO
ALTER DATABASE [SachOnline] SET QUERY_STORE = ON
GO
ALTER DATABASE [SachOnline] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [SachOnline]
GO
/****** Object:  Table [dbo].[ADMIN]    Script Date: 11/26/2023 12:26:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ADMIN](
	[MaAdmin] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](max) NULL,
	[DiaChi] [nvarchar](max) NULL,
	[DienThoai] [nvarchar](50) NULL,
	[TenDN] [nvarchar](50) NULL,
	[MatKhau] [nvarchar](50) NULL,
	[NgaySinh] [datetime] NULL,
	[Email] [nvarchar](50) NULL,
	[Quyen] [int] NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[MaAdmin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Author]    Script Date: 11/26/2023 12:26:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Author](
	[AuthorID] [int] IDENTITY(1,1) NOT NULL,
	[AuthorName] [nvarchar](50) NOT NULL,
	[AuthorEmail] [nvarchar](50) NULL,
	[AuthorAddress] [nvarchar](150) NULL,
	[Tieusu] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[AuthorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 11/26/2023 12:26:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[BookID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](200) NOT NULL,
	[AuthorID] [int] NULL,
	[Price] [decimal](18, 0) NULL,
	[Images] [varchar](200) NULL,
	[CategoryID] [int] NOT NULL,
	[Description] [ntext] NULL,
	[Published] [datetime] NULL,
	[ViewCount] [int] NULL,
	[NhaXuatBanID] [int] NOT NULL,
 CONSTRAINT [PK__Book__3DE0C227FA6DEE7F] PRIMARY KEY CLUSTERED 
(
	[BookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 11/26/2023 12:26:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CHITIETDATHANG]    Script Date: 11/26/2023 12:26:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHITIETDATHANG](
	[MaDonHang] [int] NOT NULL,
	[BookID] [int] NOT NULL,
	[Soluong] [int] NULL,
	[Dongia] [decimal](9, 2) NULL,
 CONSTRAINT [PK_CHITIETDATHANG] PRIMARY KEY CLUSTERED 
(
	[MaDonHang] ASC,
	[BookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DONDATHANG]    Script Date: 11/26/2023 12:26:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DONDATHANG](
	[MaDonHang] [int] IDENTITY(1,1) NOT NULL,
	[Dathanhtoan] [bit] NULL,
	[Tinhtranggiaohang] [int] NULL,
	[Ngaydat] [smalldatetime] NULL,
	[Ngaygiao] [smalldatetime] NULL,
	[MaKH] [int] NULL,
 CONSTRAINT [PK_DONDATHANG] PRIMARY KEY CLUSTERED 
(
	[MaDonHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KHACHHANG]    Script Date: 11/26/2023 12:26:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KHACHHANG](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](50) NOT NULL,
	[Taikhoan] [nvarchar](50) NULL,
	[Matkhau] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](100) NULL,
	[DiachiKH] [nvarchar](max) NULL,
	[DienThoaiKH] [nvarchar](50) NULL,
	[Ngaysinh] [datetime] NULL,
 CONSTRAINT [PK_KHACHHANG] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaXuatBan]    Script Date: 11/26/2023 12:26:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaXuatBan](
	[NhaXuatBanID] [int] IDENTITY(1,1) NOT NULL,
	[NhaXuatBanName] [nvarchar](500) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[NhaXuatBanID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QUYEN]    Script Date: 11/26/2023 12:26:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QUYEN](
	[Quyen] [int] IDENTITY(1,1) NOT NULL,
	[QuyenName] [nvarchar](max) NULL,
 CONSTRAINT [PK_QUYEN] PRIMARY KEY CLUSTERED 
(
	[Quyen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VIETSACH]    Script Date: 11/26/2023 12:26:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VIETSACH](
	[AuthorID] [int] NOT NULL,
	[BookID] [int] NOT NULL,
	[Vaitro] [nvarchar](50) NULL,
	[Vitri] [nvarchar](50) NULL,
 CONSTRAINT [PK_VIETSACH] PRIMARY KEY CLUSTERED 
(
	[AuthorID] ASC,
	[BookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ADMIN] ON 

INSERT [dbo].[ADMIN] ([MaAdmin], [HoTen], [DiaChi], [DienThoai], [TenDN], [MatKhau], [NgaySinh], [Email], [Quyen]) VALUES (1, N'Nguyễn Thị Kim Quyên', N'TP HCM', N'0965326872', N'kimquyen', N'123', CAST(N'2003-12-27T00:00:00.000' AS DateTime), N'kimquyen@gmail.com', 1)
INSERT [dbo].[ADMIN] ([MaAdmin], [HoTen], [DiaChi], [DienThoai], [TenDN], [MatKhau], [NgaySinh], [Email], [Quyen]) VALUES (2, N'Phác Thái Anh ', N'TPHCM', N'078451239', N'thaianh', N'123', CAST(N'1997-02-11T00:00:00.000' AS DateTime), N'thaianh@gmail.com', 2)
SET IDENTITY_INSERT [dbo].[ADMIN] OFF
GO
SET IDENTITY_INSERT [dbo].[Author] ON 

INSERT [dbo].[Author] ([AuthorID], [AuthorName], [AuthorEmail], [AuthorAddress], [Tieusu]) VALUES (2, N'Phạm Công Anh', N'vinh@gmailc.om', N'197 Trần Hưng Đạo', NULL)
INSERT [dbo].[Author] ([AuthorID], [AuthorName], [AuthorEmail], [AuthorAddress], [Tieusu]) VALUES (3, N'Nguyễn Thế Giang', N'giangnt@gmail.com', N'179 Chánh hưng - F.4 - Q.8 Tp.HCM', NULL)
INSERT [dbo].[Author] ([AuthorID], [AuthorName], [AuthorEmail], [AuthorAddress], [Tieusu]) VALUES (4, N'Lê Việt Nhân', N'nhanvl@gmail.com', N'45 Lý Thái Tổ-F2.Q.3 Tp.HCM', NULL)
INSERT [dbo].[Author] ([AuthorID], [AuthorName], [AuthorEmail], [AuthorAddress], [Tieusu]) VALUES (5, N'Hồng Phúc', N'hong@gmail.com', N'46 Lý Thái Tổ-F2.Q.3 Tp.HCM', NULL)
INSERT [dbo].[Author] ([AuthorID], [AuthorName], [AuthorEmail], [AuthorAddress], [Tieusu]) VALUES (6, N'Ks.Phạm Quang Huy', N'huyq@gmail.com', N'47 Lý Thái Tổ-F2.Q.3 Tp.HCM', NULL)
INSERT [dbo].[Author] ([AuthorID], [AuthorName], [AuthorEmail], [AuthorAddress], [Tieusu]) VALUES (9, N'Quách Tuấn Ngọc', N'ngocqt@gmail.com', N'48 Lý Thái Tổ-F2.Q.3 Tp.HCM', NULL)
INSERT [dbo].[Author] ([AuthorID], [AuthorName], [AuthorEmail], [AuthorAddress], [Tieusu]) VALUES (10, N'Lê Văn Hùng', N'vanhung@gmailc.om', N'Hà Nội', NULL)
SET IDENTITY_INSERT [dbo].[Author] OFF
GO
SET IDENTITY_INSERT [dbo].[Book] ON 

INSERT [dbo].[Book] ([BookID], [Title], [AuthorID], [Price], [Images], [CategoryID], [Description], [Published], [ViewCount], [NhaXuatBanID]) VALUES (1, N'SGS x TF HEROES BACKPACK', 2, CAST(434000 AS Decimal(18, 0)), N'BACKPACKS 1.png', 2, N'<p>SGS x TF HEROES BACKPACK</p>

<p>Th&ocirc;ng tin sản phẩm&nbsp;</p>

<p>- Chất liệu vải ch&iacute;nh:&nbsp;Oxford cao cấp 100% Polyester - phủ PU chống thấm trượt nước (Được dệt chuy&ecirc;n biệt)</p>

<p>- Vải l&oacute;t:&nbsp;Oxford trượt nước</p>

<p>- K&iacute;ch thước: 40 x 28&nbsp;x 14 cm</p>

<p>- Ngăn chống sốc laptop 16&nbsp;inch</p>

<p>- Quai đeo đệm m&uacute;t chống nhức mỏi</p>

<p>- Logo th&ecirc;u tinh xảo</p>

<p>&nbsp;</p>

<p>Thiết kế bao gồm:</p>

<p>- Tổng số ngăn: 7&nbsp;ngăn</p>

<p>- B&ecirc;n ngo&agrave;i: 1&nbsp;ngăn k&eacute;o lớn&nbsp;, 2&nbsp;ngăn b&ecirc;n h&ocirc;ng&nbsp; ( c&oacute; d&acirc;y tăng giảm để cố định )</p>

<p>- B&ecirc;n trong: 1 ngăn ch&iacute;nh lớn, 1 ngăn chống sốc laptop, 1 ngăn lớn giữ b&agrave;n ph&iacute;m v&agrave; 1 ngăn phụ</p>

<p>- Thiết kế nắp cuộn th&ocirc;ng minh gi&uacute;p tăng diện t&iacute;ch ngăn chứa ( chiều cao 60 cm khi k&eacute;o nắp l&ecirc;n )</p>
', CAST(N'2023-11-23T00:00:00.000' AS DateTime), 3, 1)
INSERT [dbo].[Book] ([BookID], [Title], [AuthorID], [Price], [Images], [CategoryID], [Description], [Published], [ViewCount], [NhaXuatBanID]) VALUES (2, N'SGS TOP - COVERING BACKPACK', 2, CAST(442000 AS Decimal(18, 0)), N'BACKPACKS 2.png', 1, N'<p>SGS TOP - COVERING BACKPACK</p>

<p>Th&ocirc;ng tin sản phẩm - Chất liệu vải ch&iacute;nh: Oxford cao cấp 100% Polyester - phủ PU chống thấm trượt nước (Được dệt chuy&ecirc;n biệt) - Vải l&oacute;t: Oxford trượt nước - K&iacute;ch thước: 40 x 26 x 14 cm - Ngăn chống sốc laptop 15 inch</p>

<p>Thiết kế bao gồm:- Tổng số ngăn: 8 ngăn - B&ecirc;n ngo&agrave;i: 1 ngăn k&eacute;o nắp lớn ,1 ngăn kho&aacute; phụ v&agrave; 2 ngăn b&ecirc;n h&ocirc;ng - B&ecirc;n trong: 1 ngăn ch&iacute;nh lớn, 1 ngăn chống sốc laptop v&agrave; 1 ngăn phụ nhỏ</p>
', CAST(N'2023-11-23T00:00:00.000' AS DateTime), 24, 1)
INSERT [dbo].[Book] ([BookID], [Title], [AuthorID], [Price], [Images], [CategoryID], [Description], [Published], [ViewCount], [NhaXuatBanID]) VALUES (3, N'SGS WATER BOTTLE COVERING BAG', 3, CAST(152000 AS Decimal(18, 0)), N'BAG1.png', 10, N'<p>SGS WATER BOTTLE COVERING BAG</p>

<p>Th&ocirc;ng tin sản phẩm:<br />
- Chất liệu vải ch&iacute;nh: Oxford cao cấp 100% Polyester - phủ PU chống thấm trượt nước (Được dệt chuy&ecirc;n biệt)<br />
- Vải l&oacute;t :Oxford trượt nước<br />
- M&agrave;u sắc : Black, Tan, Sand, Mint<br />
- Kho&aacute; d&acirc;y r&uacute;t tiện lợi<br />
- T&iacute;nh năng:&nbsp;<br />
&nbsp;+ Chứa c&aacute;c vật dụng c&aacute; nh&acirc;n bao gồm : T&uacute;i, v&iacute;, điện thoại, b&igrave;nh đựng nước,&hellip;<br />
&nbsp;+ Ph&ugrave; hợp đi l&agrave;m, đi chơi + M&oacute;n phụ kiện khiến outfit tr&ocirc;ng bắt mắt hơn.<br />
Thiết kế bao gồm:<br />
- Tổng số ngăn: 2 ngăn<br />
- B&ecirc;n ngo&agrave;i: 1 ngăn ngo&agrave;i&nbsp;<br />
- B&ecirc;n trong: 1 ngăn ch&iacute;nh lớn<br />
- K&iacute;ch thước :&nbsp;20 x 12&nbsp;x 10cm<br />
CHẾ ĐỘ BẢO H&Agrave;NH SẢN PHẨM TRỌN ĐỜI (chi tiết xem tại tab &quot;Bảo H&agrave;nh&quot; ph&iacute;a dưới)<br />
Thiết kế v&agrave; sản xuất bởi SAIGONSWAGGER</p>
', CAST(N'2023-09-23T00:00:00.000' AS DateTime), 23, 2)
INSERT [dbo].[Book] ([BookID], [Title], [AuthorID], [Price], [Images], [CategoryID], [Description], [Published], [ViewCount], [NhaXuatBanID]) VALUES (4, N'SGS BLOCK BAG', 4, CAST(331500 AS Decimal(18, 0)), N'BAG2.png', 5, N'<p>SGS BLOCK BAG</p>

<p>Th&ocirc;ng tin sản phẩm:<br />
- Chất liệu vải ch&iacute;nh: Oxford cao cấp 100% Polyester - phủ PU chống thấm trượt nước (Được dệt chuy&ecirc;n biệt)<br />
- Vải l&oacute;t :Oxford trượt nước<br />
- K&iacute;ch thước :&nbsp; 15 x 23 x 7 cm<br />
- Logo hợp kim được cải tiến chống gỉ s&eacute;t&nbsp;<br />
- D&acirc;y k&eacute;o phao đặc t&iacute;nh chống nước tốt hơn d&acirc;y k&eacute;o th&ocirc;ng thường<br />
Thiết kế bao gồm:<br />
- Tổng số ngăn: 8 ngăn</p>

<p>-&nbsp;B&ecirc;n ngo&agrave;i : 1 t&uacute;i phụ ph&iacute;a trước, 2 ngăn b&ecirc;n h&ocirc;ng, 1 ngăn ẩn ph&iacute;a sau</p>

<p>- B&ecirc;n trong : 1 ngăn ch&iacute;nh lớn v&agrave; 1 ngăn kho&aacute; k&eacute;o, 2 ngăn phụ nhỏ<br />
CHẾ ĐỘ BẢO H&Agrave;NH SẢN PHẨM TRỌN ĐỜI (chi tiết xem tại tab &quot;Bảo H&agrave;nh&quot; ph&iacute;a dưới)<br />
Thiết kế v&agrave; sản xuất bởi SAIGONSWAGGER</p>
', CAST(N'2023-09-22T00:00:00.000' AS DateTime), 25, 2)
INSERT [dbo].[Book] ([BookID], [Title], [AuthorID], [Price], [Images], [CategoryID], [Description], [Published], [ViewCount], [NhaXuatBanID]) VALUES (5, N'SGS BELT BUMBAG', 2, CAST(240000 AS Decimal(18, 0)), N'BUMBAG1.png', 10, N'<p>SGS BELT BUMBAG</p>

<p>Th&ocirc;ng tin sản phẩm:<br />
- Chất liệu vải ch&iacute;nh: Oxford cao cấp 100% Polyester - phủ PU chống thấm trượt nước (Được dệt chuy&ecirc;n biệt)<br />
- Vải l&oacute;t :Oxford trượt nước<br />
- K&iacute;ch thước: 25 x 16 x 9cm<br />
Thiết kế bao gồm:<br />
- Tổng số ngăn: 4 ngăn<br />
- B&ecirc;n ngo&agrave;i : 1 ngăn k&eacute;o ph&iacute;a trước, 1 ngăn k&eacute;o ẩn ph&iacute;a sau<br />
- B&ecirc;n trong : 1 ngăn ch&iacute;nh lớn, 1 ngăn phụ nhỏ c&oacute; d&acirc;y k&eacute;o<br />
<br />
<em>CHẾ ĐỘ BẢO H&Agrave;NH SẢN PHẨM TRỌN ĐỜI (chi tiết xem tại tab &quot;Bảo H&agrave;nh&quot; ph&iacute;a dưới)</em><br />
<strong>Thiết kế v&agrave; sản xuất bởi SAIGONSWAGGER</strong></p>
', CAST(N'2023-09-21T00:00:00.000' AS DateTime), 16, 3)
INSERT [dbo].[Book] ([BookID], [Title], [AuthorID], [Price], [Images], [CategoryID], [Description], [Published], [ViewCount], [NhaXuatBanID]) VALUES (6, N'SGS FLEXIBLE BUMBAG', 4, CAST(216000 AS Decimal(18, 0)), N'BUMBAG2.png', 2, N'<p>SGS FLEXIBLE BUMBAG</p>

<p>Th&ocirc;ng tin sản phẩm:<br />
- Chất liệu vải ch&iacute;nh: Oxford cao cấp 100% Polyester - phủ PU chống thấm trượt nước (Được dệt chuy&ecirc;n biệt)<br />
- Vải l&oacute;t : Oxford trượt nước<br />
- K&iacute;ch thước: 24 x 15 x 8cm<br />
<br />
Thiết kế bao gồm:<br />
- Tổng số ngăn: 7 ngăn<br />
- B&ecirc;n trong : 1 ngăn ch&iacute;nh lớn v&agrave; 1 ngăn phụ nhỏ<br />
- B&ecirc;n ngo&agrave;i : 3 t&uacute;i phụ ph&iacute;a trước + 2 t&uacute;i lưới b&ecirc;n h&ocirc;ng<br />
<br />
<em>CHẾ ĐỘ BẢO H&Agrave;NH SẢN PHẨM TRỌN ĐỜI (chi tiết xem tại tab &quot;Bảo H&agrave;nh&quot; ph&iacute;a dưới)</em><br />
<strong>Thiết kế v&agrave; sản xuất bởi SAIGONSWAGGER</strong></p>
', CAST(N'2023-09-20T00:00:00.000' AS DateTime), 64, 3)
INSERT [dbo].[Book] ([BookID], [Title], [AuthorID], [Price], [Images], [CategoryID], [Description], [Published], [ViewCount], [NhaXuatBanID]) VALUES (7, N'SGS NOIR PUFFER TOTE BAG', 10, CAST(472000 AS Decimal(18, 0)), N'TOTEBAG1.png', 6, N'<p>SGS NOIR PUFFER TOTE BAG</p>

<p>Th&ocirc;ng tin sản phẩm:</p>

<p>- Chất liệu vải ch&iacute;nh: Nylon Cao Cấp&nbsp;</p>

<p>- Kỹ thuật may : chần b&ocirc;ng sợi cotton đạt ti&ecirc;u chuẩn cao<br />
- Vải l&oacute;t: Oxford trượt nước, chống thấm<br />
- K&iacute;ch thước: 35 x32x10cm<br />
- Logo inox chống gỉ - khắc laser<br />
- D&acirc;y k&eacute;o phao đặc t&iacute;nh chống nước tốt hơn d&acirc;y k&eacute;o th&ocirc;ng thường<br />
- Thể t&iacute;ch chứa vừa laptop 15 inchThiết kế gồm:<br />
- Tổng số ngăn: 4 ngăn<br />
- B&ecirc;n trong: 1 ngăn ch&iacute;nh lớn v&agrave; 3 ngăn nhỏ<br />
- Quai đeo : chần b&ocirc;ng &ecirc;m &aacute;i v&agrave; tốt cho vai<br />
<em>CHẾ ĐỘ BẢO H&Agrave;NH SẢN PHẨM TRỌN ĐỜI (chi tiết xem tại tab &quot;Bảo H&agrave;nh&quot; ph&iacute;a dưới)</em><br />
<strong>Thiết kế v&agrave; sản xuất bởi SAIGONSWAGGER</strong></p>
', CAST(N'2023-10-23T00:00:00.000' AS DateTime), 12, 4)
INSERT [dbo].[Book] ([BookID], [Title], [AuthorID], [Price], [Images], [CategoryID], [Description], [Published], [ViewCount], [NhaXuatBanID]) VALUES (9, N'SGS MAGICAL COVERING TOTE BAG', 2, CAST(331500 AS Decimal(18, 0)), N'TOTEBAG2.png', 4, N'<p>SGS MAGICAL COVERING TOTE BAG</p>

<p>Th&ocirc;ng tin sản phẩm:<br />
- Chất liệu vải ch&iacute;nh: Oxford cao cấp 100% Polyester - phủ PU chống thấm trượt nước (Được dệt chuy&ecirc;n biệt)<br />
- Vải l&oacute;t :Oxford trượt nước<br />
- M&agrave;u sắc : Black, Tan<br />
- K&iacute;ch thước : 40 x 30 x 12 cm</p>

<p>- Ngăn chống sốc laptop 15.6 inch<br />
<br />
<br />
Thiết kế bao gồm:<br />
- Tổng số ngăn: 10 ngăn<br />
-&nbsp;B&ecirc;n ngo&agrave;i :&nbsp;2 ngăn b&ecirc;n h&ocirc;ng, 1 ngăn ẩn ph&iacute;a trước, 1 ngăn đằng sau<br />
- B&ecirc;n trong : 1 ngăn ch&iacute;nh lớn v&agrave; 1 ngăn đựng laptop, 2 ngăn phụ nhỏ, 1 ngăn nhỏ b&ecirc;n h&ocirc;ng v&agrave; 1 ngăn đựng b&igrave;nh nước</p>

<p>CHẾ ĐỘ BẢO H&Agrave;NH SẢN PHẨM TRỌN ĐỜI (chi tiết xem tại tab &quot;Bảo H&agrave;nh&quot; ph&iacute;a dưới)<br />
Thiết kế v&agrave; sản xuất bởi SAIGONSWAGGER</p>
', CAST(N'2023-10-23T00:00:00.000' AS DateTime), 0, 4)
INSERT [dbo].[Book] ([BookID], [Title], [AuthorID], [Price], [Images], [CategoryID], [Description], [Published], [ViewCount], [NhaXuatBanID]) VALUES (10, N'SGS JOURNAL FOLD WALLET', 2, CAST(266000 AS Decimal(18, 0)), N'WALLET1.png', 9, N'<p>SGS JOURNAL FOLD WALLET</p>

<p>Th&ocirc;ng tin sản phẩm:<br />
- Chất liệu vải ch&iacute;nh: Oxford cao cấp 100% Polyester - phủ PU chống thấm trượt nước (Được dệt chuy&ecirc;n biệt)<br />
- Vải l&oacute;t :Oxford trượt nước<br />
- K&iacute;ch thước : 11.5 x 16.5cm<br />
&nbsp;Thiết kế bao gồm:<br />
- B&ecirc;n trong gồm: 1 ngăn ch&iacute;nh đựng tiền c&oacute; kh&oacute;a zip , 5 ngăn thẻ, 1 ngăn phụ nhỏ<br />
<br />
<em>CHẾ ĐỘ BẢO H&Agrave;NH SẢN PHẨM TRỌN ĐỜI (chi tiết xem tại tab &quot;Bảo H&agrave;nh&quot; ph&iacute;a dưới)</em><br />
<strong>Thiết kế v&agrave; sản xuất bởi SAIGONSWAGGER</strong></p>
', CAST(N'2023-10-23T00:00:00.000' AS DateTime), 20, 5)
INSERT [dbo].[Book] ([BookID], [Title], [AuthorID], [Price], [Images], [CategoryID], [Description], [Published], [ViewCount], [NhaXuatBanID]) VALUES (11, N'SGS SHORT WALLET', 2, CAST(224000 AS Decimal(18, 0)), N'WALLET2.png', 7, N'<p>SGS SHORT WALLET</p>

<p>Th&ocirc;ng tin sản phẩm:<br />
- Chất liệu vải ch&iacute;nh: Oxford cao cấp 100% Polyester - phủ PU chống thấm trượt nước (Được dệt chuy&ecirc;n biệt)<br />
- Vải l&oacute;t :Oxford trượt nước<br />
- Kích thước: 11x13cm<br />
Thiết kế bao gồm :<br />
- Tổng số ngăn: 8 ngăn<br />
- B&ecirc;n trong gồm 1 ngăn k&eacute;o lớn - 6 ngăn đựng thẻ, ID card...<br />
- Ph&iacute;a sau c&oacute; 1 ngăn k&eacute;o<br />
<br />
<em>CHẾ ĐỘ BẢO H&Agrave;NH SẢN PHẨM TRỌN ĐỜI (chi tiết xem tại tab &quot;Bảo H&agrave;nh&quot; ph&iacute;a dưới)</em><br />
<strong>Thiết kế v&agrave; sản xuất bởi SAIGONSWAGGER</strong></p>
', CAST(N'2023-10-23T00:00:00.000' AS DateTime), 26, 5)
INSERT [dbo].[Book] ([BookID], [Title], [AuthorID], [Price], [Images], [CategoryID], [Description], [Published], [ViewCount], [NhaXuatBanID]) VALUES (12, N'SGS SQUARE PENCIL CASE', 2, CAST(69300 AS Decimal(18, 0)), N'ACCESSORIES1.png', 8, N'<p>SGS SQUARE PENCIL CASE</p>

<p>Th&ocirc;ng tin sản phẩm:<br />
- Chất liệu vải ch&iacute;nh: chất lưới vi t&iacute;nh - nhựa PVC kh&aacute;ng nước - Oxford cao cấp 100% Polyester - phủ PU chống thấm trượt nước<br />
- K&iacute;ch thước: 22 x 6cm<br />
- Đựng vừa m&aacute;y t&iacute;nh Casio cầm tay v&agrave; một số vật dụng kh&aacute;c như: b&uacute;t viết thước, mỹ phẩm,...<br />
Thiết kế bao gồm:<br />
- B&ecirc;n trong: 1 ngăn ch&iacute;nh<br />
<br />
<em>CHẾ ĐỘ BẢO H&Agrave;NH SẢN PHẨM TRỌN ĐỜI (chi tiết xem tại tab &quot;Bảo H&agrave;nh&quot; ph&iacute;a dưới)</em><br />
<strong>Thiết kế v&agrave; sản xuất bởi SAIGONSWAGGER</strong></p>
', CAST(N'2023-10-23T00:00:00.000' AS DateTime), 50, 6)
INSERT [dbo].[Book] ([BookID], [Title], [AuthorID], [Price], [Images], [CategoryID], [Description], [Published], [ViewCount], [NhaXuatBanID]) VALUES (13, N'SGS JOURNAL CARD KEYCHAIN', 2, CAST(90000 AS Decimal(18, 0)), N'ACCESSORIES2.png', 3, N'<p>SGS JOURNAL CARD KEYCHAIN</p>

<p>Th&ocirc;ng tin sản phẩm:<br />
- Chất liệu vải ch&iacute;nh: Oxford cao cấp 100% Polyester - phủ PU chống thấm trượt nước (Được dệt chuy&ecirc;n biệt)<br />
- Vải l&oacute;t :Oxford trượt nước<br />
- K&iacute;ch thước : 10 x 7cm<br />
Thiết kế bao gồm:<br />
- B&ecirc;n trong gồm: 1 ngăn đựng thẻ<br />
<br />
<em>CHẾ ĐỘ BẢO H&Agrave;NH SẢN PHẨM TRỌN ĐỜI (chi tiết xem tại tab &quot;Bảo H&agrave;nh&quot; ph&iacute;a dưới)</em><br />
<strong>Thiết kế v&agrave; sản xuất bởi SAIGONSWAGGER</strong></p>
', CAST(N'2023-10-23T00:00:00.000' AS DateTime), 100, 6)
INSERT [dbo].[Book] ([BookID], [Title], [AuthorID], [Price], [Images], [CategoryID], [Description], [Published], [ViewCount], [NhaXuatBanID]) VALUES (16, N'SGS ANTHEM SHORT ZIP WALLET', NULL, CAST(225000 AS Decimal(18, 0)), N'WALLET3.png', 1, N'<p><strong>SGS ANTHEM SHORT ZIP WALLET</strong><br />
<br />
Th&ocirc;ng tin sản phẩm:<br />
- Chất liệu ch&iacute;nh: Chất liệu da PU cao cấp<br />
- K&iacute;ch thước: 10 x 14 x 3cm<br />
<br />
Thiết kế bao gồm :<br />
- B&ecirc;n trong: 7 ngăn đựng thẻ v&agrave; 6 ngăn lớn c&oacute; thể đựng cash- ID card...<br />
<br />
<em>CHẾ ĐỘ BẢO H&Agrave;NH SẢN PHẨM TRỌN ĐỜI (chi tiết xem tại tab &quot;Bảo H&agrave;nh&quot; ph&iacute;a dưới)</em><br />
<strong>Thiết kế v&agrave; sản xuất bởi SAIGONSWAGGER</strong></p>
', CAST(N'2023-11-24T00:00:00.000' AS DateTime), 20, 5)
INSERT [dbo].[Book] ([BookID], [Title], [AuthorID], [Price], [Images], [CategoryID], [Description], [Published], [ViewCount], [NhaXuatBanID]) VALUES (17, N'SGS ECLIPSE BI-FOLD WALLET', NULL, CAST(315000 AS Decimal(18, 0)), N'WALLET4.png', 9, N'<p><strong>SGS ECLIPSE BI-FOLD WALLET</strong><br />
<br />
Th&ocirc;ng tin sản phẩm:<br />
- Tổng số ngăn: 11 ngăn ch&iacute;nh phụ<br />
- Chất liệu ch&iacute;nh: da thật cao cấp<br />
- Logo inox chống gỉ - khắc laser<br />
- K&iacute;ch thước : 24.5 x 9.5 cm<br />
<br />
Thiết kế gồm:<br />
- B&ecirc;n trong: 1 ngăn ch&iacute;nh đựng tiền, 8&nbsp;ngăn thẻ, 2&nbsp;ngăn phụ trong<br />
<br />
<em>CHẾ ĐỘ BẢO H&Agrave;NH SẢN PHẨM TRỌN ĐỜI (chi tiết xem tại tab &quot;Bảo H&agrave;nh&quot; ph&iacute;a dưới)</em><br />
<strong>Thiết kế v&agrave; sản xuất bởi SAIGONSWAGGER</strong></p>
', CAST(N'2023-11-24T00:00:00.000' AS DateTime), 29, 5)
INSERT [dbo].[Book] ([BookID], [Title], [AuthorID], [Price], [Images], [CategoryID], [Description], [Published], [ViewCount], [NhaXuatBanID]) VALUES (18, N'SGS JOURNAL BI-FOLD WALLET', NULL, CAST(175000 AS Decimal(18, 0)), N'WALLET5.png', 2, N'<p><strong>SGS JOURNAL BI-FOLD WALLET</strong><br />
Th&ocirc;ng tin sản phẩm:<br />
- Chất liệu vải ch&iacute;nh: Oxford cao cấp 100% Polyester - phủ PU chống thấm trượt nước (Được dệt chuy&ecirc;n biệt)<br />
- Vải l&oacute;t :Oxford trượt nước<br />
- K&iacute;ch thước : 24.5 x 9.5cm<br />
<br />
Thiết kế bao gồm:<br />
- B&ecirc;n trong: 1 ngăn ch&iacute;nh đựng tiền, 8 ngăn thẻ, 2 ngăn phụ trong<br />
<br />
<em>CHẾ ĐỘ BẢO H&Agrave;NH SẢN PHẨM TRỌN ĐỜI (chi tiết xem tại tab &quot;Bảo H&agrave;nh&quot; ph&iacute;a dưới)</em><br />
<strong>Thiết kế v&agrave; sản xuất bởi SAIGONSWAGGER</strong></p>
', CAST(N'2023-11-24T00:00:00.000' AS DateTime), 17, 5)
INSERT [dbo].[Book] ([BookID], [Title], [AuthorID], [Price], [Images], [CategoryID], [Description], [Published], [ViewCount], [NhaXuatBanID]) VALUES (19, N'SGS MULTI POCKET BUMBAG', NULL, CAST(210000 AS Decimal(18, 0)), N'SGS MULTI POCKET BUMBAG.png', 8, N'<p>SGS MULTI POCKET BUMBAG</p>

<p>Th&ocirc;ng tin sản phẩm:<br />
- Chất liệu vải ch&iacute;nh: Oxford cao cấp 100% Polyester - phủ PU chống thấm trượt nước (Được dệt chuy&ecirc;n biệt)<br />
- Vải l&oacute;t :Oxford trượt nước<br />
- K&iacute;ch thước: 30 x 13&nbsp;x 5 (cm)<br />
<br />
Thiết kế bao gồm:<br />
- Tổng số ngăn: 5&nbsp;ngăn<br />
- B&ecirc;n ngo&agrave;i : 2&nbsp;ngăn ph&iacute;a trước, 1 ngăn k&eacute;o ẩn ph&iacute;a sau<br />
- B&ecirc;n trong : 1 ngăn ch&iacute;nh lớn, 1 ngăn phụ nhỏ c&oacute; d&acirc;y k&eacute;o<br />
<br />
<em>CHẾ ĐỘ BẢO H&Agrave;NH SẢN PHẨM TRỌN ĐỜI (chi tiết xem tại tab &quot;Bảo H&agrave;nh&quot; ph&iacute;a dưới)</em><br />
<strong>Thiết kế v&agrave; sản xuất bởi SAIGONSWAGGER</strong></p>
', CAST(N'2023-11-26T00:00:00.000' AS DateTime), 20, 3)
INSERT [dbo].[Book] ([BookID], [Title], [AuthorID], [Price], [Images], [CategoryID], [Description], [Published], [ViewCount], [NhaXuatBanID]) VALUES (20, N'SGS FLAPPED BACKPACK', NULL, CAST(400000 AS Decimal(18, 0)), N'SGS FLAPPED BACKPACK.png', 3, N'<p><strong>SGS FLAPPED BACKPACK</strong><br />
<br />
Th&ocirc;ng tin sản phẩm:<br />
- Chất liệu vải ch&iacute;nh: Oxford cao cấp 100% Polyester - phủ PU chống thấm trượt nước (Được dệt chuy&ecirc;n biệt)<br />
- Vải l&oacute;t :Oxford trượt nước<br />
- K&iacute;ch thước : 41 x 28 x 14cm<br />
- Ngăn chống sốc laptop 15 inch<br />
<br />
Thiết kế bao gồm:<br />
- Tổng số ngăn: 6 ngăn<br />
- B&ecirc;n ngo&agrave;i : 1 ngăn phụ ph&iacute;a trước, 2 ngăn b&ecirc;n h&ocirc;ng<br />
- B&ecirc;n trong : 1 ngăn ch&iacute;nh lớn, 1 ngăn chống sốc laptop v&agrave; 1 ngăn phụ nhỏ<br />
- Quai đeo đệm m&uacute;t với chức năng chống nhức mỏi khi đeo<br />
<br />
<em>CHẾ ĐỘ BẢO H&Agrave;NH SẢN PHẨM TRỌN ĐỜI (chi tiết xem tại tab &quot;Bảo H&agrave;nh&quot; ph&iacute;a dưới)</em><br />
<strong>Thiết kế v&agrave; sản xuất bởi SAIGONSWAGGER</strong></p>
', CAST(N'2023-11-26T00:00:00.000' AS DateTime), 30, 1)
INSERT [dbo].[Book] ([BookID], [Title], [AuthorID], [Price], [Images], [CategoryID], [Description], [Published], [ViewCount], [NhaXuatBanID]) VALUES (21, N'SGS VERSATILE CHECKED BACKPACK', NULL, CAST(520000 AS Decimal(18, 0)), N'SGS VERSATILE CHECKED BACKPACK.png', 8, N'<p><strong>SGS VERSATILE CHECKED BACKPACK</strong><br />
&nbsp;</p>

<p>Th&ocirc;ng tin sản phẩm:<br />
- Chất liệu vải ch&iacute;nh: Oxford cao cấp 100% Polyester - phủ PU chống thấm trượt nước (Được dệt chuy&ecirc;n biệt)<br />
- Vải l&oacute;t :Oxford trượt nước<br />
- Logo SAIGONSWAGGER th&ecirc;u nổi sắc n&eacute;t<br />
- Vải l&oacute;t trượt nước<br />
- K&iacute;ch thước: 45x30x15 cm<br />
- Ngăn chống sốc laptop 16 inch<br />
<br />
Thiết kế bao gồm:<br />
- Tổng số ngăn: 6 ngăn<br />
- B&ecirc;n ngo&agrave;i : 1 t&uacute;i k&eacute;o ph&iacute;a trước, 2 t&uacute;i b&ecirc;n h&ocirc;ng<br />
- B&ecirc;n trong: 1 ngăn ch&iacute;nh, 1 ngăn chống sốc laptop v&agrave; 1 ngăn phụ nhỏ<br />
- Quai đeo thiết kế với đệm m&uacute;t chống nhức mỏi<br />
<br />
<em>CHẾ ĐỘ BẢO H&Agrave;NH SẢN PHẨM TRỌN ĐỜI (chi tiết xem tại tab &quot;Bảo H&agrave;nh&quot; ph&iacute;a dưới)</em><br />
<strong>Thiết kế v&agrave; sản xuất bởi SAIGONSWAGGER</strong></p>
', CAST(N'2023-11-26T00:00:00.000' AS DateTime), 15, 1)
INSERT [dbo].[Book] ([BookID], [Title], [AuthorID], [Price], [Images], [CategoryID], [Description], [Published], [ViewCount], [NhaXuatBanID]) VALUES (22, N'SGS LOOP BAG', NULL, CAST(312000 AS Decimal(18, 0)), N'SGS LOOP BAG.png', 10, N'<p><strong>SGS LOOP BAG</strong><br />
<br />
Th&ocirc;ng tin sản phẩm:<br />
- Chất liệu vải ch&iacute;nh: Oxford cao cấp 100% Polyester - phủ PU chống thấm trượt nước (Được dệt chuy&ecirc;n biệt)<br />
- Vải l&oacute;t :Oxford trượt nước<br />
- C&oacute; thể đeo ch&eacute;o 3 mặt : trước ngực, sau lưng, b&ecirc;n h&ocirc;ng<br />
- K&iacute;ch thước: 29 x 22 x 14 cm<br />
<br />
Thiết kế bao gồm:<br />
- Tổng số ngăn: 4 ngăn<br />
- B&ecirc;n ngo&agrave;i : 2 ngăn phụ ph&iacute;a trước, 1 ngăn k&eacute;o ẩn ph&iacute;a sau<br />
- B&ecirc;n trong : 1 ngăn ch&iacute;nh lớn, 1 ngăn phụ nhỏ c&oacute; d&acirc;y k&eacute;o<br />
<br />
<br />
<em>CHẾ ĐỘ BẢO H&Agrave;NH SẢN PHẨM TRỌN ĐỜI (chi tiết xem tại tab &quot;Bảo H&agrave;nh&quot; ph&iacute;a dưới)</em><br />
<strong>Thiết kế v&agrave; sản xuất bởi SAIGONSWAGGER</strong></p>
', CAST(N'2023-11-26T00:00:00.000' AS DateTime), 22, 2)
SET IDENTITY_INSERT [dbo].[Book] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (1, N'SGS COVERING COLLECTION')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (2, N'SGS X TF HEROES BAG')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (3, N'WANDERLUST COLLECTION')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (4, N'SOFT NATURAL COLLECTION')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (5, N'BLOCK COLLECTION')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (6, N'NOIR PUFFER COLLECTION')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (7, N'TOP BEST SELLER')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (8, N'VERSATILE COLLECTION')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (9, N'AVAIL COLLECTION')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (10, N'SGS X CLOWNZ COLLABORATION')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
INSERT [dbo].[CHITIETDATHANG] ([MaDonHang], [BookID], [Soluong], [Dongia]) VALUES (1, 1, 1, CAST(26000.00 AS Decimal(9, 2)))
INSERT [dbo].[CHITIETDATHANG] ([MaDonHang], [BookID], [Soluong], [Dongia]) VALUES (1, 3, 2, CAST(11500.00 AS Decimal(9, 2)))
INSERT [dbo].[CHITIETDATHANG] ([MaDonHang], [BookID], [Soluong], [Dongia]) VALUES (2, 2, 1, CAST(12000.00 AS Decimal(9, 2)))
INSERT [dbo].[CHITIETDATHANG] ([MaDonHang], [BookID], [Soluong], [Dongia]) VALUES (1002, 2, 2, CAST(12000.00 AS Decimal(9, 2)))
INSERT [dbo].[CHITIETDATHANG] ([MaDonHang], [BookID], [Soluong], [Dongia]) VALUES (1003, 9, 1, CAST(165050.00 AS Decimal(9, 2)))
INSERT [dbo].[CHITIETDATHANG] ([MaDonHang], [BookID], [Soluong], [Dongia]) VALUES (1004, 9, 1, CAST(165050.00 AS Decimal(9, 2)))
INSERT [dbo].[CHITIETDATHANG] ([MaDonHang], [BookID], [Soluong], [Dongia]) VALUES (1005, 3, 1, CAST(11500.00 AS Decimal(9, 2)))
INSERT [dbo].[CHITIETDATHANG] ([MaDonHang], [BookID], [Soluong], [Dongia]) VALUES (1007, 9, 1, CAST(165050.00 AS Decimal(9, 2)))
INSERT [dbo].[CHITIETDATHANG] ([MaDonHang], [BookID], [Soluong], [Dongia]) VALUES (1007, 11, 1, CAST(100300.00 AS Decimal(9, 2)))
INSERT [dbo].[CHITIETDATHANG] ([MaDonHang], [BookID], [Soluong], [Dongia]) VALUES (1008, 9, 1, CAST(165050.00 AS Decimal(9, 2)))
INSERT [dbo].[CHITIETDATHANG] ([MaDonHang], [BookID], [Soluong], [Dongia]) VALUES (1009, 1, 1, CAST(434000.00 AS Decimal(9, 2)))
INSERT [dbo].[CHITIETDATHANG] ([MaDonHang], [BookID], [Soluong], [Dongia]) VALUES (1010, 9, 1, CAST(331500.00 AS Decimal(9, 2)))
INSERT [dbo].[CHITIETDATHANG] ([MaDonHang], [BookID], [Soluong], [Dongia]) VALUES (1011, 17, 1, CAST(315000.00 AS Decimal(9, 2)))
INSERT [dbo].[CHITIETDATHANG] ([MaDonHang], [BookID], [Soluong], [Dongia]) VALUES (1012, 18, 1, CAST(175000.00 AS Decimal(9, 2)))
INSERT [dbo].[CHITIETDATHANG] ([MaDonHang], [BookID], [Soluong], [Dongia]) VALUES (1013, 18, 1, CAST(175000.00 AS Decimal(9, 2)))
INSERT [dbo].[CHITIETDATHANG] ([MaDonHang], [BookID], [Soluong], [Dongia]) VALUES (1014, 1, 1, CAST(434000.00 AS Decimal(9, 2)))
INSERT [dbo].[CHITIETDATHANG] ([MaDonHang], [BookID], [Soluong], [Dongia]) VALUES (1015, 1, 1, CAST(434000.00 AS Decimal(9, 2)))
INSERT [dbo].[CHITIETDATHANG] ([MaDonHang], [BookID], [Soluong], [Dongia]) VALUES (1016, 1, 1, CAST(434000.00 AS Decimal(9, 2)))
INSERT [dbo].[CHITIETDATHANG] ([MaDonHang], [BookID], [Soluong], [Dongia]) VALUES (1017, 2, 1, CAST(442000.00 AS Decimal(9, 2)))
INSERT [dbo].[CHITIETDATHANG] ([MaDonHang], [BookID], [Soluong], [Dongia]) VALUES (1018, 9, 1, CAST(331500.00 AS Decimal(9, 2)))
INSERT [dbo].[CHITIETDATHANG] ([MaDonHang], [BookID], [Soluong], [Dongia]) VALUES (1019, 9, 1, CAST(331500.00 AS Decimal(9, 2)))
INSERT [dbo].[CHITIETDATHANG] ([MaDonHang], [BookID], [Soluong], [Dongia]) VALUES (1020, 18, 1, CAST(175000.00 AS Decimal(9, 2)))
INSERT [dbo].[CHITIETDATHANG] ([MaDonHang], [BookID], [Soluong], [Dongia]) VALUES (1021, 6, 1, CAST(216000.00 AS Decimal(9, 2)))
INSERT [dbo].[CHITIETDATHANG] ([MaDonHang], [BookID], [Soluong], [Dongia]) VALUES (1022, 17, 1, CAST(315000.00 AS Decimal(9, 2)))
GO
SET IDENTITY_INSERT [dbo].[DONDATHANG] ON 

INSERT [dbo].[DONDATHANG] ([MaDonHang], [Dathanhtoan], [Tinhtranggiaohang], [Ngaydat], [Ngaygiao], [MaKH]) VALUES (1, 1, 0, CAST(N'2023-10-17T14:37:00' AS SmallDateTime), CAST(N'2023-10-19T00:00:00' AS SmallDateTime), 1002)
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Dathanhtoan], [Tinhtranggiaohang], [Ngaydat], [Ngaygiao], [MaKH]) VALUES (2, 0, 0, CAST(N'2023-10-17T16:06:00' AS SmallDateTime), CAST(N'2023-10-26T00:00:00' AS SmallDateTime), 1002)
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Dathanhtoan], [Tinhtranggiaohang], [Ngaydat], [Ngaygiao], [MaKH]) VALUES (1002, 0, 1, CAST(N'2023-10-31T20:22:00' AS SmallDateTime), CAST(N'2023-11-02T00:00:00' AS SmallDateTime), 1002)
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Dathanhtoan], [Tinhtranggiaohang], [Ngaydat], [Ngaygiao], [MaKH]) VALUES (1003, 0, 1, CAST(N'2023-11-04T00:16:00' AS SmallDateTime), CAST(N'2023-11-21T00:00:00' AS SmallDateTime), 1002)
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Dathanhtoan], [Tinhtranggiaohang], [Ngaydat], [Ngaygiao], [MaKH]) VALUES (1004, 0, 1, CAST(N'2023-11-06T13:38:00' AS SmallDateTime), CAST(N'2023-11-10T00:00:00' AS SmallDateTime), 1002)
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Dathanhtoan], [Tinhtranggiaohang], [Ngaydat], [Ngaygiao], [MaKH]) VALUES (1005, 1, 1, CAST(N'2023-11-13T21:22:00' AS SmallDateTime), CAST(N'2023-11-14T00:00:00' AS SmallDateTime), 1002)
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Dathanhtoan], [Tinhtranggiaohang], [Ngaydat], [Ngaygiao], [MaKH]) VALUES (1007, 0, 1, CAST(N'2023-11-23T13:03:00' AS SmallDateTime), CAST(N'2023-11-25T00:00:00' AS SmallDateTime), 1002)
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Dathanhtoan], [Tinhtranggiaohang], [Ngaydat], [Ngaygiao], [MaKH]) VALUES (1008, 0, 1, CAST(N'2023-11-23T13:05:00' AS SmallDateTime), CAST(N'2023-11-26T00:00:00' AS SmallDateTime), 1002)
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Dathanhtoan], [Tinhtranggiaohang], [Ngaydat], [Ngaygiao], [MaKH]) VALUES (1009, 0, 1, CAST(N'2023-11-24T08:11:00' AS SmallDateTime), CAST(N'2023-11-26T00:00:00' AS SmallDateTime), 1002)
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Dathanhtoan], [Tinhtranggiaohang], [Ngaydat], [Ngaygiao], [MaKH]) VALUES (1010, 0, 1, CAST(N'2023-11-24T10:27:00' AS SmallDateTime), CAST(N'2023-11-28T00:00:00' AS SmallDateTime), 1002)
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Dathanhtoan], [Tinhtranggiaohang], [Ngaydat], [Ngaygiao], [MaKH]) VALUES (1011, 0, 1, CAST(N'2023-11-24T13:59:00' AS SmallDateTime), CAST(N'2023-11-28T00:00:00' AS SmallDateTime), 1002)
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Dathanhtoan], [Tinhtranggiaohang], [Ngaydat], [Ngaygiao], [MaKH]) VALUES (1012, 0, 1, CAST(N'2023-11-25T10:32:00' AS SmallDateTime), CAST(N'2023-11-24T00:00:00' AS SmallDateTime), 1007)
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Dathanhtoan], [Tinhtranggiaohang], [Ngaydat], [Ngaygiao], [MaKH]) VALUES (1013, 0, 1, CAST(N'2023-11-25T12:11:00' AS SmallDateTime), CAST(N'2023-11-27T00:00:00' AS SmallDateTime), 1002)
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Dathanhtoan], [Tinhtranggiaohang], [Ngaydat], [Ngaygiao], [MaKH]) VALUES (1014, 0, 1, CAST(N'2023-11-25T14:39:00' AS SmallDateTime), CAST(N'2023-11-26T00:00:00' AS SmallDateTime), 1002)
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Dathanhtoan], [Tinhtranggiaohang], [Ngaydat], [Ngaygiao], [MaKH]) VALUES (1015, 0, 1, CAST(N'2023-11-25T14:41:00' AS SmallDateTime), CAST(N'2023-11-29T00:00:00' AS SmallDateTime), 1007)
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Dathanhtoan], [Tinhtranggiaohang], [Ngaydat], [Ngaygiao], [MaKH]) VALUES (1016, 0, 1, CAST(N'2023-11-25T14:44:00' AS SmallDateTime), CAST(N'2023-11-30T00:00:00' AS SmallDateTime), 1007)
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Dathanhtoan], [Tinhtranggiaohang], [Ngaydat], [Ngaygiao], [MaKH]) VALUES (1017, 0, 1, CAST(N'2023-11-25T14:45:00' AS SmallDateTime), CAST(N'2023-11-30T00:00:00' AS SmallDateTime), 1007)
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Dathanhtoan], [Tinhtranggiaohang], [Ngaydat], [Ngaygiao], [MaKH]) VALUES (1018, 0, 1, CAST(N'2023-11-25T14:53:00' AS SmallDateTime), CAST(N'2023-11-30T00:00:00' AS SmallDateTime), 1002)
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Dathanhtoan], [Tinhtranggiaohang], [Ngaydat], [Ngaygiao], [MaKH]) VALUES (1019, 0, 1, CAST(N'2023-11-25T15:18:00' AS SmallDateTime), CAST(N'2023-11-28T00:00:00' AS SmallDateTime), 1002)
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Dathanhtoan], [Tinhtranggiaohang], [Ngaydat], [Ngaygiao], [MaKH]) VALUES (1020, 0, 1, CAST(N'2023-11-25T15:39:00' AS SmallDateTime), CAST(N'2023-11-29T00:00:00' AS SmallDateTime), 1002)
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Dathanhtoan], [Tinhtranggiaohang], [Ngaydat], [Ngaygiao], [MaKH]) VALUES (1021, 0, 1, CAST(N'2023-11-26T11:03:00' AS SmallDateTime), CAST(N'2023-11-28T00:00:00' AS SmallDateTime), 1002)
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Dathanhtoan], [Tinhtranggiaohang], [Ngaydat], [Ngaygiao], [MaKH]) VALUES (1022, 1, 0, CAST(N'2023-11-26T12:12:00' AS SmallDateTime), CAST(N'2023-11-29T00:00:00' AS SmallDateTime), 1016)
SET IDENTITY_INSERT [dbo].[DONDATHANG] OFF
GO
SET IDENTITY_INSERT [dbo].[KHACHHANG] ON 

INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [Taikhoan], [Matkhau], [Email], [DiachiKH], [DienThoaiKH], [Ngaysinh]) VALUES (3, N'Thái Gia Hân', N'Giahan', N'123', N'Thaigiahan2120@gmail.com', N'xã Tân Thạnh Tây, Củ Chi, TPHCM', N'0968124579', CAST(N'2003-10-01T00:00:00.000' AS DateTime))
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [Taikhoan], [Matkhau], [Email], [DiachiKH], [DienThoaiKH], [Ngaysinh]) VALUES (1002, N'Nguyễn Thị Kim Quyên', N'kimquyen', N'123', N'2124802010@student.tdmu.edu.vn', N'xã Tân Thạnh Đông, Củ Chi, TPHCM', N'0965326000', CAST(N'2003-12-27T00:00:00.000' AS DateTime))
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [Taikhoan], [Matkhau], [Email], [DiachiKH], [DienThoaiKH], [Ngaysinh]) VALUES (1003, N'Rose', N'Rose', N'123', N'Rose@gmail.com', N'TPHCM', N'0123456', CAST(N'1997-02-11T00:00:00.000' AS DateTime))
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [Taikhoan], [Matkhau], [Email], [DiachiKH], [DienThoaiKH], [Ngaysinh]) VALUES (1004, N'meo', N'meo', N'123', N'asdf', N'afa', N'1234', CAST(N'2023-09-25T00:00:00.000' AS DateTime))
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [Taikhoan], [Matkhau], [Email], [DiachiKH], [DienThoaiKH], [Ngaysinh]) VALUES (1005, N'kimquyen', N'quin', N'123', N'asdf', N'TPHCM', N'0123456', CAST(N'2023-09-25T00:00:00.000' AS DateTime))
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [Taikhoan], [Matkhau], [Email], [DiachiKH], [DienThoaiKH], [Ngaysinh]) VALUES (1006, N'Quyen', N'quinn', N'123', N'quinn', N'tphcm', N'0968124156', CAST(N'2023-10-01T00:00:00.000' AS DateTime))
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [Taikhoan], [Matkhau], [Email], [DiachiKH], [DienThoaiKH], [Ngaysinh]) VALUES (1007, N'Ngọc Dung', N'ngocdung', N'123', N'ngocdung@gmail.com', N'TPHCM', N'0326587412', CAST(N'2005-02-10T00:00:00.000' AS DateTime))
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [Taikhoan], [Matkhau], [Email], [DiachiKH], [DienThoaiKH], [Ngaysinh]) VALUES (1008, N'Tấn Tài', N'tai', N'123', N'2124802010789@student.tdmu.edu.vn', N'TPHCM', N'0326585987', CAST(N'2009-12-27T00:00:00.000' AS DateTime))
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [Taikhoan], [Matkhau], [Email], [DiachiKH], [DienThoaiKH], [Ngaysinh]) VALUES (1009, N'Kim Quyên', N'kim', N'123', N'2124802010789@student.tdmu.edu.vn', N'TPHCM', N'0326585987', CAST(N'2003-12-27T00:00:00.000' AS DateTime))
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [Taikhoan], [Matkhau], [Email], [DiachiKH], [DienThoaiKH], [Ngaysinh]) VALUES (1010, N'thai anh', N'thaianh', N'123', N'thaianh@gmail.com', N'tphcm', N'0123456789', CAST(N'1997-02-11T00:00:00.000' AS DateTime))
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [Taikhoan], [Matkhau], [Email], [DiachiKH], [DienThoaiKH], [Ngaysinh]) VALUES (1012, N'Phan Bảo Anh', N'baoanh', N'123', N'baoanh@gmail.com', N'TPHCM', N'087542316', CAST(N'2008-06-03T00:00:00.000' AS DateTime))
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [Taikhoan], [Matkhau], [Email], [DiachiKH], [DienThoaiKH], [Ngaysinh]) VALUES (1016, N'LALISA123', N'lisa', N'123', N'lisa@gmail.com', N'TPHCM', N'01234567741', CAST(N'1997-12-27T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[KHACHHANG] OFF
GO
SET IDENTITY_INSERT [dbo].[NhaXuatBan] ON 

INSERT [dbo].[NhaXuatBan] ([NhaXuatBanID], [NhaXuatBanName]) VALUES (1, N'BACKPACKS')
INSERT [dbo].[NhaXuatBan] ([NhaXuatBanID], [NhaXuatBanName]) VALUES (2, N'BAGS')
INSERT [dbo].[NhaXuatBan] ([NhaXuatBanID], [NhaXuatBanName]) VALUES (3, N'BUMBAGS')
INSERT [dbo].[NhaXuatBan] ([NhaXuatBanID], [NhaXuatBanName]) VALUES (4, N'TOTE BAGS')
INSERT [dbo].[NhaXuatBan] ([NhaXuatBanID], [NhaXuatBanName]) VALUES (5, N'WALLETS')
INSERT [dbo].[NhaXuatBan] ([NhaXuatBanID], [NhaXuatBanName]) VALUES (6, N'ACCESSORIES')
INSERT [dbo].[NhaXuatBan] ([NhaXuatBanID], [NhaXuatBanName]) VALUES (7, N'BALO TRUYỀN THỐNG')
INSERT [dbo].[NhaXuatBan] ([NhaXuatBanID], [NhaXuatBanName]) VALUES (8, N'BALO DU LỊCH')
SET IDENTITY_INSERT [dbo].[NhaXuatBan] OFF
GO
SET IDENTITY_INSERT [dbo].[QUYEN] ON 

INSERT [dbo].[QUYEN] ([Quyen], [QuyenName]) VALUES (1, N'Admin')
INSERT [dbo].[QUYEN] ([Quyen], [QuyenName]) VALUES (2, N'Quản trị viên')
INSERT [dbo].[QUYEN] ([Quyen], [QuyenName]) VALUES (3, N'Nhân viên')
SET IDENTITY_INSERT [dbo].[QUYEN] OFF
GO
ALTER TABLE [dbo].[Book] ADD  CONSTRAINT [DF__Book__Published__3B75D760]  DEFAULT (getdate()) FOR [Published]
GO
ALTER TABLE [dbo].[Book] ADD  CONSTRAINT [DF__Book__ViewCount__3C69FB99]  DEFAULT ((0)) FOR [ViewCount]
GO
ALTER TABLE [dbo].[ADMIN]  WITH CHECK ADD  CONSTRAINT [fk_quyen] FOREIGN KEY([Quyen])
REFERENCES [dbo].[QUYEN] ([Quyen])
GO
ALTER TABLE [dbo].[ADMIN] CHECK CONSTRAINT [fk_quyen]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Books_Categories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_Books_Categories]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Books_Nhaxuatban] FOREIGN KEY([NhaXuatBanID])
REFERENCES [dbo].[NhaXuatBan] ([NhaXuatBanID])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_Books_Nhaxuatban]
GO
ALTER TABLE [dbo].[CHITIETDATHANG]  WITH CHECK ADD  CONSTRAINT [FK_CHITIETDATHANG_Book] FOREIGN KEY([BookID])
REFERENCES [dbo].[Book] ([BookID])
GO
ALTER TABLE [dbo].[CHITIETDATHANG] CHECK CONSTRAINT [FK_CHITIETDATHANG_Book]
GO
ALTER TABLE [dbo].[DONDATHANG]  WITH CHECK ADD  CONSTRAINT [FK_DONDATHANG_KHACHHANG] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KHACHHANG] ([MaKH])
GO
ALTER TABLE [dbo].[DONDATHANG] CHECK CONSTRAINT [FK_DONDATHANG_KHACHHANG]
GO
ALTER TABLE [dbo].[VIETSACH]  WITH CHECK ADD  CONSTRAINT [FK_VIETSACH_Author] FOREIGN KEY([AuthorID])
REFERENCES [dbo].[Author] ([AuthorID])
GO
ALTER TABLE [dbo].[VIETSACH] CHECK CONSTRAINT [FK_VIETSACH_Author]
GO
ALTER TABLE [dbo].[VIETSACH]  WITH CHECK ADD  CONSTRAINT [FK_VIETSACH_Book] FOREIGN KEY([BookID])
REFERENCES [dbo].[Book] ([BookID])
GO
ALTER TABLE [dbo].[VIETSACH] CHECK CONSTRAINT [FK_VIETSACH_Book]
GO
USE [master]
GO
ALTER DATABASE [SachOnline] SET  READ_WRITE 
GO
