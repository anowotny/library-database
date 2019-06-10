select borrow_id, count(*) as "copies"
from book_borrowed
where instance_id=1;

update book
set copies_number =( 
select count(*) as "all copies"
from book_instance
where book_id=3)
where book_id=3;


select count(instance_id) as "all books"
from book_instance;

SELECT s.name, s.surname, d.department_name
FROM staff s
LEFT JOIN department d ON d.department_id = s.department_id
LEFT JOIN location l ON l.location_id = d.location_id
WHERE d.department_name LIKE "Filia 9"
ORDER BY s.name,s.surname;

select c.category_name, b.title, b.copies_number
from category c
inner join book b on  b.category_id=c.category_id
where b.copies_number>3;

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

select a.name,a.surname,b.title
from author a
inner join book b on b.author_id=a.author_id
where b.title like"A%";


select c.category_name,b.title,b.book_id,b.author_id
from category c
left join book b on c.category_id=b.category_id
where b.book_id=b.author_id;

select department_name
from department d
where d.location_id =any(
select location_id
from location l
where l.postal_code like "31-9%");

select count(instance_id) as "books",department_id
from book_instance
group by department_id;

select count(*) as "all copies",department_id
from book_instance
where book_id=3
group by department_id;

select count(book_id) as "books no.", author_id
from book_author
group by author_id;

select surname from user
union all
select surname from staff;

select name,surname,age
from user
group by surname
having age>20;


select staff.department_id, department.department_name, avg(age) as "average age"
from staff
left join department on staff.department_id=department.department_id
group by department_name;

select instance_id from book_instance
union all
select instance_id from book_borrowed;


select name,surname,age
from user
group by surname
having age>20;


select c.category_name,b.title,b.book_id,b.author_id
from category c
left join book b on c.category_id=b.category_id
where b.book_id=b.author_id;
