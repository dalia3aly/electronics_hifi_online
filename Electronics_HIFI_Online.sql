CREATE DATABASE Electronics_HIFI;
USE Electronics_HIFI;

CREATE TABLE Categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    number_of_products INT NOT NULL,
    image_url VARCHAR(255)
);

CREATE TABLE Suppliers (
	Supplier_id INT AUTO_INCREMENT PRIMARY KEY,
    supplier_name VARCHAR(255) NOT NULL,
    physical_address VARCHAR(255) NOT NULL,
    email_address VARCHAR(255) NOT NULL,
    phone_number VARCHAR(255) NOT NULL,
    supplied_products JSON
);


CREATE TABLE Products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    brand_name VARCHAR(255) NOT NULL,
    Description TEXT NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    stock_level INT NOT NULL,
    category_id INT NOT NULL,
    country_of_origin VARCHAR(255),
    image_url VARCHAR(255),
    barcode_number INT NOT NULL,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

CREATE TABLE Stock_details (
	stock_details_id INT AUTO_INCREMENT PRIMARY KEY,
	product_id INT NOT NULL,
    stock_level INT NOT NULL,
    supplier_id INT NOT NULL,
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email_address VARCHAR(255) NOT NULL UNIQUE,
    phone_number VARCHAR(255),
    password VARCHAR(255) NOT NULL
);

CREATE TABLE Addresses (
    address_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    address_name VARCHAR(255) NOT NULL,
    street_address VARCHAR(255) NOT NULL,
    postcode VARCHAR(10) NOT NULL,
    state VARCHAR(100) NOT NULL,
    country VARCHAR(100) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Carts (
    cart_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    added_products JSON NOT NULL,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    is_successful BOOLEAN NOT NULL,
    customer_id INT NOT NULL,
    cart_id INT NOT NULL,
    paid_amount DECIMAL(10, 2) NOT NULL,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    address_id INT NOT NULL,
    shipment_id INT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (cart_id) REFERENCES Carts(cart_id),
    FOREIGN KEY (address_id) REFERENCES Addresses(address_id)
);

CREATE TABLE Shipments (
	shipment_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    courier VARCHAR(255),
    tracking_number VARCHAR(100) NOT NULL,
    dispatch_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    is_fragile BOOLEAN NOT NULL DEFAULT TRUE,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

-- for faster queries and searching by tracking_number
CREATE INDEX idx_tracking_number ON Shipments(tracking_number);

ALTER TABLE Orders
ADD CONSTRAINT fk_shipment_id
    FOREIGN KEY (shipment_id) REFERENCES Shipments(shipment_id);
