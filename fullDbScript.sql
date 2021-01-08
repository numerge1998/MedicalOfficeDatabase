USE [master]
GO
/****** Object:  Database [CabinetMedical]    Script Date: 12/3/2020 6:35:57 PM ******/
CREATE DATABASE [CabinetMedical]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CabinetMedical', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\CabinetMedical.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CabinetMedical_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\CabinetMedical_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [CabinetMedical] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CabinetMedical].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CabinetMedical] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CabinetMedical] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CabinetMedical] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CabinetMedical] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CabinetMedical] SET ARITHABORT OFF 
GO
ALTER DATABASE [CabinetMedical] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CabinetMedical] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CabinetMedical] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CabinetMedical] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CabinetMedical] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CabinetMedical] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CabinetMedical] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CabinetMedical] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CabinetMedical] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CabinetMedical] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CabinetMedical] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CabinetMedical] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CabinetMedical] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CabinetMedical] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CabinetMedical] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CabinetMedical] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CabinetMedical] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CabinetMedical] SET RECOVERY FULL 
GO
ALTER DATABASE [CabinetMedical] SET  MULTI_USER 
GO
ALTER DATABASE [CabinetMedical] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CabinetMedical] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CabinetMedical] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CabinetMedical] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CabinetMedical] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'CabinetMedical', N'ON'
GO
ALTER DATABASE [CabinetMedical] SET QUERY_STORE = OFF
GO
USE [CabinetMedical]
GO
/****** Object:  User [pacient_user]    Script Date: 12/3/2020 6:35:57 PM ******/
CREATE USER [pacient_user] FOR LOGIN [pacient_user] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [doctor_user]    Script Date: 12/3/2020 6:35:57 PM ******/
CREATE USER [doctor_user] FOR LOGIN [doctor_user] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [asistent_user]    Script Date: 12/3/2020 6:35:57 PM ******/
CREATE USER [asistent_user] FOR LOGIN [asistent_user] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [admin_user]    Script Date: 12/3/2020 6:35:57 PM ******/
CREATE USER [admin_user] FOR LOGIN [admin_user] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  DatabaseRole [pacient_role]    Script Date: 12/3/2020 6:35:57 PM ******/
CREATE ROLE [pacient_role]
GO
/****** Object:  DatabaseRole [doctor_role]    Script Date: 12/3/2020 6:35:57 PM ******/
CREATE ROLE [doctor_role]
GO
/****** Object:  DatabaseRole [asistent_role]    Script Date: 12/3/2020 6:35:57 PM ******/
CREATE ROLE [asistent_role]
GO
/****** Object:  DatabaseRole [admin_role]    Script Date: 12/3/2020 6:35:57 PM ******/
CREATE ROLE [admin_role]
GO
ALTER ROLE [pacient_role] ADD MEMBER [pacient_user]
GO
ALTER ROLE [doctor_role] ADD MEMBER [doctor_user]
GO
ALTER ROLE [asistent_role] ADD MEMBER [asistent_user]
GO
ALTER ROLE [admin_role] ADD MEMBER [admin_user]
GO
/****** Object:  Table [dbo].[Asistent]    Script Date: 12/3/2020 6:35:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Asistent](
	[id_asistent] [int] NOT NULL,
	[nume] [varchar](50) NULL,
	[prenume] [varchar](50) NULL,
	[varsta] [int] NULL,
	[id_sediu] [int] NULL,
 CONSTRAINT [PK_Asistent] PRIMARY KEY CLUSTERED 
(
	[id_asistent] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pacient]    Script Date: 12/3/2020 6:35:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pacient](
	[id_pacient] [int] NOT NULL,
	[nume] [varchar](50) NULL,
	[prenume] [varchar](50) NULL,
	[cnp] [varchar](50) NULL,
	[varsta] [int] NULL,
	[data_nasterii] [date] NULL,
	[id_doctor] [int] NULL,
	[id_asistent] [int] NULL,
 CONSTRAINT [PK_Pacient] PRIMARY KEY CLUSTERED 
(
	[id_pacient] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[PacientiiAsistentului]    Script Date: 12/3/2020 6:35:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PacientiiAsistentului]
AS  
SELECT p.nume, p.prenume  
FROM Pacient p join Asistent a   
ON p.id_asistent = a.id_asistent ;   
GO
/****** Object:  Table [dbo].[Doctor]    Script Date: 12/3/2020 6:35:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctor](
	[id_doctor] [int] NOT NULL,
	[nume] [varchar](50) NULL,
	[prenume] [varchar](50) NULL,
	[varsta] [int] NULL,
	[id_sediu] [int] NULL,
 CONSTRAINT [PK_Doctor] PRIMARY KEY CLUSTERED 
(
	[id_doctor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[PacientiiDoctorului]    Script Date: 12/3/2020 6:35:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PacientiiDoctorului]
AS  
SELECT p.nume, p.prenume  
FROM Pacient p join Doctor d   
ON p.id_doctor = d.id_doctor ;   
GO
/****** Object:  Table [dbo].[Echipament]    Script Date: 12/3/2020 6:35:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Echipament](
	[id_echipament] [int] NOT NULL,
	[nume] [varchar](50) NULL,
	[cantitate] [int] NULL,
	[id_sediu] [int] NULL,
 CONSTRAINT [PK_Echipament] PRIMARY KEY CLUSTERED 
(
	[id_echipament] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Furnizor]    Script Date: 12/3/2020 6:35:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Furnizor](
	[id_furnizor] [int] NOT NULL,
	[nume] [varchar](50) NULL,
	[id_sediu] [int] NULL,
 CONSTRAINT [PK_Furnizor] PRIMARY KEY CLUSTERED 
(
	[id_furnizor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Furnizor_Echipament]    Script Date: 12/3/2020 6:35:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Furnizor_Echipament](
	[id_furnizor] [int] NOT NULL,
	[id_echipament] [int] NOT NULL,
 CONSTRAINT [PK_Furnizor_Echipament] PRIMARY KEY CLUSTERED 
(
	[id_furnizor] ASC,
	[id_echipament] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicament]    Script Date: 12/3/2020 6:35:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicament](
	[id_medicament] [int] NOT NULL,
	[nume] [varchar](50) NULL,
	[dozaj] [varchar](50) NULL,
 CONSTRAINT [PK_Medicament] PRIMARY KEY CLUSTERED 
(
	[id_medicament] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Program]    Script Date: 12/3/2020 6:35:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Program](
	[id_program] [int] NOT NULL,
	[data_program] [date] NULL,
	[ora_inceput] [int] NULL,
	[ora_sfarsit] [int] NULL,
	[id_doctor] [int] NULL,
 CONSTRAINT [PK_Program] PRIMARY KEY CLUSTERED 
(
	[id_program] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reteta_Medicament]    Script Date: 12/3/2020 6:35:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reteta_Medicament](
	[id_reteta] [int] NOT NULL,
	[id_medicament] [int] NOT NULL,
 CONSTRAINT [PK_Reteta_Medicament] PRIMARY KEY CLUSTERED 
(
	[id_reteta] ASC,
	[id_medicament] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RetetaMedicala]    Script Date: 12/3/2020 6:35:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RetetaMedicala](
	[id_reteta] [int] NOT NULL,
	[numar] [int] NULL,
	[id_doctor] [int] NULL,
	[id_pacient] [int] NULL,
 CONSTRAINT [PK_RetetaMedicala] PRIMARY KEY CLUSTERED 
(
	[id_reteta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sediu]    Script Date: 12/3/2020 6:35:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sediu](
	[id_sediu] [int] NOT NULL,
	[adresa] [varchar](50) NULL,
 CONSTRAINT [PK_Sediu] PRIMARY KEY CLUSTERED 
(
	[id_sediu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Asistent]  WITH CHECK ADD  CONSTRAINT [FK_Asistent_Sediu] FOREIGN KEY([id_sediu])
REFERENCES [dbo].[Sediu] ([id_sediu])
GO
ALTER TABLE [dbo].[Asistent] CHECK CONSTRAINT [FK_Asistent_Sediu]
GO
ALTER TABLE [dbo].[Doctor]  WITH CHECK ADD  CONSTRAINT [FK_Doctor_Sediu] FOREIGN KEY([id_sediu])
REFERENCES [dbo].[Sediu] ([id_sediu])
GO
ALTER TABLE [dbo].[Doctor] CHECK CONSTRAINT [FK_Doctor_Sediu]
GO
ALTER TABLE [dbo].[Echipament]  WITH CHECK ADD  CONSTRAINT [FK_Echipament_Sediu] FOREIGN KEY([id_sediu])
REFERENCES [dbo].[Sediu] ([id_sediu])
GO
ALTER TABLE [dbo].[Echipament] CHECK CONSTRAINT [FK_Echipament_Sediu]
GO
ALTER TABLE [dbo].[Furnizor]  WITH CHECK ADD  CONSTRAINT [FK_Furnizor_Sediu] FOREIGN KEY([id_sediu])
REFERENCES [dbo].[Sediu] ([id_sediu])
GO
ALTER TABLE [dbo].[Furnizor] CHECK CONSTRAINT [FK_Furnizor_Sediu]
GO
ALTER TABLE [dbo].[Furnizor_Echipament]  WITH CHECK ADD  CONSTRAINT [FK_Furnizor_Echipament_Echipament] FOREIGN KEY([id_echipament])
REFERENCES [dbo].[Echipament] ([id_echipament])
GO
ALTER TABLE [dbo].[Furnizor_Echipament] CHECK CONSTRAINT [FK_Furnizor_Echipament_Echipament]
GO
ALTER TABLE [dbo].[Furnizor_Echipament]  WITH CHECK ADD  CONSTRAINT [FK_Furnizor_Echipament_Furnizor] FOREIGN KEY([id_furnizor])
REFERENCES [dbo].[Furnizor] ([id_furnizor])
GO
ALTER TABLE [dbo].[Furnizor_Echipament] CHECK CONSTRAINT [FK_Furnizor_Echipament_Furnizor]
GO
ALTER TABLE [dbo].[Pacient]  WITH CHECK ADD  CONSTRAINT [FK_Pacient_Asistent] FOREIGN KEY([id_asistent])
REFERENCES [dbo].[Asistent] ([id_asistent])
GO
ALTER TABLE [dbo].[Pacient] CHECK CONSTRAINT [FK_Pacient_Asistent]
GO
ALTER TABLE [dbo].[Pacient]  WITH CHECK ADD  CONSTRAINT [FK_Pacient_Doctor] FOREIGN KEY([id_doctor])
REFERENCES [dbo].[Doctor] ([id_doctor])
GO
ALTER TABLE [dbo].[Pacient] CHECK CONSTRAINT [FK_Pacient_Doctor]
GO
ALTER TABLE [dbo].[Program]  WITH CHECK ADD  CONSTRAINT [FK_Program_Doctor] FOREIGN KEY([id_doctor])
REFERENCES [dbo].[Doctor] ([id_doctor])
GO
ALTER TABLE [dbo].[Program] CHECK CONSTRAINT [FK_Program_Doctor]
GO
ALTER TABLE [dbo].[Reteta_Medicament]  WITH CHECK ADD  CONSTRAINT [FK_Reteta_Medicament_Medicament] FOREIGN KEY([id_medicament])
REFERENCES [dbo].[Medicament] ([id_medicament])
GO
ALTER TABLE [dbo].[Reteta_Medicament] CHECK CONSTRAINT [FK_Reteta_Medicament_Medicament]
GO
ALTER TABLE [dbo].[Reteta_Medicament]  WITH CHECK ADD  CONSTRAINT [FK_Reteta_Medicament_RetetaMedicala] FOREIGN KEY([id_reteta])
REFERENCES [dbo].[RetetaMedicala] ([id_reteta])
GO
ALTER TABLE [dbo].[Reteta_Medicament] CHECK CONSTRAINT [FK_Reteta_Medicament_RetetaMedicala]
GO
ALTER TABLE [dbo].[RetetaMedicala]  WITH CHECK ADD  CONSTRAINT [FK_RetetaMedicala_Doctor] FOREIGN KEY([id_doctor])
REFERENCES [dbo].[Doctor] ([id_doctor])
GO
ALTER TABLE [dbo].[RetetaMedicala] CHECK CONSTRAINT [FK_RetetaMedicala_Doctor]
GO
ALTER TABLE [dbo].[RetetaMedicala]  WITH CHECK ADD  CONSTRAINT [FK_RetetaMedicala_Pacient] FOREIGN KEY([id_pacient])
REFERENCES [dbo].[Pacient] ([id_pacient])
GO
ALTER TABLE [dbo].[RetetaMedicala] CHECK CONSTRAINT [FK_RetetaMedicala_Pacient]
GO
USE [master]
GO
ALTER DATABASE [CabinetMedical] SET  READ_WRITE 
GO
