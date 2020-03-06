-- 16

create temporary table table3
select contract.id_contract , employee.id_employee from contract inner join employee
on contract.id_employee = employee.id_employee 
where not exists(select employee.id_employee from
contract where contract.daystart_contract between "2017-01-01" and "2019-12-31" 
and contract.id_employee = employee.id_employee ) ;
select * from table3 ;
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
 where custommer.id_custommer in (select table5.id_custommer from table5) ;
-- 18.	Xóa những khách hàng có hợp đồng trước năm 2016 (chú ý rang buộc giữa các bảng).
delete contract_details from contract inner join contract_details 
on contract.id_contract = contract_details.id_contract 
where year(contract.daystart_contract) < 2016 ;
delete contract from contract 
where year(contract.daystart_contract) < 2016 ;
-- 19.	Cập nhật giá cho các Dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2019 lên gấp đôi.
update accompanied_services set accompanied_services.salary = accompanied_services.salary*2
where accompanied_services.id_accompanied_services in (select contract_details.id_accompanied_services 
 from  contract_details
 group by  contract_details.id_accompanied_services having count(contract_details.id_accompanied_services) > 1 ) ;
 


