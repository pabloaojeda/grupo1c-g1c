USE [PilWallet]
GO
/****** Object:  Table [dbo].[Cuenta]    Script Date: 04-Oct-21 8:54:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cuenta](
	[ID_Cuenta] [int] NOT NULL,
	[CBU] [varchar](25) NOT NULL,
	[ID_Cliente] [int] NOT NULL,
	[ID_Tipo_Cuenta] [int] NOT NULL,
	[ID_Balance] [int] NOT NULL,
 CONSTRAINT [PK__Cuenta__820D611F2C69BC92] PRIMARY KEY CLUSTERED 
(
	[ID_Cuenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Cuenta] ([ID_Cuenta], [CBU], [ID_Cliente], [ID_Tipo_Cuenta], [ID_Balance]) VALUES (0, N'0987654321', 3, 0, 0)
GO
INSERT [dbo].[Cuenta] ([ID_Cuenta], [CBU], [ID_Cliente], [ID_Tipo_Cuenta], [ID_Balance]) VALUES (1, N'0823455556', 1, 0, 1)
GO
INSERT [dbo].[Cuenta] ([ID_Cuenta], [CBU], [ID_Cliente], [ID_Tipo_Cuenta], [ID_Balance]) VALUES (2, N'0823455556', 1, 1, 3)
GO
INSERT [dbo].[Cuenta] ([ID_Cuenta], [CBU], [ID_Cliente], [ID_Tipo_Cuenta], [ID_Balance]) VALUES (4, N'0987654321', 3, 1, 4)
GO
INSERT [dbo].[Cuenta] ([ID_Cuenta], [CBU], [ID_Cliente], [ID_Tipo_Cuenta], [ID_Balance]) VALUES (5, N'0987654321', 3, 2, 5)
GO
INSERT [dbo].[Cuenta] ([ID_Cuenta], [CBU], [ID_Cliente], [ID_Tipo_Cuenta], [ID_Balance]) VALUES (6, N'0323455556', 8, 0, 2)
GO
