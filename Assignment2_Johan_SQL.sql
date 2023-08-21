-- Question 1 set 2.

-- Using the previously created database.

use assignment;

select * from employee where salary > 3000 AND deptno = 10;

-- Question 2 set 2.

-- Alloting students grades based on their marks.

  ALTER TABLE students ADD COLUMN Grade varchar(20) after marks;
  
  describe students;
  
  UPDATE students
  SET Grade = 
     CASE
			WHEN marks BETWEEN 40 AND 49.99 THEN 'Third Class'
            WHEN marks BETWEEN 50 AND 59.99 THEN 'First Class'
            WHEN marks BETWEEN 60 AND 79.99 THEN 'Second Class'
            WHEN marks BETWEEN 80 AND 100 THEN 'Distinction'
            ELSE 'Failed'
    END;
  
-- Question 2A set 2.

select count(Grade) as 'Students graduated with First Class' from students where Grade regexp 'First';

-- Question 2B set 2.

select count(Grade) as 'Students graduated with Distinction' from students where Grade regexp 'Dist';

-- Question 3 set 2.

Select * from station;

select * from station where id % 2 = 0;

select *,COUNT(*) as CNT from station where id % 2 = 0 GROUP BY id, city, state, lat_n, long_w HAVING CNT = 1;

select * from station where id % 2 = 0 GROUP BY id, city, state, lat_n, long_w HAVING COUNT(*) = 1;

-- Question 4 set 2.

select count(city) as 'Count of all Cities' from station;

-- if A is the number of city in station, and A1 is the number of distinct city names in station, Then we will write query as A-A1 from station.

select count(distinct city) as 'Count of Distinct Cities' from station;

select count(city) - count( distinct city) as 'Difference Between Number of Distinct and All Cities' from station;

-- Question 5A set 2.

select city FROM station where city regexp '^a|^e|^i|^o|^u' GROUP BY city order by city;

-- Question 5B set 2.

select distinct city FROM assignment.station where city regexp '^[aioue].*[aeiou]$' order by city;

-- Question 5C set 2.

select distinct city FROM station where city regexp '^[^aeiou]' order by city;

-- Question 5D set 2.

select distinct city FROM station where city regexp '^[^aeiou]|.*[^aeiou]$';

-- Question 6 set 2.

select Concat(first_name, ' ', last_name) as Employee, Concat(salary, '$') as 'Salary($)', hire_date, timestampdiff(MONTH, hire_date, current_date()) as 'Total_Months_Joined' 
from emp where salary > 2000 having Total_Months_Joined < 36 order by salary desc;

-- Question 7 set 2.

select deptno, sum(salary) as Total_salary from employee group by deptno;

-- Question 8 set 2.

select name as City, population from city where population > 100000 order by population desc;

-- Question 9 set 2.

select district, sum(population) as Total_population from city where district regexp 'California' group by district;

-- Question 10 set 2.

select district as District, AVG(population) as Average_Population from city group by District;

-- Question 11 set 2.

select o.ordernumber, o.status, o.customernumber, c.customername, o.comments from customers c JOIN orders o USING (customernumber) Where o.status = 'Disputed';
















