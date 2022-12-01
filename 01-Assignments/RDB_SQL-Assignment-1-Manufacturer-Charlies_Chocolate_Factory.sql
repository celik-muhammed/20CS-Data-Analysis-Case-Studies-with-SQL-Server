USE Manifacturer;

create table product(
	prod_id int primary key identity(1,1) not null,
	prod_name varchar(50) null,
	quantity int
)

create table supplier(
	supp_id int primary key identity(1,1) not null,
	supp_name varchar(50) null,
	supp_location varchar(50) null,
	supp_country varchar(50) null,
	is_active bit
)

create table component(
	comp_id int identity(1,1) not null,
	comp_name varchar(50) null,
	[description] varchar(50) null,
	quantity_comp int null,
	
	primary key (comp_id)
)

create table prod_comp(
	prod_id int identity(1,1) not null foreign key references product (prod_id),
	comp_id int not null foreign key references component (comp_id),
	quantity_comp int null

	primary key (prod_id, comp_id),
)

create table comp_supp(
	supp_id int identity(1,1) not null,
	comp_id int not null,
	order_date date,
	quantity int
	
	primary key (supp_id, comp_id)

	foreign key (supp_id) references supplier (supp_id),
	foreign key (comp_id) references component (comp_id)
)

DROP TABLE IF EXISTS prod_comp;
DROP TABLE IF EXISTS comp_supp;
DROP TABLE IF EXISTS product;
DROP TABLE IF EXISTS supplier;
DROP TABLE IF EXISTS component;