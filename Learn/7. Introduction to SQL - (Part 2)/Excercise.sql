show databases;

--

use hotel_db;

--

show tables;

--

SELECT *
FROM booking
WHERE dateto IS NULL;

--

SELECT COUNT(*)
FROM hotel;

--

describe room;

--

SELECT AVG(price)
FROM room;

--

SELECT SUM(price)
FROM room
WHERE type = 'Double';

--

SELECT COUNT(DISTINCT guesto)
FROM booking
WHERE (datefrom >= '2004-08-01' AND datefrom <= '2004-08-31');

--

describe room;

--

SELECT *
FROM room;

--

SELECT *
FROM hotel;

--

SELECT price, type
FROM room
WHERE hotelno IN (SELECT hotelno 
                  FROM hotel
                  WHERE hotelname = 'Grosvenor');

--

SELECT price, type
FROM room
WHERE hotelno = (SELECT hotelno FROM hotel
WHERE hotelname = 'Grosvenor');

--

