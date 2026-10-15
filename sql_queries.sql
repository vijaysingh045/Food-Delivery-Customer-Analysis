CREATE DATABASE food_delivery;

USE food_delivery;

 -- 1. Customers
--  2. Restaurants
--  3. Menu_items
--  4. Orders
--  5. delivery

create table if not exists customers(customer_id int unsigned primary key auto_increment,
								     customer_name varchar(30) not null,
                                     gender varchar(6) not null,
                                     contact char(10) not null unique ,
                                     Address varchar(100) not null,
                                     signup_date datetime default current_timestamp);
                                     
INSERT INTO Customers
(customer_name, gender, contact, Address) VALUES
('Aarav Sharma','Male','9000000001','Lucknow, UP'),
('Priya Verma','Female','9000000002','Kanpur, UP'),
('Rahul Singh','Male','9000000003','Varanasi, UP'),
('Sneha Gupta','Female','9000000004','Agra, UP'),
('Arjun Kumar','Male','9000000005','Prayagraj, UP'),
('Ananya Mishra','Female','9000000006','Gorakhpur, UP'),
('Vikash Yadav','Male','9000000007','Noida, UP'),
('Pooja Pandey','Female','9000000008','Ghaziabad, UP'),
('Rohit Saxena','Male','9000000009','Meerut, UP'),
('Neha Agarwal','Female','9000000010','Bareilly, UP'),
('Amit Tiwari','Male','9000000011','Lucknow, UP'),
('Riya Joshi','Female','9000000012','Kanpur, UP'),
('Karan Malhotra','Male','9000000013','Agra, UP'),
('Simran Kaur','Female','9000000014','Noida, UP'),
('Deepak Chauhan','Male','9000000015','Mathura, UP'),
('Kavya Srivastava','Female','9000000016','Ayodhya, UP'),
('Mohit Jain','Male','9000000017','Jhansi, UP'),
('Isha Saxena','Female','9000000018','Meerut, UP'),
('Saurabh Patel','Male','9000000019','Prayagraj, UP'),
('Meera Das','Female','9000000020','Gonda, UP'),
('Nikhil Raj','Male','9000000021','Lucknow, UP'),
('Aditi Kapoor','Female','9000000022','Noida, UP'),
('Varun Thakur','Male','9000000023','Kanpur, UP'),
('Tanya Bansal','Female','9000000024','Agra, UP'),
('Manish Yadav','Male','9000000025','Gorakhpur, UP'),
('Shreya Roy','Female','9000000026','Varanasi, UP'),
('Akash Dubey','Male','9000000027','Bareilly, UP'),
('Nisha Rani','Female','9000000028','Meerut, UP'),
('Rajat Arora','Male','9000000029','Ghaziabad, UP'),
('Divya Tripathi','Female','9000000030','Ayodhya, UP'),
('Abhishek Pal','Male','9000000031','Lucknow, UP'),
('Sakshi Goyal','Female','9000000032','Noida, UP'),
('Pranav Sinha','Male','9000000033','Kanpur, UP'),
('Muskan Ali','Female','9000000034','Agra, UP'),
('Shivam Shukla','Male','9000000035','Mathura, UP'),
('Payal Nigam','Female','9000000036','Jhansi, UP'),
('Ramesh Maurya','Male','9000000037','Gonda, UP'),
('Komal Sharma','Female','9000000038','Varanasi, UP'),
('Yash Chawla','Male','9000000039','Meerut, UP'),
('Pallavi Singh','Female','9000000040','Bareilly, UP'),
('Harsh Vardhan','Male','9000000041','Lucknow, UP'),
('Tanvi Mehta','Female','9000000042','Noida, UP'),
('Gaurav Mishra','Male','9000000043','Kanpur, UP'),
('Ritika Anand','Female','9000000044','Agra, UP'),
('Ajay Kumar','Male','9000000045','Prayagraj, UP'),
('Sonia Verma','Female','9000000046','Ghaziabad, UP'),
('Tarun Pandey','Male','9000000047','Ayodhya, UP'),
('Bhavna Gupta','Female','9000000048','Gorakhpur, UP'),
('Kunal Singh','Male','9000000049','Varanasi, UP'),
('Jaya Srivastava','Female','9000000050','Lucknow, UP');
                                     
create table if not exists Restaurants(Res_id int unsigned primary key auto_increment,
                                       Res_name varchar(50) not null,
                                       contact char(10) not null unique,
                                       address varchar(100),
                                       cuisine char(20),
                                       rating int check(rating>=1 and rating<=5));
                                       
INSERT INTO Restaurants
(Res_name, contact, address, cuisine, rating) VALUES
('Spice Garden','9100000001','Hazratganj, Lucknow','Indian',5),
('Pizza Palace','9100000002','Gomti Nagar, Lucknow','Italian',4),
('Burger Hub','9100000003','Aliganj, Lucknow','Fast Food',4),
('Royal Biryani','9100000004','Aminabad, Lucknow','Mughlai',5),
('Tandoori Treats','9100000005','Indira Nagar, Lucknow','Punjabi',4),
('Chinese Wok','9100000006','Civil Lines, Kanpur','Chinese',4),
('South Spice','9100000007','Swaroop Nagar, Kanpur','South Indian',5),
('Sweet Cravings','9100000008','Mall Road, Kanpur','Dessert',4),
('Food Junction','9100000009','Sigra, Varanasi','Indian',3),
('Cafe Delight','9100000010','Lanka, Varanasi','Cafe',5),
('The Pasta House','9100000011','Tajganj, Agra','Italian',4),
('Kebab Corner','9100000012','Sadar, Agra','Mughlai',5),
('Dosa Point','9100000013','Sector 18, Noida','South Indian',4),
('Rolls Express','9100000014','Sector 62, Noida','Fast Food',3),
('Noodle Nation','9100000015','Sector 15, Noida','Chinese',4),
('The Curry Bowl','9100000016','Sector 50, Noida','Indian',5),
('Flame Grill','9100000017','Vaishali, Ghaziabad','BBQ',4),
('Green Leaf','9100000018','Indirapuram, Ghaziabad','Vegetarian',5),
('Momo Street','9100000019','Raj Nagar, Ghaziabad','Chinese',4),
('Cafe Aroma','9100000020','Civil Lines, Prayagraj','Cafe',4),
('Biryani Blues','9100000021','George Town, Prayagraj','Mughlai',5),
('Punjabi Dhaba','9100000022','Medical Road, Gorakhpur','Punjabi',4),
('Chaat Bazaar','9100000023','Golghar, Gorakhpur','Street Food',5),
('Sushi Station','9100000024','Gomti Nagar, Lucknow','Japanese',4),
('Taco Town','9100000025','Hazratganj, Lucknow','Mexican',4),
('Waffle World','9100000026','Alambagh, Lucknow','Dessert',5),
('The Veg Kitchen','9100000027','Kakadeo, Kanpur','Vegetarian',4),
('Grill House','9100000028','Kidwai Nagar, Kanpur','BBQ',4),
('Wrap It Up','9100000029','Bhelupur, Varanasi','Fast Food',3),
('Thali Junction','9100000030','Mahmoorganj, Varanasi','Indian',5),
('Pav Bhaji Point','9100000031','Kamla Nagar, Agra','Street Food',4),
('Fried Chicken Co','9100000032','Dayal Bagh, Agra','Fast Food',4),
('Healthy Bites','9100000033','Sector 137, Noida','Healthy Food',5),
('The Dessert Bar','9100000034','Sector 76, Noida','Dessert',4),
('Royal Rasoi','9100000035','Crossings Republik, Ghaziabad','Indian',5),
('Chowmein Corner','9100000036','Vijay Nagar, Ghaziabad','Chinese',3),
('Idli House','9100000037','Civil Lines, Jhansi','South Indian',4),
('Kathi Roll Hub','9100000038','Sipri Bazaar, Jhansi','Fast Food',4),
('Cafe Mocha','9100000039','Civil Lines, Bareilly','Cafe',5),
('Awadhi Kitchen','9100000040','Chowk, Lucknow','Awadhi',5),
('The Sandwich Shop','9100000041','Gomti Nagar, Lucknow','Fast Food',4),
('Paratha Junction','9100000042','Aminabad, Lucknow','North Indian',4),
('Pasta & More','9100000043','Sector 12, Noida','Italian',3),
('Dumpling House','9100000044','Sector 18, Noida','Chinese',5),
('The Breakfast Club','9100000045','Swaroop Nagar, Kanpur','Breakfast',4),
('Kulfi Kingdom','9100000046','Sadar, Agra','Dessert',5),
('Royal Feast','9100000047','Sigra, Varanasi','Indian',4),
('Desi Tadka','9100000048','Aliganj, Lucknow','Indian',5),
('Urban Eats','9100000049','Indirapuram, Ghaziabad','Fusion',4),
('Food Fiesta','9100000050','Sector 18, Noida','Multi-Cuisine',4);
                                       
create table if not exists Menu_item(item_id int unsigned primary key auto_increment,
                                     res_id int unsigned,
                                     food_item varchar(50) not null,
                                     price float default 0,
                                     availability bool,
                                     foreign key(res_id) references Restaurants(res_id));
                                     
INSERT INTO Menu_item
(res_id, food_item, price, availability) VALUES
(1,'Paneer Butter Masala',250,1),
(2,'Margherita Pizza',199,1),
(3,'Classic Veg Burger',99,1),
(4,'Chicken Biryani',280,1),
(5,'Tandoori Paneer',240,1),
(6,'Veg Hakka Noodles',180,1),
(7,'Masala Dosa',120,1),
(8,'Chocolate Brownie',100,1),
(9,'Veg Thali',220,1),
(10,'Cappuccino',130,1),
(11,'White Sauce Pasta',210,1),
(12,'Chicken Seekh Kebab',260,1),
(13,'Mysore Masala Dosa',150,1),
(14,'Paneer Kathi Roll',140,1),
(15,'Chilli Garlic Noodles',190,1),
(16,'Dal Makhani',200,1),
(17,'BBQ Chicken',320,1),
(18,'Veg Pulao',160,1),
(19,'Veg Momos',100,1),
(20,'Cold Coffee',120,1),
(21,'Mutton Biryani',350,1),
(22,'Chole Bhature',140,1),
(23,'Aloo Tikki Chaat',80,1),
(24,'Veg Sushi Roll',280,1),
(25,'Veg Tacos',180,1),
(26,'Belgian Waffle',170,1),
(27,'Shahi Paneer',230,1),
(28,'Grilled Chicken',290,1),
(29,'Chicken Wrap',160,1),
(30,'Special Veg Thali',250,1),
(31,'Pav Bhaji',110,1),
(32,'Crispy Fried Chicken',240,1),
(33,'Quinoa Salad',220,1),
(34,'Chocolate Pastry',90,1),
(35,'Butter Chicken',300,1),
(36,'Chicken Chowmein',170,1),
(37,'Idli Sambhar',80,1),
(38,'Egg Kathi Roll',120,1),
(39,'Cafe Mocha',160,1),
(40,'Awadhi Chicken Korma',320,1),
(41,'Grilled Sandwich',130,1),
(42,'Aloo Paratha',90,1),
(43,'Penne Alfredo',240,1),
(44,'Chicken Dumplings',220,1),
(45,'English Breakfast',280,1),
(46,'Malai Kulfi',70,1),
(47,'Paneer Tikka',210,1),
(48,'Dal Tadka',150,1),
(49,'Veg Fried Rice',180,1),
(50,'Special Combo Meal',299,1);
                                     
create table if not exists Orders(order_id int unsigned primary key auto_increment,
                                 customer_id int unsigned,
                                 item_id int unsigned,
                                 Res_id int unsigned,
                                 quantity tinyint unsigned check(quantity>=1),
                                 discount float default 0,
                                 total_price float default 0,
                                 order_datetime datetime default current_timestamp,
                                 foreign key(customer_id) references Customers(customer_id),
                                 foreign key(item_id) references Menu_item(item_id),
                                 foreign key(Res_id) references Restaurants(Res_id));
                                 
INSERT INTO `Orders`
(customer_id, item_id, Res_id, quantity, discount, total_price) VALUES
(1,1,1,2,10,450),
(2,2,2,1,0,199),
(3,3,3,3,5,282.15),
(4,4,4,2,10,504),
(5,5,5,1,0,240),
(6,6,6,2,5,342),
(7,7,7,3,0,360),
(8,8,8,2,10,180),
(9,9,9,1,0,220),
(10,10,10,2,5,247),
(11,11,11,1,10,189),
(12,12,12,2,0,520),
(13,13,13,2,5,285),
(14,14,14,3,10,378),
(15,15,15,1,0,190),
(16,16,16,2,5,380),
(17,17,17,1,10,288),
(18,18,18,3,0,480),
(19,19,19,2,5,190),
(20,20,20,1,0,120),
(21,21,21,2,10,630),
(22,22,22,2,5,266),
(23,23,23,4,0,320),
(24,24,24,1,10,252),
(25,25,25,2,5,342),
(26,26,26,3,0,510),
(27,27,27,1,5,218.50),
(28,28,28,2,10,522),
(29,29,29,2,0,320),
(30,30,30,1,5,237.50),
(31,31,31,3,10,297),
(32,32,32,2,5,456),
(33,33,33,1,0,220),
(34,34,34,4,10,324),
(35,35,35,2,5,570),
(36,36,36,2,0,340),
(37,37,37,3,0,240),
(38,38,38,2,5,228),
(39,39,39,1,10,144),
(40,40,40,2,5,608),
(41,41,41,3,0,390),
(42,42,42,4,10,324),
(43,43,43,1,5,228),
(44,44,44,2,10,396),
(45,45,45,1,0,280),
(46,46,46,5,5,332.50),
(47,47,47,2,10,378),
(48,48,48,3,0,450),
(49,49,49,2,5,342),
(50,50,50,1,10,269.10);


-- drop table Delivery;

create table if not exists Delivery(delivery_id int unsigned primary key auto_increment,
                                    order_id int unsigned,
                                    customer_id int unsigned,
                                    item_id int unsigned,
                                    Res_id int unsigned,
                                    assigned_executive varchar(30),
                                    contact_executive varchar(10),
                                    status varchar(30),
                                    delivery_time datetime default current_timestamp,
									foreign key(order_id) references Orders(order_id),
                                    foreign key(customer_id) references customers(customer_id),
                                    foreign key(item_id) references Menu_item(item_id),
                                    foreign key(Res_id) references Restaurants(Res_id)
                                    );
                                    
INSERT INTO Delivery
(order_id, customer_id, item_id, Res_id,
 assigned_executive, contact_executive, status) VALUES
(1,1,1,1,'Aman Kumar','9200000001','Delivered'),
(2,2,2,2,'Ravi Singh','9200000002','Delivered'),
(3,3,3,3,'Vijay Sharma','9200000003','Out for Delivery'),
(4,4,4,4,'Suresh Yadav','9200000004','Delivered'),
(5,5,5,5,'Rohit Verma','9200000005','Preparing'),
(6,6,6,6,'Amit Gupta','9200000006','Delivered'),
(7,7,7,7,'Karan Mishra','9200000007','Out for Delivery'),
(8,8,8,8,'Deepak Singh','9200000008','Delivered'),
(9,9,9,9,'Mohit Kumar','9200000009','Assigned'),
(10,10,10,10,'Arjun Patel','9200000010','Delivered'),
(11,11,11,11,'Rahul Jain','9200000011','Delivered'),
(12,12,12,12,'Nitin Das','9200000012','Out for Delivery'),
(13,13,13,13,'Varun Roy','9200000013','Delivered'),
(14,14,14,14,'Sanjay Pal','9200000014','Preparing'),
(15,15,15,15,'Ankit Raj','9200000015','Delivered'),
(16,16,16,16,'Pankaj Tiwari','9200000016','Delivered'),
(17,17,17,17,'Manoj Saini','9200000017','Out for Delivery'),
(18,18,18,18,'Yash Malhotra','9200000018','Delivered'),
(19,19,19,19,'Ajay Chauhan','9200000019','Assigned'),
(20,20,20,20,'Sumit Arora','9200000020','Delivered'),
(21,21,21,21,'Vikas Pandey','9200000021','Delivered'),
(22,22,22,22,'Tarun Joshi','9200000022','Out for Delivery'),
(23,23,23,23,'Gaurav Mehta','9200000023','Delivered'),
(24,24,24,24,'Harsh Kapoor','9200000024','Preparing'),
(25,25,25,25,'Abhishek Roy','9200000025','Delivered'),
(26,26,26,26,'Naveen Kumar','9200000026','Delivered'),
(27,27,27,27,'Rakesh Mishra','9200000027','Out for Delivery'),
(28,28,28,28,'Shivam Gupta','9200000028','Delivered'),
(29,29,29,29,'Pradeep Singh','9200000029','Assigned'),
(30,30,30,30,'Kunal Verma','9200000030','Delivered'),
(31,31,31,31,'Akhil Sharma','9200000031','Delivered'),
(32,32,32,32,'Rajesh Yadav','9200000032','Out for Delivery'),
(33,33,33,33,'Sahil Jain','9200000033','Delivered'),
(34,34,34,34,'Lokesh Kumar','9200000034','Preparing'),
(35,35,35,35,'Dinesh Patel','9200000035','Delivered'),
(36,36,36,36,'Sandeep Roy','9200000036','Delivered'),
(37,37,37,37,'Raman Singh','9200000037','Out for Delivery'),
(38,38,38,38,'Chirag Gupta','9200000038','Delivered'),
(39,39,39,39,'Akash Verma','9200000039','Assigned'),
(40,40,40,40,'Mukesh Kumar','9200000040','Delivered'),
(41,41,41,41,'Rajat Sharma','9200000041','Delivered'),
(42,42,42,42,'Vivek Mishra','9200000042','Out for Delivery'),
(43,43,43,43,'Nikhil Singh','9200000043','Delivered'),
(44,44,44,44,'Sachin Yadav','9200000044','Preparing'),
(45,45,45,45,'Piyush Jain','9200000045','Delivered'),
(46,46,46,46,'Anurag Verma','9200000046','Delivered'),
(47,47,47,47,'Varun Gupta','9200000047','Out for Delivery'),
(48,48,48,48,'Rohit Mishra','9200000048','Delivered'),
(49,49,49,49,'Aman Singh','9200000049','Assigned'),
(50,50,50,50,'Keshav Kumar','9200000050','Delivered');
                                    
select count(*) from customers;
select count(*) from Menu_item;
select count(*) from Restaurants;
select count(*) from Orders;
select count(*) from delivery;

select * from delivery;



-- Average Order Cost --

select avg(total_price) as average_order_cost from Orders;

-- join the table customers and orders.

select customers.customer_id, customer_name ,Orders.order_id,order_datetime,food_item,Res_name,
assigned_executive,contact_executive
from customers left join Orders on customers.customer_id=Orders.customer_id join Menu_item
on Orders.item_id=Menu_item.item_id join Restaurants on Restaurants.Res_id=Orders.Res_id join
Delivery on delivery.order_id=Orders.order_id;



-- LOAD DATA local infile 'C:\Users\VIJAY SINGH\Desktop\Project Food_delivery\food_delivery_csv_import_pack/customers.csv'
-- into table customers fields terminated by ',' optionally enclosed by '"' lines terminated by "r\n" ignore 1 rows
-- (customer_id,customer_name, gender, contact, Address,signup_date);


-- SET global local_infile=OFF;

-- SET GLOBAL local_infile = 1;

-- SHOW global variables like 'local_infile';

select * from customers;
select * from Orders;
select * from delivery;
select * from Menu_item;
select * from restaurants;




















                             

