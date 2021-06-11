-- 1.1 Select the names of all the products in the store.
SELECT products.Name
FROM products;

-- 1.2 Select the names and the prices of all the products in the store.
SELECT products.Name, products.Price
FROM products;

-- 1.3 Select the name of the products with a price less than or equal to $200.
SELECT products.Name
FROM products
WHERE products.Price <= 200;

-- 1.4 Select all the products with a price between $60 and $120.
SELECT products.Name
FROM products
WHERE products.Price > 60 AND products.Price <= 120;

-- 1.5 Select the name and price in cents (i.e., the price must be multiplied by 100).
SELECT products.Name, products.Price * 100 AS Price_in_cents
FROM products;

-- 1.6 Compute the average price of all the products.
SELECT AVG(products.Price)
FROM products;

-- 1.7 Compute the average price of all products with manufacturer code equal to 2.
SELECT AVG(products.Price)
FROM products
WHERE products.Manufacturer = 2;

-- 1.8 Compute the number of products with a price larger than or equal to $180.
SELECT COUNT(products.Name) AS NumberOfProducts
FROM Products
WHERE products.Price >= 180;

-- 1.9 Select the name and price of all products with a price larger than or equal to $180, and sort first by price (in descending order), and then by name (in ascending order).
SELECT products.Name, products.Price
FROM products
WHERE products.Price >= 180
ORDER BY products.Price DESC, products.Name ASC;

-- 1.10 Select all the data from the products, including all the data for each product's manufacturer.
SELECT *
FROM products 
JOIN Manufacturers on products.Manufacturer = Manufacturers.code;

-- 1.11 Select the product name, price, and manufacturer name of all the products.
SELECT products.Name, products.Price, Manufacturers.Name
FROM products 
JOIN Manufacturers on products.Manufacturer = Manufacturers.code;

-- 1.12 Select the average price of each manufacturer's products, showing only the manufacturer's code.
SELECT AVG(products.Price), products.Manufacturer
FROM Products
GROUP BY Manufacturer;

-- 1.13 Select the average price of each manufacturer's products, showing the manufacturer's name.
SELECT AVG(products.Price), Manufacturers.name
FROM Products JOIN Manufacturers on products.Manufacturer = Manufacturers.code
GROUP BY Manufacturer;

-- 1.14 Select the names of manufacturer whose products have an average price larger than or equal to $150.
SELECT AVG(products.Price), Manufacturers.name
FROM Products
JOIN Manufacturers on products.Manufacturer = Manufacturers.code
GROUP BY Manufacturer
HAVING AVG(products.Price) >= 150;

-- 1.15 Select the name and price of the cheapest product.
SELECT products.price, products.name
FROM products
ORDER BY products.price ASC
LIMIT 1;
--OR 
select name, price from Products 
where price = (
select min(price)
from products);

-- 1.16 Select the name of each manufacturer along with the name and price of its most expensive product.
SELECT manufacturers.name, products.price, products.name as product
FROM products, manufacturers
WHERE (products.manufacturer = manufacturers.code) AND products.price IN
(
SELECT MAX(products.price)
FROM products, manufacturers
WHERE products.manufacturer = manufacturers.code
GROUP BY manufacturers.name,manufacturers.code);

-- 1.17 Add a new product: Loudspeakers, $70, manufacturer 2.
INSERT INTOProducts
VALUES(11, 'Loudspeakers', 70, 2);
    
-- 1.18 Update the name of product 8 to "Laser Printer".
update products
set name = 'Laser Printer'
where code=8;

-- 1.19 Apply a 10% discount to all products.
UPDATE products
set price = price*0.9;

-- 1.20 Apply a 10% discount to all products with a price larger than or equal to $120.
UPDATE products
set price = price*0.9
WHERE price>=120;

