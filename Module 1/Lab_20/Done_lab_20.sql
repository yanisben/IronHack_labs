CREATE DATABASE lab_mysql;
USE lab_mysql;

CREATE TABLE IF NOT EXISTS cars(
car_id INT NOT NULL AUTO_INCREMENT,
VIN varchar(255),
manufacturer varchar(255),
model varchar(255),
year INT,
color varchar(255),
PRIMARY KEY(car_id)
);

CREATE TABLE IF NOT EXISTS customers(
id INT NOT NULL auto_increment,
customer_id varchar(255),
customer_name varchar(255),
phone_number TEXT,
email varchar(255),
address varchar(255),
city varchar(255),
state varchar(255),
country varchar(255),
zip_code varchar(255),
PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS salespersons(
sp_id INT NOT NULL auto_increment,
staff_id varchar(255),
salesperson_name varchar(255),
store varchar(255),
PRIMARY KEY (sp_id)
);

CREATE TABLE IF NOT EXISTS invoices(
invoice_id INT NOT NULL auto_increment,
invoice_number varchar(255),
date datetime,
car varchar(255),
customer INT,
salesperson INT,
PRIMARY KEY(invoice_id)
);

insert into cars values 
(0, "HKNDGS7CU31E9Z7JW", "Toyota", "Rav4", 2018, "Silver"),
(0, "RKXVNNIHLVVZOUB4M", "Ford", "Fusion", 2018, "White"),
(0, "DAM41UDN3CHU2WVF6", "Volvo", "V60", 2019, "Gray"),
(0, "DAM41UDN3CHU2WVF6", "Volvo", "V60 Cross Country", 2019, "Gray");

insert into customers values 
(0, "10001", "Pablo Picasso", "3463617638", "" ,"Paseo de la Chopera, 14", "Madrid", "Madrid", "Spain", "28045"),
(0, "20001", "Abraham Lincoln", "1305907708","" , "120 SW 8th St", "Miami", "Florida", "United States", "33130"),
(0, "30001", "Napoléon Bonaparte", "3179754000","" ,"40 Rue du Colisée", "Paris", "Ile de France", "France", "75008");

insert into invoices values
(0, 852399038,"2018-08-22", "0", 1, 3),
(0, 731166526,"2018-12-31", "3", 0, 5),
(0, 271135104,"2019-01-22", "2", 2, 7);

insert into salespersons values
(0, "00001", "Petey Cruiser", "Madrid"),
(0, "00002", "Anna Sthesia", "Barcelona"),
(0, "00003", "Paul Molive", "Berlin"),
(0, "00004", "Gail Forcewind", "Paris"),
(0, "00005", "Paige Turner", "Miami"),
(0, "00006", "Bob Frapples", "Mexico City"),
(0, "00007", "Walter Melon", "Amsterdam"),
(0, "00008", "Shonda Leer", "São Paulo");

select * from cars