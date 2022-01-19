USE onlineshop;

INSERT INTO orders (order_id, product_id, price, quantity)
VALUES (1, 4, 4, 2),
(2, 7, 7, 7), 
(3, 6, 10, 2),
(4, 11, 8, 4),
(5, 11, 6, 3),
(6, 4, 4, 2),
(7, 6, 6, 6),
(8, 5, 12, 2),
(9, 1, 18, 6),
(10, 7, 5, 5),
(11, 5, 6, 1),
(12, 9, 14, 2);

INSERT INTO products (product_id, category, price, name, stock)
VALUES (1, 'Decoration', '3', 'Fairy Lights', 20),
(2, 'Cutlery', '5', 'Kitchen knives', 27),
(3, 'Gardening', '30', 'Electric lawnmower', 20),
(4, 'Gardening', '2', 'Trimmer', 46),
(5, 'Food', '6', 'Shortbread', 34),
(6, 'Food', '1', 'Rubicon mango', 2),
(7, 'Food', '1', 'Walkers Sensations', 65),
(8, 'Clothes', '7', 'Tank top', 242),
(9, 'Clothes', '10', 'Shorts', 64),
(10, 'Clothes', '2', 'Gloves', 53),
(11, 'Food', '2', 'Digestives', 3),
(12, 'Cutlery', '7', 'Large plates', 23);

INSERT INTO users (user_id, email, full_name, first_line_add, postcode, phone)
VALUES (1, 'noddy.dolly@noddyworld.com', 'Noddy Dolly', '1 Noddy Street', '4BW H98', 224324345),
(2,'betty.boo@noddyworld.com', 'Betty Boo', '72 Honeypot Way', '6BW U23', 1451343543), 
(3, 'charles.xavier@noddyworld.com', 'Charles Xavier','65 Chessington Avenue', '5BW G96', 1345354315),
(4, 'gambit@noddyworld.com', 'Remy Etienne LeBeau', '11 Crazy Story Lane', '1HA P83', 1534154351),
(5, 'harry.potter@noddyworld.com', 'Harry Potter', '91 Hufflepuff Descent', '3IQ YE9', 134534545);


INSERT INTO reviews (review_id, reviewer_name, category, order_id, rating)
VALUES (1, 'Barney', 'Clothes', 12, 5),
(2, 'Spiderman', 'Food', 4, 3), 
(3, 'Darkseid', 'Food', 3, 1),
(4, 'Galactus', 'Food', 8, 2),
(5, 'Tiamut', 'Gardening', 6, 4);


INSERT INTO orderline (orderline_id, product_id, order_id)
VALUES (1, 11, 4),
(2, 6, 7), 
(3, 5, 8),
(4, 5, 11),
(5, 9, 12);


ALTER TABLE products CHANGE price price int;

ALTER TABLE users
ADD order_id INT;

/*--------------------------------------------------*/
/* Change 2 records in reviews  */
/*--------------------------------------------------*/
UPDATE reviews
SET reviewer_name = 'Spooderman'
WHERE review_id = 2;

UPDATE reviews
SET reviewer_name = 'Thanos'
WHERE review_id = '3';

/*--------------------------------------------------*/
/* Change 2 records in users  */
/*--------------------------------------------------*/
UPDATE users
SET email = 'charles.xavier@xmen.com'
WHERE user_id = 3;

UPDATE users
SET email = 'gambit@xmen.com'
WHERE user_id = 4;

/*--------------------------------------------------*/
/* Change 2 records in products  */
/*--------------------------------------------------*/
UPDATE products
SET category = 'Self-care'
WHERE product_id = 4;

UPDATE products
SET price = 10
WHERE product_id = 2;

/*--------------------------------------------------*/
/* Change 2 records in orders  */
/*--------------------------------------------------*/
UPDATE orders
SET quantity = 7
WHERE order_id = 4;

UPDATE orders
SET quantity = 8
WHERE order_id = 3;


/*--------------------------------------------------*/
/* Queries  */
/*--------------------------------------------------*/
/* Joins*/
SELECT *
FROM orderline
JOIN orders
ON orders.order_id = orderline.order_id;

SELECT *
FROM users
JOIN orders
ON users.order_id = orderline.order_id;

/* Left Join */
SELECT *
FROM users
LEFT JOIN orders
ON users.order_id = orders.order_id;

ALTER TABLE users
ALTER email SET DEFAULT 'No email address';

ALTER TABLE users
ALTER full_name SET DEFAULT 'No full name';

ALTER TABLE users
ALTER first_line_add SET DEFAULT 'No address';

ALTER TABLE users
ALTER postcode SET DEFAULT 'No postcode';

ALTER TABLE users
ALTER phone SET DEFAULT 1;

INSERT INTO users (order_id)
SELECT order_id FROM orders;

SELECT *
FROM users
LIMIT 1;

/* Max queries */
SELECT MAX(price)
FROM orders;

SELECT MAX(price)
FROM orders
WHERE product_id = 5;
