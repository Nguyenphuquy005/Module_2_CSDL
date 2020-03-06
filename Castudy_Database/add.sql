delete from custommer ; 
insert into  custommer_style(name_custommer_style)
 values ("diamond") ,("platinium") ,("gold"),("sliver"),("manber") ;
 
 alter table custommer Modify  id_card varchar(45) unique;
  delete from type_services;
 insert into custommer(full_name,id_custommer_style,brithday,id_card,phone_number,email,adress)
 values ("Lê Ngọc Huy",1,"20191212","12345678","01225448521","huy@gmail.com","Đà Nẵng"),
        ("Lê Hoàn",1,"20151203","65445678","0123236541","hoan@gmail.com","Quảng Nam"),
        ("Lê Ngọc Huy",1,"20161212","1232995678","6548521254","huyvu@gmail.com","Đà Nẵng"),
        ("Trần Cường",2,"19961202","12548563","12654555211","cuong@gmail.com","Huế"),
        ("Nguyễn Ngọc",2,"19851214","621458745","01254125485","ngoc@gmail.com","Quảng Bình"),
        ("Trần Bình",3,"20111206","21585321","01225448521","huy@gmail.com","Quảng Trị"),
        ("Tống Công Minh",3,"19941205","84596321","2238546514","minh@gmail.com","Vinh"),
        ("Lê Hồng",4,"20191212","65485212","01226748521","hong@gmail.com","Hồ Chí Minh"),
        ("Trương Kiên",5,"20191212","98456215","01256775521","kien@gmail.com","Hà Nội");
        
        insert into type_rent(name_type_rent)
        values ("house"),("day"),("mount"),("year") ;
        
        select*from type_rent ;
        
        insert into type_services(name_type_services)
        values("villa"),("house"),("room") ;
        
       insert into services(name_services,area,num_floot,max_number,
       rental_cost,id_type_rent,id_type_services,status_services)
       values ("karaoke",50,3,5,30.000,1,3,"no Status"),
       ("food",50,3,5,30.000,2,3,"no Status"),
       ("drink",50,3,5,30.000,4,2,"no Status"),
       ("sport",50,3,5,30.000,4,1,"no Status");
      select * from furamaresort.accompanied_services ;
      delete from furamaresort.employee where employee.id_positions is null;
      insert into contract(id_contract,id_employee,id_custommer,id_services,daystart_contract,dayend_contract,
      deposits,total_money) values () ;
     
     insert into furamaresort.department(name_department) values ("gm"),("dgm"),("fom") ;
       insert into furamaresort.education(education) values ("dai hoc") ;
       insert into furamaresort.positions(name_position) values ("fom" ) ;
       insert into furamaresort.employee(full_name,id_positions,id_education,id_department,brithday,id_card,salary
       ,phone_number,email,adress)
       values ("Lê Ngọc Huy Cường",1,1,3,"19961207","13659845","60000","1236587456","uong@gmail.com","da nang");
  insert into furamaresort.accompanied_services(name_accompanied_services,salary,units,availability_status)
  values ("boxing",120000,15,"run time"),("play game",11,2,"overnight");
  
insert into furamaresort.contract(id_employee,id_custommer,id_services,daystart_contract,
dayend_contract,deposits,total_money) 
values (1,1,1,"20190117","20220821",50000,73000),
(1,2,3,"20190117","20220821",50000,73000) ,
(1,1,1,"20190117","20220821",50000,73000);
  
