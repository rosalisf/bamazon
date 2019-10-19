DROP DATABASE IF EXISTS bamazon;

CREATE DATABASE bamazon;

USE bamazon;

CREATE TABLE departments (
  id INT NOT NULL AUTO_INCREMENT,
  department_name VARCHAR(255) NOT NULL UNIQUE,
  PRIMARY KEY(id)
);

CREATE TABLE products (

  id INT NOT NULL AUTO_INCREMENT,
  product_name VARCHAR(255) NOT NULL UNIQUE,
  department_id INT,
  price DECIMAL(10,2) NOT NULL,
  stock_quantity INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (department_id) REFERENCES departments(id)
);

INSERT INTO departments (department_name) VALUES 
	("Clothing, Shoes & Jewelry"),
	("Video Games"),
	("Movies & TV"),
    ("Beauty & Personal Care"),
    ("CDs & Vinyl"),
    ("Computers"),
    ("Electronics")
;
INSERT INTO products (product_name, department_id, price, stock_quantity)
VALUES (
"Sailor Moon Wig", 
(SELECT id from departments where department_name="Clothing, Shoes & Jewelry"),
 23.50, 100);

INSERT INTO products (product_name, department_id, price, stock_quantity)
VALUES (
"Legend of Zelda: Breath of the Wild - Wii U ", 
(SELECT id from departments where department_name="Video Games"),
 40.00, 350);

INSERT INTO products (product_name, department_id, price, stock_quantity)
VALUES (
"Neon Genesis Evangelion: Platinum Collection", 
(SELECT id from departments where department_name="Movies & TV"),
 225.01, 345);
 
 INSERT INTO products (product_name, department_id, price, stock_quantity)
VALUES (
"Code Geass: Lelouch of the Rebellion DVD", 
(SELECT id from departments where department_name="Movies & TV"),
 45.50, 245);
 
 INSERT INTO products (product_name, department_id, price, stock_quantity)
VALUES (
"The Arwen Evenstar Pendant Silver Plated", 
(SELECT id from departments where department_name="Clothing, Shoes & Jewelry"),
 49.00, 25);
 
 INSERT INTO products (product_name, department_id, price, stock_quantity)
VALUES (
"Kat Von D Everlasting Liquid Lipstick", 
(SELECT id from departments where department_name="Beauty & Personal Care"),
 29.47, 500);
 
 INSERT INTO products (product_name, department_id, price, stock_quantity)
VALUES (
"Kid Cudi Man on the Moon: The End of Day (Vinyl)", 
(SELECT id from departments where department_name="CDs & Vinyl"),
 21.34, 1000);
 
 INSERT INTO products (product_name, department_id, price, stock_quantity)
VALUES (
"ASUS VivoBook 15 Thin and Light Laptop", 
(SELECT id from departments where department_name="Computers"),
 428.49, 3455);
 
  INSERT INTO products (product_name, department_id, price, stock_quantity)
VALUES (
"FIXBODY Makeup Brush Sets - 10 PCS", 
(SELECT id from departments where department_name="Beauty & Personal Care"),
 9.99, 500);
 
 INSERT INTO products (product_name, department_id, price, stock_quantity)
VALUES (
"Beats Wireless On-Ear Headphones - Gold", 
(SELECT id from departments where department_name="Electronics"),
 131.85, 2306);
 