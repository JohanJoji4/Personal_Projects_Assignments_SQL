-- Question 1 set 3.

use assignment;

-- Writing a SP.

DELIMITER //
Create procedure order_status( IN t_year INT, IN t_month INT )
	BEGIN 
		select orderNumber,orderdate,status from orders where year(orderDate) = t_year AND month(orderDate) = t_month;
	END //
DELIMITER ;

-- Order placed.

call order_status(2005, 5);

-- Question 2A set 3.

-- Total purchase amount for the customer is < 25000 status = Silver, amount between 25000 and 50000, status = Gold, if amount > 50000 Platinum.

select * from payments;

-- Creating a function.

delimiter //
CREATE FUNCTION pur_stat(
	cid int
) 
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE stat VARCHAR(20);
    DECLARE credit numeric;
    SET credit = (select sum(Amount) from Payments where customerNumber = cid);

    IF credit > 50000 THEN
		SET stat = 'platinum';
    ELSEIF (credit >= 25000 AND 
			credit <= 50000) THEN
        SET stat = 'gold';
    ELSEIF credit < 25000 THEN
        SET stat = 'silver';
    END IF;
	-- return the customer level
	RETURN (stat);
END //

Delimiter ;

-- drop function pur_stat;

-- Query to find status

-- CALL customer_status( 456 );

select 456 as customerNumber, pur_stat(456) as purchase_status;


-- Question 2B set 3.

select c.customerNumber, c.customerName, o.status from customers c LEFT JOIN orders o USING (customerNumber);

-- Question 3 set 3.

DELIMITER //
CREATE TRIGGER delete_cascade
  AFTER DELETE on movies FOR EACH ROW 
    BEGIN
      UPDATE rentals SET movieid = NULL WHERE movieid NOT IN (SELECT distinct id from movies);
    END //
DELIMITER ;

drop trigger if exists delete_cascade;

select * from movies;

INSERT INTO movies(id,title,category) Values (21, 'Bigil', 'Action');

INSERT INTO rentals(memid,first_name,last_name,movieid ) Values (29,'Johan','Prince',21 );

delete from movies where id = 21;

SELECT id from movies;

SELECT * from rentals;

DELIMITER //
CREATE TRIGGER update_cascade
  AFTER UPDATE on movies FOR EACH ROW 
    BEGIN
      UPDATE rentals SET movieid = new.id WHERE movieid = old.id;
    END //
DELIMITER ;

DROP trigger if exists update_cascade;

INSERT INTO movies(id,title,category)Values (294, 'Bigil', 'Action'); 

UPDATE rentals SET movieid = 294 WHERE memid = 29;

UPDATE movies SET id = 21 WHERE title regexp 'Dark Knight';

select * from movies;

select * from rentals;

-- Question 4 set 3.

select * from employee order by salary desc limit 2,1;

-- Question 5 set 3.

select *, dense_rank () OVER (order by salary desc) as Rank_salary from employee;

-- Dropping database assignment

-- Drop Database assignment;


