--CREATE TABLE Orders
--(
--    OrderID INT IDENTITY(1,1) PRIMARY KEY,
--    UserID INT NOT NULL,
--    OrderDate DATETIME NOT NULL DEFAULT GETDATE(),
--    TotalAmount DECIMAL(12,2) NOT NULL,
--    OrderStatus VARCHAR(30) NOT NULL DEFAULT 'Pending',
--    PaymentMode VARCHAR(50) NULL,   -- COD / Online / UPI etc
--    ShippingAddress VARCHAR(300) NOT NULL,

--    CONSTRAINT FK_Orders_Users 
--        FOREIGN KEY (UserID) REFERENCES Users(UserID)
--);

--CREATE TABLE OrderDetails
--(
--    OrderDetailID INT IDENTITY(1,1) PRIMARY KEY,
--    OrderID INT NOT NULL,
--    ProductID INT NOT NULL,
--    Quantity INT NOT NULL,
--    Price DECIMAL(10,2) NOT NULL, -- price at order time

--    CONSTRAINT FK_OrderDetails_Orders 
--        FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),

--    CONSTRAINT FK_OrderDetails_Products 
--        FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
--);

-----Optional
--CREATE TABLE OrderStatusHistory
--(
--    StatusID INT IDENTITY(1,1) PRIMARY KEY,
--    OrderID INT NOT NULL,
--    Status VARCHAR(30) NOT NULL,
--    ChangedDate DATETIME DEFAULT GETDATE(),
--    Remarks VARCHAR(200) NULL,

--    CONSTRAINT FK_OrderStatusHistory_Orders
--        FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
--);