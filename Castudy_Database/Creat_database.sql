create database FuramaResort ;
use FuramaResort;
-- Vi tri
create table positions(
 id_positions int unsigned not null auto_increment primary key ,
 name_position varchar(45) 
 ) ;
 -- trinh do
 create table education(
 id_education int unsigned not null auto_increment primary key ,
 education  varchar(45) 
 );
 -- bo phan
 create table department(
 id_department int unsigned not null auto_increment primary key ,
 name_department varchar(45)
 );
 -- nhan vien
 create table employee(
 id_employee int unsigned not null auto_increment primary key  ,
 full_name nvarchar(50) not null,
 id_positions int unsigned, foreign key(id_positions) references positions(id_positions),
 id_education int unsigned, foreign key(id_education) references education(id_education) ,
 id_department int unsigned,foreign key(id_department) references department(id_department) ,
 brithday date ,
 id_card  varchar(45) not null ,
 salary varchar(45) ,
 phone_number varchar(45) not null,
 email varchar(45) not null,
 adress varchar(45)
 );
 create table custommer_style(
 id_custommer_style int unsigned not null auto_increment primary key ,
 name_custommer_style nvarchar(45)
 );
 create table custommer(
 id_custommer int unsigned not null auto_increment primary key ,
 id_custommer_style int unsigned, foreign key(id_custommer_style) references custommer_style(id_custommer_style),
 brithday date ,
 id_card  varchar(45) not null,
 phone_number varchar(45) not null,
 email varchar(45),
 adress varchar(45)
 );
 create table type_rent(
 id_type_rent int unsigned not null auto_increment primary key ,
 name_type_rent varchar(45) ,
 price int 
 );
 create table type_services(
 id_type_services int unsigned not null auto_increment primary key ,
 name_type_services varchar(45)
 );
 create table services (
 id_services int unsigned not null auto_increment primary key ,
 name_services varchar(45),
 num_floot int ,
 max_number varchar(45) ,
 rental_cost varchar(45),
 id_type_rent int unsigned , foreign key(id_type_rent) references type_rent(id_type_rent) ,
 id_type_services int unsigned, foreign key(id_type_services) references type_services(id_type_services) ,
 status_services varchar(45)
 );
 create table contract(
 id_contract int unsigned not null auto_increment primary key ,
 id_employee int unsigned, foreign key(id_employee) references employee(id_employee),
 id_custommer int unsigned, foreign key(id_custommer) references custommer(id_custommer) ,
 id_services int unsigned, foreign key(id_services) references services(id_services) ,
 daystart_contract date ,
 dayend_contract date,
 deposits int unsigned,
 total_money int unsigned 
 );
 create table contract_details(
 id_contract_details int unsigned not null auto_increment primary key ,
 id_contract int unsigned , foreign key(id_contract)references contract(id_contract) ,
 id_accompanied_services int unsigned, foreign key(id_accompanied_services) references accompanied_services(id_accompanied_services) ,
  amount int
 );
 create table accompanied_services(
 id_accompanied_services int unsigned not null auto_increment primary key ,
 name_accompanied_services varchar(45) ,
 salary int ,
 units int ,
 availability_status varchar(45)
 );
