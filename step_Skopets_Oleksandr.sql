-- SQL степ-проект -- Skopets Oleksandr

 -- Запросы
 -- 1.Покажите среднюю зарплату сотрудников за каждый год (средняя заработная плата среди тех, кто работал в отчетный период -статистика с начала до 2005 года).
USE employees;
 /* SELECT YEAR(from_date) AS 'Year', ROUND(AVG(salary) OVER (PARTITION BY salary order by from_date) ,2) AS avg_salary -- без 2003-2005 годов
 from salaries
 where year(from_date) <= 2005
 group by year(from_date)
 order by year(from_date); */
 --
 WITH RECURSIVE avg_salaries (during_year, avg_salary) AS  
(SELECT        1985
              , ROUND(AVG(s.salary),2)  
        FROM salaries AS s
        WHERE 1985 BETWEEN YEAR(s.from_date) AND YEAR(s.to_date) 
UNION ALL  
SELECT  during_year + 1, (SELECT ROUND(AVG(s.salary),2)
            FROM salaries AS s
            WHERE during_year + 1 BETWEEN YEAR(s.from_date) AND YEAR(s.to_date))
FROM avg_salaries
WHERE during_year < 2005)  
SELECT during_year, avg_salary
FROM avg_salaries;
 
 -- 2. Покажите среднюю зарплату сотрудников по каждому отделу. Примечание: принять в расчет только текущие отделы и текущую заработную плату.
 
 SELECT de.dept_no, ROUND(AVG(salary),2) AS avg_salary
 FROM salaries AS s
 INNER JOIN dept_emp AS de
 ON s.emp_no=de.emp_no
 WHERE de.to_date>now() AND s.to_date>now()
 GROUP BY de.dept_no;
 
  /* 3. Покажите среднюю зарплату сотрудников по каждому отделу за каждый год. 
  Примечание: для средней зарплаты отдела X в году Y нам нужно взять среднее значение всех зарплат 
  в году Y сотрудников,которые были в отделе X в году Y. */
 

(SELECT        1985 AS 'year'
			  , de.dept_no
              , round(AVG(s.salary),2) AS AVG_by_dept
        FROM salaries AS s
        INNER JOIN dept_emp AS de
        ON s.emp_no=de.emp_no
        WHERE 1985 BETWEEN YEAR(s.from_date) AND YEAR(s.to_date) 
        AND 1985 BETWEEN YEAR(de.from_date) AND YEAR(de.to_date)
        GROUP BY de.dept_no
        ORDER BY de.dept_no)
UNION 
(SELECT        1986 AS 'year'
			  , de.dept_no
              , round(AVG(s.salary),2) AS AVG_by_dept
        FROM salaries AS s
        INNER JOIN dept_emp AS de
        ON s.emp_no=de.emp_no
        WHERE 1986 BETWEEN YEAR(s.from_date) AND YEAR(s.to_date) 
        AND 1986 BETWEEN YEAR(de.from_date) AND YEAR(de.to_date)
        GROUP BY de.dept_no 
        ORDER BY de.dept_no)                  
UNION
     (SELECT        1987 AS 'year'
			  , de.dept_no
              , round(AVG(s.salary),2) AS AVG_by_dept
        FROM salaries AS s
        INNER JOIN dept_emp AS de
        ON s.emp_no=de.emp_no
        WHERE 1987 BETWEEN YEAR(s.from_date) AND YEAR(s.to_date)
        AND 1987 BETWEEN YEAR(de.from_date) AND YEAR(de.to_date)
        GROUP BY de.dept_no
        ORDER BY de.dept_no)
UNION 
   (SELECT       1988 AS 'year'
			  , de.dept_no
              , round(AVG(s.salary),2)AS AVG_by_dept
        FROM salaries AS s
        INNER JOIN dept_emp AS de
        ON s.emp_no=de.emp_no
        WHERE 1988 BETWEEN YEAR(s.from_date) AND YEAR(s.to_date) 
        AND 1988 BETWEEN YEAR(de.from_date) AND YEAR(de.to_date)
        GROUP BY de.dept_no
        ORDER BY de.dept_no)
UNION 
 (SELECT        1989 AS 'year'
			  , de.dept_no
              , round(AVG(s.salary),2) AS AVG_by_dept
        FROM salaries AS s
        INNER JOIN dept_emp AS de
        ON s.emp_no=de.emp_no
        WHERE 1989 BETWEEN YEAR(s.from_date) AND YEAR(s.to_date) 
        AND 1989 BETWEEN YEAR(de.from_date) AND YEAR(de.to_date)
        GROUP BY de.dept_no
        ORDER BY de.dept_no)
UNION
 (SELECT        1990 AS 'year'
			  , de.dept_no
              , round(AVG(s.salary),2) AS AVG_by_dept
        FROM salaries AS s
        INNER JOIN dept_emp AS de
        ON s.emp_no=de.emp_no
        WHERE 1990 BETWEEN YEAR(s.from_date) AND YEAR(s.to_date) AND 1990 BETWEEN YEAR(de.from_date) AND YEAR(de.to_date)
        GROUP BY de.dept_no
        ORDER BY de.dept_no)
UNION 
 (SELECT        1991 AS 'year'
			  , de.dept_no
              , round(AVG(s.salary),2) AS AVG_by_dept
        FROM salaries AS s
        INNER JOIN dept_emp AS de
        ON s.emp_no=de.emp_no
        WHERE 1991 BETWEEN YEAR(s.from_date) AND YEAR(s.to_date) 
        AND 1991 BETWEEN YEAR(de.from_date) AND YEAR(de.to_date)
        GROUP BY de.dept_no
        ORDER BY de.dept_no)
UNION
 (SELECT        1992 AS 'year'
			  , de.dept_no
              , round(AVG(s.salary),2) AS AVG_by_dept
        FROM salaries AS s
        INNER JOIN dept_emp AS de
        ON s.emp_no=de.emp_no
        WHERE 1992 BETWEEN YEAR(s.from_date) AND YEAR(s.to_date)
        AND 1992 BETWEEN YEAR(de.from_date) AND YEAR(de.to_date)
        GROUP BY de.dept_no
        ORDER BY de.dept_no)
UNION 
 (SELECT        1993 AS 'year'
			  , de.dept_no
              , round(AVG(s.salary),2) AS AVG_by_dept
        FROM salaries AS s
        INNER JOIN dept_emp AS de
        ON s.emp_no=de.emp_no
        WHERE 1993 BETWEEN YEAR(s.from_date) AND YEAR(s.to_date)
        AND 1993 BETWEEN YEAR(de.from_date) AND YEAR(de.to_date)
        GROUP BY de.dept_no
        ORDER BY de.dept_no)
UNION 
 (SELECT        1994 AS 'year'
			  , de.dept_no
              , round(AVG(s.salary),2) AS AVG_by_dept
        FROM salaries AS s
        INNER JOIN dept_emp AS de
        ON s.emp_no=de.emp_no
        WHERE 1994 BETWEEN YEAR(s.from_date) AND YEAR(s.to_date)
        AND 1994 BETWEEN YEAR(de.from_date) AND YEAR(de.to_date)
        GROUP BY de.dept_no
        ORDER BY de.dept_no)
UNION 
 (SELECT        1995 AS 'year'
			  , de.dept_no
              , round(AVG(s.salary),2) AS AVG_by_dept
        FROM salaries AS s
        INNER JOIN dept_emp AS de
        ON s.emp_no=de.emp_no
        WHERE 1995 BETWEEN YEAR(s.from_date) AND YEAR(s.to_date)
        AND 1995 BETWEEN YEAR(de.from_date) AND YEAR(de.to_date)
        GROUP BY de.dept_no
        ORDER BY de.dept_no)
UNION 
 (SELECT        1996 AS 'year'
			  , de.dept_no
              , round(AVG(s.salary),2) AS AVG_by_dept
        FROM salaries AS s
        INNER JOIN dept_emp AS de
        ON s.emp_no=de.emp_no
        WHERE 1996 BETWEEN YEAR(s.from_date) AND YEAR(s.to_date)
        AND 1996 BETWEEN YEAR(de.from_date) AND YEAR(de.to_date)
        GROUP BY de.dept_no
        ORDER BY de.dept_no)
UNION 
 (SELECT        1997 AS 'year'
			  , de.dept_no
              , round(AVG(s.salary),2) AS AVG_by_dept
        FROM salaries AS s
        INNER JOIN dept_emp AS de
        ON s.emp_no=de.emp_no
        WHERE 1997 BETWEEN YEAR(s.from_date) AND YEAR(s.to_date)
        AND 1997 BETWEEN YEAR(de.from_date) AND YEAR(de.to_date)
        GROUP BY de.dept_no
        ORDER BY de.dept_no)
UNION 
 (SELECT        1998 AS 'year'
			  , de.dept_no
              , round(AVG(s.salary),2) AS AVG_by_dept
        FROM salaries AS s
        INNER JOIN dept_emp AS de
        ON s.emp_no=de.emp_no
        WHERE 1998 BETWEEN YEAR(s.from_date) AND YEAR(s.to_date)
        AND 1998 BETWEEN YEAR(de.from_date) AND YEAR(de.to_date)
        GROUP BY de.dept_no
        ORDER BY de.dept_no)
UNION 
 (SELECT        1999 AS 'year'
			  , de.dept_no
              , round(AVG(s.salary),2) AS AVG_by_dept
        FROM salaries AS s
        INNER JOIN dept_emp AS de
        ON s.emp_no=de.emp_no
        WHERE 1999 BETWEEN YEAR(s.from_date) AND YEAR(s.to_date)
        AND 1999 BETWEEN YEAR(de.from_date) AND YEAR(de.to_date)
        GROUP BY de.dept_no
        ORDER BY de.dept_no)
UNION 
 (SELECT        2000 AS 'year'
			  , de.dept_no
              , round(AVG(s.salary),2) AS AVG_by_dept
        FROM salaries AS s
        INNER JOIN dept_emp AS de
        ON s.emp_no=de.emp_no
        WHERE 2000 BETWEEN YEAR(s.from_date) AND YEAR(s.to_date)
        AND 2000 BETWEEN YEAR(de.from_date) AND YEAR(de.to_date)
        GROUP BY de.dept_no
        ORDER BY de.dept_no)
UNION 
 (SELECT        2001 AS 'year'
			  , de.dept_no
              , round(AVG(s.salary),2) AS AVG_by_dept
        FROM salaries AS s
        INNER JOIN dept_emp AS de
        ON s.emp_no=de.emp_no
        WHERE 2001 BETWEEN YEAR(s.from_date) AND YEAR(s.to_date)
        AND 2001 BETWEEN YEAR(de.from_date) AND YEAR(de.to_date)
        GROUP BY de.dept_no
        ORDER BY de.dept_no)
UNION 
 (SELECT        2002 AS 'year'
			  , de.dept_no
              , round(AVG(s.salary),2) AS AVG_by_dept
        FROM salaries AS s
        INNER JOIN dept_emp AS de
        ON s.emp_no=de.emp_no
        WHERE 2002 BETWEEN YEAR(s.from_date) AND YEAR(s.to_date)
        AND 2002 BETWEEN YEAR(de.from_date) AND YEAR(de.to_date)
        GROUP BY de.dept_no
        ORDER BY de.dept_no);
 
 -- 4. Покажите для каждого года самый крупный отдел (по количеству сотрудников) в этом году и его среднюю зарплату.
 
 (SELECT        1985 AS 'year'
			  , de.dept_no
              , count(de.emp_no)   AS 'count'
              , round(AVG(s.salary),2) AS AVG_by_dept
        FROM salaries AS s
        INNER JOIN dept_emp AS de
        ON s.emp_no=de.emp_no
        WHERE 1985 BETWEEN YEAR(s.from_date) AND YEAR(s.to_date) 
        AND 1985 BETWEEN YEAR(de.from_date) AND YEAR(de.to_date)
        GROUP BY de.dept_no
        ORDER BY count(de.emp_no) DESC
        LIMIT 1)
UNION
     (SELECT        1986 AS 'year'
			  , de.dept_no
              , count(de.emp_no)  AS 'count'
              , round(AVG(s.salary),2) AS AVG_by_dept
        FROM salaries AS s
        INNER JOIN dept_emp AS de
        ON s.emp_no=de.emp_no
        WHERE 1986 BETWEEN YEAR(s.from_date) AND YEAR(s.to_date) 
        AND 1986 BETWEEN YEAR(de.from_date) AND YEAR(de.to_date)
        GROUP BY de.dept_no
        ORDER BY count(de.emp_no) DESC
        LIMIT 1)
UNION 
        (SELECT        1987 AS 'year'
			  , de.dept_no
              , count(de.emp_no)   AS 'count'
              , round(AVG(s.salary),2) AS AVG_by_dept
        FROM salaries AS s
        INNER JOIN dept_emp AS de
        ON s.emp_no=de.emp_no
        WHERE 1987 BETWEEN YEAR(s.from_date) AND YEAR(s.to_date) 
        AND 1987 BETWEEN YEAR(de.from_date) AND YEAR(de.to_date)
        GROUP BY de.dept_no
        ORDER BY count(de.emp_no) DESC
        LIMIT 1)
UNION 
  (SELECT        1988 AS 'year'
			  , de.dept_no
              , count(de.emp_no)   AS 'count'
              , round(AVG(s.salary),2) AS AVG_by_dept
        FROM salaries AS s
        INNER JOIN dept_emp AS de
        ON s.emp_no=de.emp_no
        WHERE 1988 BETWEEN YEAR(s.from_date) AND YEAR(s.to_date) 
        AND 1988 BETWEEN YEAR(de.from_date) AND YEAR(de.to_date)
        GROUP BY de.dept_no
        ORDER BY count(de.emp_no) DESC
        LIMIT 1)
UNION
  (SELECT        1989 AS 'year'
			  , de.dept_no
              , count(de.emp_no)   AS 'count'
              , round(AVG(s.salary),2) AS AVG_by_dept
        FROM salaries AS s
        INNER JOIN dept_emp AS de
        ON s.emp_no=de.emp_no
        WHERE 1989 BETWEEN YEAR(s.from_date) AND YEAR(s.to_date) 
        AND 1989 BETWEEN YEAR(de.from_date) AND YEAR(de.to_date)
        GROUP BY de.dept_no
        ORDER BY count(de.emp_no) DESC
        LIMIT 1)
UNION 
  (SELECT        1990 AS 'year'
			  , de.dept_no
              , count(de.emp_no)   AS 'count'
              , round(AVG(s.salary),2) AS AVG_by_dept
        FROM salaries AS s
        INNER JOIN dept_emp AS de
        ON s.emp_no=de.emp_no
        WHERE 1990 BETWEEN YEAR(s.from_date) AND YEAR(s.to_date) 
        AND 1990 BETWEEN YEAR(de.from_date) AND YEAR(de.to_date)
        GROUP BY de.dept_no
        ORDER BY count(de.emp_no) DESC
        LIMIT 1)
UNION 
  (SELECT        1991 AS 'year'
			  , de.dept_no
              , count(de.emp_no)   AS 'count'
              , round(AVG(s.salary),2) AS AVG_by_dept
        FROM salaries AS s
        INNER JOIN dept_emp AS de
        ON s.emp_no=de.emp_no
        WHERE 1991 BETWEEN YEAR(s.from_date) AND YEAR(s.to_date) 
        AND 1991 BETWEEN YEAR(de.from_date) AND YEAR(de.to_date)
        GROUP BY de.dept_no
        ORDER BY count(de.emp_no) DESC
        LIMIT 1)
UNION
  (SELECT        1992 AS 'year'
			  , de.dept_no
              , count(de.emp_no)   AS 'count'
              , round(AVG(s.salary),2) AS AVG_by_dept
        FROM salaries AS s
        INNER JOIN dept_emp AS de
        ON s.emp_no=de.emp_no
        WHERE 1992 BETWEEN YEAR(s.from_date) AND YEAR(s.to_date) 
        AND 1992 BETWEEN YEAR(de.from_date) AND YEAR(de.to_date)
        GROUP BY de.dept_no
        ORDER BY count(de.emp_no) DESC
        LIMIT 1)
UNION
  (SELECT        1993 AS 'year'
			  , de.dept_no
              , count(de.emp_no)   AS 'count'
              , round(AVG(s.salary),2) AS AVG_by_dept
        FROM salaries AS s
        INNER JOIN dept_emp AS de
        ON s.emp_no=de.emp_no
        WHERE 1993 BETWEEN YEAR(s.from_date) AND YEAR(s.to_date) 
        AND 1993 BETWEEN YEAR(de.from_date) AND YEAR(de.to_date)
        GROUP BY de.dept_no
        ORDER BY count(de.emp_no) DESC
        LIMIT 1)
UNION
  (SELECT        1994 AS 'year'
			  , de.dept_no
              , count(de.emp_no)   AS 'count'
              , round(AVG(s.salary),2) AS AVG_by_dept
        FROM salaries AS s
        INNER JOIN dept_emp AS de
        ON s.emp_no=de.emp_no
        WHERE 1994 BETWEEN YEAR(s.from_date) AND YEAR(s.to_date) 
        AND 1994 BETWEEN YEAR(de.from_date) AND YEAR(de.to_date)
        GROUP BY de.dept_no
        ORDER BY count(de.emp_no) DESC
        LIMIT 1)
UNION
  (SELECT        1995 AS 'year'
			  , de.dept_no
              , count(de.emp_no)   AS 'count'
              , round(AVG(s.salary),2) AS AVG_by_dept
        FROM salaries AS s
        INNER JOIN dept_emp AS de
        ON s.emp_no=de.emp_no
        WHERE 1995 BETWEEN YEAR(s.from_date) AND YEAR(s.to_date) 
        AND 1995 BETWEEN YEAR(de.from_date) AND YEAR(de.to_date)
        GROUP BY de.dept_no
        ORDER BY count(de.emp_no) DESC
        LIMIT 1)
UNION  
  (SELECT        1996 AS 'year'
			  , de.dept_no
              , count(de.emp_no)   AS 'count'
              , round(AVG(s.salary),2) AS AVG_by_dept
        FROM salaries AS s
        INNER JOIN dept_emp AS de
        ON s.emp_no=de.emp_no
        WHERE 1996 BETWEEN YEAR(s.from_date) AND YEAR(s.to_date) 
        AND 1996 BETWEEN YEAR(de.from_date) AND YEAR(de.to_date)
        GROUP BY de.dept_no
        ORDER BY count(de.emp_no) DESC
        LIMIT 1)
UNION 
  (SELECT        1997 AS 'year'
			  , de.dept_no
              , count(de.emp_no)   AS 'count'
              , round(AVG(s.salary),2) AS AVG_by_dept
        FROM salaries AS s
        INNER JOIN dept_emp AS de
        ON s.emp_no=de.emp_no
        WHERE 1997 BETWEEN YEAR(s.from_date) AND YEAR(s.to_date) 
        AND 1997 BETWEEN YEAR(de.from_date) AND YEAR(de.to_date)
        GROUP BY de.dept_no
        ORDER BY count(de.emp_no) DESC
        LIMIT 1)
UNION 
  (SELECT        1998 AS 'year'
			  , de.dept_no
              , count(de.emp_no)   AS 'count'
              , round(AVG(s.salary),2) AS AVG_by_dept
        FROM salaries AS s
        INNER JOIN dept_emp AS de
        ON s.emp_no=de.emp_no
        WHERE 1998 BETWEEN YEAR(s.from_date) AND YEAR(s.to_date) 
        AND 1998 BETWEEN YEAR(de.from_date) AND YEAR(de.to_date)
        GROUP BY de.dept_no
        ORDER BY count(de.emp_no) DESC
        LIMIT 1)
UNION 
  (SELECT        1999 AS 'year'
			  , de.dept_no
              , count(de.emp_no)   AS 'count'
              , round(AVG(s.salary),2) AS AVG_by_dept
        FROM salaries AS s
        INNER JOIN dept_emp AS de
        ON s.emp_no=de.emp_no
        WHERE 1999 BETWEEN YEAR(s.from_date) AND YEAR(s.to_date) 
        AND 1999 BETWEEN YEAR(de.from_date) AND YEAR(de.to_date)
        GROUP BY de.dept_no
        ORDER BY count(de.emp_no) DESC
        LIMIT 1)
UNION 
  (SELECT        2000 AS 'year'
			  , de.dept_no
              , count(de.emp_no)   AS 'count'
              , round(AVG(s.salary),2) AS AVG_by_dept
        FROM salaries AS s
        INNER JOIN dept_emp AS de
        ON s.emp_no=de.emp_no
        WHERE 2000 BETWEEN YEAR(s.from_date) AND YEAR(s.to_date) 
        AND 2000 BETWEEN YEAR(de.from_date) AND YEAR(de.to_date)
        GROUP BY de.dept_no
        ORDER BY count(de.emp_no) DESC
        LIMIT 1)
UNION 
  (SELECT        2001 AS 'year'
			  , de.dept_no
              , count(de.emp_no)   AS 'count'
              , round(AVG(s.salary),2) AS AVG_by_dept
        FROM salaries AS s
        INNER JOIN dept_emp AS de
        ON s.emp_no=de.emp_no
        WHERE 2001 BETWEEN YEAR(s.from_date) AND YEAR(s.to_date) 
        AND 2001 BETWEEN YEAR(de.from_date) AND YEAR(de.to_date)
        GROUP BY de.dept_no
        ORDER BY count(de.emp_no) DESC
        LIMIT 1)
UNION
  (SELECT        2002 AS 'year'
			  , de.dept_no
              , count(de.emp_no)   AS 'count'
              , round(AVG(s.salary),2) AS AVG_by_dept
        FROM salaries AS s
        INNER JOIN dept_emp AS de
        ON s.emp_no=de.emp_no
        WHERE 2002 BETWEEN YEAR(s.from_date) AND YEAR(s.to_date) 
        AND 2002 BETWEEN YEAR(de.from_date) AND YEAR(de.to_date)
        GROUP BY de.dept_no
        ORDER BY count(de.emp_no) DESC
        LIMIT 1);
 
 -- 5. Покажите подробную информацию о менеджере, который дольше всех исполняет свои обязанности на данный момент.
 SELECT e.*
 FROM employees AS e
 INNER JOIN dept_manager AS dm
 ON e.emp_no = dm.emp_no
 WHERE dm.to_date>now()
 ORDER BY dm.from_date
 LIMIT 1;
 
 -- 6. Покажите топ-10 нынешних сотрудников компании с наибольшей разницей между их зарплатой и текущей средней зарплатой в их отделе.
 
 SELECT s.emp_no, s.salary - AVG(salary) OVER ( PARTITION BY de.dept_no ORDER BY de.emp_no ) salary_diff
  FROM salaries AS s
  INNER JOIN dept_emp AS de
  ON s.emp_no=de.emp_no
  WHERE s.to_date>now()
  ORDER BY salary_diff DESC
  LIMIT 10;
  
  
  
  /* 7.Из-за кризиса на одно подразделение на своевременную выплату зарплаты выделяется всего 500 тысяч долларов. 
  Правление решило, что низкооплачиваемые сотрудники будут первыми получать зарплату. 
  Показать список всех сотрудников, которые будут вовремя получать зарплату 
  (обратите внимание, что мы должны платить зарплату за один месяц, но в базе данных мы храним годовые суммы). 
  */
  
SELECT month_cume_salary.*               
FROM (
SELECT dept_emp.dept_no, salaries.emp_no, salaries.salary/12 AS month_salary,
SUM(salaries.salary/12) OVER (PARTITION BY dept_emp.dept_no ORDER BY salaries.salary/12) AS month_sum_salary                                                                      
FROM employees.dept_emp
LEFT JOIN employees.salaries ON salaries.emp_no = dept_emp.emp_no
WHERE salaries.to_date > now() ) AS month_cume_salary
WHERE  month_sum_salary <= 500000;




-- Дизайн базы данных:
/* 1.Разработайте базу данных для управления курсами. 
База данных содержит следующие сущности:
a. students: student_no, teacher_no, course_no, student_name, email, birth_date.
b. teachers: teacher_no, teacher_name, phone_no
c. courses: course_no, course_name, start_date, end_date. 
 - Секционировать по годам, таблицу studentsпо полю birth_dateс помощью механизма range
 - В таблице studentsсделать первичный ключ в сочетании двух полей student_noи birth_date
 - Создать индекс по полю students.email 
 - Создать уникальный индекс по полю teachers.phone_no*/

CREATE DATABASE course_manag;


CREATE TABLE course_manag.students (
    student_no INT NOT NULL ,
    teacher_no INT NOT NULL,
    course_no INT NOT NULL,
    email VARCHAR(50),
    birth_date DATE NOT NULL,
    PRIMARY KEY (`student_no`,`birth_date`)
    )
    PARTITION BY RANGE (YEAR(birth_date)) (
PARTITION p0 VALUES LESS THAN (2020),   
PARTITION p1 VALUES LESS THAN (2021),
PARTITION p2 VALUES LESS THAN (2022))  
;

CREATE TABLE course_manag.teachers (
    teacher_no INT,
    teacher_name VARCHAR(50),
    phone_no INT
    );

CREATE TABLE course_manag.courses (
    course_no INT,
    course_name VARCHAR(75),
    start_date DATE,
    end_date DATE
);

CREATE INDEX stud_email
 ON course_manag.students (email);

CREATE UNIQUE INDEX teachers_phone
ON course_manag.teachers (phone_no);

-- 2. На свое усмотрение добавить тестовые данные (7-10 строк) в наши три таблицы.
INSERT INTO course_manag.students
VALUE (1, 1, 101, 'ivan@gmail.com', '1988-10-10'),
(2, 3, 103, 'anna@gmail.com', '1990-12-12'),
(3, 1, 102, 'dog@gmail.com', '1991-05-01'),
(4, 2, 101, 'qwert@gmail.com', '1990-07-08'),
(5, 2, 103, 'kolo@gmail.com', '1991-11-08'),
(6, 3, 102, 'polo@gmail.com', '1989-11-02'),
(7, 1, 102, 'grem@gmail.com', '1990-12-23');


INSERT INTO course_manag.teachers
VALUE (1, 'Nina', 0502202213),
(2, 'Ira', 0978202213),
(3, 'Ivan', 0502204421),
(4, 'Pavlo', 0504569876),
(5, 'Oksana', 0996701347),
(6, 'Peter', 0935690001),
(7, 'John', 0508751313);



INSERT INTO course_manag.courses
VALUE (101, 'History', '2020-01-10', '2021-03-30'),
(102, 'Analytics', '2020-03-01', '2021-02-25'),
(103, 'Law', '2020-09-15', '2021-04-30'),
(104, 'Economics', '2020-10-21', '2021-05-21'),
(105, 'Psychology', '2020-05-01', '2020-10-30'),
(106, 'Reading', '2020-08-08', '2021-08-08'),
(107, 'Writing', '2020-07-11', '2021-02-22');

 /* 3. Отобразить данные за любой год из таблицы students и зафиксировать в виду комментария план выполнения запроса, 
где будет видно что запрос будет выполняться по конкретной секции. */

EXPLAIN SELECT *
FROM course_manag.students
WHERE YEAR(birth_date) =1990; -- type ALL

/* 4. Отобразить данные учителя, по любому одному номеру телефона и зафиксировать план выполнения запроса, 
где будет видно, что запрос будет выполняться по индексу, а не методом ALL. 
Далее индекс из поля teachers.phone_no сделать невидимым и зафиксировать план выполнения запроса, 
где ожидаемый результат -метод ALL. В итоге индекс оставить в статусе -видимый. 
*/

EXPLAIN SELECT *
FROM course_manag.teachers
WHERE phone_no=0502204421; -- type const

ALTER TABLE course_manag.teachers
ALTER INDEX teachers_phone INVISIBLE;

EXPLAIN SELECT *
FROM course_manag.teachers
WHERE phone_no=0502204421; -- type ALL

ALTER TABLE course_manag.teachers
ALTER INDEX teachers_phone VISIBLE;

-- 5.Специально сделаем 3 дубляжа в таблице students (добавим еще 3 одинаковые строки).

ALTER TABLE course_manag.students  DROP PRIMARY KEY;
INSERT INTO course_manag.students
VALUE (8, 2, 103, 'pio@gmail.com', '1990-12-01'),
(8, 2, 103, 'pio@gmail.com', '1990-12-01'),
(8, 2, 103, 'pio@gmail.com', '1990-12-01');

SELECT *
FROM course_manag.students;

-- 6. Написать запрос, который выводит строки с дубляжами.
SELECT *
FROM course_manag.students
GROUP BY student_no, email
HAVING count(student_no) >1 AND count(email)>1;

