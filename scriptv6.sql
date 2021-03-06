USE [estoreDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_Image]    Script Date: 10/30/2017 8:01:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Image]
@ImageID int = null,
@Name nvarchar(50) = null,
@ProductID int = null,
@action nvarchar(10)

	
AS
BEGIN

if @action = 'select'
select * from ImageTbl

if @action = 'insert'
INSERT INTO ImageTbl values(@Name,@ProductID)  

if @action = 'update'
Update ImageTbl set Name=@Name where ImageID=@ImageID

					

if @action='delete'
delete from ImageTbl where ImageID=@ImageID

if @action='deleteAll'
delete from ImageTbl where ProductID=@ProductID


if @action = 'getbyproduct'
select * from ImageTbl where ProductID=@ProductID


	

	
END

GO
/****** Object:  StoredProcedure [dbo].[sp_Insertuser]    Script Date: 10/30/2017 8:01:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Insertuser]
	
	@email nvarchar(50),
	@password nvarchar(50)

AS
BEGIN
insert into UserTbl values(@email,@password)
	
END



GO
/****** Object:  StoredProcedure [dbo].[sp_Product]    Script Date: 10/30/2017 8:01:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Product]
@ProductID int = null,
@Name nvarchar(50) = null,
@Price decimal = null,
@Area int = null,
@Rooms int = null,
@Color nvarchar(50) = null,
@Year date = null ,
@UserID int = null,
@ProductTypeID int = null,
@action nvarchar(10)

	
AS
BEGIN

if @action = 'select'
select * from ProductTbl

if @action = 'insert'
INSERT INTO ProductTbl values(@Name,@Price,@Area,@Rooms,
                        @Color,@Year,@UserID,@ProductTypeID)  

if @action = 'update'
Update ProductTbl set Name=@Name,Price=@Price,Area=@Area,Rooms=@Rooms,
                        Color=@Color,Year=@Year,UserID=@UserID,ProductTypeID=@ProductTypeID

						where ProductID=@ProductID

if @action='delete'
delete from ProductTbl where ProductID=@ProductID


if @action = 'selectSingle'
select * from ProductTbl where ProductID=@ProductID

if	@action = 'getTypes'
select * from TypesTbl

	

	
END

GO
/****** Object:  StoredProcedure [dbo].[sp_Profile]    Script Date: 10/30/2017 8:01:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_Profile]
@profileid int = null,
@fullname nvarchar(50) = null,
@address nvarchar(50) = null,
@street nvarchar(50) = null,
@image nvarchar(50) = null,
@action int


	AS
BEGIN
	
	if @action =1
	select * from ProfileTbl where ProfileID = @profileid

	if @action =2
	INSERT INTO ProfileTbl VALUES(@profileid,@fullname,@address,@street,@image)

	if @action=3
	update ProfileTbl SET FullName=@fullname,Address=@address,Street=@street,
	Image=@image Where ProfileID=@profileid

	if @action =4
	Delete from ProfileTbl where ProfileID=@profileid



END


GO
/****** Object:  StoredProcedure [dbo].[sp_UserLog]    Script Date: 10/30/2017 8:01:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_UserLog]


@email nvarchar(50),
@password nvarchar(50)
AS
BEGIN
	
	SELECT * from UserTbl where Email=@email and Passowrd=@password
END


GO
/****** Object:  Table [dbo].[ImageTbl]    Script Date: 10/30/2017 8:01:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImageTbl](
	[ImageID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[ProductID] [int] NULL,
 CONSTRAINT [PK_ImageTbl] PRIMARY KEY CLUSTERED 
(
	[ImageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductTbl]    Script Date: 10/30/2017 8:01:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductTbl](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Price] [money] NULL,
	[Area] [int] NULL,
	[Rooms] [int] NULL,
	[Year] [date] NULL,
	[Color] [nvarchar](50) NULL,
	[UserID] [int] NULL,
	[ProductTypeID] [int] NULL,
 CONSTRAINT [PK_ProductTbl] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProfileTbl]    Script Date: 10/30/2017 8:01:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProfileTbl](
	[ProfileID] [int] NOT NULL,
	[FullName] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[Street] [nvarchar](50) NULL,
	[Image] [nvarchar](50) NULL,
 CONSTRAINT [PK_ProfileTbl] PRIMARY KEY CLUSTERED 
(
	[ProfileID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TypesTbl]    Script Date: 10/30/2017 8:01:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypesTbl](
	[PID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](50) NULL,
 CONSTRAINT [PK_TypesTbl] PRIMARY KEY CLUSTERED 
(
	[PID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserTbl]    Script Date: 10/30/2017 8:01:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTbl](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](50) NULL,
	[Passowrd] [nvarchar](50) NULL,
 CONSTRAINT [PK_UserTbl] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[ProfileTbl] ([ProfileID], [FullName], [Address], [Street], [Image]) VALUES (1, N'ammar Yaser Qasem', N'amman', N'Budrus', NULL)
INSERT [dbo].[ProfileTbl] ([ProfileID], [FullName], [Address], [Street], [Image]) VALUES (2, N'omar ahmad ali', N'amman', NULL, N'Koala.jpg')
SET IDENTITY_INSERT [dbo].[TypesTbl] ON 

INSERT [dbo].[TypesTbl] ([PID], [ProductName]) VALUES (1, N'Flat')
INSERT [dbo].[TypesTbl] ([PID], [ProductName]) VALUES (2, N'Car')
SET IDENTITY_INSERT [dbo].[TypesTbl] OFF
SET IDENTITY_INSERT [dbo].[UserTbl] ON 

INSERT [dbo].[UserTbl] ([ID], [Email], [Passowrd]) VALUES (1, N'ammar@gmail.com', N'222')
INSERT [dbo].[UserTbl] ([ID], [Email], [Passowrd]) VALUES (2, N'omar@gmail.com', N'333')
SET IDENTITY_INSERT [dbo].[UserTbl] OFF
ALTER TABLE [dbo].[ImageTbl]  WITH CHECK ADD  CONSTRAINT [FK_ImageTbl_ProductTbl] FOREIGN KEY([ProductID])
REFERENCES [dbo].[ProductTbl] ([ProductID])
GO
ALTER TABLE [dbo].[ImageTbl] CHECK CONSTRAINT [FK_ImageTbl_ProductTbl]
GO
ALTER TABLE [dbo].[ProductTbl]  WITH CHECK ADD  CONSTRAINT [FK_ProductTbl_TypesTbl] FOREIGN KEY([ProductTypeID])
REFERENCES [dbo].[TypesTbl] ([PID])
GO
ALTER TABLE [dbo].[ProductTbl] CHECK CONSTRAINT [FK_ProductTbl_TypesTbl]
GO
ALTER TABLE [dbo].[ProductTbl]  WITH CHECK ADD  CONSTRAINT [FK_ProductTbl_UserTbl] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserTbl] ([ID])
GO
ALTER TABLE [dbo].[ProductTbl] CHECK CONSTRAINT [FK_ProductTbl_UserTbl]
GO
ALTER TABLE [dbo].[ProfileTbl]  WITH CHECK ADD  CONSTRAINT [FK_ProfileTbl_UserTbl] FOREIGN KEY([ProfileID])
REFERENCES [dbo].[UserTbl] ([ID])
GO
ALTER TABLE [dbo].[ProfileTbl] CHECK CONSTRAINT [FK_ProfileTbl_UserTbl]
GO
