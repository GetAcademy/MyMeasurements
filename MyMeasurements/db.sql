
/****** Object:  Table [dbo].[Measurement]    Script Date: 03.05.2022 09:05:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Measurement](
	[Id] [uniqueidentifier] NOT NULL,
	[Value] [float] NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
	[PersonId] [uniqueidentifier] NOT NULL,
	[SensorId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Measurement] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 03.05.2022 09:05:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sensor]    Script Date: 03.05.2022 09:05:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sensor](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Sensor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Measurement] ([Id], [Value], [TimeStamp], [PersonId], [SensorId]) VALUES (N'18bc0dab-dd38-4820-9327-6b0ef914fcb3', 5.5, CAST(N'2022-05-03T09:05:00.000' AS DateTime), N'73bc3238-eac8-4bd0-ba6b-aa67721211de', N'333179a7-9526-4834-adbb-1671262122a8')
GO
INSERT [dbo].[Measurement] ([Id], [Value], [TimeStamp], [PersonId], [SensorId]) VALUES (N'ee4c23ad-4972-4b12-b620-e325a305f407', 450, CAST(N'2022-05-03T09:05:00.000' AS DateTime), N'73bc3238-eac8-4bd0-ba6b-aa67721211de', N'03e13b3c-fcf5-4660-ab34-68627d8f9bfc')
GO
INSERT [dbo].[Person] ([Id], [Name]) VALUES (N'5382848c-cf4c-4659-9893-204e5059d13e', N'Per')
GO
INSERT [dbo].[Person] ([Id], [Name]) VALUES (N'431075d4-29de-41f2-8571-3ecfcecb5ea2', N'Pål')
GO
INSERT [dbo].[Person] ([Id], [Name]) VALUES (N'73bc3238-eac8-4bd0-ba6b-aa67721211de', N'Terje')
GO
INSERT [dbo].[Sensor] ([Id], [Name]) VALUES (N'333179a7-9526-4834-adbb-1671262122a8', N'Temperatur 1. etasje sør')
GO
INSERT [dbo].[Sensor] ([Id], [Name]) VALUES (N'03e13b3c-fcf5-4660-ab34-68627d8f9bfc', N'CO2 1. etasje sør')
GO
ALTER TABLE [dbo].[Measurement]  WITH CHECK ADD  CONSTRAINT [FK_Measurement_Person] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([Id])
GO
ALTER TABLE [dbo].[Measurement] CHECK CONSTRAINT [FK_Measurement_Person]
GO
ALTER TABLE [dbo].[Measurement]  WITH CHECK ADD  CONSTRAINT [FK_Measurement_Sensor] FOREIGN KEY([SensorId])
REFERENCES [dbo].[Sensor] ([Id])
GO
ALTER TABLE [dbo].[Measurement] CHECK CONSTRAINT [FK_Measurement_Sensor]
GO
USE [master]
GO
ALTER DATABASE [TestDb] SET  READ_WRITE 
GO
