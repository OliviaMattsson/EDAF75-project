PRAGMA foreign_keys=OFF;

DROP IF EXISTS Customers;
DROP IF EXISTS Orders;
DROP IF EXISTS OrderDetails;
DROP IF EXISTS Recipies;
DROP IF EXISTS Products;
DROP IF EXISTS Ingredients;
DROP IF EXISTS Pallets;
DROP IF EXISTS Deliveries;

PRAGMA foreign_keys=ON;


CREATE TABLE Customers (
customer_name  text,
delivery_address text,
city text,
PRIMARY KEY (customer_name)

);


CREATE TABLE Orders (
orderId text DEFAULT (lower(hex(randomblob(16)))),
orderDate date,
customer_name text,
orderStatus text,
PRIMARY KEY (orderId)
FOREIGN KEY (customer_name) REFERENCES Customers(customer_name)
    
);


CREATE TABLE OrderDetails (
palletQuantity int,
cookieName text,
orderId text,
FOREIGN KEY (cookieName) REFERENCES Products(cookieName),
FOREIGN KEY (orderId) REFERENCES Orders(orderId)
      
);

CREATE TABLE Pallets (
palletId text DEFAULT (lower(hex(randomblob(16)))),
cookieName text,
palletStatus text,
deliveryDate date,
PRIMARY KEY(palletId)
    
);

CREATE TABLE Deliveries (
deliveryId text DEFAULT (lower(hex(randomblob(16)))),
deliveryDate date,
truckId text,
PRIMARY KEY(deliveryId),
FOREIGN KEY (deliveryDate) REFERENCES Pallets(deliveryDate)
    
);

CREATE TABLE Recipies (
ingredientName text,
cookieName text,
amount INT, 
FOREIGN KEY (ingredientName) REFERENCES Ingredients(ingredientName),
FOREIGN KEY (cookieName) REFERENCES Products(cookieName)
    
);

CREATE TABLE Products (
cookieName text,
PRIMARY KEY(cookieName)
    
);


CREATE TABLE Ingredients (
ingredientName text,
bestBeforeDate date,
ingredientQuantity int,
PRIMARY KEY(ingredientName)
    
);