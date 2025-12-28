/* Creating database */
create database electronics_retailer;

/* Setting the active database to electronics_retailer */
use electronics_retailer;


/* Creating stores table */
create table stores (
store_key int,
country varchar(100) not null,
state varchar(100) not null,
store_area float ,
open_date date not null,
primary key(store_key));

/* Checking the table data after importing the csv file */
select * from stores;

/* Checking whether constraints are applied correctly */
describe stores;


/* Creating exchange_rates table */
create table exchange_rates (
dates date not null,
currency_code varchar(3) not null,
exchange_rate decimal(10,4) not null,
primary key(dates,currency_code));


/* Creating customers table */
create table customers (
customer_key int,
gender varchar(20),
customer_name varchar(100) not null,
city varchar(50) not null,
state_code varchar(5),
state varchar(50),
zip_code varchar(50),
country varchar(50) not null,
continent varchar(50),
birthday date,
primary key(customer_key));


/* Creating products table */
create table products(
product_key int,
product_name varchar(100) not null,
brand varchar(50) not null,
color varchar(20) not null,
unit_cost_USD decimal(10,2) not null,
unit_price_USD decimal(10,2) not null,
subcategory_key int not null,
subcategory varchar(100),
category_key int not null,
category varchar(100) not null,
primary key (product_key));


/* Creating sales table */
create table sales(
sales_key int,
order_number varchar(10),
line_item varchar(5),
order_date date not null,
delivery_date date,
customer_key int,
store_key int,
product_key int,
quantity int not null,
currency_code varchar(3),
primary key (sales_key)
);

/* Adding foreign key constraints */

/* sales table --> customers table */
alter table sales
add constraint fk_customers
foreign key (customer_key)
references customers(customer_key);

/* sales table --> stores table */
alter table sales
add constraint fk_stores
foreign key (store_key)
references stores(store_key);

/* sales table --> products table */
alter table sales
add constraint fk_products
foreign key (product_key)
references products(product_key);

/* sales table --> exchange_rates table */
alter table sales
add constraint fk_exchange_rates
foreign key (order_date, currency_code)
references exchange_rates(dates, currency_code);

/* Verifying foreign key constraints on sales table */
describe sales;
