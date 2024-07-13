CREATE TABLE students (
    ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Gender CHAR(1)
);


INSERT INTO students (ID, Name, Gender) VALUES
(1, 'Gopal', 'M'),
(2, 'Rohit', 'M'),
(3, 'Amit', 'M'),
(4, 'Suraj', 'M'),
(5, 'Ganesh', 'M'),
(6, 'Neha', 'F'),
(7, 'Isha', 'F'),
(8, 'Geeta', 'F');


--SQL QUERY TO DISPLAY GENDER ALTERNATELY--

SELECT * FROM STUDENTS

WITH CTE1 AS
(
	SELECT *,
	ROW_NUMBER()OVER(PARTITION BY GENDER ORDER BY ID) AS RN
	FROM STUDENTS
),
CTE2 AS
(
SELECT ID,
	   NAME,
	   GENDER,
       RN
	FROM CTE1
ORDER BY RN,
		 CASE
			WHEN GENDER='M' THEN 1
	        ELSE 2
	     END
)
SELECT 
ID,
NAME,
GENDER 
FROM CTE2
