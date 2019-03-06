


-- Returns the title of the book and the Author
SELECT title, author_name FROM `books` INNER JOIN `authors` ON fk_author_id = author_id 

--Return the title, author_name and pub_name from the table books

SELECT title, author_name, pub_name FROM `books` INNER JOIN `authors` ON fk_author_id = author_id INNER JOIN `publisher`ON fk_pub_id = pub_id;

--Returns the title, author_name, pub_name and shop bought from Table books

SELECT title, author_name, pub_name, shop_name
FROM `books`
INNER JOIN `authors` ON fk_author_id = author_id 
INNER JOIN `publisher`ON fk_pub_id = pub_id
INNER JOIN `shop` ON fk_shop_ind = shop_id;

-- return data listed below

SELECT title, date_buy, date_read_start, date_read_end, shop_name
FROM `books` INNER JOIN `shop` ON fk_shop_ind = shop_id;


-- return number of books bought at one shop

SELECT shop_name, COUNT(book_id)
FROM `books` LEFT JOIN `shop`ON fk_shop_ind = shop_id
GROUP BY shop_id;

--Orders the data by date bought in desc order

SELECT book_id, title, date_buy, date_read_start, date_read_end
FROM `books`
ORDER BY date_buy DESC;

--asc order by date_buy

SELECT book_id, title, date_buy, date_read_start, date_read_end
FROM `books`
ORDER BY date_buy ASC;

-- orders the data by date_buy and adds the shop name to it

SELECT book_id, title, date_buy, date_read_start, date_read_end, shop_name
FROM `books`
INNER JOIN `shop`ON fk_shop_ind = shop_id
ORDER BY date_buy ASC;

-- returns all data and shows specific shop

SELECT  title, date_buy, date_read_start, date_read_end, shop_name
FROM `books`
INNER JOIN `shop` ON fk_shop_ind = shop_id
WHERE shop_name = 'Amazon';