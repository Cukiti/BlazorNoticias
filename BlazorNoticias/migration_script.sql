IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;
GO

BEGIN TRANSACTION;
CREATE TABLE [AspNetRoles] (
    [Id] nvarchar(450) NOT NULL,
    [Name] nvarchar(256) NULL,
    [NormalizedName] nvarchar(256) NULL,
    [ConcurrencyStamp] nvarchar(max) NULL,
    CONSTRAINT [PK_AspNetRoles] PRIMARY KEY ([Id])
);

CREATE TABLE [AspNetUsers] (
    [Id] nvarchar(450) NOT NULL,
    [UserName] nvarchar(256) NULL,
    [NormalizedUserName] nvarchar(256) NULL,
    [Email] nvarchar(256) NULL,
    [NormalizedEmail] nvarchar(256) NULL,
    [EmailConfirmed] bit NOT NULL,
    [PasswordHash] nvarchar(max) NULL,
    [SecurityStamp] nvarchar(max) NULL,
    [ConcurrencyStamp] nvarchar(max) NULL,
    [PhoneNumber] nvarchar(max) NULL,
    [PhoneNumberConfirmed] bit NOT NULL,
    [TwoFactorEnabled] bit NOT NULL,
    [LockoutEnd] datetimeoffset NULL,
    [LockoutEnabled] bit NOT NULL,
    [AccessFailedCount] int NOT NULL,
    CONSTRAINT [PK_AspNetUsers] PRIMARY KEY ([Id])
);

CREATE TABLE [AspNetRoleClaims] (
    [Id] int NOT NULL IDENTITY,
    [RoleId] nvarchar(450) NOT NULL,
    [ClaimType] nvarchar(max) NULL,
    [ClaimValue] nvarchar(max) NULL,
    CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [AspNetRoles] ([Id]) ON DELETE CASCADE
);

CREATE TABLE [AspNetUserClaims] (
    [Id] int NOT NULL IDENTITY,
    [UserId] nvarchar(450) NOT NULL,
    [ClaimType] nvarchar(max) NULL,
    [ClaimValue] nvarchar(max) NULL,
    CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
);

CREATE TABLE [AspNetUserLogins] (
    [LoginProvider] nvarchar(450) NOT NULL,
    [ProviderKey] nvarchar(450) NOT NULL,
    [ProviderDisplayName] nvarchar(max) NULL,
    [UserId] nvarchar(450) NOT NULL,
    CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY ([LoginProvider], [ProviderKey]),
    CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
);

CREATE TABLE [AspNetUserRoles] (
    [UserId] nvarchar(450) NOT NULL,
    [RoleId] nvarchar(450) NOT NULL,
    CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY ([UserId], [RoleId]),
    CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [AspNetRoles] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
);

CREATE TABLE [AspNetUserTokens] (
    [UserId] nvarchar(450) NOT NULL,
    [LoginProvider] nvarchar(450) NOT NULL,
    [Name] nvarchar(450) NOT NULL,
    [Value] nvarchar(max) NULL,
    CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY ([UserId], [LoginProvider], [Name]),
    CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
);

CREATE INDEX [IX_AspNetRoleClaims_RoleId] ON [AspNetRoleClaims] ([RoleId]);

CREATE UNIQUE INDEX [RoleNameIndex] ON [AspNetRoles] ([NormalizedName]) WHERE [NormalizedName] IS NOT NULL;

CREATE INDEX [IX_AspNetUserClaims_UserId] ON [AspNetUserClaims] ([UserId]);

CREATE INDEX [IX_AspNetUserLogins_UserId] ON [AspNetUserLogins] ([UserId]);

CREATE INDEX [IX_AspNetUserRoles_RoleId] ON [AspNetUserRoles] ([RoleId]);

CREATE INDEX [EmailIndex] ON [AspNetUsers] ([NormalizedEmail]);

CREATE UNIQUE INDEX [UserNameIndex] ON [AspNetUsers] ([NormalizedUserName]) WHERE [NormalizedUserName] IS NOT NULL;

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'00000000000000_CreateIdentitySchema', N'9.0.3');

ALTER TABLE [AspNetUsers] ADD [Apellido] nvarchar(100) NOT NULL DEFAULT N'';

ALTER TABLE [AspNetUsers] ADD [Fecha_de_Nacimiento] nvarchar(50) NOT NULL DEFAULT N'';

ALTER TABLE [AspNetUsers] ADD [Nombre] nvarchar(50) NOT NULL DEFAULT N'';

ALTER TABLE [AspNetUsers] ADD [Nombre_de_compañia] nvarchar(100) NOT NULL DEFAULT N'';

ALTER TABLE [AspNetUsers] ADD [Pais_de_residencia] nvarchar(50) NOT NULL DEFAULT N'';

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20250325215201_Adduserprofileaditionals', N'9.0.3');

ALTER TABLE [AspNetUsers] ADD [Cardnet] nvarchar(30) NOT NULL DEFAULT N'';

ALTER TABLE [AspNetUsers] ADD [Genero] nvarchar(30) NOT NULL DEFAULT N'';

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20250325215859_Adduserprofileaditionalss', N'9.0.3');

ALTER TABLE [AspNetUsers] ADD [CreacionAccount] datetime2 NOT NULL DEFAULT '0001-01-01T00:00:00.0000000';

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20250325220229_Adduserprofileaditionalss1', N'9.0.3');

DECLARE @var sysname;
SELECT @var = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[AspNetUsers]') AND [c].[name] = N'Fecha_de_Nacimiento');
IF @var IS NOT NULL EXEC(N'ALTER TABLE [AspNetUsers] DROP CONSTRAINT [' + @var + '];');
ALTER TABLE [AspNetUsers] ALTER COLUMN [Fecha_de_Nacimiento] datetime2 NOT NULL;

DECLARE @var1 sysname;
SELECT @var1 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[AspNetUsers]') AND [c].[name] = N'Cardnet');
IF @var1 IS NOT NULL EXEC(N'ALTER TABLE [AspNetUsers] DROP CONSTRAINT [' + @var1 + '];');
ALTER TABLE [AspNetUsers] ALTER COLUMN [Cardnet] int NOT NULL;

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20250326144525_Midracion1', N'9.0.3');

DECLARE @var2 sysname;
SELECT @var2 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[AspNetUsers]') AND [c].[name] = N'Pais_de_residencia');
IF @var2 IS NOT NULL EXEC(N'ALTER TABLE [AspNetUsers] DROP CONSTRAINT [' + @var2 + '];');
ALTER TABLE [AspNetUsers] DROP COLUMN [Pais_de_residencia];

DECLARE @var3 sysname;
SELECT @var3 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[AspNetUsers]') AND [c].[name] = N'Nombre_de_compañia');
IF @var3 IS NOT NULL EXEC(N'ALTER TABLE [AspNetUsers] DROP CONSTRAINT [' + @var3 + '];');
ALTER TABLE [AspNetUsers] ALTER COLUMN [Nombre_de_compañia] nvarchar(50) NOT NULL;

ALTER TABLE [AspNetUsers] ADD [PaisesID] int NOT NULL DEFAULT 0;

CREATE TABLE [Paises] (
    [Id] int NOT NULL IDENTITY,
    [Nombre] nvarchar(128) NOT NULL,
    [Estado] bit NOT NULL,
    CONSTRAINT [PK_Paises] PRIMARY KEY ([Id])
);

CREATE INDEX [IX_AspNetUsers_PaisesID] ON [AspNetUsers] ([PaisesID]);

ALTER TABLE [AspNetUsers] ADD CONSTRAINT [FK_AspNetUsers_Paises_PaisesID] FOREIGN KEY ([PaisesID]) REFERENCES [Paises] ([Id]) ON DELETE CASCADE;

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20250401030303_crearRelacionusuariopais', N'9.0.3');

ALTER TABLE [AspNetUsers] DROP CONSTRAINT [FK_AspNetUsers_Paises_PaisesID];

DECLARE @var4 sysname;
SELECT @var4 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[AspNetUsers]') AND [c].[name] = N'PaisesID');
IF @var4 IS NOT NULL EXEC(N'ALTER TABLE [AspNetUsers] DROP CONSTRAINT [' + @var4 + '];');
ALTER TABLE [AspNetUsers] ALTER COLUMN [PaisesID] int NULL;

ALTER TABLE [AspNetUsers] ADD CONSTRAINT [FK_AspNetUsers_Paises_PaisesID] FOREIGN KEY ([PaisesID]) REFERENCES [Paises] ([Id]);

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20250401033846_usuariopaisidnull', N'9.0.3');

DECLARE @var5 sysname;
SELECT @var5 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[AspNetUsers]') AND [c].[name] = N'Apellido');
IF @var5 IS NOT NULL EXEC(N'ALTER TABLE [AspNetUsers] DROP CONSTRAINT [' + @var5 + '];');
ALTER TABLE [AspNetUsers] ALTER COLUMN [Apellido] nvarchar(100) NULL;

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20250401034256_migracionfinal', N'9.0.3');

DECLARE @var6 sysname;
SELECT @var6 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[AspNetUsers]') AND [c].[name] = N'Nombre_de_compañia');
IF @var6 IS NOT NULL EXEC(N'ALTER TABLE [AspNetUsers] DROP CONSTRAINT [' + @var6 + '];');
ALTER TABLE [AspNetUsers] ALTER COLUMN [Nombre_de_compañia] nvarchar(50) NULL;

DECLARE @var7 sysname;
SELECT @var7 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[AspNetUsers]') AND [c].[name] = N'Nombre');
IF @var7 IS NOT NULL EXEC(N'ALTER TABLE [AspNetUsers] DROP CONSTRAINT [' + @var7 + '];');
ALTER TABLE [AspNetUsers] ALTER COLUMN [Nombre] nvarchar(50) NULL;

DECLARE @var8 sysname;
SELECT @var8 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[AspNetUsers]') AND [c].[name] = N'Genero');
IF @var8 IS NOT NULL EXEC(N'ALTER TABLE [AspNetUsers] DROP CONSTRAINT [' + @var8 + '];');
ALTER TABLE [AspNetUsers] ALTER COLUMN [Genero] nvarchar(30) NULL;

DECLARE @var9 sysname;
SELECT @var9 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[AspNetUsers]') AND [c].[name] = N'Cardnet');
IF @var9 IS NOT NULL EXEC(N'ALTER TABLE [AspNetUsers] DROP CONSTRAINT [' + @var9 + '];');
ALTER TABLE [AspNetUsers] ALTER COLUMN [Cardnet] int NULL;

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20250401034444_nullusercreation', N'9.0.3');

ALTER TABLE [AspNetUsers] DROP CONSTRAINT [FK_AspNetUsers_Paises_PaisesID];

EXEC sp_rename N'[AspNetUsers].[PaisesID]', N'PaisID', 'COLUMN';

EXEC sp_rename N'[AspNetUsers].[IX_AspNetUsers_PaisesID]', N'IX_AspNetUsers_PaisID', 'INDEX';

ALTER TABLE [AspNetUsers] ADD CONSTRAINT [FK_AspNetUsers_Paises_PaisID] FOREIGN KEY ([PaisID]) REFERENCES [Paises] ([Id]);

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20250401161714_cambiarnombrepaisid', N'9.0.3');

DECLARE @var10 sysname;
SELECT @var10 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[AspNetUsers]') AND [c].[name] = N'Cardnet');
IF @var10 IS NOT NULL EXEC(N'ALTER TABLE [AspNetUsers] DROP CONSTRAINT [' + @var10 + '];');
ALTER TABLE [AspNetUsers] ALTER COLUMN [Cardnet] nvarchar(30) NULL;

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20250401165407_ultimamigracion2', N'9.0.3');



CREATE TABLE [Categorias] (
    [Id] int NOT NULL IDENTITY,
    [Nombre] nvarchar(100) NOT NULL,
    [Activo] bit NOT NULL,
    CONSTRAINT [PK_Categorias] PRIMARY KEY ([Id])
);

CREATE TABLE [Productos] (
    [Id] int NOT NULL IDENTITY,
    [Nombre] nvarchar(100) NOT NULL,
    [Precio] decimal(10,2) NOT NULL,
    [Activo] bit NOT NULL,
    [CategoriaId] int NOT NULL,
    CONSTRAINT [PK_Productos] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Productos_Categorias_CategoriaId] FOREIGN KEY ([CategoriaId]) REFERENCES [Categorias] ([Id]) ON DELETE CASCADE
);

CREATE INDEX [IX_Productos_CategoriaId] ON [Productos] ([CategoriaId]);

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20250403135508_creacionproductomodelo', N'9.0.3');

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20250403135758_productocategoriacreate', N'9.0.3');

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20250403140244_basededatosagain', N'9.0.3');

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20250403141140_paiscategoriaproductomodelo', N'9.0.3');

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20250403142332_productcategorymodel', N'9.0.3');

DROP TABLE [Productos];

DROP TABLE [Categorias];

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20250403143218_dbcontextmigracion', N'9.0.3');

COMMIT;
GO

