USE NovaStoreDB;
GO

CREATE TABLE Categories(
   CategoryID INT IDENTITY(1,1) PRIMARY KEY,
   CategoryName VARCHAR(50) NOT NULL
	);
GO

CREATE TABLE Customers(
   CustomerID INT IDENTITY(1,1) PRIMARY KEY,
   FullName VARCHAR(50),
   City VARCHAR(20),
   Email VARCHAR(100) UNIQUE
);
GO

CREATE TABLE Products(
   ProductID INT IDENTITY(1,1) PRIMARY KEY,
   ProductName VARCHAR(100) NOT NULL,
   Price decimal(10,2),
   Stock INT DEFAULT 0,
   CategoryID INT FOREIGN KEY REFERENCES Categories(CategoryID)
);
GO

CREATE TABLE Orders(
   OrderID INT IDENTITY(1,1) PRIMARY KEY,
   CustomerID INT FOREIGN KEY REFERENCES Customers(CustomerID),
   OrderDate datetime DEFAULT GETDATE(),
   TotalAmount decimal(10,2)
);
GO

CREATE TABLE OrderDetails(
   DetailID INT IDENTITY(1,1) PRIMARY KEY,
   OrderID INT FOREIGN KEY REFERENCES Orders(OrderID),
   ProductID INT FOREIGN KEY REFERENCES Products(ProductID),
   Quantity INT 
);
