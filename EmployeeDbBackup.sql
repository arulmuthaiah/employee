USE [EmployeeDB]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 11/9/2022 1:58:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[addresses]    Script Date: 11/9/2022 1:58:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[addresses](
	[AddressId] [int] IDENTITY(1,1) NOT NULL,
	[EmpId] [int] NOT NULL,
	[StreetAddress] [nvarchar](max) NULL,
	[City] [nvarchar](max) NULL,
	[State] [nvarchar](max) NULL,
	[PostalCode] [nvarchar](max) NULL,
 CONSTRAINT [PK_addresses] PRIMARY KEY CLUSTERED 
(
	[AddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[employees]    Script Date: 11/9/2022 1:58:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employees](
	[EmpId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[Age] [int] NOT NULL,
 CONSTRAINT [PK_employees] PRIMARY KEY CLUSTERED 
(
	[EmpId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[phoneNumbers]    Script Date: 11/9/2022 1:58:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[phoneNumbers](
	[PhoneId] [int] IDENTITY(1,1) NOT NULL,
	[EmpId] [int] NOT NULL,
	[Type] [nvarchar](max) NULL,
	[Number] [nvarchar](max) NULL,
 CONSTRAINT [PK_phoneNumbers] PRIMARY KEY CLUSTERED 
(
	[PhoneId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20221109070503_CreateEmployeeDB', N'5.0.17')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20221109075527_updateEmployeeDB', N'5.0.17')
SET IDENTITY_INSERT [dbo].[addresses] ON 

INSERT [dbo].[addresses] ([AddressId], [EmpId], [StreetAddress], [City], [State], [PostalCode]) VALUES (2, 3, N'21 2nd Street', N'New York', N'NY', N'10021')
SET IDENTITY_INSERT [dbo].[addresses] OFF
SET IDENTITY_INSERT [dbo].[employees] ON 

INSERT [dbo].[employees] ([EmpId], [FirstName], [LastName], [Age]) VALUES (3, N'John', N'Smith', 25)
SET IDENTITY_INSERT [dbo].[employees] OFF
SET IDENTITY_INSERT [dbo].[phoneNumbers] ON 

INSERT [dbo].[phoneNumbers] ([PhoneId], [EmpId], [Type], [Number]) VALUES (3, 3, N'home', N'212 555-1234')
INSERT [dbo].[phoneNumbers] ([PhoneId], [EmpId], [Type], [Number]) VALUES (4, 3, N'fax', N'646 555-4567')
SET IDENTITY_INSERT [dbo].[phoneNumbers] OFF
ALTER TABLE [dbo].[addresses]  WITH CHECK ADD  CONSTRAINT [FK_addresses_employees_EmpId] FOREIGN KEY([EmpId])
REFERENCES [dbo].[employees] ([EmpId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[addresses] CHECK CONSTRAINT [FK_addresses_employees_EmpId]
GO
ALTER TABLE [dbo].[phoneNumbers]  WITH CHECK ADD  CONSTRAINT [FK_phoneNumbers_employees_EmpId] FOREIGN KEY([EmpId])
REFERENCES [dbo].[employees] ([EmpId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[phoneNumbers] CHECK CONSTRAINT [FK_phoneNumbers_employees_EmpId]
GO
