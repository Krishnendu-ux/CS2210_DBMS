create database Shopping;
use Shopping;
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(15)
);
INSERT INTO Customers (FirstName, LastName, Email, Phone) VALUES
('Amit', 'Sharma', 'amit.sharma@example.com', '9876543210'),
('Neha', 'Verma', 'neha.verma@example.com', '9876543211'),
('Raj', 'Patel', 'raj.patel@example.com', '9876543212'),
('Priya', 'Singh', 'priya.singh@example.com', '9876543213'),
('Karan', 'Nair', 'karan.nair@example.com', '9876543214');

CREATE TABLE Stores (
    StoreID INT PRIMARY KEY AUTO_INCREMENT,
    StoreName VARCHAR(100),
    Location VARCHAR(100)
);
INSERT INTO Stores (StoreName, Location) VALUES
('Tech World', 'Mumbai'),
('Fashion Hub', 'Delhi'),
('Home Essentials', 'Bangalore'),
('Gadget Store', 'Hyderabad'),
('Furniture Palace', 'Chennai');

CREATE TABLE Products (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2),
    StockQuantity INT,
    StoreID INT,
    FOREIGN KEY (StoreID) REFERENCES Stores(StoreID)
);
INSERT INTO Products (ProductName, Category, Price, StockQuantity, StoreID) VALUES
('Laptop', 'Electronics', 55000, 20, 1),
('T-Shirt', 'Clothing', 800, 100, 2),
('Sofa', 'Furniture', 25000, 10, 5),
('Smartphone', 'Electronics', 30000, 30, 1),
('Dining Table', 'Furniture', 15000, 5, 5);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    StoreID INT,
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (StoreID) REFERENCES Stores(StoreID)
);
INSERT INTO Orders (CustomerID, StoreID, OrderDate) VALUES
(1, 1, '2025-08-01'),
(2, 2, '2025-08-02'),
(3, 5, '2025-08-04'),
(4, 1, '2025-08-05'),
(5, 5, '2025-08-06');

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES
(1, 1, 1),   
(2, 2, 2),   
(3, 3, 1),   
(4, 4, 1),   
(5, 5, 1);   

CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    PaymentDate DATE,
    Amount DECIMAL(10,2),
    PaymentMethod VARCHAR(50),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);
INSERT INTO Payments (OrderID, PaymentDate, Amount, PaymentMethod) VALUES
(1, '2025-08-01', 55000, 'Credit Card'),
(2, '2025-08-02', 1600, 'UPI'),
(3, '2025-08-04', 25000, 'Debit Card'),
(4, '2025-08-05', 30000, 'Credit Card'),
(5, '2025-08-06', 15000, 'Cash');

SELECT * FROM Customers;
SELECT * FROM Stores;
SELECT * FROM Products;
SELECT * FROM Orders;
SELECT * FROM OrderDetails;
SELECT * FROM Payments;
UPDATE Products
SET StockQuantity = StockQuantity - 1
WHERE ProductID = 3;
DELETE FROM OrderDetails WHERE OrderID = 2;