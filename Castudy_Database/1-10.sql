use furamaresort ;
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
where ct.name_custommer_style = "diamond" 
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
