--CREATE DATABASE HiraJewelryDB;
--GO

--USE HiraJewelryDB;
--GO

--CREATE TABLE Users
--(
--    UserID INT IDENTITY(1,1) PRIMARY KEY,
--    FullName VARCHAR(100) NOT NULL,
--    Email VARCHAR(100) NOT NULL UNIQUE,
--    Password VARCHAR(200) NOT NULL,  -- later we will hash
--    Mobile VARCHAR(15) NULL,
--    Address VARCHAR(200) NULL,
--    Role VARCHAR(20) NOT NULL,  -- Admin / User
--    CreatedDate DATETIME DEFAULT GETDATE()
--);

--INSERT INTO Users (FullName, Email, Password, Role)
--VALUES ('Admin', 'admin@site.com', 'admin123', 'Admin');
--INSERT INTO Users (FullName, Email, Password, Mobile, Role)
--VALUES ('Hrutik G', 'hrutik@gmail.com', '123456', '9876543210', 'User');

--USE HiraJewelryDB;
--GO

--CREATE TABLE Admins (
--    AdminID INT IDENTITY(1,1) PRIMARY KEY,
--    AdminName NVARCHAR(100) NOT NULL,
--    Email NVARCHAR(150) UNIQUE NOT NULL,
--    Password NVARCHAR(200) NOT NULL
--);
--GO

---- Insert Default Admin
--INSERT INTO Admins (AdminName, Email, Password)
--VALUES ('Main Admin', 'admin@hira.com', 'admin123');

--USE HiraJewelryDB;
--GO

--CREATE TABLE Products
--(
--    ProductID INT IDENTITY(1,1) PRIMARY KEY,
--    ProductName NVARCHAR(150) NOT NULL,
--    Category NVARCHAR(100) NOT NULL,
--    Description NVARCHAR(500) NULL,
--    Price DECIMAL(10,2) NOT NULL,
--    Stock INT NOT NULL DEFAULT 0,
--    ImageUrl NVARCHAR(300) NULL,
--    CreatedDate DATETIME DEFAULT GETDATE()
--);

--INSERT INTO Products (ProductName, Category, Description, Price, Stock, ImageUrl)
--VALUES
--('Gold Necklace', 'Necklace', '18K gold necklace', 25000, 10, 'images/necklace1.jpg'),
--('Diamond Ring', 'Ring', 'Diamond ring with platinum', 50000, 5, 'images/ring1.jpg'),
--('Silver Bracelet', 'Bracelet', 'Pure silver bracelet', 1500, 20, 'images/bracelet1.jpg');


--USE HiraJewelryDB;
--GO

---- Cart Master Table
--CREATE TABLE CartMaster
--(
--    CartID INT IDENTITY(1,1) PRIMARY KEY,
--    UserID INT NOT NULL,
--    CreatedDate DATETIME DEFAULT GETDATE(),
--    FOREIGN KEY (UserID) REFERENCES Users(UserID)
--);
--GO

---- Cart Details Table
--CREATE TABLE CartDetails
--(
--    CartDetailID INT IDENTITY(1,1) PRIMARY KEY,
--    CartID INT NOT NULL,
--    ProductID INT NOT NULL,
--    Quantity INT NOT NULL DEFAULT 1,
--    FOREIGN KEY (CartID) REFERENCES CartMaster(CartID),
--    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
--);
--GO
