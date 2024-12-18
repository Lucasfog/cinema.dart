USE [master]
GO
/****** Object:  Database [cine_match]    Script Date: 22/11/2024 20:07:16 ******/
CREATE DATABASE [cine_match]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'cine_match', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\cine_match.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'cine_match_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\cine_match_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [cine_match] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [cine_match].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [cine_match] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [cine_match] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [cine_match] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [cine_match] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [cine_match] SET ARITHABORT OFF 
GO
ALTER DATABASE [cine_match] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [cine_match] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [cine_match] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [cine_match] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [cine_match] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [cine_match] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [cine_match] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [cine_match] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [cine_match] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [cine_match] SET  DISABLE_BROKER 
GO
ALTER DATABASE [cine_match] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [cine_match] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [cine_match] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [cine_match] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [cine_match] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [cine_match] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [cine_match] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [cine_match] SET RECOVERY FULL 
GO
ALTER DATABASE [cine_match] SET  MULTI_USER 
GO
ALTER DATABASE [cine_match] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [cine_match] SET DB_CHAINING OFF 
GO
ALTER DATABASE [cine_match] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [cine_match] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [cine_match] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [cine_match] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'cine_match', N'ON'
GO
ALTER DATABASE [cine_match] SET QUERY_STORE = ON
GO
ALTER DATABASE [cine_match] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [cine_match]
GO
/****** Object:  User [teste]    Script Date: 22/11/2024 20:07:16 ******/
CREATE USER [teste] FOR LOGIN [teste] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [teste]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [teste]
GO
/****** Object:  Table [dbo].[FilmesFavoritos]    Script Date: 22/11/2024 20:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FilmesFavoritos](
	[IdFavorito] [int] IDENTITY(1,1) NOT NULL,
	[IdUser] [int] NOT NULL,
	[IdFilme] [int] NULL,
	[AdicionadoEm] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdFavorito] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PasswordReset]    Script Date: 22/11/2024 20:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PasswordReset](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserEmail] [nvarchar](255) NOT NULL,
	[ResetCode] [nvarchar](10) NOT NULL,
	[ExpiryTime] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuarios]    Script Date: 22/11/2024 20:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuarios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nome] [nvarchar](100) NOT NULL,
	[sobrenome] [nvarchar](100) NOT NULL,
	[email] [nvarchar](255) NOT NULL,
	[data_nascimento] [date] NOT NULL,
	[senha] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FilmesFavoritos] ADD  DEFAULT (getdate()) FOR [AdicionadoEm]
GO
ALTER TABLE [dbo].[FilmesFavoritos]  WITH CHECK ADD  CONSTRAINT [FK_User_Favorites] FOREIGN KEY([IdUser])
REFERENCES [dbo].[usuarios] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FilmesFavoritos] CHECK CONSTRAINT [FK_User_Favorites]
GO
/****** Object:  StoredProcedure [dbo].[GenerateResetCode]    Script Date: 22/11/2024 20:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GenerateResetCode]
    @Email NVARCHAR(255)
AS
BEGIN
    DECLARE @Code NVARCHAR(6)
    DECLARE @ExpiryTime DATETIME
    DECLARE @Nome NVARCHAR(255)

    -- Verificar se o email existe no sistema
    IF EXISTS (SELECT 1 FROM usuarios WHERE email = @Email)
    BEGIN
        -- Obter o nome do usuário correspondente
        SELECT @Nome = nome FROM usuarios WHERE email = @Email

        -- Gerar um código aleatório de 6 caracteres alfanuméricos
        SET @Code = RIGHT(CONVERT(VARCHAR(50), NEWID()), 6)
        SET @ExpiryTime = DATEADD(MINUTE, 5, GETDATE())

        -- Inserir o código na tabela de recuperação de senha
        INSERT INTO PasswordReset (UserEmail, ResetCode, ExpiryTime)
        VALUES (@Email, @Code, @ExpiryTime)

        -- Retornar o código gerado e o nome do usuário
        SELECT 
            @Code AS ResetCode,
            @Nome AS Nome
    END
    ELSE
    BEGIN
        -- Retornar erro se o email não for encontrado
        RAISERROR('Email não encontrado.', 16, 1)
    END
END
GO
USE [master]
GO
ALTER DATABASE [cine_match] SET  READ_WRITE 
GO
