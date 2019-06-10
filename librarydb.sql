CREATE TABLE `library`.`user` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `surname` VARCHAR(45) NULL,
  `age` INT NULL,
  PRIMARY KEY (`user_id`));

CREATE TABLE `library`.`book` (
  `book_id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NULL,
  `author_id` INT NULL,
  `copies_number` INT NULL,
  `category_id` INT NULL,
   PRIMARY KEY (`book_id`));
  
  CREATE TABLE `library`.`author` (
  `author_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NULL,
  `surname` VARCHAR(50) NULL,
  PRIMARY KEY (`author_id`));

CREATE TABLE `library`.`department` (
  `department_id` INT NOT NULL AUTO_INCREMENT,
  `department_name` VARCHAR(50) NULL,
  `manager_id` INT NULL,
  `location_id` INT NULL,
  `opening_hours` VARCHAR(45) NULL,
  PRIMARY KEY (`department_id`));
  
  CREATE TABLE `library`.`category` (
  `category_id` INT NOT NULL AUTO_INCREMENT,
  `category_name` VARCHAR(50) NULL,
  PRIMARY KEY (`category_id`));

CREATE TABLE `library`.`location` (
  `location_id` INT NOT NULL AUTO_INCREMENT,
  `street` VARCHAR(60) NULL,
  `postal_code` VARCHAR(45) NULL,
  PRIMARY KEY (`location_id`));
  
  
  CREATE TABLE `library`.`staff` (
  `employee_id` INT NOT NULL AUTO_INCREMENT,
  `manager_id` INT NULL,
  `name` VARCHAR(50) NULL,
  `surname` VARCHAR(50) NULL,
  `age` INT NULL,
  `department_id` INT NULL,
  PRIMARY KEY (`employee_id`));
  

  
  CREATE TABLE `library`.`book_instance` (
  `instance_id` INT NOT NULL AUTO_INCREMENT,
  `department_id` INT NULL,
  `book_id` INT NULL,
  PRIMARY KEY (`instance_id`));
    

CREATE TABLE `library`.`book_author` (
  `author_id` INT NULL,
  `book_id` INT NULL);
  
CREATE TABLE `library`.`book_borrowed` (
  `borrow_id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NULL,
  `instance_id` INT NULL,
  `taken_date` VARCHAR(45) NULL,
  `deadline_date` VARCHAR(45) NULL,
  PRIMARY KEY (`borrow_id`));
  


ALTER TABLE `library`.`book` 
ADD CONSTRAINT `fkauthor`
  FOREIGN KEY (`author_id`)
  REFERENCES `library`.`author` (`author_id`)
  ;

ALTER TABLE `library`.`book` 
ADD CONSTRAINT `category`
  FOREIGN KEY (`category_id`)
  REFERENCES `library`.`category` (`category_id`)
  ;



ALTER TABLE `library`.`department` 
ADD CONSTRAINT `location`
  FOREIGN KEY (`location_id`)
  REFERENCES `library`.`location` (`location_id`)
  ;

ALTER TABLE `library`.`staff` 
ADD CONSTRAINT `depfk`
  FOREIGN KEY (`department_id`)
  REFERENCES `library`.`department` (`department_id`)
 ;
  
  
ALTER TABLE `library`.`book_instance` 
ADD CONSTRAINT `department_fk`
  FOREIGN KEY (`department_id`)
  REFERENCES `library`.`department` (`department_id`),
 
ADD CONSTRAINT `book_fk`
  FOREIGN KEY (`book_id`)
  REFERENCES `library`.`book` (`book_id`)
  ;
  
ALTER TABLE `library`.`book_author` 
ADD CONSTRAINT `author`
  FOREIGN KEY (`author_id`)
  REFERENCES `library`.`author` (`author_id`)
  ,
ADD CONSTRAINT `book`
  FOREIGN KEY (`book_id`)
  REFERENCES `library`.`book` (`book_id`)
  ;
  
ALTER TABLE `library`.`book_borrowed` 
ADD CONSTRAINT `user_fk`
  FOREIGN KEY (`user_id`)
  REFERENCES `library`.`user` (`user_id`)
  ,
ADD CONSTRAINT `instance_fk`
  FOREIGN KEY (`instance_id`)
  REFERENCES `library`.`book_instance` (`instance_id`)
  ;
  

ALTER TABLE `library`.`department` 
ADD CONSTRAINT `manager`
  FOREIGN KEY (`manager_id`)
  REFERENCES `library`.`staff` (`employee_id`)
  ;



INSERT INTO location(street,postal_code) VALUES("os.Stalowe 12","31-901");
INSERT INTO location(street,postal_code) VALUES("al. 29 Listopada 59","31-000");
INSERT INTO location(street,postal_code) VALUES("ul. Ugorek 11","31-456");
INSERT INTO location(street,postal_code) VALUES("al. I. Daszynskiego 22","33-332");
INSERT INTO location(street,postal_code) VALUES("ul. Dobrego Pasterza 6","31-416");

insert into department(department_name,location_id,opening_hours) values("Filia 14",3,"8.00-15.00");
insert into department(department_name,location_id,opening_hours) values("Filia 9",5,"9.00-16.00");
insert into department(department_name,location_id,opening_hours) values("Filia 53",1,"9.00-15.00");
insert into department(department_name,location_id,opening_hours) values("Filia 6",4,"8.30-15.30");
insert into department(department_name,location_id,opening_hours) values("Filia 10 ",2,"8.00-14.30");

INSERT INTO staff(name,surname,manager_id,department_id,age) VALUES("Anna","Iksowa",1,3,30);
INSERT INTO staff(name,surname,manager_id,department_id,age) VALUES("Danuta","Jawka",1,3,24);
INSERT INTO staff(name,surname,manager_id,department_id,age) VALUES("Tomasz","Baran",1,3,34);
INSERT INTO staff(name,surname,manager_id,department_id,age) VALUES("Katarzyna","Nowak",1,3,23);
INSERT INTO staff(name,surname,manager_id,department_id,age) VALUES("Barbara","Zet",5,1,44);
INSERT INTO staff(name,surname,manager_id,department_id,age) VALUES("Adam","Snop",5,1,19);
INSERT INTO staff(name,surname,manager_id,department_id,age) VALUES("Bartosz","Trzask",5,1,47);
INSERT INTO staff(name,surname,manager_id,department_id,age) VALUES("Artur","Jakubowski",8,2,49);
INSERT INTO staff(name,surname,manager_id,department_id,age) VALUES("Wiktoria","Igrekowa",8,2,33);
INSERT INTO staff(name,surname,manager_id,department_id,age) VALUES("Karol","Jedny",8,2,29);
INSERT INTO staff(name,surname,manager_id,department_id,age) VALUES("Natalia","Krakowska",11,5,50);
INSERT INTO staff(name,surname,manager_id,department_id,age) VALUES("Jacek","Kosma",11,5,36);
INSERT INTO staff(name,surname,manager_id,department_id,age) VALUES("Ildefons","Galka",11,5,55);
INSERT INTO staff(name,surname,manager_id,department_id,age) VALUES("Alfred","Szklar",14,4,22);
INSERT INTO staff(name,surname,manager_id,department_id,age) VALUES("Robert","Kruz",14,4,63);
INSERT INTO staff(name,surname,manager_id,department_id,age) VALUES("Anna","Herbatnik",14,4,26);

update department
set manager_id=1
where department_id=3;
update department
set manager_id=5
where department_id=1;
update department
set manager_id=8
where department_id=2;
update department
set manager_id=11
where department_id=5;
update department
set manager_id=14
where department_id=4;

insert into category(category_name) values("fantastyka");
insert into category(category_name) values("epika");
insert into category(category_name) values("historia");
insert into category(category_name) values("nauka");
insert into category(category_name) values("liryka");
insert into category(category_name) values("kryminal");
insert into category(category_name) values("romans");
insert into category(category_name) values("dramat");

insert into author(name,surname) values("George R.R","Martin");
insert into author(name,surname) values("Adam","Mickiewicz");
insert into author(name,surname) values("Yuval Noah","Harari");
insert into author(name,surname) values("Henryk","Sienkiewicz");
insert into author(name,surname) values("Jan","Kochanowski");
insert into author(name,surname) values("Dan","Brown");
insert into author(name,surname) values("Harlan","Coben");
insert into author(name,surname) values("Gustave","Flaubert");
insert into author(name,surname) values("Charlotte","Bronte");
insert into author(name,surname) values("Charles","Duhigg");
insert into author(name,surname) values("William","Shakespeare");

insert into book(title,author_id,category_id) values("A Song of Ice and Fire",1,1);
insert into book(title,author_id,category_id) values("Pan Tadeusz",2,2);
insert into book(title,author_id,category_id) values("A Clash of Kings",1,1);
insert into book(title,author_id,category_id) values("Treny",5,5);
insert into book(title,author_id,category_id) values("Quo Vadis",4,3);
insert into book(title,author_id,category_id) values("Angels and Demons",6,6);
insert into book(title,author_id,category_id) values("Pani Bovary",8,7);
insert into book(title,author_id,category_id) values("Dziwne losy Jane Eyre",9,7);
insert into book(title,author_id,category_id) values("Tell No One",7,6);
insert into book(title,author_id,category_id) values("The Da Vinci Code",6,6);
insert into book(title,author_id,category_id) values("Krzyzacy",4,3);
insert into book(title,author_id,category_id) values("Sila nawyku",10,4);
insert into book(title,author_id,category_id) values("Sapiens. A brief history of humankind.",3,4);
insert into book(title,author_id,category_id) values("Salambo",8,4);
insert into book(title,author_id,category_id) values("Odprawa poslow greckich",5,8);
insert into book(title,author_id,category_id) values("Dziady",2,8);
insert into book(title,author_id,category_id) values("Homo Deus: A brief history of Tomorrow",3,4);
insert into book(title,author_id,category_id) values("Sonety krymkie",2,5);
insert into book(title,author_id,category_id) values("Romeo i Julia",11,8);
insert into book(title,author_id,category_id) values("Makbet",11,8);

insert into book_author(author_id,book_id) values(1,3);
insert into book_author(author_id,book_id) values(2,4);
insert into book_author(author_id,book_id) values(1,5);
insert into book_author(author_id,book_id) values(5,6);
insert into book_author(author_id,book_id) values(4,7);
insert into book_author(author_id,book_id) values(6,8);
insert into book_author(author_id,book_id) values(8,9);
insert into book_author(author_id,book_id) values(9,10);
insert into book_author(author_id,book_id) values(7,11);
insert into book_author(author_id,book_id) values(6,12);
insert into book_author(author_id,book_id) values(4,13);
insert into book_author(author_id,book_id) values(10,14);
insert into book_author(author_id,book_id) values(3,15);
insert into book_author(author_id,book_id) values(3,18);
insert into book_author(author_id,book_id) values(2,19);
insert into book_author(author_id,book_id) values(5,17);
insert into book_author(author_id,book_id) values(8,16);
insert into book_author(author_id,book_id) values(2,20);

insert into book_instance(department_id,book_id) values(1,3);
insert into book_instance(department_id,book_id) values(3,6);
insert into book_instance(department_id,book_id) values(2,3);
insert into book_instance(department_id,book_id) values(5,7);
insert into book_instance(department_id,book_id) values(1,6);
insert into book_instance(department_id,book_id) values(1,12);
insert into book_instance(department_id,book_id) values(2,9);
insert into book_instance(department_id,book_id) values(3,8);
insert into book_instance(department_id,book_id) values(4,4);
insert into book_instance(department_id,book_id) values(4,7);
insert into book_instance(department_id,book_id) values(5,11);
insert into book_instance(department_id,book_id) values(3,3);
insert into book_instance(department_id,book_id) values(2,11);
insert into book_instance(department_id,book_id) values(4,7);
insert into book_instance(department_id,book_id) values(2,3);
insert into book_instance(department_id,book_id) values(1,6);
insert into book_instance(department_id,book_id) values(3,11);
insert into book_instance(department_id,book_id) values(2,3);
insert into book_instance(department_id,book_id) values(5,5);
insert into book_instance(department_id,book_id) values(5,10);
insert into book_instance(department_id,book_id) values(1,6);
insert into book_instance(department_id,book_id) values(3,11);
insert into book_instance(department_id,book_id) values(2,13);
insert into book_instance(department_id,book_id) values(5,15);
insert into book_instance(department_id,book_id) values(5,15);
insert into book_instance(department_id,book_id) values(3,4);
insert into book_instance(department_id,book_id) values(2,18);
insert into book_instance(department_id,book_id) values(5,17);
insert into book_instance(department_id,book_id) values(5,16);
insert into book_instance(department_id,book_id) values(1,19);
insert into book_instance(department_id,book_id) values(3,18);
insert into book_instance(department_id,book_id) values(2,16);
insert into book_instance(department_id,book_id) values(5,17);
insert into book_instance(department_id,book_id) values(5,14);
insert into book_instance(department_id,book_id) values(5,20);
insert into book_instance(department_id,book_id) values(5,16);
insert into book_instance(department_id,book_id) values(1,20);
insert into book_instance(department_id,book_id) values(3,20);
insert into book_instance(department_id,book_id) values(2,16);
insert into book_instance(department_id,book_id) values(5,20);

insert into book_instance(department_id,book_id) values(1,1);
insert into book_instance(department_id,book_id) values(3,1);
insert into book_instance(department_id,book_id) values(2,2);
insert into book_instance(department_id,book_id) values(5,2);
insert into book_instance(department_id,book_id) values(5,2);
insert into book_instance(department_id,book_id) values(3,1);
insert into book_instance(department_id,book_id) values(2,1);
insert into book_instance(department_id,book_id) values(5,2);



insert into user(name,surname,age) values("Aleksandra","Nowotny",22);
insert into user(name,surname,age) values("Piotr","Orlicki",21);
insert into user(name,surname,age) values("Remigiusz","Wach",18);
insert into user(name,surname,age) values("Konstancja","Ksiazek",10);
insert into user(name,surname,age) values("Jowita","Ogorek",30);
insert into user(name,surname,age) values("Barbara","Zet",44);

insert into book_borrowed(user_id,instance_id,taken_date,deadline_date) values(11,1,"30.05.2019","30.06.2019");


update book
set copies_number =( 
select count(*) as "all copies"
from book_instance
where book_id=1)
where book_id=1;
update book
set copies_number =( 
select count(*) as "all copies"
from book_instance
where book_id=2)
where book_id=2;
update book
set copies_number =( 
select count(*) as "all copies"
from book_instance
where book_id=3)
where book_id=3;
update book
set copies_number =( 
select count(*) as "all copies"
from book_instance
where book_id=4)
where book_id=4;
update book
set copies_number =( 
select count(*) as "all copies"
from book_instance
where book_id=5)
where book_id=5;
update book
set copies_number =( 
select count(*) as "all copies"
from book_instance
where book_id=6)
where book_id=6;
update book
set copies_number =( 
select count(*) as "all copies"
from book_instance
where book_id=7)
where book_id=7;
update book
set copies_number =( 
select count(*) as "all copies"
from book_instance
where book_id=8)
where book_id=8;
update book
set copies_number =( 
select count(*) as "all copies"
from book_instance
where book_id=9)
where book_id=9;
update book
set copies_number =( 
select count(*) as "all copies"
from book_instance
where book_id=10)
where book_id=10;
update book
set copies_number =( 
select count(*) as "all copies"
from book_instance
where book_id=11)
where book_id=11;
update book
set copies_number =( 
select count(*) as "all copies"
from book_instance
where book_id=12)
where book_id=12;
update book
set copies_number =( 
select count(*) as "all copies"
from book_instance
where book_id=13)
where book_id=13;
update book
set copies_number =( 
select count(*) as "all copies"
from book_instance
where book_id=14)
where book_id=14;
update book
set copies_number =( 
select count(*) as "all copies"
from book_instance
where book_id=15)
where book_id=15;
update book
set copies_number =( 
select count(*) as "all copies"
from book_instance
where book_id=16)
where book_id=16;
update book
set copies_number =( 
select count(*) as "all copies"
from book_instance
where book_id=17)
where book_id=17;
update book
set copies_number =( 
select count(*) as "all copies"
from book_instance
where book_id=18)
where book_id=18;
update book
set copies_number =( 
select count(*) as "all copies"
from book_instance
where book_id=19)
where book_id=19;
update book
set copies_number =( 
select count(*) as "all copies"
from book_instance
where book_id=20)
where book_id=20;

