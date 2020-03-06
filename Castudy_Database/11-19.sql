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
delete from employee where not exists(select employee.id_employee from
contract where contract.daystart_contract between "2017-01-01" and "2019-12-31" 
and contract.id_employee = employee.id_employee ) ;
SET SQL_SAFE_UPDATES = 0;
-- 17 
update custommer, (select contract.id_custommer as id , sum(contract.total_money) as tong_tien from contract
 where year(contract.daystart_contract) = "2019" 
 group by contract.id_custommer 
 having tong_tien > 10000000 ) as temp  
 set custommer.id_custommer_style = (select custommer_style.id_custommer_style
from custommer_style where custommer_style.name_custommer_style = "Diamond" )
where custommer.id_custommer = (select custommer.id_custommer_style from  custommer_style 
where custommer_style.name_custommer_style="platinium")
and temp.id = 	custommer.id_custommer ;
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
 group by  contract_details.id_accompanied_services having count(contract_details.id_accompanied_services) > 10 ) ;
-- 20.	Hiển thị thông tin của tất cả các Nhân viên và Khách hàng có trong hệ thống,
--  thông tin hiển thị bao gồm ID (IDNhanVien, IDKhachHang), 
--  HoTen, Email, SoDienThoai, NgaySinh, DiaChi.
select employee.id_employee , employee.full_name as name_employee , employee.email as email_employee,
custommer.id_custommer as name_custommer , custommer.full_name as full_name_custommer,
custommer.email as email_custommer from employee , custommer ;

