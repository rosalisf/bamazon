DROP DATABASE IF EXISTS bamazon;

CREATE DATABASE bamazon;

USE bamazon;

CREATE TABLE products (

  id INT NOT NULL AUTO_INCREMENT,
  product_name VARCHAR(255) NULL,
  department_name VARCHAR(255) NULL,
  price DECIMAL(10,2) NULL,
  stock_quantity INT NULL,
  PRIMARY KEY (id)
);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Sailor Moon Wig", "Clothing, Shoes & Jewelry", 23.50, 100);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Legend of Zelda: Breath of the Wild - Wii U ", "Video Games", 40.00, 350);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Neon Genesis Evangelion: Platinum Collection", "Movies & TV", 225.01, 345);