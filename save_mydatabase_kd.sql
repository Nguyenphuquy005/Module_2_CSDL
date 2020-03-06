-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: furamaresort_kd
-- ------------------------------------------------------
-- Server version	8.0.19
create database furama_kd ;
use furama_kd ;
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `accompanied_services`
--

DROP TABLE IF EXISTS `accompanied_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accompanied_services` (
  `id_accompanied_services` int unsigned NOT NULL AUTO_INCREMENT,
  `name_accompanied_services` varchar(45) DEFAULT NULL,
  `salary` int DEFAULT NULL,
  `units` int DEFAULT NULL,
  `availability_status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_accompanied_services`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accompanied_services`
--

LOCK TABLES `accompanied_services` WRITE;
/*!40000 ALTER TABLE `accompanied_services` DISABLE KEYS */;
INSERT INTO `accompanied_services` VALUES (1,'boxing',120000,15,'run time'),(2,'play game',11,2,'overnight');
/*!40000 ALTER TABLE `accompanied_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contract`
--

DROP TABLE IF EXISTS `contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contract` (
  `id_contract` int unsigned NOT NULL AUTO_INCREMENT,
  `id_employee` int unsigned DEFAULT NULL,
  `id_custommer` int unsigned DEFAULT NULL,
  `id_services` int unsigned DEFAULT NULL,
  `daystart_contract` date DEFAULT NULL,
  `dayend_contract` date DEFAULT NULL,
  `deposits` int unsigned DEFAULT NULL,
  `total_money` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id_contract`),
  KEY `id_employee` (`id_employee`),
  KEY `id_custommer` (`id_custommer`),
  KEY `id_services` (`id_services`),
  CONSTRAINT `contract_ibfk_1` FOREIGN KEY (`id_employee`) REFERENCES `employee` (`id_employee`),
  CONSTRAINT `contract_ibfk_2` FOREIGN KEY (`id_custommer`) REFERENCES `custommer` (`id_custommer`),
  CONSTRAINT `contract_ibfk_3` FOREIGN KEY (`id_services`) REFERENCES `services` (`id_services`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contract`
--

LOCK TABLES `contract` WRITE;
/*!40000 ALTER TABLE `contract` DISABLE KEYS */;
INSERT INTO `contract` VALUES (11,1,1,1,'2018-01-17','2022-08-21',50000,73000),(12,1,2,3,'2019-01-17','2022-08-21',50000,73000),(13,1,1,1,'2019-01-17','2022-08-21',50000,73000),(14,1,9,4,'2019-02-20','2019-05-12',30000,63000);
/*!40000 ALTER TABLE `contract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contract_details`
--

DROP TABLE IF EXISTS `contract_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contract_details` (
  `id_contract_details` int unsigned NOT NULL AUTO_INCREMENT,
  `id_contract` int unsigned DEFAULT NULL,
  `id_accompanied_services` int unsigned DEFAULT NULL,
  `amount` int DEFAULT NULL,
  PRIMARY KEY (`id_contract_details`),
  KEY `id_contract` (`id_contract`),
  KEY `id_accompanied_services` (`id_accompanied_services`),
  CONSTRAINT `contract_details_ibfk_1` FOREIGN KEY (`id_contract`) REFERENCES `contract` (`id_contract`),
  CONSTRAINT `contract_details_ibfk_2` FOREIGN KEY (`id_accompanied_services`) REFERENCES `accompanied_services` (`id_accompanied_services`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contract_details`
--

LOCK TABLES `contract_details` WRITE;
/*!40000 ALTER TABLE `contract_details` DISABLE KEYS */;
INSERT INTO `contract_details` VALUES (1,11,1,23000),(2,12,2,12000),(3,13,2,10000);
/*!40000 ALTER TABLE `contract_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custommer`
--

DROP TABLE IF EXISTS `custommer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `custommer` (
  `id_custommer` int unsigned NOT NULL AUTO_INCREMENT,
  `full_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `id_custommer_style` int unsigned DEFAULT NULL,
  `brithday` date DEFAULT NULL,
  `id_card` varchar(45) COLLATE utf8mb4_0900_as_cs DEFAULT NULL,
  `phone_number` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `adress` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id_custommer`),
  UNIQUE KEY `id_card` (`id_card`),
  UNIQUE KEY `id_card_2` (`id_card`),
  UNIQUE KEY `id_card_3` (`id_card`),
  UNIQUE KEY `id_card_4` (`id_card`),
  KEY `id_custommer_style` (`id_custommer_style`),
  CONSTRAINT `custommer_ibfk_1` FOREIGN KEY (`id_custommer_style`) REFERENCES `custommer_style` (`id_custommer_style`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custommer`
--

LOCK TABLES `custommer` WRITE;
/*!40000 ALTER TABLE `custommer` DISABLE KEYS */;
INSERT INTO `custommer` VALUES (1,'Lê Ngọc Huy',1,'2019-12-12','12345678','01225448521','huy@gmail.com','Đà Nẵng'),(2,'Nguyễn Phú Quý ',1,'1998-12-12','65445678','0123236541','hoan@gmail.com','Quảng Nam'),(3,'Lê Ngọc Huy',1,'2016-12-12','1232995678','6548521254','huyvu@gmail.com','Đà Nẵng'),(4,'Trần Cường',2,'1996-12-02','12548563','12654555211','cuong@gmail.com','Huế'),(5,'Nguyễn Ngọc',2,'1985-12-14','621458745','01254125485','ngoc@gmail.com','Quảng Bình'),(6,'Trần Bình',3,'1991-12-06','21585321','01225448521','huy@gmail.com','Quảng Trị'),(7,'Tống Công Minh',3,'1994-12-05','84596321','2238546514','minh@gmail.com','Vinh'),(8,'Lê Hồng',4,'2019-12-12','65485212','01226748521','hong@gmail.com','Hồ Chí Minh'),(9,'Trương Kiên',5,'2019-12-12','98456215','01256775521','kien@gmail.com','Hà Nội');
/*!40000 ALTER TABLE `custommer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custommer_style`
--

DROP TABLE IF EXISTS `custommer_style`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `custommer_style` (
  `id_custommer_style` int unsigned NOT NULL AUTO_INCREMENT,
  `name_custommer_style` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_custommer_style`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custommer_style`
--

LOCK TABLES `custommer_style` WRITE;
/*!40000 ALTER TABLE `custommer_style` DISABLE KEYS */;
INSERT INTO `custommer_style` VALUES (1,'diamond'),(2,'platinium'),(3,'gold'),(4,'sliver'),(5,'menber'),(13,'diamond'),(14,'platinium'),(15,'gold'),(16,'sliver'),(17,'manber'),(18,'diamond'),(19,'platinium'),(20,'gold'),(21,'sliver'),(22,'manber');
/*!40000 ALTER TABLE `custommer_style` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `id_department` int unsigned NOT NULL AUTO_INCREMENT,
  `name_department` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_department`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'gm'),(2,'dgm'),(3,'fom');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `education`
--

DROP TABLE IF EXISTS `education`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `education` (
  `id_education` int unsigned NOT NULL AUTO_INCREMENT,
  `education` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_education`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `education`
--

LOCK TABLES `education` WRITE;
/*!40000 ALTER TABLE `education` DISABLE KEYS */;
INSERT INTO `education` VALUES (1,'dai hoc');
/*!40000 ALTER TABLE `education` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `id_employee` int unsigned NOT NULL AUTO_INCREMENT,
  `full_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_positions` int unsigned DEFAULT NULL,
  `id_education` int unsigned DEFAULT NULL,
  `id_department` int unsigned DEFAULT NULL,
  `brithday` date DEFAULT NULL,
  `id_card` varchar(45) NOT NULL,
  `salary` varchar(45) DEFAULT NULL,
  `phone_number` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `adress` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_employee`),
  KEY `id_positions` (`id_positions`),
  KEY `id_education` (`id_education`),
  KEY `id_department` (`id_department`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`id_positions`) REFERENCES `positions` (`id_positions`),
  CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`id_education`) REFERENCES `education` (`id_education`),
  CONSTRAINT `employee_ibfk_3` FOREIGN KEY (`id_department`) REFERENCES `department` (`id_department`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Lê Ngọc Huy Cường',1,1,3,'1996-12-07','13659845','60000','1236587456','uong@gmail.com','da nang');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `positions`
--

DROP TABLE IF EXISTS `positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `positions` (
  `id_positions` int unsigned NOT NULL AUTO_INCREMENT,
  `name_position` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_positions`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `positions`
--

LOCK TABLES `positions` WRITE;
/*!40000 ALTER TABLE `positions` DISABLE KEYS */;
INSERT INTO `positions` VALUES (1,'fom');
/*!40000 ALTER TABLE `positions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services` (
  `id_services` int unsigned NOT NULL AUTO_INCREMENT,
  `name_services` varchar(45) DEFAULT NULL,
  `area` double DEFAULT NULL,
  `num_floot` int DEFAULT NULL,
  `max_number` varchar(45) DEFAULT NULL,
  `rental_cost` varchar(45) DEFAULT NULL,
  `id_type_rent` int unsigned DEFAULT NULL,
  `id_type_services` int unsigned DEFAULT NULL,
  `status_services` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_services`),
  KEY `id_type_rent` (`id_type_rent`),
  KEY `id_type_services` (`id_type_services`),
  CONSTRAINT `services_ibfk_1` FOREIGN KEY (`id_type_rent`) REFERENCES `type_rent` (`id_type_rent`),
  CONSTRAINT `services_ibfk_2` FOREIGN KEY (`id_type_services`) REFERENCES `type_services` (`id_type_services`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES (1,'karaoke',50,3,'5','30.000',1,3,'no Status'),(2,'food',50,3,'5','30.000',2,3,'no Status'),(3,'drink',50,3,'5','30.000',4,2,'no Status'),(4,'sport',50,3,'5','30.000',4,1,'no Status');
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_rent`
--

DROP TABLE IF EXISTS `type_rent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `type_rent` (
  `id_type_rent` int unsigned NOT NULL AUTO_INCREMENT,
  `name_type_rent` varchar(45) DEFAULT NULL,
  `price` int DEFAULT NULL,
  PRIMARY KEY (`id_type_rent`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_rent`
--

LOCK TABLES `type_rent` WRITE;
/*!40000 ALTER TABLE `type_rent` DISABLE KEYS */;
INSERT INTO `type_rent` VALUES (1,'house',NULL),(2,'day',NULL),(3,'month',NULL),(4,'year',NULL);
/*!40000 ALTER TABLE `type_rent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_services`
--

DROP TABLE IF EXISTS `type_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `type_services` (
  `id_type_services` int unsigned NOT NULL AUTO_INCREMENT,
  `name_type_services` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_type_services`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_services`
--

LOCK TABLES `type_services` WRITE;
/*!40000 ALTER TABLE `type_services` DISABLE KEYS */;
INSERT INTO `type_services` VALUES (1,'villa'),(2,'house'),(3,'room');
/*!40000 ALTER TABLE `type_services` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-29 15:04:57
use furama_kd ;
 -- 2
 select * from furamaresort.employee 
 where (full_name like 'L%' or 'K%' or 'T%') 
 and char_LENGTH(employee.full_name) <= 15  ;
 -- 3
 
  select * from furamaresort.custommer 
 where  ((Year(now()) - Year(brithday)) between 18 and 50)
 and (adress in ( "Đà Nẵng" , "Quảng Trị"));
-- 4
select c.full_name , count(cc.id_contract) 
as booking_room from furamaresort.custommer_style ct 
inner join furamaresort.custommer c on ct.id_custommer_style = c.id_custommer_style 
join furamaresort.contract cc on c.id_custommer = cc.id_custommer 
where ct.name_custommer_style = "gold" 
group by c.id_custommer order by booking_room
 ;
-- 5
select custommer.id_custommer ,custommer.full_name ,custommer_style.name_custommer_style
, contract.id_contract,contract.daystart_contract ,contract.dayend_contract,contract.total_money ,
sum(services.rental_cost + contract_details.amount*accompanied_services.salary ) as TONG_tIEN 
from custommer left join custommer_style on custommer.id_custommer_style = custommer_style.id_custommer_style
left join contract on custommer.id_custommer = contract.id_custommer 
left join services on contract.id_services = services.id_services 
left join contract_details on contract.id_contract =contract_details.id_contract 
left join accompanied_services on contract_details.id_accompanied_services = accompanied_services.id_accompanied_services
group by contract.id_contract;
-- 6 
select services.id_services , services.name_services , services.rental_cost , type_services.name_type_services 
from services inner join type_services
on services.id_type_services = type_services.id_type_services 
where not exists(select contract.id_contract from contract 
where (contract.daystart_contract between "2019-01-01" and "2019-03-01" 
and contract.id_services = services.id_services));


 -- 7 
 select services.id_services , services.name_services, services.area , services.max_number ,
services.rental_cost , services.name_services 
from services join type_services 
on services.id_type_services = type_services.id_type_services
where exists(select contract.id_contract from contract where year(contract.daystart_contract) = "2018" 
and contract.id_services = services.id_services)  
and not exists(select contract.id_contract from contract where year(contract.daystart_contract) = "2019"
and contract.id_services = services.id_services );

-- 8 
select distinct custommer.full_name from custommer ;
select  custommer.full_name from custommer group by custommer.full_name ;
	select  custommer.full_name from custommer union select custommer.full_name from custommer ;
    
    -- 9 
    select temp.month, count(month(contract.daystart_contract)) as numbercontract , month(contract.daystart_contract) as monthct  ,
    sum(contract.total_money) as total from
    ( select  1 as month 
    union select 2 as month union select 3 as month union select 4 as month
    union select 5 as month union select 6 as month
    union select 7 as month union select 8 as month union select 9 as month
    union select 10 as month union select 11 as month union select 12 as month) as temp 
    left join contract on month(contract.daystart_contract) = temp.month 
    left join custommer on custommer.id_custommer = contract.id_custommer 
    where year(contract.daystart_contract) = "2019" 
     group by temp.month ;
     
     select month(contract.daystart_contract) as month_contract , count(month(contract.daystart_contract)) as numbercontract 
     ,  sum(contract.total_money) as total from
     contract inner join custommer on custommer.id_custommer = contract.id_custommer 
     where year(contract.daystart_contract) = "2019" 
     group by month_contract;


-- 10 
select contract.id_contract,contract.daystart_contract,contract.dayend_contract,
count(contract_details.id_accompanied_services) as number 
from contract inner join contract_details 
on contract.id_contract = contract_details.id_contract
group by contract.id_contract ;
-- sdadsada
-- 11.	
 select accompanied_services.id_accompanied_services ,accompanied_services.name_accompanied_services
 from accompanied_services inner join contract_details 
 on accompanied_services.id_accompanied_services = contract_details.id_accompanied_services 
 inner join contract on contract_details.id_contract = contract.id_contract 
 inner join custommer on contract.id_custommer = custommer.id_custommer 
 inner join custommer_style on custommer.id_custommer_style =custommer_style.id_custommer_style
 where name_custommer_style = "diamond" and custommer.adress = "Đà Nẵng" ;
--  12.	
select contract.id_contract,employee.full_name,custommer.full_name,custommer.phone_number,services.name_services,
count(contract_details.id_accompanied_services) as num_usedServices 
from contract inner join employee on contract.id_employee = employee.id_employee 
inner join custommer on contract.id_custommer = custommer.id_custommer 
inner join services on contract.id_services = services.id_services 
inner join contract_details on contract.id_contract  = contract_details.id_contract 
where not exists(select contract.id_contract where contract.daystart_contract between "2019-01-01" and "2019-06-31")
and exists(select contract.id_contract where contract.daystart_contract between "2019-10-01" and "2019-12-31");
-- 13 

create temporary table temp
select accompanied_services.name_accompanied_services as name_acServices ,
count(contract_details.id_accompanied_services) as num_used from contract_details inner join accompanied_services
on contract_details.id_accompanied_services = accompanied_services.id_accompanied_services 
group by accompanied_services.name_accompanied_services;
select *from temp ;
create temporary table temp1 
select  max(temp.num_used) as number_max  from temp ;
select * from temp1 ;
select temp.name_acServices ,temp.num_used from temp inner join temp1 
on temp.num_used =temp1.number_max;
-- 14.Thông tin hiển thị bao gồm IDHopDong, TenLoaiDichVu, TenDichVuDiKem, SoLanSuDung.
select contract.id_contract, services.name_services,accompanied_services.name_accompanied_services,
count(contract_details.id_accompanied_services) as num_used from 
contract inner join services on  contract.id_services = services.id_services
inner join type_services on services.id_type_services = type_services.id_type_services
inner join contract_details on contract.id_contract = contract_details.id_contract 
inner join accompanied_services on contract_details.id_accompanied_services =  accompanied_services.id_accompanied_services
group by accompanied_services.name_accompanied_services  having num_used = 1 ;

-- 15.	Hiển thi thông tin của tất cả nhân viên bao gồm IDNhanVien, HoTen, TrinhDo, TenBoPhan, SoDienThoai, 
-- DiaChi mới chỉ lập được tối đa 3 hợp đồng từ năm 2018 đến 2019.
select employee.id_employee , employee.full_name ,  education.education , department.name_department ,
employee.phone_number ,employee.adress , count(contract.id_employee) as num from employee inner join education
on employee.id_education = education.id_education 
inner join department on employee.id_department =department.id_department 
inner join contract on employee.id_employee = contract.id_employee
where contract.daystart_contract between "2018-01-01" and "2019-12-31"
group by employee.full_name having num <= 3  ;
-- 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2017 đến năm 2019.

create temporary table table3
select contract.id_contract , employee.id_employee from contract inner join employee
on contract.id_employee = employee.id_employee 
where not exists(select contract.id_employee from
contract where contract.daystart_contract between "2017-01-01" and "2019-12-31" 
and contract.id_employee = employee.id_employee ) ;
select * from table3 ;
drop table table3;
SET SQL_SAFE_UPDATES = 0;
delete contract from  contract where id_contract in (select table3.id_contract from table3) ;
delete  employee from employee inner join table3 on employee.id_employee = table3.id_employee   ;


-- 17.	Cập nhật thông tin những khách hàng có TenLoaiKhachHang từ VIP1 lên VIP,
--  chỉ cập nhật những khách hàng đã từng đặt phòng với tổng 
--  Tiền thanh toán trong năm 2019 là lớn hơn 10.000.000 VNĐ.
create temporary table table5 
select custommer.id_custommer  , sum(contract.total_money) as total from custommer inner join contract 
on custommer.id_custommer = contract.id_custommer
where year(contract.daystart_contract ) = "2019"
group by custommer.id_custommer having total  > 70000 ;
select * from table5;
drop table table5 ;
update custommer set custommer.id_custommer_style = 3
 where custommer.id_custommer in ( select table5.id_custommer from table5) ;
 

 
-- 18.	Xóa những khách hàng có hợp đồng trước năm 2016 (chú ý rang buộc giữa các bảng).
delete contract_details from contract inner join contract_details 
on contract.id_contract = contract_details.id_contract 
where year(contract.daystart_contract) < 2016 ;
delete contract from contract 
where year(contract.daystart_contract) < 2016 ;

delete contract_details, contract  from contract inner join contract_details 
on contract.id_contract = contract_details.id_contract 
where year(contract.daystart_contract) < 2016 ;
-- 19.	Cập nhật giá cho các Dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2019 lên gấp đôi.
update accompanied_services set accompanied_services.salary = accompanied_services.salary*2
where accompanied_services.id_accompanied_services in (select contract_details.id_accompanied_services 
 from  contract_details
 group by  contract_details.id_accompanied_services having count(contract_details.id_accompanied_services) > 1 ) ;
 
-- 20
select employee.id_employee , employee.full_name as name_employee , employee.email as email_employee,
custommer.id_custommer as name_custommer , custommer.full_name as full_name_custommer,
custommer.email as email_custommer from employee , custommer ;


