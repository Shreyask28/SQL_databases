CREATE DATABASE college_db;

USE college_db;
SHOW DATABASES;

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    city VARCHAR(50)
);

INSERT INTO students (student_id, name, age, city)
VALUES
(1, 'Rahul', 20, 'Pune'),
(2, 'Amit', 21, 'Mumbai'),
(3, 'Priya', 19, 'Nashik'),
(4, 'Sneha', 22, 'Pune'),
(5, 'Rohan', 20, 'Nagpur'),
(6, 'Anjali', 23, 'Mumbai'),
(7, 'Karan', 21, 'Nashik'),
(8, 'Neha', 19, 'Pune');



SELECT * FROM students;


CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50) NOT NULL,
    fees INT
);



INSERT INTO courses (course_id, course_name, fees)
VALUES
(101, 'Python', 5000),
(102, 'Java', 6000),
(103, 'Web Development', 7000),
(104, 'Data Science', 10000),
(105, 'DBMS', 4000);




CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);



INSERT INTO enrollments
(enrollment_id, student_id, course_id, enrollment_date)
VALUES
(1, 1, 101, '2026-01-10'),
(2, 2, 102, '2026-01-12'),
(3, 3, 103, '2026-01-15'),
(4, 4, 104, '2026-01-18'),
(5, 5, 105, '2026-01-20'),
(6, 6, 101, '2026-02-01'),
(7, 7, 103, '2026-02-05'),
(8, 8, 102, '2026-02-10'),
(9, 1, 105, '2026-02-15'),
(10, 3, 104, '2026-02-20');

SELECT * FROM students;
SELECT*FROM courses;
SELECT * FROM enrollments;



SELECT * FROM students;
SELECT name FROM students;
SELECT name,city FROM students;
SELECT course_name FROM courses;
SELECT * FROM students 
WHERE age>20;


SELECT * FROM students 
WHERE age>19 AND city ='Pune';

SELECT * FROM students 
WHERE city='Mumbai' OR city ='Pune';

SELECT * FROM students 
WHERE age BETWEEN 20 AND 22;

SELECT students.name, enrollments.course_id
FROM students
INNER JOIN enrollments
ON students.student_id = enrollments.student_id;

-- SELECT a.name, b.student_id
-- FROM students AS a
-- INNER JOIN enrollments AS b
-- ON a.student_id = b.student_id;


SELECT 
    s.name,
    c.course_name,
    c.fees
FROM students AS s
INNER JOIN enrollments AS e
ON s.student_id = e.student_id
INNER JOIN courses AS c
ON e.course_id = c.course_id;





USE college_db;

SELECT * FROM students;
SELECT * FROM courses;
SELECT * FROM enrollments;



SELECT *
FROM students
INTO OUTFILE '/Users/shreyaskumbhar2006/Desktop/SQL_databases/college_db/students.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';


SHOW VARIABLES LIKE 'secure_file_priv';
