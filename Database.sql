USE [123DB]
GO
/****** Object:  Table [dbo].[Tbl_Accountinfo]    Script Date: 1/28/2022 2:44:04 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Accountinfo](
	[ID] [int] IDENTITY(1000000,1) NOT NULL,
	[Password] [varchar](50) NULL,
	[Client] [nvarchar](50) NULL,
	[Customer_Name] [varchar](50) NULL,
	[Male] [nvarchar](50) NULL,
	[Other_Details] [varchar](max) NULL,
	[Date_Created] [datetime] NULL,
	[Created_By] [varchar](50) NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Tbl_Accountinfo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_TransactionInfo]    Script Date: 1/28/2022 2:44:04 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_TransactionInfo](
	[TransactionCode] [int] IDENTITY(10000000,1) NOT NULL,
	[Account_No] [int] NULL,
	[Account_Name] [varchar](50) NULL,
	[Merchant] [nvarchar](50) NULL,
	[Status] [nvarchar](50) NULL,
	[Amount] [decimal](18, 3) NULL,
	[Createddate] [datetime] NULL,
	[Createdby] [varchar](50) NULL,
	[UpdatedDate] [datetime] NULL,
	[Updatedby] [varchar](50) NULL,
	[Documentinfo] [varchar](max) NULL,
	[ServiceFee] [decimal](18, 3) NULL,
	[Remarks] [varchar](max) NULL,
 CONSTRAINT [PK_Tbl_TransactionInfo] PRIMARY KEY CLUSTERED 
(
	[TransactionCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblCustomer_merchantAccount]    Script Date: 1/28/2022 2:44:04 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblCustomer_merchantAccount](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AccountID] [int] NULL,
	[Merchant] [varchar](50) NULL,
	[AccountNo] [int] NULL,
	[Account_Name] [varchar](50) NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_TblmerchantAccount] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblMerchant]    Script Date: 1/28/2022 2:44:04 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMerchant](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Merchant] [varchar](50) NULL,
 CONSTRAINT [PK_tblMerchant] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Getpending]    Script Date: 1/28/2022 2:44:04 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Getpending]
AS
SELECT a.TransactionCode, a.Createddate AS Date, c.Client, c.Customer_Name, a.Merchant, b.AccountNo, b.Account_Name, c.Other_Details, a.Status, a.Amount, a.Updatedby AS [Processed By], a.Documentinfo, a.ServiceFee, a.Remarks
FROM     dbo.Tbl_TransactionInfo AS a INNER JOIN
                  dbo.TblCustomer_merchantAccount AS b ON a.Merchant = b.Merchant INNER JOIN
                  dbo.Tbl_Accountinfo AS c ON c.ID = a.Account_No
GO
SET IDENTITY_INSERT [dbo].[Tbl_Accountinfo] ON 

INSERT [dbo].[Tbl_Accountinfo] ([ID], [Password], [Client], [Customer_Name], [Male], [Other_Details], [Date_Created], [Created_By], [IsActive]) VALUES (1000000, N'1234', N'ABC Pay', N'Junnel Gomez', N'Male', NULL, CAST(N'2022-01-22T00:00:00.000' AS DateTime), N'PP', 1)
SET IDENTITY_INSERT [dbo].[Tbl_Accountinfo] OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_TransactionInfo] ON 

INSERT [dbo].[Tbl_TransactionInfo] ([TransactionCode], [Account_No], [Account_Name], [Merchant], [Status], [Amount], [Createddate], [Createdby], [UpdatedDate], [Updatedby], [Documentinfo], [ServiceFee], [Remarks]) VALUES (10000000, 1000000, N'Junnel Gomez', N'Netflix', N'Done', CAST(50.000 AS Decimal(18, 3)), CAST(N'2022-01-22T00:00:00.000' AS DateTime), N'Junnel Gomez', CAST(N'2022-01-27T02:39:58.700' AS DateTime), N'Jgomez', N'C:\ReceiptInfo\WIN_20220127_02_19_56_Pro.jpg', CAST(50.000 AS Decimal(18, 3)), N'34324234')
INSERT [dbo].[Tbl_TransactionInfo] ([TransactionCode], [Account_No], [Account_Name], [Merchant], [Status], [Amount], [Createddate], [Createdby], [UpdatedDate], [Updatedby], [Documentinfo], [ServiceFee], [Remarks]) VALUES (10000001, 1000000, N'Junnel Gomez', N'Netflix', N'Done', CAST(50.000 AS Decimal(18, 3)), CAST(N'2022-01-22T00:00:00.000' AS DateTime), N'Junnel Gomez', CAST(N'2022-01-27T02:40:32.070' AS DateTime), N'Jgomez', N'C:\ReceiptInfo\WIN_20220127_02_19_57_Pro.jpg', CAST(50.000 AS Decimal(18, 3)), N'')
INSERT [dbo].[Tbl_TransactionInfo] ([TransactionCode], [Account_No], [Account_Name], [Merchant], [Status], [Amount], [Createddate], [Createdby], [UpdatedDate], [Updatedby], [Documentinfo], [ServiceFee], [Remarks]) VALUES (10000002, 1000000, N'Junnel Gomez', N'Netflix', N'Done', CAST(50.000 AS Decimal(18, 3)), CAST(N'2022-01-22T00:00:00.000' AS DateTime), N'Junnel Gomez', CAST(N'2022-01-27T02:40:45.100' AS DateTime), N'Jgomez', N'C:\ReceiptInfo\WIN_20220127_02_19_58_Pro (2).jpg', CAST(480.000 AS Decimal(18, 3)), N'')
INSERT [dbo].[Tbl_TransactionInfo] ([TransactionCode], [Account_No], [Account_Name], [Merchant], [Status], [Amount], [Createddate], [Createdby], [UpdatedDate], [Updatedby], [Documentinfo], [ServiceFee], [Remarks]) VALUES (10000003, 1000000, N'Junnel Gomez', N'Netflix', N'Processing', CAST(50.000 AS Decimal(18, 3)), CAST(N'2022-01-22T00:00:00.000' AS DateTime), N'Junnel Gomez', CAST(N'2022-01-27T01:35:32.757' AS DateTime), N'Jgomez', N'', CAST(500.000 AS Decimal(18, 3)), N'sample')
INSERT [dbo].[Tbl_TransactionInfo] ([TransactionCode], [Account_No], [Account_Name], [Merchant], [Status], [Amount], [Createddate], [Createdby], [UpdatedDate], [Updatedby], [Documentinfo], [ServiceFee], [Remarks]) VALUES (10000004, 1000000, N'Junnel Gomez', N'Netflix', N'Pending', CAST(50.000 AS Decimal(18, 3)), CAST(N'2022-01-23T02:00:13.787' AS DateTime), N'Junnel Gomez', CAST(N'2022-01-27T01:35:35.903' AS DateTime), N'Jgomez', N'', CAST(0.000 AS Decimal(18, 3)), N'')
INSERT [dbo].[Tbl_TransactionInfo] ([TransactionCode], [Account_No], [Account_Name], [Merchant], [Status], [Amount], [Createddate], [Createdby], [UpdatedDate], [Updatedby], [Documentinfo], [ServiceFee], [Remarks]) VALUES (10000005, 1000000, N'Junnel Gomez', N'NetfliX', N'Processing', CAST(50.000 AS Decimal(18, 3)), CAST(N'2022-01-23T02:00:13.787' AS DateTime), N'Junnel Gomez', CAST(N'2022-01-27T01:35:58.987' AS DateTime), N'Jgomez', N'', CAST(0.000 AS Decimal(18, 3)), N'')
INSERT [dbo].[Tbl_TransactionInfo] ([TransactionCode], [Account_No], [Account_Name], [Merchant], [Status], [Amount], [Createddate], [Createdby], [UpdatedDate], [Updatedby], [Documentinfo], [ServiceFee], [Remarks]) VALUES (10000006, 1000000, N'Junnel Gomez', N'Netflix', N'Pending', CAST(50.000 AS Decimal(18, 3)), CAST(N'2022-01-23T02:00:13.787' AS DateTime), N'Junnel Gomez', CAST(N'2022-01-27T01:36:04.717' AS DateTime), N'Jgomez', N'', CAST(500.000 AS Decimal(18, 3)), N'400')
INSERT [dbo].[Tbl_TransactionInfo] ([TransactionCode], [Account_No], [Account_Name], [Merchant], [Status], [Amount], [Createddate], [Createdby], [UpdatedDate], [Updatedby], [Documentinfo], [ServiceFee], [Remarks]) VALUES (10000007, 1000000, N'Junnel Gomez', N'Netflix', N'Pending', CAST(50.000 AS Decimal(18, 3)), CAST(N'2022-01-23T02:00:13.787' AS DateTime), N'Junnel Gomez', CAST(N'2022-01-23T02:00:13.787' AS DateTime), N'sample string 6', N'sample string 7', CAST(0.000 AS Decimal(18, 3)), NULL)
INSERT [dbo].[Tbl_TransactionInfo] ([TransactionCode], [Account_No], [Account_Name], [Merchant], [Status], [Amount], [Createddate], [Createdby], [UpdatedDate], [Updatedby], [Documentinfo], [ServiceFee], [Remarks]) VALUES (10000008, 1000000, N'Junnel Gomez', N'Netflix', N'Pending', CAST(50.000 AS Decimal(18, 3)), CAST(N'2022-01-23T02:00:13.787' AS DateTime), N'Junnel Gomez', CAST(N'2022-01-27T01:36:23.837' AS DateTime), N'Jgomez', N'', CAST(0.000 AS Decimal(18, 3)), N'')
INSERT [dbo].[Tbl_TransactionInfo] ([TransactionCode], [Account_No], [Account_Name], [Merchant], [Status], [Amount], [Createddate], [Createdby], [UpdatedDate], [Updatedby], [Documentinfo], [ServiceFee], [Remarks]) VALUES (10000009, 1000000, N'Junnel Gomez', N'Netflix', N'Pending', CAST(50.000 AS Decimal(18, 3)), CAST(N'2022-01-23T02:00:13.787' AS DateTime), N'Junnel Gomez', CAST(N'2022-01-27T01:36:11.457' AS DateTime), N'Jgomez', N'', CAST(0.000 AS Decimal(18, 3)), N'')
INSERT [dbo].[Tbl_TransactionInfo] ([TransactionCode], [Account_No], [Account_Name], [Merchant], [Status], [Amount], [Createddate], [Createdby], [UpdatedDate], [Updatedby], [Documentinfo], [ServiceFee], [Remarks]) VALUES (10000010, 1000000, N'Junnel Gomez', N'Netflix', N'Processing', CAST(5000.000 AS Decimal(18, 3)), CAST(N'2022-01-24T00:00:00.000' AS DateTime), N'Junnel Gomez', CAST(N'2022-01-27T01:38:02.567' AS DateTime), N'Jgomez', N'', CAST(50.000 AS Decimal(18, 3)), N'')
INSERT [dbo].[Tbl_TransactionInfo] ([TransactionCode], [Account_No], [Account_Name], [Merchant], [Status], [Amount], [Createddate], [Createdby], [UpdatedDate], [Updatedby], [Documentinfo], [ServiceFee], [Remarks]) VALUES (10000011, 10000000, N'Junnel Gomez', N'Netflix', N'Pending', CAST(5000.000 AS Decimal(18, 3)), CAST(N'2022-01-24T00:00:00.000' AS DateTime), N'Junnel Gomez', CAST(N'2022-01-24T00:00:00.000' AS DateTime), N'Junnel gomez', N'H', CAST(0.000 AS Decimal(18, 3)), NULL)
INSERT [dbo].[Tbl_TransactionInfo] ([TransactionCode], [Account_No], [Account_Name], [Merchant], [Status], [Amount], [Createddate], [Createdby], [UpdatedDate], [Updatedby], [Documentinfo], [ServiceFee], [Remarks]) VALUES (10000012, 1000000, N'Gomez', N'Netflix', N'Pending', CAST(50.000 AS Decimal(18, 3)), CAST(N'2022-01-24T00:00:00.000' AS DateTime), N'Junnel Gomez', CAST(N'2022-01-27T01:35:49.677' AS DateTime), N'Jgomez', N'', CAST(0.000 AS Decimal(18, 3)), N'')
INSERT [dbo].[Tbl_TransactionInfo] ([TransactionCode], [Account_No], [Account_Name], [Merchant], [Status], [Amount], [Createddate], [Createdby], [UpdatedDate], [Updatedby], [Documentinfo], [ServiceFee], [Remarks]) VALUES (10000013, 1000001, N'Dela Cruz', N'Netflix', N'Pending', CAST(5000.000 AS Decimal(18, 3)), CAST(N'2022-01-24T00:00:00.000' AS DateTime), N'Junnel Gomez', CAST(N'2022-01-24T00:00:00.000' AS DateTime), N'Junnel gomez', NULL, CAST(0.000 AS Decimal(18, 3)), NULL)
INSERT [dbo].[Tbl_TransactionInfo] ([TransactionCode], [Account_No], [Account_Name], [Merchant], [Status], [Amount], [Createddate], [Createdby], [UpdatedDate], [Updatedby], [Documentinfo], [ServiceFee], [Remarks]) VALUES (10000014, 1234578, N'JGOMEZ', N'Netflix', N'Pending', CAST(500.000 AS Decimal(18, 3)), CAST(N'2022-01-24T00:00:00.000' AS DateTime), N'Junnel Gomez', NULL, NULL, NULL, CAST(0.000 AS Decimal(18, 3)), NULL)
INSERT [dbo].[Tbl_TransactionInfo] ([TransactionCode], [Account_No], [Account_Name], [Merchant], [Status], [Amount], [Createddate], [Createdby], [UpdatedDate], [Updatedby], [Documentinfo], [ServiceFee], [Remarks]) VALUES (10000015, 10000000, N'Dela Cruz', N'Netflix', NULL, CAST(5000.000 AS Decimal(18, 3)), CAST(N'2022-01-27T00:00:00.000' AS DateTime), N'Junnel Gomez', NULL, NULL, NULL, CAST(0.000 AS Decimal(18, 3)), NULL)
INSERT [dbo].[Tbl_TransactionInfo] ([TransactionCode], [Account_No], [Account_Name], [Merchant], [Status], [Amount], [Createddate], [Createdby], [UpdatedDate], [Updatedby], [Documentinfo], [ServiceFee], [Remarks]) VALUES (10000016, 10000000, N'Dela Cruz', N'Netflix', NULL, CAST(5000.000 AS Decimal(18, 3)), CAST(N'2022-01-27T00:00:00.000' AS DateTime), N'Junnel Gomez', NULL, NULL, NULL, CAST(0.000 AS Decimal(18, 3)), NULL)
INSERT [dbo].[Tbl_TransactionInfo] ([TransactionCode], [Account_No], [Account_Name], [Merchant], [Status], [Amount], [Createddate], [Createdby], [UpdatedDate], [Updatedby], [Documentinfo], [ServiceFee], [Remarks]) VALUES (10000017, 1000000, N'JGOMEZ', N'TELEPAY', N'Processing', CAST(400.000 AS Decimal(18, 3)), CAST(N'2022-01-27T00:00:00.000' AS DateTime), N'Junnel Gomez', CAST(N'2022-01-27T01:35:43.387' AS DateTime), N'Jgomez', N'', CAST(0.000 AS Decimal(18, 3)), N'')
INSERT [dbo].[Tbl_TransactionInfo] ([TransactionCode], [Account_No], [Account_Name], [Merchant], [Status], [Amount], [Createddate], [Createdby], [UpdatedDate], [Updatedby], [Documentinfo], [ServiceFee], [Remarks]) VALUES (10000018, 1000000, N'Junnel Gomez', N'NetFlix', NULL, CAST(500.000 AS Decimal(18, 3)), CAST(N'2022-01-27T00:00:00.000' AS DateTime), N'JGOMEZ', NULL, NULL, NULL, CAST(0.000 AS Decimal(18, 3)), N' ')
INSERT [dbo].[Tbl_TransactionInfo] ([TransactionCode], [Account_No], [Account_Name], [Merchant], [Status], [Amount], [Createddate], [Createdby], [UpdatedDate], [Updatedby], [Documentinfo], [ServiceFee], [Remarks]) VALUES (10000019, 1000000, N'Junnel Gomez', N'NetFlix', NULL, CAST(500.000 AS Decimal(18, 3)), CAST(N'2022-01-28T00:00:00.000' AS DateTime), N'JGOMEZ', NULL, NULL, NULL, CAST(0.000 AS Decimal(18, 3)), N' ')
INSERT [dbo].[Tbl_TransactionInfo] ([TransactionCode], [Account_No], [Account_Name], [Merchant], [Status], [Amount], [Createddate], [Createdby], [UpdatedDate], [Updatedby], [Documentinfo], [ServiceFee], [Remarks]) VALUES (10000020, 1000000, N'Junnel Gomez', N'NetFlix', NULL, CAST(500.000 AS Decimal(18, 3)), CAST(N'2022-01-27T00:00:00.000' AS DateTime), N'JGOMEZ', NULL, NULL, NULL, CAST(0.000 AS Decimal(18, 3)), N' ')
SET IDENTITY_INSERT [dbo].[Tbl_TransactionInfo] OFF
GO
SET IDENTITY_INSERT [dbo].[TblCustomer_merchantAccount] ON 

INSERT [dbo].[TblCustomer_merchantAccount] ([ID], [AccountID], [Merchant], [AccountNo], [Account_Name], [IsActive], [CreatedBy], [CreatedDate]) VALUES (1, 1000000, N'NetFlix', 23456789, N'JGOMEZ    ', 1, N'Junnel Gomez', CAST(N'2022-01-26T00:00:00.000' AS DateTime))
INSERT [dbo].[TblCustomer_merchantAccount] ([ID], [AccountID], [Merchant], [AccountNo], [Account_Name], [IsActive], [CreatedBy], [CreatedDate]) VALUES (2, 1000000, N'TELEPAY', 23456799, N'JGOMEZ    ', 1, N'Junnel Gomez', CAST(N'2022-01-26T00:00:00.000' AS DateTime))
INSERT [dbo].[TblCustomer_merchantAccount] ([ID], [AccountID], [Merchant], [AccountNo], [Account_Name], [IsActive], [CreatedBy], [CreatedDate]) VALUES (3, 1000000, N'AT&T Mobile', 24345678, N'JGOMEZ', 1, N'Junnel Gomez', CAST(N'2022-01-26T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[TblCustomer_merchantAccount] OFF
GO
ALTER TABLE [dbo].[Tbl_TransactionInfo] ADD  CONSTRAINT [DF_Tbl_TransactionInfo_Status]  DEFAULT (N'Pending') FOR [Status]
GO
ALTER TABLE [dbo].[Tbl_TransactionInfo] ADD  CONSTRAINT [DF_Tbl_TransactionInfo_Amount]  DEFAULT ((0)) FOR [Amount]
GO
ALTER TABLE [dbo].[Tbl_TransactionInfo] ADD  CONSTRAINT [DF_Tbl_TransactionInfo_Documentinfo]  DEFAULT (' ') FOR [Documentinfo]
GO
ALTER TABLE [dbo].[Tbl_TransactionInfo] ADD  CONSTRAINT [DF_Tbl_TransactionInfo_ServiceFee]  DEFAULT ((0)) FOR [ServiceFee]
GO
ALTER TABLE [dbo].[Tbl_TransactionInfo] ADD  CONSTRAINT [DF_Tbl_TransactionInfo_Remarks]  DEFAULT (' ') FOR [Remarks]
GO
/****** Object:  StoredProcedure [dbo].[PaymentModule]    Script Date: 1/28/2022 2:44:04 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[PaymentModule] 
	@action as nvarchar(50) = null,
	@status as varchar(50) = null,
	@TransactionCode as int  = null,
	@Updatedby as varchar(50) =null,
	@updatedDate as datetime = null,
	@Documentinfo as varchar(max) = null,
	@ServiceFee as decimal(18,3)= null,
	@Remarks as varchar(max) = null
AS
BEGIN

if @action = 'Get'
begin
SELECT  a.[TransactionCode]
      ,a.Createddate as [Date]
      ,c.client
	  ,c.Customer_Name
      ,a.[Merchant]
	  ,b.[AccountNo]
	  ,b.[Account_Name]
	  ,c.Other_Details
      ,case when a.[Status] is null then 'Pending' else a.[Status] end [Status]
      ,a.[Amount]
	  ,a.[Updatedby] as [Processed By]
      ,a.[Createddate]
      ,a.[Createdby]
      ,a.[UpdatedDate]
      
      ,a.[Documentinfo]
FROM [123DB].[dbo].[Tbl_TransactionInfo] as a inner join 
[dbo].[TblCustomer_merchantAccount] as b on a.Merchant = b.Merchant inner join [dbo].[Tbl_Accountinfo] as c on c.ID=a.[Account_No]

  end


  if @action ='Update'
  begin
   update [Tbl_TransactionInfo] set [Status] = @status 
          ,Updatedby = @Updatedby ,UpdatedDate = getdate(),Documentinfo = @Documentinfo ,ServiceFee =ISNULL(@ServiceFee,0),Remarks = @Remarks
   
   where [TransactionCode] = @TransactionCode
end


END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "a"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 254
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "b"
            Begin Extent = 
               Top = 7
               Left = 302
               Bottom = 170
               Right = 497
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "c"
            Begin Extent = 
               Top = 7
               Left = 545
               Bottom = 170
               Right = 749
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Getpending'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Getpending'
GO
