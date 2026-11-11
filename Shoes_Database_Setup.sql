-- ===================================================
-- SHOES STORE DATABASE SETUP SCRIPT (ASP.NET WEB FORMS)
-- Tables: emp_tbl, Add_Company_Tbl, Add_Products_Tbl, cart_tbl
-- ===================================================

USE [master];
GO

-- 1. Create Tables if they don't exist
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'emp_tbl')
BEGIN
    CREATE TABLE [dbo].[emp_tbl] (
        [Id]       INT            IDENTITY (1, 1) NOT NULL PRIMARY KEY,
        [Name]     NVARCHAR (MAX) NULL,
        [Gender]   NVARCHAR (MAX) NULL,
        [Email]    NVARCHAR (MAX) NULL,
        [Password] NVARCHAR (MAX) NULL,
        [City]     NVARCHAR (MAX) NULL,
        [Address]  NVARCHAR (MAX) NULL,
        [Mobile]   NVARCHAR (MAX) NULL,
        [Image]    NVARCHAR (MAX) NULL
    );
END
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Add_Company_Tbl')
BEGIN
    CREATE TABLE [dbo].[Add_Company_Tbl] (
        [Comp_Id]         INT            IDENTITY (1, 1) NOT NULL PRIMARY KEY,
        [Comp_Name]       NVARCHAR (MAX) NULL,
        [Comp_Owner_Name] NVARCHAR (MAX) NULL,
        [Comp_Email]      NVARCHAR (MAX) NULL,
        [Comp_Address]    NVARCHAR (MAX) NULL,
        [Comp_Cover_Img]  NVARCHAR (MAX) NULL
    );
END
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Add_Products_Tbl')
BEGIN
    CREATE TABLE [dbo].[Add_Products_Tbl] (
        [Prod_Id]      INT             IDENTITY (1, 1) NOT NULL PRIMARY KEY,
        [Prod_Comp_Id] INT             NULL,
        [Prod_Name]    NVARCHAR (MAX)  NULL,
        [Prod_Model]   NVARCHAR (MAX)  NULL,
        [Prod_Desc]    NVARCHAR (MAX)  NULL,
        [Prod_Weight]  NVARCHAR (MAX)  NULL,
        [Prod_Config]  NVARCHAR (MAX)  NULL,
        [Prod_Img]     NVARCHAR (MAX)  NULL,
        [Prod_Price]   DECIMAL (18, 2) NULL
    );
END
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'cart_tbl')
BEGIN
    CREATE TABLE [dbo].[cart_tbl] (
        [Cart_Id]      INT      IDENTITY (1, 1) NOT NULL PRIMARY KEY,
        [Cart_User_Id] INT      NULL,
        [Cart_Prod_Id] INT      NULL,
        [Quentity]     INT      NULL,
        [AddedDate]    DATETIME NULL
    );
END
GO

-- 2. Clean & Reseed for Fresh Shoes Data
DELETE FROM [cart_tbl];
DELETE FROM [Add_Products_Tbl];
DELETE FROM [Add_Company_Tbl];

DBCC CHECKIDENT ('Add_Company_Tbl', RESEED, 0);
DBCC CHECKIDENT ('Add_Products_Tbl', RESEED, 0);
DBCC CHECKIDENT ('cart_tbl', RESEED, 0);
GO

-- 3. Insert Shoe Brands (Companies)
INSERT INTO [Add_Company_Tbl] ([Comp_Name], [Comp_Owner_Name], [Comp_Email], [Comp_Address], [Comp_Cover_Img])
VALUES
('Nike', 'Phil Knight', 'contact@nike.com', 'One Bowerman Drive, Beaverton, Oregon, USA', 'images/nike_brand.jpg'),
('Adidas', 'Adolf Dassler', 'contact@adidas.com', 'Adi-Dassler-Strasse 1, Herzogenaurach, Germany', 'images/adidas_brand.jpg'),
('Puma', 'Rudolf Dassler', 'contact@puma.com', 'PUMA Way 1, Herzogenaurach, Germany', 'images/puma_brand.jpg'),
('Reebok', 'Joe Foster', 'contact@reebok.com', '25 Drydock Avenue, Boston, MA, USA', 'images/reebok_brand.jpg'),
('Air Jordan', 'Michael Jordan', 'contact@jordan.com', 'Chicago, Illinois, USA', 'images/jordan_brand.jpg'),
('Campus', 'Hari Krishna Agarwal', 'contact@campusshoes.com', 'D-1, Udyog Nagar, New Delhi, India', 'images/campus_brand.jpg');
GO

-- 4. Insert Shoes Products
-- Brand 1: Nike
INSERT INTO [Add_Products_Tbl] ([Prod_Comp_Id], [Prod_Name], [Prod_Model], [Prod_Desc], [Prod_Weight], [Prod_Config], [Prod_Img], [Prod_Price])
VALUES
(1, 'Nike', 'Nike Air Jordan 1 High', 'Iconic high-top basketball sneaker with premium genuine leather upper and responsive Air-Sole cushioning.', 'UK 7-11 | 420g', 'Material: Genuine Leather | Sole: Rubber | Style: High Top Retro', 'images/nike_air_jordan1.jpg', 16995.00),
(1, 'Nike', 'Nike Air Max 270', 'Lifestyle runner featuring large heel Max Air unit for maximum bounce and breathable engineered mesh upper.', 'UK 6-11 | 310g', 'Material: Engineered Mesh | Sole: Dual-density Foam with Max Air', 'images/nike_air_max270.jpg', 13995.00),
(1, 'Nike', 'Nike Air Zoom Pegasus 40', 'Legendary road running shoe with dual Zoom Air units and lightweight React foam for smooth energy return.', 'UK 7-12 | 285g', 'Material: Breathable Mesh | Sole: Waffle Rubber Outsole | Style: Running', 'images/nike_pegasus40.jpg', 11495.00);

-- Brand 2: Adidas
INSERT INTO [Add_Products_Tbl] ([Prod_Comp_Id], [Prod_Name], [Prod_Model], [Prod_Desc], [Prod_Weight], [Prod_Config], [Prod_Img], [Prod_Price])
VALUES
(2, 'Adidas', 'Adidas Ultraboost Light', 'Lightest Ultraboost with 30 percent lighter BOOST material and Continental rubber outsole.', 'UK 7-11 | 299g', 'Material: PRIMEKNIT+ | Sole: Light BOOST & Continental Rubber', 'images/adidas_ultraboost.jpg', 18999.00),
(2, 'Adidas', 'Adidas Superstar Classic', 'Classic streetwear sneaker with iconic rubber shell toe, 3-Stripes and smooth coated leather upper.', 'UK 6-10 | 380g', 'Material: Full Grain Leather | Sole: Herringbone Rubber', 'images/adidas_superstar.jpg', 8999.00),
(2, 'Adidas', 'Adidas Samba OG', 'Vintage football-inspired street sneaker with suede T-toe reinforcement and textured gum rubber sole.', 'UK 6-11 | 340g', 'Material: Full-grain Leather & Suede | Sole: Gum Rubber', 'images/adidas_samba.jpg', 10999.00);

-- Brand 3: Puma
INSERT INTO [Add_Products_Tbl] ([Prod_Comp_Id], [Prod_Name], [Prod_Model], [Prod_Desc], [Prod_Weight], [Prod_Config], [Prod_Img], [Prod_Price])
VALUES
(3, 'Puma', 'Puma RS-X Geek Sneakers', 'Futuristic chunky sneaker with Running System retro cushioning and layered synthetic leather overlays.', 'UK 6-11 | 410g', 'Material: Mesh & Synthetic | Sole: Lightweight PU Midsole', 'images/puma_rsx.jpg', 7999.00),
(3, 'Puma', 'Puma Smash V2 Leather', 'Clean tennis-inspired court shoe with soft leather upper and SoftFoam+ insert for all-day comfort.', 'UK 6-10 | 330g', 'Material: Soft Leather Upper | Sole: Non-marking Rubber', 'images/puma_smash_v2.jpg', 3499.00),
(3, 'Puma', 'Puma Velocity Nitro 2', 'Neutral running shoe equipped with NITRO foam technology for pinpoint responsiveness.', 'UK 7-11 | 257g', 'Material: Engineered Mesh | Sole: NITRO Foam & PUMAGRIP', 'images/puma_nitro.jpg', 10999.00);

-- Brand 4: Reebok
INSERT INTO [Add_Products_Tbl] ([Prod_Comp_Id], [Prod_Name], [Prod_Model], [Prod_Desc], [Prod_Weight], [Prod_Config], [Prod_Img], [Prod_Price])
VALUES
(4, 'Reebok', 'Reebok Classic Leather', 'Timeless retro runner made with soft garment leather upper and die-cut EVA midsole.', 'UK 6-10 | 350g', 'Material: Soft Garment Leather | Sole: Die-cut EVA & Rubber', 'images/reebok_classic.jpg', 5999.00),
(4, 'Reebok', 'Reebok Club C 85 Vintage', 'Clean 80s tennis court sneaker crafted with chalk leather upper and comfortable padded foam sockliner.', 'UK 6-11 | 365g', 'Material: Vintage Leather | Sole: Durable Rubber Cupsole', 'images/reebok_club_c.jpg', 6999.00),
(4, 'Reebok', 'Reebok Floatride Energy 5', 'High-mileage training shoe featuring lightweight Floatride Energy Foam cushioning.', 'UK 7-11 | 266g', 'Material: Speed Shift Mesh | Sole: Floatride Energy Foam', 'images/reebok_floatride.jpg', 8999.00);

-- Brand 5: Air Jordan
INSERT INTO [Add_Products_Tbl] ([Prod_Comp_Id], [Prod_Name], [Prod_Model], [Prod_Desc], [Prod_Weight], [Prod_Config], [Prod_Img], [Prod_Price])
VALUES
(5, 'Air Jordan', 'Air Jordan 4 Retro', 'Legendary silhouette featuring molded plastic eyestays, mesh side panels and visible Air cushioning.', 'UK 7-11 | 460g', 'Material: Full-Grain Leather | Sole: Polyurethane with Air Unit', 'images/jordan_retro4.jpg', 19995.00),
(5, 'Air Jordan', 'Air Jordan 1 Low SE', 'Low-profile court classic in iconic colorways with encapsulated Air-Sole unit and padded collar.', 'UK 6-11 | 370g', 'Material: Leather & Suede | Sole: Solid Rubber Cupsole', 'images/jordan_low_se.jpg', 10295.00);

-- Brand 6: Campus
INSERT INTO [Add_Products_Tbl] ([Prod_Comp_Id], [Prod_Name], [Prod_Model], [Prod_Desc], [Prod_Weight], [Prod_Config], [Prod_Img], [Prod_Price])
VALUES
(6, 'Campus', 'Campus Rodeo Running Shoes', 'Ultra-flexible lightweight running shoe with breathable knitted upper and shock-absorbing phylon sole.', 'UK 6-10 | 280g', 'Material: Knitted Mesh Upper | Sole: Phylon & TPR Outsole', 'images/campus_rodeo.jpg', 1499.00),
(6, 'Campus', 'Campus North Plus Casuals', 'Casual lifestyle walking sneaker with cushioned collar and slip-resistant traction outsole.', 'UK 6-10 | 290g', 'Material: Synthetic & Mesh | Sole: High Grade EVA Sole', 'images/campus_north_plus.jpg', 1299.00);
GO

-- 5. Insert Users
IF NOT EXISTS (SELECT 1 FROM [emp_tbl] WHERE [Email] = 'admin@shoes.com')
BEGIN
    INSERT INTO [emp_tbl] ([Name], [Gender], [Email], [Password], [City], [Address], [Mobile], [Image])
    VALUES ('Admin Shoes', 'Male', 'admin@shoes.com', 'admin123', 'Rajkot', 'Kalawad Road, Rajkot', '9876543210', 'images/nike_air_jordan1.jpg');
END
GO
