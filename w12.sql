create database w12 ;
use w12;
CREATE TABLE employees (
EMPNO INTEGER PRIMARY KEY,
ENAME varchar(255) NOT NULL,
JOB varchar(255) NOT NULL,
MGR INTEGER,
HIREDATE date NOT NULL,
Salary INTEGER NOT NULL,
COMM varchar(255),
DEPTNO INTEGER NOT NULL
);
-- insert
INSERT INTO employees
VALUES (7369, 'SMITH', 'CLERK', 7902, '1980/12/17', 800, NULL, 20),
(7499, 'ALLEN', 'SALESMAN', 7698, '1981/02/20', 1600, 300, 30),
(7521, 'WARD', 'SALESMAN', 7698, '1981/02/22', 1250, 500, 30),
(7566, 'JONES', 'MANAGER', 7839, '1980/08/02', 2975, NULL, 20),
(7654, 'MARTIN', 'SALESMAN', 7698, '1981/09/28', 1250, 1400, 30),
(7698, 'BLAKE', 'MANAGER', 7839, '1981/05/01', 2850, NULL, 30),
(7782, 'CLARK', 'MANAGER', 7839, '1981/06/09', 2450, NULL, 20),
(7788, 'SCOTT', 'ANALYST', 7566, '1982/12/09', 3100, NULL, 30),
(7839, 'KING', 'PRESIDENT',NULL , '1981/11/17', 5000, NULL, 10),
(7844, 'TURNER', 'SALESMAN', 7698, '1981/09/08', 1500, 0, 30),
(7876, 'ADAMS', 'CLERK', 7788, '1983/01/12', 1100, NULL, 20),
(7900, 'JAMES', 'CLERK', 7698, '1981/12/03', 950, NULL, 30),
(7902, 'FORD', 'ANALYST', 7566, '1981/12/03', 3000, NULL, 20),
(7934, 'MILLER', 'CLERK', 7782, '1983/01/23', 1300, NULL, 20);
-- CREATE TABLE 2"
CREATE TABLE depts (
DEPTNO INTEGER PRIMARY KEY,
DNAME varchar(255) NOT NULL,
Location varchar(255) NOT NULL
);
-- insert
INSERT INTO depts
VALUES (10, 'accounting', '	'),
(20, 'research', 'Dallas'),
(30, 'sales', 'Chicago'),
(40, 'operations', 'Boston');
select * from employees ;
select distinct JOB FROM employees ;
select * from employees order by Salary ;
select * from employees order by Salary ;
select * from employees order by DEPTNO asc,JOB desc ;
SELECT DISTINCT JOB FROM employees
ORDER BY JOB DESC;
select * from employees where JOB= 'MANAGER';
select * from employees where HIREDATE <'1981-01-01';
sELECT EMPNO, JOB,ENAME, Salary,
Salary/30 AS Daily_Sal
FROM employees;
select EMPNO, ENAME, JOB, HIREDATE,year(curdate())-year(hiredate())as experience from employees where JOB='MANAGER';
SELECT EMPNO, ENAME, Salary,
YEAR(CURDATE()) - YEAR(HIREDATE) AS Experience
FROM employees
WHERE MGR = 7698;
SELECT * from employees WHERE COMM > Salary;
select * from employees where HIREDATE <'1981-06-30'order by JOB ASC ;
select * from employees where JOB in('CLERK','ANALYST')order by JOB desc;
select * from employees where HIREDATE IN ('1981-05-01','1981-12-03','1980-12-17','1980-01-19')order by HIREDATE asc;
select * from employees where DEPTNO in (10,20);
select * from employees where year(HIREDATE) = 1981;
select * from employees where year(HIREDATE) = 1980 and month(HIREDATE)=08;
select * from employees where Salary*12 between 22000 and 45000 ;
select ENAME from employees where length(ENAME)=5;
select ENAME from employees where ENAME like 'S____';
select ENAME from employees where ENAME like '__R_';
select ENAME from employees where ENAME like 'S___H'; 
select * from employees where month(HIREDATE)=01 ;
select * from employees where monthname(HIREDATE)like'_a%';
select * from employees where Salary like '___0';
select * from employees where  ENAME like '%LL%';
SELECT * FROM employees WHERE YEAR(HIREDATE) BETWEEN 1980 AND 1989;
select * from employees where DEPTNO <> 20;
select * from employees where JOB not in('PRESIDENT’ & ‘MGR') order by Salary asc ;
select * from employees where year(HIREDATE)<>'1981';
select * from employees where EMPNO NOT like ('78%');
SELECT * FROM employees
WHERE MGR IS NOT NULL;
SELECT * FROM employees
WHERE MONTH(HIREDATE) <> 3;
SELECT * FROM employees
WHERE JOB='CLERK' AND DEPTNO=20;
SELECT * FROM employees
WHERE DEPTNO IN (10,30)
AND YEAR(HIREDATE)=1981;
SELECT * FROM employees
where ENAME ='SMITH';
SELECT d.Location FROM employees e join depts d on d.DEPTNO=e.DEPTNO  where e.ENAME ='SMITH';
SELECT e.*,d.DNAME,d.Location FROM employees e join depts d on d.DEPTNO=e.DEPTNO ;
SELECT e.EMPNO, e.ENAME, e.Salary, d.DNAME
FROM employees e
JOIN depts d ON e.DEPTNO=d.DEPTNO
WHERE e.JOB='MANAGER'
AND d.DNAME='research'
AND d.Location IN ('New York','Dallas')
AND (YEAR(CURDATE()) - YEAR(e.HIREDATE)) > 7
AND e.COMM IS NULL
ORDER BY d.Location ASC;
SELECT e.EMPNO, e.ENAME, e.Salary, d.DNAME, d.Location,
e.DEPTNO, e.JOB
FROM employees e
JOIN depts d ON e.DEPTNO=d.DEPTNO
WHERE (
d.Location='Chicago'
OR d.DNAME='accounting'
)
AND (e.Salary*12) > 28000
AND e.Salary NOT IN (3000,2800)
AND e.JOB <> 'MANAGER'
AND SUBSTRING(e.EMPNO,3,1) IN ('7','8')
ORDER BY e.DEPTNO ASC, e.JOB DESC;