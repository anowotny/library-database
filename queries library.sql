
--COUNTS ALL COPIES OF BOOK WITH ID=3 AND PUTS THEM INTO COPIES_NUMBER
update book
set copies_number =( 
select count(*) as "all copies"
from book_instance
where book_id=3)
where book_id=3;

--COUNTS ALL COPIES EXISTING
select count(instance_id) as "all books"
from book_instance;

--SHOWS ALL EMPLOYEES WORKING IN DEPARTMENT "FILIA 9"
SELECT s.name, s.surname, d.department_name
FROM staff s
LEFT JOIN department d ON d.department_id = s.department_id
LEFT JOIN location l ON l.location_id = d.location_id
WHERE d.department_name LIKE "Filia 9"
ORDER BY s.name,s.surname;

--SHOWS CATEGORY NAME, BOOK TITLE AND NUMBER OF COPIES OF BOOKS THAT HAVE MORE THAN 3 COPIES
select c.category_name, b.title, b.copies_number
from category c
inner join book b on  b.category_id=c.category_id
where b.copies_number>3;

--BORROWS BOOK
insert into book_borrowed(user_id,instance_id,taken_date,deadline_date) values(1,1,"30.05.2019","30.06.2019");
update book
set copies_number=copies_number-1
where book_id IN(
  select book_id 
  from book_instance 
  where instance_id IN(
    select instance_id
    from book_borrowed
    WHERE user_id=1)
  );

--RETURNS BOOK
update book
set copies_number=copies_number+1
where book_id IN(
  select book_id 
  from book_instance 
  where instance_id IN(
    select instance_id
    from book_borrowed
    WHERE user_id=1)
  );
delete from book_borrowed where borrow_id=1;

--SHOWS AUTHOR'S NAME, SURNAME AND BOOK TITLE IF BOOK TITLE BEGINS WITH 'A'
select a.name,a.surname,b.title
from author a
inner join book b on b.author_id=a.author_id
where b.title like"A%";

--SHOWS CATEGORY NAME,BOOK TITLE, BOOK ID AND AUTHOR ID WHEN BOOK ID EQUALS AUHTHOR ID
select c.category_name,b.title,b.book_id,b.author_id
from category c
left join book b on c.category_id=b.category_id
where b.book_id=b.author_id;


--SHOWS NAMES OF DEPARTMENTS IF THEIR POSTAL CODES BEGIN WITH '31-9'
select department_name
from department d
where d.location_id =any(
select location_id
from location l
where l.postal_code like "31-9%");

--COUNTS BOOKS IN DEPARTMENTS
select count(instance_id) as "books",department_id
from book_instance
group by department_id;

--COUNTS SPECIFIC BOOKS IN DEPARTMENTS
select count(*) as "all copies",department_id
from book_instance
where book_id=3
group by department_id;

--COUNTS AUTHOR'S BOOKS
select count(book_id) as "books no.", author_id
from book_author
group by author_id;

--SHOWS USERS OF THE LIBRARY AND THE EMPOYEES, DUPLICATES 
select surname from user
union all
select surname from staff;


--COUNTS AVERAGE AGE OF EMPLOYEES IN DEPARTMENTS
select staff.department_id, department.department_name, avg(age) as "average age"
from staff
left join department on staff.department_id=department.department_id
group by department_name;

--SHOWS COPIES OF BOOKS AND BORROWED ONES, DUPLICATES
select instance_id from book_instance
union all
select instance_id from book_borrowed;


