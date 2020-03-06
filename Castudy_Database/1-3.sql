insert into employee(full_name,brithday,id_card,salary,phone_number,email,adress)
values ("Lê Ngọc Huy","20191212","12345678","20.000","1234567894","Email.com","vô gia cư"),
 ("Lê Ngọc Duy","20191212","12345678","20.000","1234567894","Email.com","vô gia cư") ;
 insert into employee(full_name,brithday,id_card,salary,phone_number,email,adress)
values ("Mê Ngọc Huy","20191212","12345678","20.000","1234567894","Email.com","vô gia cư"),
 ("Mút Ngọc Duy","20191212","12345678","20.000","1234567894","Email.com","vô gia cư") ;
 insert into custommer(brithday,id_card,phone_number,email,adress)
 value("19961212","12345678","1234567894","email.com","ngo quyen"),
 ("20161212","12345678","1234567894","email.com","ngo quyen");
 -- 2
 select * from furamaresort.employee 
 where (full_name like 'L%' or 'K%' or 'T%') 
 and char_LENGTH(employee.full_name) <= 15  ;
 -- 3
  select *
 from furamaresort.custommer 
 where  ((Year(now()) - Year(brithday) between 18 and 50)) 
 and (adress = "Đà Nẵng" or "Quảng Trị");
 -- 4
 