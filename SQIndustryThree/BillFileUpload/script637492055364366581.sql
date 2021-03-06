USE [SQQEYEDatabase]
GO
/****** Object:  Table [dbo].[VisitorRoleWiseApprover]    Script Date: 1/9/2021 7:01:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VisitorRoleWiseApprover](
	[rwaid] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[UserName] [nvarchar](100) NULL,
	[UserEmail] [nvarchar](100) NULL,
	[Designation] [nvarchar](100) NULL,
	[Role] [nvarchar](100) NULL,
	[UnitId] [int] NULL,
	[UnitName] [nvarchar](100) NULL,
	[ApproverSequence] [tinyint] NULL,
 CONSTRAINT [PK_VisitorRoleWiseApprover] PRIMARY KEY CLUSTERED 
(
	[rwaid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[VisitorRoleWiseApprover] ON 

INSERT [dbo].[VisitorRoleWiseApprover] ([rwaid], [UserId], [UserName], [UserEmail], [Designation], [Role], [UnitId], [UnitName], [ApproverSequence]) VALUES (1, 1153, N'Fayez Ahmed', N'fayez.ahamed@sqgc.com', N'Head of Marketing', N'HOM', 3, N'SQ Birichina', 2)
INSERT [dbo].[VisitorRoleWiseApprover] ([rwaid], [UserId], [UserName], [UserEmail], [Designation], [Role], [UnitId], [UnitName], [ApproverSequence]) VALUES (2, 1359, N'Ruwan Gunapala', N'ruwan.gunapala@sqgc.com', N'Head of Marketing', N'HOM', 3, N'SQ Birichina', 2)
INSERT [dbo].[VisitorRoleWiseApprover] ([rwaid], [UserId], [UserName], [UserEmail], [Designation], [Role], [UnitId], [UnitName], [ApproverSequence]) VALUES (3, 1151, N'Nimisha Dutta', N'nimisha.dutta@sqgc.com', N'Head of Marketing', N'HOM', 3, N'SQ Birichina', 2)
INSERT [dbo].[VisitorRoleWiseApprover] ([rwaid], [UserId], [UserName], [UserEmail], [Designation], [Role], [UnitId], [UnitName], [ApproverSequence]) VALUES (4, 1154, N'Shane Baldsing', N'shane.baldsing@sqgc.com', N'Head of Marketing', N'HOM', 2, N'SQ Celsius Unit 2', 2)
INSERT [dbo].[VisitorRoleWiseApprover] ([rwaid], [UserId], [UserName], [UserEmail], [Designation], [Role], [UnitId], [UnitName], [ApproverSequence]) VALUES (5, 1154, N'Shane Baldsing', N'shane.baldsing@sqgc.com', N'Head of Marketing', N'HOM', 1, N'SQ Celsius Unit 1', 2)
INSERT [dbo].[VisitorRoleWiseApprover] ([rwaid], [UserId], [UserName], [UserEmail], [Designation], [Role], [UnitId], [UnitName], [ApproverSequence]) VALUES (6, 1152, N'Presantha Fernando', N'presantha.fernando@sqgc.com', N'Chief Operating Officer', N'COO', 3, N'SQ Birichina', 2)
INSERT [dbo].[VisitorRoleWiseApprover] ([rwaid], [UserId], [UserName], [UserEmail], [Designation], [Role], [UnitId], [UnitName], [ApproverSequence]) VALUES (7, 1155, N'Crishantha Senarath', N'crishantha.senarath@sqgc.com', N'Chief Operating Officer', N'COO', 2, N'SQ Celsius Unit 2', 2)
INSERT [dbo].[VisitorRoleWiseApprover] ([rwaid], [UserId], [UserName], [UserEmail], [Designation], [Role], [UnitId], [UnitName], [ApproverSequence]) VALUES (8, 1155, N'Crishantha Senarath', N'crishantha.senarath@sqgc.com', N'Chief Operating Officer', N'COO', 1, N'SQ Celsius Unit 1', 2)
INSERT [dbo].[VisitorRoleWiseApprover] ([rwaid], [UserId], [UserName], [UserEmail], [Designation], [Role], [UnitId], [UnitName], [ApproverSequence]) VALUES (9, 1174, N'Athula Balasuriya ', N'athula.balasuriya@sqgc.com', N'Chief Operating Officer', N'COO', 5, N'SQ Hues', 2)
INSERT [dbo].[VisitorRoleWiseApprover] ([rwaid], [UserId], [UserName], [UserEmail], [Designation], [Role], [UnitId], [UnitName], [ApproverSequence]) VALUES (10, 26, N'Mahmudul Haque ', N'mahmudul.haque@sqgc.com ', N'Deputy Chief People Officer', N'DCPO', 3, N'SQ Birichina', 2)
INSERT [dbo].[VisitorRoleWiseApprover] ([rwaid], [UserId], [UserName], [UserEmail], [Designation], [Role], [UnitId], [UnitName], [ApproverSequence]) VALUES (11, 26, N'Mahmudul Haque ', N'mahmudul.haque@sqgc.com ', N'Deputy Chief People Officer', N'DCPO', 2, N'SQ Celsius Unit 2', 2)
INSERT [dbo].[VisitorRoleWiseApprover] ([rwaid], [UserId], [UserName], [UserEmail], [Designation], [Role], [UnitId], [UnitName], [ApproverSequence]) VALUES (12, 26, N'Mahmudul Haque ', N'mahmudul.haque@sqgc.com ', N'Deputy Chief People Officer', N'DCPO', 1, N'SQ Celsius Unit 1', 2)
INSERT [dbo].[VisitorRoleWiseApprover] ([rwaid], [UserId], [UserName], [UserEmail], [Designation], [Role], [UnitId], [UnitName], [ApproverSequence]) VALUES (13, 1289, N'Muhammed Sameer Uddin ', N'sameer.uddin@sqgc.com', N'Finance Controller
', N'FC', 3, N'SQ Birichina', 2)
INSERT [dbo].[VisitorRoleWiseApprover] ([rwaid], [UserId], [UserName], [UserEmail], [Designation], [Role], [UnitId], [UnitName], [ApproverSequence]) VALUES (14, 1289, N'Muhammed Sameer Uddin ', N'sameer.uddin@sqgc.com', N'Finance Controller
', N'FC', 1, N'SQ Celsius Unit 1', 2)
INSERT [dbo].[VisitorRoleWiseApprover] ([rwaid], [UserId], [UserName], [UserEmail], [Designation], [Role], [UnitId], [UnitName], [ApproverSequence]) VALUES (15, 1289, N'Muhammed Sameer Uddin ', N'sameer.uddin@sqgc.com', N'Finance Controller
', N'FC', 2, N'SQ Celsius Unit 2', 2)
INSERT [dbo].[VisitorRoleWiseApprover] ([rwaid], [UserId], [UserName], [UserEmail], [Designation], [Role], [UnitId], [UnitName], [ApproverSequence]) VALUES (16, 1289, N'Muhammed Sameer Uddin ', N'sameer.uddin@sqgc.com', N'Finance Controller
', N'FC', 5, N'SQ Hues', 2)
INSERT [dbo].[VisitorRoleWiseApprover] ([rwaid], [UserId], [UserName], [UserEmail], [Designation], [Role], [UnitId], [UnitName], [ApproverSequence]) VALUES (17, 1301, N'Ruwan Kumara', N'ruwan.kumara@sqgc.com', N'Head of Supply Chain
', N'HOSC', 3, N'SQ Birichina', 2)
INSERT [dbo].[VisitorRoleWiseApprover] ([rwaid], [UserId], [UserName], [UserEmail], [Designation], [Role], [UnitId], [UnitName], [ApproverSequence]) VALUES (18, 2, N'Mahbubur Rahman', N'mahbub.rahman@sqgc.com', N'Head of IT
, SQ Group', N'HOIT', 3, N'SQ Birichina', 2)
INSERT [dbo].[VisitorRoleWiseApprover] ([rwaid], [UserId], [UserName], [UserEmail], [Designation], [Role], [UnitId], [UnitName], [ApproverSequence]) VALUES (19, 1301, N'Ruwan Kumara', N'ruwan.kumara@sqgc.com', N'Head of Supply Chain
', N'HOSC', 1, N'SQ Celsius Unit 1', 2)
INSERT [dbo].[VisitorRoleWiseApprover] ([rwaid], [UserId], [UserName], [UserEmail], [Designation], [Role], [UnitId], [UnitName], [ApproverSequence]) VALUES (20, 1301, N'Ruwan Kumara', N'ruwan.kumara@sqgc.com', N'Head of Supply Chain
', N'HOSC', 2, N'SQ Celsius Unit 2', 2)
INSERT [dbo].[VisitorRoleWiseApprover] ([rwaid], [UserId], [UserName], [UserEmail], [Designation], [Role], [UnitId], [UnitName], [ApproverSequence]) VALUES (21, 1301, N'Ruwan Kumara', N'ruwan.kumara@sqgc.com', N'Head of Supply Chain
', N'HOSC', 5, N'SQ Hues', 2)
INSERT [dbo].[VisitorRoleWiseApprover] ([rwaid], [UserId], [UserName], [UserEmail], [Designation], [Role], [UnitId], [UnitName], [ApproverSequence]) VALUES (22, 2, N'Mahbubur Rahman', N'mahbub.rahman@sqgc.com', N'Head of IT
, SQ Group', N'HOIT', 1, N'SQ Celsius Unit 1', 2)
INSERT [dbo].[VisitorRoleWiseApprover] ([rwaid], [UserId], [UserName], [UserEmail], [Designation], [Role], [UnitId], [UnitName], [ApproverSequence]) VALUES (23, 2, N'Mahbubur Rahman', N'mahbub.rahman@sqgc.com', N'Head of IT
, SQ Group', N'HOIT', 2, N'SQ Celsius Unit 2', 2)
INSERT [dbo].[VisitorRoleWiseApprover] ([rwaid], [UserId], [UserName], [UserEmail], [Designation], [Role], [UnitId], [UnitName], [ApproverSequence]) VALUES (24, 2, N'Mahbubur Rahman', N'mahbub.rahman@sqgc.com', N'Head of IT
, SQ Group', N'HOIT', 5, N'SQ Hues', 2)
INSERT [dbo].[VisitorRoleWiseApprover] ([rwaid], [UserId], [UserName], [UserEmail], [Designation], [Role], [UnitId], [UnitName], [ApproverSequence]) VALUES (25, 17, N'Ashique Emdad', N'ashique.emdad@sqgc.com ', N'Head of Factory HR, Birichina', N'HOHR', 3, N'SQ Birichina', 1)
INSERT [dbo].[VisitorRoleWiseApprover] ([rwaid], [UserId], [UserName], [UserEmail], [Designation], [Role], [UnitId], [UnitName], [ApproverSequence]) VALUES (26, 34, N'Shahriat Hossain', N'shahriat.hossain@sqgc.com', N'Head of Station Administration', N'HOS', 6, N'SQ Station', 1)
INSERT [dbo].[VisitorRoleWiseApprover] ([rwaid], [UserId], [UserName], [UserEmail], [Designation], [Role], [UnitId], [UnitName], [ApproverSequence]) VALUES (27, 1297, N'Mahabub A Rabby', N'mahabub.rabby@sqgc.com', N'Manager, HR, SQ Celsius Ltd., Unit-2', N'HOHR', 2, N'SQ Station', 1)
INSERT [dbo].[VisitorRoleWiseApprover] ([rwaid], [UserId], [UserName], [UserEmail], [Designation], [Role], [UnitId], [UnitName], [ApproverSequence]) VALUES (28, 1162, N'Asad Hossain', N'asad.hossain@sqgc.com', N'GM, Shipping & Logistics', N'GM, Shipping & Logistics
', 2, N'SQ Celsius Unit 2', 2)
INSERT [dbo].[VisitorRoleWiseApprover] ([rwaid], [UserId], [UserName], [UserEmail], [Designation], [Role], [UnitId], [UnitName], [ApproverSequence]) VALUES (29, 1162, N'Asad Hossain', N'asad.hossain@sqgc.com', N'GM, Shipping & Logistics', N'GM, Shipping & Logistics', 3, N'SQ Birichina', 2)
INSERT [dbo].[VisitorRoleWiseApprover] ([rwaid], [UserId], [UserName], [UserEmail], [Designation], [Role], [UnitId], [UnitName], [ApproverSequence]) VALUES (30, 1162, N'Asad Hossain', N'asad.hossain@sqgc.com', N'GM, Shipping & Logistics', N'GM, Shipping & Logistics', 5, N'SQ Hues', 2)
INSERT [dbo].[VisitorRoleWiseApprover] ([rwaid], [UserId], [UserName], [UserEmail], [Designation], [Role], [UnitId], [UnitName], [ApproverSequence]) VALUES (31, 1306, N'J.M.A.C. Jayakody', N'j.m.jayakody@sqgc.com', N'Head of Quality
', N'HOQ', 2, N'SQ Celsius Unit 2', 2)
INSERT [dbo].[VisitorRoleWiseApprover] ([rwaid], [UserId], [UserName], [UserEmail], [Designation], [Role], [UnitId], [UnitName], [ApproverSequence]) VALUES (32, 1327, N'Nazmul Hasan', N'nazmul.hasan@sqgc.com', N'Manager, HR, SQ Hues Ltd', N'HOHR', 5, N'SQ Hues', 1)
INSERT [dbo].[VisitorRoleWiseApprover] ([rwaid], [UserId], [UserName], [UserEmail], [Designation], [Role], [UnitId], [UnitName], [ApproverSequence]) VALUES (33, 16, N'A S M Enamul Hassan', N'enamul.hassan@sqgc.com', N'Head of Factory HR', N'HOHR', 4, N'SQ ColBlanc', 1)
INSERT [dbo].[VisitorRoleWiseApprover] ([rwaid], [UserId], [UserName], [UserEmail], [Designation], [Role], [UnitId], [UnitName], [ApproverSequence]) VALUES (34, 32, N'Kazi Iqbal Hossain', N'iqbal.hossain@sqgc.com', N'Manager, Admin & Compliance', N'HOHR', 1, N'SQ Celsius Unit 1 ', 1)
INSERT [dbo].[VisitorRoleWiseApprover] ([rwaid], [UserId], [UserName], [UserEmail], [Designation], [Role], [UnitId], [UnitName], [ApproverSequence]) VALUES (35, 17, N'Ashique Emdad', N'ashique.emdad@sqgc.com ', N'Head of Factory HR, Birichina', N'TBA', 3, N'SQ Birichina', 1)
INSERT [dbo].[VisitorRoleWiseApprover] ([rwaid], [UserId], [UserName], [UserEmail], [Designation], [Role], [UnitId], [UnitName], [ApproverSequence]) VALUES (1032, 7, N'Saliya Sellahewa', N'saliya.sellahewa@sqgc.com', N'Deputy Chief Executive', N'DCEO', 3, N'SQ Birichina', 2)
INSERT [dbo].[VisitorRoleWiseApprover] ([rwaid], [UserId], [UserName], [UserEmail], [Designation], [Role], [UnitId], [UnitName], [ApproverSequence]) VALUES (1033, 1156, N'Parakrama Ekanayake', N'parakrama.ekanayake@sqgc.com', N'Deputy Chief Executive', N'DCEO', 2, N'SQ Celsius Unit 2', 2)
INSERT [dbo].[VisitorRoleWiseApprover] ([rwaid], [UserId], [UserName], [UserEmail], [Designation], [Role], [UnitId], [UnitName], [ApproverSequence]) VALUES (1034, 1156, N'Parakrama Ekanayake', N'parakrama.ekanayake@sqgc.com', N'Deputy Chief Executive', N'DCEO', 1, N'SQ Celsius Unit 1', 2)
INSERT [dbo].[VisitorRoleWiseApprover] ([rwaid], [UserId], [UserName], [UserEmail], [Designation], [Role], [UnitId], [UnitName], [ApproverSequence]) VALUES (1035, 1307, N'Chandrawansa Bandara', N'chandrawansa.bandara@sqgc.com', N'Head of Quality
', N'HOQ', 3, N'SQ Birichina', 2)
INSERT [dbo].[VisitorRoleWiseApprover] ([rwaid], [UserId], [UserName], [UserEmail], [Designation], [Role], [UnitId], [UnitName], [ApproverSequence]) VALUES (1037, 3, N'Shihan Hassan ', N'shihan.hassan@sqgc.com', N'Chief, Innovation, Infrastructure Architecture & Engineering', N'CIO', 1, N'SQ Celsius Unit 1', 2)
INSERT [dbo].[VisitorRoleWiseApprover] ([rwaid], [UserId], [UserName], [UserEmail], [Designation], [Role], [UnitId], [UnitName], [ApproverSequence]) VALUES (1038, 3, N'Shihan Hassan ', N'shihan.hassan@sqgc.com', N'Chief, Innovation, Infrastructure Architecture & Engineering', N'CIO', 2, N'SQ Celsius Unit 2', 2)
INSERT [dbo].[VisitorRoleWiseApprover] ([rwaid], [UserId], [UserName], [UserEmail], [Designation], [Role], [UnitId], [UnitName], [ApproverSequence]) VALUES (1039, 3, N'Shihan Hassan ', N'shihan.hassan@sqgc.com', N'Chief, Innovation, Infrastructure Architecture & Engineering', N'CIO', 3, N'SQ Birichina', 2)
INSERT [dbo].[VisitorRoleWiseApprover] ([rwaid], [UserId], [UserName], [UserEmail], [Designation], [Role], [UnitId], [UnitName], [ApproverSequence]) VALUES (1040, 3, N'Shihan Hassan ', N'shihan.hassan@sqgc.com', N'Chief, Innovation, Infrastructure Architecture & Engineering', N'CIO', 4, N'SQ ColBlanc', 2)
INSERT [dbo].[VisitorRoleWiseApprover] ([rwaid], [UserId], [UserName], [UserEmail], [Designation], [Role], [UnitId], [UnitName], [ApproverSequence]) VALUES (1041, 6, N'Senthil Selvan', N'senthil.selvan@sqgc.com', N'Chief Executive', N'CE', 3, N'SQ Birichina', 2)
INSERT [dbo].[VisitorRoleWiseApprover] ([rwaid], [UserId], [UserName], [UserEmail], [Designation], [Role], [UnitId], [UnitName], [ApproverSequence]) VALUES (1042, 6, N'Senthil Selvan', N'senthil.selvan@sqgc.com', N'Chief Executive', N'CE', 2, N'SQ Celsius Unit 2', 2)
INSERT [dbo].[VisitorRoleWiseApprover] ([rwaid], [UserId], [UserName], [UserEmail], [Designation], [Role], [UnitId], [UnitName], [ApproverSequence]) VALUES (1043, 6, N'Senthil Selvan', N'senthil.selvan@sqgc.com', N'Chief Executive', N'CE', 4, N'SQ ColBlanc', 2)
INSERT [dbo].[VisitorRoleWiseApprover] ([rwaid], [UserId], [UserName], [UserEmail], [Designation], [Role], [UnitId], [UnitName], [ApproverSequence]) VALUES (1044, 11, N'Sarath Padmasiri ', N'sarath.padmasiri@sqgc.com', N'Chief Executive', N'CE', 5, N'SQ Hues', 2)
INSERT [dbo].[VisitorRoleWiseApprover] ([rwaid], [UserId], [UserName], [UserEmail], [Designation], [Role], [UnitId], [UnitName], [ApproverSequence]) VALUES (2037, 1152, N'Presantha Fernando', N'presantha.fernando@sqgc.com', N'Chief Operating Officer', N'COO', 4, N'SQ ColBlanc', 2)
INSERT [dbo].[VisitorRoleWiseApprover] ([rwaid], [UserId], [UserName], [UserEmail], [Designation], [Role], [UnitId], [UnitName], [ApproverSequence]) VALUES (2038, 1154, N'Shane Baldsing', N'shane.baldsing@sqgc.com', N'Head of Marketing', N'HOM', 4, N'SQ Celsius Unit 1', 2)
INSERT [dbo].[VisitorRoleWiseApprover] ([rwaid], [UserId], [UserName], [UserEmail], [Designation], [Role], [UnitId], [UnitName], [ApproverSequence]) VALUES (2039, 1321, N'Athula Chandana Lankatilleke', N'athul.lankatilleke@sqgc.com', N'Head of Quality', N'HOQ', 1, N'SQ Celsius Unit 1', 2)
INSERT [dbo].[VisitorRoleWiseApprover] ([rwaid], [UserId], [UserName], [UserEmail], [Designation], [Role], [UnitId], [UnitName], [ApproverSequence]) VALUES (2041, 1307, N'Chandrawansa Bandara', N'chandrawansa.bandara@sqgc.com', N'Head of Quality', N'HOQ', 4, N'SQ ColBlanc', 2)
INSERT [dbo].[VisitorRoleWiseApprover] ([rwaid], [UserId], [UserName], [UserEmail], [Designation], [Role], [UnitId], [UnitName], [ApproverSequence]) VALUES (2042, 26, N'Mahmudul Haque ', N'mahmudul.haque@sqgc.com ', N'Deputy Chief People Officer', N'DCPO', 5, N'SQ Hues', 2)
INSERT [dbo].[VisitorRoleWiseApprover] ([rwaid], [UserId], [UserName], [UserEmail], [Designation], [Role], [UnitId], [UnitName], [ApproverSequence]) VALUES (2043, 26, N'Mahmudul Haque ', N'mahmudul.haque@sqgc.com ', N'Deputy Chief People Officer', N'DCPO', 4, N'SQ ColBlanc', 2)
INSERT [dbo].[VisitorRoleWiseApprover] ([rwaid], [UserId], [UserName], [UserEmail], [Designation], [Role], [UnitId], [UnitName], [ApproverSequence]) VALUES (2044, 1289, N'Muhammed Sameer Uddin ', N'sameer.uddin@sqgc.com', N'Finance Controller', N'FC', 4, N'SQ ColBlanc', 2)
INSERT [dbo].[VisitorRoleWiseApprover] ([rwaid], [UserId], [UserName], [UserEmail], [Designation], [Role], [UnitId], [UnitName], [ApproverSequence]) VALUES (2046, 1301, N'Ruwan Kumara', N'ruwan.kumara@sqgc.com', N'Head of Supply Chain', N'HOSC', 4, N'SQ ColBlanc', 2)
INSERT [dbo].[VisitorRoleWiseApprover] ([rwaid], [UserId], [UserName], [UserEmail], [Designation], [Role], [UnitId], [UnitName], [ApproverSequence]) VALUES (2048, 6, N'Senthil Selvan', N'senthil.selvan@sqgc.com', N'Chief Executive', N'CE', 1, N'SQ Celsius Unit 1', 2)
INSERT [dbo].[VisitorRoleWiseApprover] ([rwaid], [UserId], [UserName], [UserEmail], [Designation], [Role], [UnitId], [UnitName], [ApproverSequence]) VALUES (2049, 2, N'Mahbubur Rahman', N'mahbub.rahman@sqgc.com', N'Head of IT
', N'HOIT', 4, N'SQ ColBlanc', 2)
INSERT [dbo].[VisitorRoleWiseApprover] ([rwaid], [UserId], [UserName], [UserEmail], [Designation], [Role], [UnitId], [UnitName], [ApproverSequence]) VALUES (2050, 1162, N'Asad Hossain', N'asad.hossain@sqgc.com', N'GM, Shipping & Logistics', N'GM, Shipping & Logistics', 1, N'SQ Celsius Unit 1 ', 2)
INSERT [dbo].[VisitorRoleWiseApprover] ([rwaid], [UserId], [UserName], [UserEmail], [Designation], [Role], [UnitId], [UnitName], [ApproverSequence]) VALUES (2051, 1162, N'Asad Hossain', N'asad.hossain@sqgc.com', N'GM, Shipping & Logistics', N'GM, Shipping & Logistics', 2, N'SQ Celsius Unit 2 ', 2)
INSERT [dbo].[VisitorRoleWiseApprover] ([rwaid], [UserId], [UserName], [UserEmail], [Designation], [Role], [UnitId], [UnitName], [ApproverSequence]) VALUES (2052, 1162, N'Asad Hossain', N'asad.hossain@sqgc.com', N'GM, Shipping & Logistics', N'GM, Shipping & Logistics', 4, N'SQ ColBlanc', 2)
INSERT [dbo].[VisitorRoleWiseApprover] ([rwaid], [UserId], [UserName], [UserEmail], [Designation], [Role], [UnitId], [UnitName], [ApproverSequence]) VALUES (2053, 30, N'Front Desk', N'frontdesk.central@sqgc.com', N'Front Desk', N'Front Desk', NULL, NULL, 10)
INSERT [dbo].[VisitorRoleWiseApprover] ([rwaid], [UserId], [UserName], [UserEmail], [Designation], [Role], [UnitId], [UnitName], [ApproverSequence]) VALUES (2054, 1303, N'Celsius One Gate', N'celsius1.gate@sqgc.com', N'Celsius One Gate', N'Celsius One Gate', NULL, NULL, 10)
INSERT [dbo].[VisitorRoleWiseApprover] ([rwaid], [UserId], [UserName], [UserEmail], [Designation], [Role], [UnitId], [UnitName], [ApproverSequence]) VALUES (2055, 1302, N'Station Access', N'stationaccess@sqgc.com', N'Station Access', N'Station Access', NULL, NULL, 10)
INSERT [dbo].[VisitorRoleWiseApprover] ([rwaid], [UserId], [UserName], [UserEmail], [Designation], [Role], [UnitId], [UnitName], [ApproverSequence]) VALUES (2056, 1358, N'Shakhawat Hossain', N'shakhawat.hossain@sqgc.com', N'Head of Quality & Technical, QA, SQCL', N'HOQ', 5, N'Hues', 2)
INSERT [dbo].[VisitorRoleWiseApprover] ([rwaid], [UserId], [UserName], [UserEmail], [Designation], [Role], [UnitId], [UnitName], [ApproverSequence]) VALUES (2057, 34, N'Shahriat Hossain', N'shahriat.hossain@sqgc.com', N'Head of Station Administration', N'HOS', 2, N'SQ Celsius Unit 2', 1)
INSERT [dbo].[VisitorRoleWiseApprover] ([rwaid], [UserId], [UserName], [UserEmail], [Designation], [Role], [UnitId], [UnitName], [ApproverSequence]) VALUES (2058, 34, N'Shahriat Hossain', N'shahriat.hossain@sqgc.com', N'Head of Station Administration', N'HOS', 3, N'SQ Birichina', 1)
INSERT [dbo].[VisitorRoleWiseApprover] ([rwaid], [UserId], [UserName], [UserEmail], [Designation], [Role], [UnitId], [UnitName], [ApproverSequence]) VALUES (2059, 34, N'Shahriat Hossain', N'shahriat.hossain@sqgc.com', N'Head of Station Administration', N'HOS', 4, N'SQ ColBlanc', 1)
INSERT [dbo].[VisitorRoleWiseApprover] ([rwaid], [UserId], [UserName], [UserEmail], [Designation], [Role], [UnitId], [UnitName], [ApproverSequence]) VALUES (2060, 34, N'Shahriat Hossain', N'shahriat.hossain@sqgc.com', N'Head of Station Administration', N'HOS', 5, N'SQ Hues', 1)
INSERT [dbo].[VisitorRoleWiseApprover] ([rwaid], [UserId], [UserName], [UserEmail], [Designation], [Role], [UnitId], [UnitName], [ApproverSequence]) VALUES (2061, 26, N'Mahmudul Haque ', N'mahmudul.haque@sqgc.com ', N'Deputy Chief People Officer', N'DCPO', 6, N'Station', 2)
SET IDENTITY_INSERT [dbo].[VisitorRoleWiseApprover] OFF
GO
