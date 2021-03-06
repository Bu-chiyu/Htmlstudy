USE [WebData]
GO
/****** Object:  User [Admin]    Script Date: 07/24/2019 14:55:41 ******/
CREATE USER [Admin] FOR LOGIN [Admin] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[t_user]    Script Date: 07/24/2019 14:55:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_user](
	[u_id] [int] IDENTITY(1,1) NOT NULL,
	[u_name] [varchar](20) NULL,
	[u_pwd] [varchar](16) NULL,
 CONSTRAINT [PK_t_user] PRIMARY KEY CLUSTERED 
(
	[u_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_column]    Script Date: 07/24/2019 14:55:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_column](
	[c_id] [int] IDENTITY(1,1) NOT NULL,
	[c_name] [varchar](20) NULL,
	[u_id] [int] NULL,
 CONSTRAINT [PK_t_column] PRIMARY KEY CLUSTERED 
(
	[c_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_news]    Script Date: 07/24/2019 14:55:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_news](
	[n_id] [int] IDENTITY(1,1) NOT NULL,
	[n_title] [varchar](50) NULL,
	[n_contents] [varchar](max) NULL,
	[u_id] [int] NULL,
	[c_id] [int] NULL,
	[addTime] [datetime] NULL,
	[hitCount] [int] NULL,
	[imgUrl] [varchar](100) NULL,
 CONSTRAINT [PK_t_news] PRIMARY KEY CLUSTERED 
(
	[n_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[View_News]    Script Date: 07/24/2019 14:55:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_News]
AS
SELECT     dbo.t_news.n_id, dbo.t_news.n_title, dbo.t_user.u_name, dbo.t_column.c_name, dbo.t_news.hitCount, dbo.t_news.addTime
FROM         dbo.t_column INNER JOIN
                      dbo.t_news ON dbo.t_column.c_id = dbo.t_news.c_id INNER JOIN
                      dbo.t_user ON dbo.t_news.u_id = dbo.t_user.u_id
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
         Begin Table = "t_column"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 96
               Right = 180
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "t_news"
            Begin Extent = 
               Top = 6
               Left = 218
               Bottom = 198
               Right = 361
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "t_user"
            Begin Extent = 
               Top = 15
               Left = 405
               Bottom = 120
               Right = 547
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
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_News'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_News'
GO
/****** Object:  ForeignKey [FK_t_column_t_user]    Script Date: 07/24/2019 14:55:42 ******/
ALTER TABLE [dbo].[t_column]  WITH CHECK ADD  CONSTRAINT [FK_t_column_t_user] FOREIGN KEY([u_id])
REFERENCES [dbo].[t_user] ([u_id])
GO
ALTER TABLE [dbo].[t_column] CHECK CONSTRAINT [FK_t_column_t_user]
GO
/****** Object:  ForeignKey [FK_t_news_t_column]    Script Date: 07/24/2019 14:55:42 ******/
ALTER TABLE [dbo].[t_news]  WITH CHECK ADD  CONSTRAINT [FK_t_news_t_column] FOREIGN KEY([c_id])
REFERENCES [dbo].[t_column] ([c_id])
GO
ALTER TABLE [dbo].[t_news] CHECK CONSTRAINT [FK_t_news_t_column]
GO
/****** Object:  ForeignKey [FK_t_news_t_user]    Script Date: 07/24/2019 14:55:42 ******/
ALTER TABLE [dbo].[t_news]  WITH CHECK ADD  CONSTRAINT [FK_t_news_t_user] FOREIGN KEY([u_id])
REFERENCES [dbo].[t_user] ([u_id])
GO
ALTER TABLE [dbo].[t_news] CHECK CONSTRAINT [FK_t_news_t_user]
GO
