## Overview
This repository contains the SQL scripts and the Entity-Relationship Diagram (ERD) for the database of an Electronics Store with online shopping capabilities. The database is designed to handle products, inventory, orders, shipments, and customer data management.

## Database Schema
The database consists of the following main tables:

Categories: Stores information about product categories.
Products: Contains all details of the products sold.
Stock_details: Stores information about stock levels and suppliers of products.
Suppliers: Information about the product suppliers.
Customers: Stores customer account information.
Addresses: Customer addresses for shipping and billing.
Carts: Shopping cart data for each customer.
Orders: Order transactions made by customers.
Shipments: Shipping details of orders.
Reviews: Customer reviews for products.

#### Each table is designed with specific relationships that are crucial for integrity and performance. Foreign keys are used extensively to ensure data consistency.

## Entity-Relationship Diagram
The ERD provides a visual representation of the relationships between the tables in the database. It can be found in the file ERD_JB-HIFI.drawio.png.


## SQL Scripts
The SQL scripts for creating and manipulating the database tables are included in this repository. They are designed for a MySQL database and include:

- Table creation scripts with primary and foreign keys, constraints, and relationships.
- Sample queries for common operations.
- Indexes to improve performance on frequent operations.
