-- Jawaban No. 1

SELECT Name FROM Products;

-- Jawaban No. 2

SELECT Name, Price FROM Products;

-- Jawaban No. 3

SELECT Name FROM Products WHERE Price <= 200;

-- Jawaban No. 4

/* With AND */
 SELECT * FROM Products
   WHERE Price >= 60 AND Price <= 120;
 
 /* With BETWEEN */
 SELECT * FROM Products
   WHERE Price BETWEEN 60 AND 120;

-- Jawaban No. 5

/* Without AS */
 SELECT Name, Price * 100 FROM Products;
 
 /* With AS */
 SELECT Name, Price * 100 AS PriceCents FROM Products;

-- Jawaban No. 6

SELECT AVG(Price) FROM Products;

-- Jawaban No. 7

SELECT AVG(Price) FROM Products WHERE Manufacturer=2;

-- Jawaban No. 8

SELECT COUNT(*) FROM Products WHERE Price >= 180;

-- Jawaban No. 9

SELECT Name, Price 
FROM Products
WHERE Price >= 180
ORDER BY Price DESC, Name;
 
-- Jawaban No. 10

/* Without INNER JOIN */
 SELECT * FROM Products, Manufacturers
   WHERE Products.Manufacturer = Manufacturers.Code;

 /* With INNER JOIN */
 SELECT *
   FROM Products INNER JOIN Manufacturers
   ON Products.Manufacturer = Manufacturers.Code;
 
-- Jawaban No. 11

/* Without INNER JOIN */
 SELECT Products.Name, Price, Manufacturers.Name
   FROM Products, Manufacturers
   WHERE Products.Manufacturer = Manufacturers.Code;

 /* With INNER JOIN */
 SELECT Products.Name, Price, Manufacturers.Name
   FROM Products INNER JOIN Manufacturers
   ON Products.Manufacturer = Manufacturers.Code;

-- Jawaban No. 12

SELECT AVG(Price), Manufacturer
    FROM Products
GROUP BY Manufacturer;

-- Jawaban No. 13

/* Without INNER JOIN */
 SELECT AVG(Price), Manufacturers.Name
   FROM Products, Manufacturers
   WHERE Products.Manufacturer = Manufacturers.Code
   GROUP BY Manufacturers.Name;
 
 /* With INNER JOIN */
 SELECT AVG(Price), Manufacturers.Name
   FROM Products INNER JOIN Manufacturers
   ON Products.Manufacturer = Manufacturers.Code
   GROUP BY Manufacturers.Name;
  
-- Jawaban No. 14

/* Without INNER JOIN */
 SELECT AVG(Price), Manufacturers.Name
   FROM Products, Manufacturers
   WHERE Products.Manufacturer = Manufacturers.Code
   GROUP BY Manufacturers.Name
   HAVING AVG(Price) >= 150;
 
 /* With INNER JOIN */
 SELECT AVG(Price), Manufacturers.Name
   FROM Products INNER JOIN Manufacturers
   ON Products.Manufacturer = Manufacturers.Code
   GROUP BY Manufacturers.Name
   HAVING AVG(Price) >= 150;

-- Jawaban No. 15

SELECT name,price
  FROM Products
  ORDER BY price ASC
  LIMIT 1

/* With a nested SELECT */
/* WARNING: If there is more than one item with the cheapest price it will select them both */
 SELECT Name, Price
   FROM Products
   WHERE Price = (SELECT MIN(Price) FROM Products);

-- Jawaban No. 16

/* With a nested SELECT and without INNER JOIN */
   SELECT A.Name, A.Price, F.Name
   FROM Products A, Manufacturers F
   WHERE A.Manufacturer = F.Code
     AND A.Price =
     (
       SELECT MAX(A.Price)
         FROM Products A
         WHERE A.Manufacturer = F.Code
     );
 
 /* With a nested SELECT and an INNER JOIN */
   SELECT A.Name, A.Price, F.Name
   FROM Products A INNER JOIN Manufacturers F
   ON A.Manufacturer = F.Code
     AND A.Price =
     (
       SELECT MAX(A.Price)
         FROM Products A
         WHERE A.Manufacturer = F.Code
     );

-- Jawaban No. 17

Select DISTINCT m.Name as manufacturer_name, m.Code
 FROM Manufacturers m
 JOIN Products p
 ON p.Manufacturer = m.code
 WHERE p.Manufacturer in (
	SELECT DISTINCT p.Manufacturer
	FROM Products p
	GROUP BY p.Manufacturer
	HAVING AVG(p.Price) >= 150 AND COUNT(p.Manufacturer) >=2
);

-- Jawaban No. 18

INSERT INTO Products( Code, Name , Price , Manufacturer)
  VALUES ( 11, 'Loudspeakers' , 70 , 2 );

-- Jawaban No. 19

UPDATE Products
   SET Name = 'Laser Printer'
   WHERE Code = 8;

-- Jawaban No. 20

UPDATE Products
   SET Price = Price - (Price * 0.1);
   
-- Jawaban No. 21

UPDATE Products
   SET Price = Price - (Price * 0.1)
   WHERE Price >= 120;
