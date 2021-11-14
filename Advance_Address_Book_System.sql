#Address book Service
*_____________________________________________________________________________________________________________________________________________________________________________*
*_____________________________________________________________________________________________________________________________________________________________________________*
#uc1 
#create Addesss book service DB
create database address_book_service;
 MySQL  localhost:3306 ssl  address_book_service  SQL > show databases;
+----------------------+
| Database             |
+----------------------+
| address_book_service |
| addressbookservice   |
| employeedb           |
| employeedetails      |
| information_schema   |
| mysql                |
| payroll_service      |
| performance_schema   |
| sakila               |
| sys                  |
| user                 |
| world                |
+----------------------+
12 rows in set (0.0021 sec)
 MySQL  localhost:3306 ssl  address_book_service  SQL > use address_book_service;
Default schema set to `address_book_service`.
Fetching table and column names from `address_book_service` for auto-completion... Press ^C to stop.
*_____________________________________________________________________________________________________________________________________________________________________________*
*_____________________________________________________________________________________________________________________________________________________________________________*
#uc2
#Ability to create a Address Book Table with first andlast names, address, city,state, zip, phone numberand email as its attributes.
CREATE TABLE address_book(
    firstName VARCHAR(30) NOT NULL,
    lastName VARCHAR(30) NOT NULL,
    address VARCHAR(50) NOT NULL,
    city VARCHAR(20) NOT NULL,
    state VARCHAR(20) NOT NULL,
    zip VARCHAR(10) NOT NULL,
    phoneNo VARCHAR(15) NOT NULL,
    email VARCHAR(15) NOT NULL,
    PRIMARY KEY (firstName)
);
 MySQL  localhost:3306 ssl  address_book_service  SQL > desc address_book;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| firstName | varchar(30) | NO   | PRI | NULL    |       |
| lastName  | varchar(30) | NO   |     | NULL    |       |
| address   | varchar(50) | NO   |     | NULL    |       |
| city      | varchar(20) | NO   |     | NULL    |       |
| state     | varchar(20) | NO   |     | NULL    |       |
| zip       | varchar(10) | NO   |     | NULL    |       |
| phoneNo   | varchar(15) | NO   |     | NULL    |       |
| email     | varchar(15) | NO   |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
8 rows in set (0.0632 sec)
*_____________________________________________________________________________________________________________________________________________________________________________*
*_____________________________________________________________________________________________________________________________________________________________________________*
uc3
#Ability to insert new Contacts to Address Book
#Query-:
insert  into address_book(firstName,lastname,address,city,state,zip,phoneNo,email) values
 ('prajakta','mahajan','cidco','Nashik','Maharashtra','543987','93929393','prajakta@gmail.com'),
 ('mohini','patil','Gandhi Road','kolhapur','Maharastra','414039','343929393','mohini@gmail.com'),
 ('pooja','pawar','sb road','Bharuch','Gujrat','311030','783929393','pooja@gmail.com'),
 ('tanvi','sonawane',' mg road','jaipur','Rajasthan','321030','723929393','tanvi@gmail.com');
 #display Contacts in address_book table 
 MySQL  localhost:3306 ssl  address_book_service  SQL > select * from address_book;
+-----------+----------+-------------+----------+------------+--------+-----------+--------------------+
| firstName | lastName | address     | city     | state      | zip    | phoneNo   | email              |
+-----------+----------+-------------+----------+------------+--------+-----------+--------------------+
| prajakta  | mahajan  |  cidco      | Nashik   | Maharastra | 321030 | 723929393 |prajakta@gmail.com  |
| mohini    | patil    | Gandhi Road | kolhapur | Maharastra | 311030 | 783929393 |mohini@gmail.com    |
| pooja     | pawar    | sb road     | Bharuch  | Gujrat     | 543987 | 93929393  |pooja@gmail.com     |
| tanvi     | sonawane | mg road     | jaipur   | Rajasthan  | 414039 | 343929393 |tanvi@gmail.com     |
+-----------+----------+-------------+----------+------------+--------+-----------+--------------------+
4 rows in set (0.0012 sec)
*_____________________________________________________________________________________________________________________________________________________________________________*
*_____________________________________________________________________________________________________________________________________________________________________________*
#uc4
#Ability to edit existing contact person using their name
#query-:
 MySQL  localhost:3306 ssl  address_book_service  SQL > UPDATE address_book
                                                     -> SET
                                                     ->     phoneNo = '9098765432'
                                                     -> WHERE
                                                     ->     firstName = 'prajakta';
+-----------+----------+-------------+----------+------------+--------+-----------+--------------------+
| firstName | lastName | address     | city     | state      | zip    | phoneNo   | email              |
+-----------+----------+-------------+----------+------------+--------+-----------+--------------------+
| prajakta  | mahajan  |  cidco      | Nashik   | Maharastra | 321030 | 9098765432|prajakta@gmail.com  |
| mohini    | patil    | Gandhi Road | kolhapur | Maharastra | 311030 | 783929393 |mohini@gmail.com    |
| pooja     | pawar    | sb road     | Bharuch  | Gujrat     | 543987 | 93929393  |pooja@gmail.com     |
| tanvi     | sonawane | mg road     | jaipur   | Rajasthan  | 414039 | 343929393 |tanvi@gmail.com     |
+-----------+----------+-------------+----------+------------+--------+-----------+--------------------+
Query OK, 1 row affected (0.0496 sec)

Rows matched: 1  Changed: 1  Warnings: 0
---------------------------------------------

 MySQL  localhost:3306 ssl  address_book_service  SQL > UPDATE address_book
                                                     -> SET
                                                     -> lastName = 'choudhari'
                                                     -> WHERE
                                                     ->     firstName = 'prajakta';
+-----------+----------+-------------+----------+------------+--------+-----------+--------------------+
| firstName | lastName | address     | city     | state      | zip    | phoneNo   | email              |
+-----------+----------+-------------+----------+------------+--------+-----------+--------------------+
| prajakta  | choudhari|  cidco      | Nashik   | Maharastra | 321030 | 9098765432|prajakta@gmail.com  |
| mohini    | patil    | Gandhi Road | kolhapur | Maharastra | 311030 | 783929393 |mohini@gmail.com    |
| pooja     | pawar    | sb road     | Bharuch  | Gujrat     | 543987 | 93929393  |pooja@gmail.com     |
| tanvi     | sonawane | mg road     | jaipur   | Rajasthan  | 414039 | 343929393 |tanvi@gmail.com     |
+-----------+----------+-------------+----------+------------+--------+-----------+--------------------+
Query OK, 1 row affected (0.0503 sec)

Rows matched: 1  Changed: 1  Warnings: 0
*_____________________________________________________________________________________________________________________________________________________________________________*
*_____________________________________________________________________________________________________________________________________________________________________________*
#uc5
#Ability to delete person using FirstName
 MySQL  localhost:3306 ssl  address_book_service  SQL > DELETE FROM `address_book`
                                                     -> WHERE
                                                     ->     `firstName` = 'tanvi';
+-----------+----------+-------------+----------+------------+--------+-----------+--------------------+
| firstName | lastName | address     | city     | state      | zip    | phoneNo   | email              |
+-----------+----------+-------------+----------+------------+--------+-----------+--------------------+
| prajakta  | mahajan  |  cidco      | Nashik   | Maharastra | 321030 | 723929393 |prajakta@gmail.com  |
| mohini    | patil    | Gandhi Road | kolhapur | Maharastra | 311030 | 783929393 |mohini@gmail.com    |
| pooja     | pawar    | sb road     | Bharuch  | Gujrat     | 543987 | 93929393  |pooja@gmail.com     |
+-----------+----------+-------------+----------+------------+--------+-----------+--------------------+
Query OK, 1 row affected (0.0499 sec)
*_____________________________________________________________________________________________________________________________________________________________________________*
*_____________________________________________________________________________________________________________________________________________________________________________*
#UC6
#Ability to Retrieve Person belonging to a City or State from the Address Book
#query:-
#1)Retrive contact using city 
 MySQL  localhost:3306 ssl  address_book_service  SQL > SELECT
                                                     ->     *
                                                     -> FROM
                                                     ->     address_book
                                                     -> WHERE
                                                     ->     city = 'Odisha';
Empty set (0.0012 sec)
----------------------------------------
    #2)Retrive contact using city
 MySQL  localhost:3306 ssl  address_book_service  SQL > SELECT
                                                     ->     *
                                                     -> FROM
                                                     ->     address_book
                                                     -> WHERE
                                                     ->     city = 'kolhapur';
+-----------+----------+-------------+--------+------------+--------+-----------+-----------------+
| firstName | lastName | address     | city   | state      | zip    | phoneNo   | email           |
+-----------+----------+-------------+--------+------------+--------+-----------+-----------------+
| mohini    | patil    | Gandhi Road |kolhapur| Maharastra | 311030 | 783929393 |mohini@gmail.com |
+-----------+----------+-------------+--------+------------+--------+-----------+-----------------+
1 row in set (0.0011 sec)
------------------------------------------
    
	#3)Retrive contact using city
 MySQL  localhost:3306 ssl  address_book_service  SQL > SELECT
                                                     ->     *
                                                     -> FROM
                                                     ->     address_book
                                                     -> WHERE
                                                     ->     city = 'Bharuch';
+-----------+----------+---------+----------+------------+--------+-----------+-----------------+
| firstName | lastName | address | city     | state      | zip    | phoneNo   | email           |
+-----------+----------+---------+----------+------------+--------+-----------+-----------------+
| pooja     | pawar    | sb road | Bharuch  | Gujrat     | 543987 | 93929393  | pooja@gmail.com |
+-----------+----------+---------+----------+------------+--------+-----------+-----------------+
1 row in set (0.0011 sec)
--------------------------------------------
#4)Retrive contact using state
 MySQL  localhost:3306 ssl  address_book_service  SQL > SELECT
                                                     ->     *
                                                     -> FROM
                                                     ->     address_book
                                                     -> WHERE
                                                     ->     state = 'maharastra';
+-----------+----------+-------------+----------+------------+--------+-----------+------------------- +
| firstName | lastName | address     | city     | state      | zip    | phoneNo   | email              |
+-----------+----------+-------------+----------+------------+--------+-----------+--------------------+
| prajakta  | choudhari| cidco       | Nashik   | Maharastra | 321030 | 723929393 |prajakta@gmail.com  | 
| mohini    | patil    | Gandhi Road | kolhapur | Maharastra | 311030 | 783929393 |mohini@gmail.com    |
+-----------+----------+-------------+----------+------------+--------+-----------+--------------------+
2 rows in set (0.0011 sec)
*_____________________________________________________________________________________________________________________________________________________________________________*
*_____________________________________________________________________________________________________________________________________________________________________________*

#uc8
#Ability to retrieve entries sorted alphabetically by Person’s name for a given city
#Query-:
 MySQL  localhost:3306 ssl  address_book_service  SQL > SELECT
                                                     ->     firstName,city
                                                     -> FROM
                                                     ->     address_book
                                                     -> ORDER BY firstName;
+-----------+----------+
| firstName | city     |
+-----------+----------+
| mohini    | kolhapur |
| pooja     | Bharuch  |
| prajakta  | Nashik   |
+-----------+----------+
3 rows in set (0.0010 sec)
*_____________________________________________________________________________________________________________________________________________________________________________*
*_____________________________________________________________________________________________________________________________________________________________________________*
#uc9
#Ability to identify each Address Book with name andType.
 MySQL  localhost:3306 ssl  address_book_service  SQL > alter table address_book add type varchar(30) after lastName;
Query OK, 0 rows affected (0.1345 sec)

Records: 0  Duplicates: 0  Warnings: 0
 MySQL  localhost:3306 ssl  address_book_service  SQL > update  address_book set type='family' where firstName ='prajakta';
Query OK, 1 row affected (0.0498 sec)

Rows matched: 1  Changed: 1  Warnings: 0
 MySQL  localhost:3306 ssl  address_book_service  SQL > update  address_book set type='friend' where firstName ='mohini';
Query OK, 1 row affected (0.0511 sec)

Rows matched: 1  Changed: 1  Warnings: 0
 MySQL  localhost:3306 ssl  address_book_service  SQL > update  address_book set type='profession' where firstName ='pooja';
Query OK, 1 row affected (0.0223 sec)

Rows matched: 1  Changed: 1  Warnings: 0
 MySQL  localhost:3306 ssl  address_book_service  SQL > select * from address_book;
+-----------+----------+-------------+-------------+----------+------------+--------+-----------+--------------------+
| firstName | lastName | type        | address     | city     | state      | zip    | phoneNo   | email              |
+-----------+----------+-------------+-------------+----------+------------+--------+-----------+--------------------+ 
| mohini    | patil    | family      | Gandhi Road | kolhapur| Maharastra  | 321030 |78392939   | prajakta@gmail.com |
| pooja     | pawar    | friend      | sb road     | Bharuch | Gujrat      | 311030 | 93929393  | mohini@gmail.com   |
| prajakta  | choudhari| profession  | cidco       | Nashik  | Maharastra  | 543987 | 9098765432| pooja@gmail.com    |
+-----------+----------+-------------+-------------+----------+------------+--------+-----------+--------------------+
3 rows in set (0.0010 sec)
*_____________________________________________________________________________________________________________________________________________________________________________*
*_____________________________________________________________________________________________________________________________________________________________________________*
#UC10
# COUNT(city) AS NumberOfaddress_book FROM address_book;
#query 
select count(type) AS NumberOfaddress_book FROM address_book;
 MySQL  localhost:3306 ssl  address_book_service  SQL > select count(type) AS NumberOfaddress_book FROM address_book;
+----------------------+
| NumberOfaddress_book |
+----------------------+
|                    3 |
+----------------------+
*_____________________________________________________________________________________________________________________________________________________________________________*
*_____________________________________________________________________________________________________________________________________________________________________________*
#uc11
#Ability to add person to both Friend and Family
 MySQL  localhost:3306 ssl  address_book_service  SQL > update  address_book set type='friend' where firstName ='prajakta';
Query OK, 0 rows affected (0.0004 sec)ok_service  SQL > update  address_book set type='friend' where firstName ='prajakta';

Rows matched: 1  Changed: 0  Warnings: 0
 MySQL  localhost:3306 ssl  address_book_service  SQL > select * from address_book;
+-----------+----------+------------+-------------+----------+------------+--------+------------+-------------------+
| firstName | lastName | type       | address     | city     | state      | zip    | phoneNo    | email             |
+-----------+----------+------------+-------------+----------+------------+--------+------------+-------------------+
| mohini    | patil    | friend     | Gandhi road | kolhapur | Maharastra | 311030 | 783929393  | mohinis@gmail.com  |
| pooja     | pawar    | friend     |  sb road    | Bharuch  | Gujrat     | 543987 |  93929393  | pooja@gmail.com   |
| prajakta  | choudhari| profession |  cidco      | Nashik   | Maharastra | 414039 | 9098765432 | prajakta@gmail.com|
+-----------+----------+------------+-------------+----------+------------+--------+------------+-------------------+
3 rows in set (0.0018 sec)
 MySQL  localhost:3306 ssl  address_book_service  SQL >
