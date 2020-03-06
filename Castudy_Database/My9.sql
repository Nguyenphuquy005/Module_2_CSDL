drop table queritable ;
create temporary table queritable 
 select month(contract.daystart_contract) as month_contract , count(month(contract.daystart_contract)) as numbercontract 
     ,  sum(contract.total_money) as total from
     contract inner join custommer on custommer.id_custommer = contract.id_custommer 
     where year(contract.daystart_contract) = "2019" 
     group by month_contract;

select * from queritable;
drop table tableMonth ;
create  temporary table tableMonth (
monthTable int 
  );
  insert into tableMonth(monthTable) values (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12) ;
  select * from tableMonth ;
select   tableMonth.monthTable ,queritable.numbercontract ,queritable.total from  tableMonth left join  queritable 
on tableMonth.monthTable = queritable.month_contract ;
