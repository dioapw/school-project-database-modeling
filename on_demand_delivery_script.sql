-- Create Table Users
create table users (   
  user_id       number,   
  password      varchar2(50) not null,   
  email         varchar2(100) not null,   
  first_name    varchar2(50) not null, 
  last_name     varchar2(50), 
  gender        char(1), 
  phone_no      char(12), 
  created_at    date, 
  user_type     char(1) not null, 
  constraint pk_user_id primary key (user_id)   
);;

-- Create Users Trigger
create or replace trigger  USERS_PK_TRIGGER 
    before insert or update on users 
    for each row 
begin 
    if inserting and :new.user_id is null then 
        :new.user_id := to_number(sys_guid(),  
          'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'); 
    end if; 
end; 
/

-- Add Data to Users
insert into users (password,email,first_name,last_name,gender,phone_no,created_at,user_type) 
values ('wqqMdsd2uo4*Ie7ZgEI7J3r8*','example1@gmail.com','Shalih',null,'L','081123422423','03-DEC-20','2');
insert into users (password,email,first_name,last_name,gender,phone_no,created_at,user_type) 
values ('314351Yuuo4*Ie7ZgEI7Jvvbv*','example2@gmail.com','Fauzan','Muhammad','L','082323412443','02-DEC-20','2');
insert into users (password,email,first_name,last_name,gender,phone_no,created_at,user_type) 
values ('rtMV22231uuo4*Ie7ZgEI7Jht5*','example3@gmail.com','Dio','Aditya','L','081121232343','17-MAR-20','3');
insert into users (password,email,first_name,last_name,gender,phone_no,created_at,user_type) 
values ('21232323o4*Isdfs127J!j@8*','example4@gmail.com','Rifka',null,'P','081113225443','16-FEB-20','3');
insert into users (password,email,first_name,last_name,gender,phone_no,created_at,user_type)
values ('1MV6Yuasfsdfsq2324sdJ090iok*','example5@gmail.com','Abdurrahman','Ali','L','081322566543','11-JAN-20','1');
insert into users (password,email,first_name,last_name,gender,phone_no,created_at,user_type) 
values ('Oa23234dasd3r322343asd&$8*','example6@gmail.com','Aisyah',null,'P','082362385634','22-JUN-19','1');


-- Create Table Item Type
create table item_type(
    item_type_id number,
    type varchar2(30) not null,
    details varchar2(255),
    extra_cost number(*,0),
    Constraint pk_item_type_id primary key (item_type_id)
);


-- Create Item Type Trigger
create or replace trigger ITEM_TYPE_PK_TRIGGER
    before insert or update on item_type
    for each row
begin
    if inserting and :new.item_type_id is null then
        :new.item_type_id := to_number(sys_guid(),'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
    end if;
end;
/


-- Add Data to Item Type
insert into item_type(type,details,extra_cost) values ('barang_berharga','memiliki nilai >= Rp 1.000.000,00',5000);
insert into item_type(type,details,extra_cost) values ('barang_berat','memiliki berat >= 50kg',4500);
insert into item_type(type,details,extra_cost) values ('barang_mudah_pecah','terbuat dari bahan yang mudah pecah',6500);
insert into item_type(type,details,extra_cost) values ('barang_biasa','memiliki berat < 50kg dan nilai < Rp 1.000.000,00',null);


-- Create Table Truck Type
create table truck_type(
    truck_type_id number,
    type char(10) not null,
    details varchar2(255),
    maximum_weight number,
    dimension char(11),
    Constraint pk_truck_type_id primary key(truck_type_id)
);


-- Create Truck Type Trigger
create or replace trigger TRUCK_TYPE_PK_TRIGGER
    before insert or update on truck_type
    for each row
begin
    if inserting and :new.truck_type_id is null then
        :new.truck_type_id := to_number(sys_guid(),'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
    end if;
end;
/


-- Add Data to Truck Type
insert into truck_type(type,details,maximum_weight,dimension) 
values('pickup_bak','dapat mengangkut sampai 1000kg and memiliki dimensi 2.0 m x 1.3 m x 1.2 m',1000,'200x130x120');
insert into truck_type(type,details,maximum_weight,dimension) 
values('pickup_box','dapat mengangkut sampai 1000kg and memiliki dimensi 2.0 m x 1.3 m x 1.3 m',1000,'200x130x130');
insert into truck_type(type,details,maximum_weight,dimension) 
values('engkel_bak','dapat mengangkut sampai 2000kg and memiliki dimensi 3.0 m x 1.6 m x 1.3 m',2000,'300x160x130');
insert into truck_type(type,details,maximum_weight,dimension) 
values('engkel_box','dapat mengangkut sampai 2000kg and memiliki dimensi 3.0 m x 1.6 m x 1.6 m',2000,'300x160x160');


-- Create Table Employee Role
create table employee_role(
    employee_role_id number,
    role_name varchar2(100) not null,
    role_detail varchar2(255),
    created_at date,
    Constraint pk_employee_role_id primary key (employee_role_id)
);


-- Create Employee Role Trigger
create or replace trigger EMPLOYEE_ROLE_PK_TRIGGER
    before insert or update on employee_role
    for each row
begin
    if inserting and :new.employee_role_id is null then
        :new.employee_role_id := to_number(sys_guid(),'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
    end if;
end;
/


-- Add Data to Employee Role
insert into employee_role(role_name,role_detail,created_at) values('project_manager','planning, overseeing and leading projects from ideation through to completion','19-APR-20');
insert into employee_role(role_name,role_detail,created_at) values('network_engineer','setting up, developing and maintaining computer networks within an organisation or between organisations','03-MAR-19');
insert into employee_role(role_name,role_detail,created_at) values('front_end_engineer','responsible for implementing visual elements that users see and interact within a web application','06-JUL-20');
insert into employee_role(role_name,role_detail,created_at) values('back_end_engineer','create, code, and improve the server, server-side applications, and databases that, when combined with front-end codes, help create a functional, seamless experience for the end-user','11-FEB-20');
insert into employee_role(role_name,role_detail,created_at) values('cloud_engineer','responsible for duties associated with cloud computing including planning, design, management, maintenance, and support. More and more, companies are moving their critical IT infrastructure to cloud-based environments','01-JAN-18');
insert into employee_role(role_name,role_detail,created_at) values('system_administrator','responsible for the upkeep, configuration, and reliable operation of computer systems; especially multi-user computers, such as servers.','09-OCT-19');
insert into employee_role(role_name,role_detail,created_at) values('database_administrator','The role may include capacity planning, installation, configuration, database design, migration, performance monitoring, security, troubleshooting, as well as backup and data recovery','12-AUG-19');


-- Create Table Driver
create table driver(
    driver_id number,
    user_id number not null,
    rating number(3,0),
    profile_pic varchar2(255) not null,
    login_at date not null,
    constraint pk_driver_id primary key (driver_id),
    constraint fk_driver_user_id foreign key(user_id) references users(user_id)
);


-- Create Driver Trigger
create or replace trigger DRIVER_PK_TRIGGER
    before insert or update on driver
    for each row
begin
    if inserting and :new.driver_id is null then
        :new.driver_id := to_number(sys_guid(),'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
    end if;
end;
/


-- Add Data to Driver
insert into driver(user_id,rating,profile_pic,login_at) values (
    (select user_id
      from users
     where user_type = 2 and created_at= '03-DEC-20'),
    70, 'http://www.example.com/pictures01','19-APR-19'
);
insert into driver(user_id,rating,profile_pic,login_at) values (
    (select user_id
      from users
     where user_type = 2 and created_at = '02-DEC-20'),
    89, 'http://www.example.com/pictures02','11-APR-20'
);


-- Create Table Driver Income
create table driver_income(
    driver_income_id number,
    driver_id number not null,
    total_income number(*,0),
    paid_date date not null,
    trip_income number(*,0),
    bonus number(*,0),
    customer_tip number(*,0),
    Constraint pk_driver_income_id primary key (driver_income_id),
    Constraint fk_driver_income_driver_id foreign key(driver_id) references driver(driver_id)
);


-- Create Driver Income Trigger
create or replace trigger DRIVER_INCOME_PK_TRIGGER
    before insert or update on driver_income
    for each row
begin
    if inserting and :new.driver_income_id is null then
        :new.driver_income_id := to_number(sys_guid(),'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
    end if;
end;
/


-- Add Data to Driver Income
insert into driver_income(driver_id,total_income,paid_date,trip_income,bonus,customer_tip) values (
    (
        select driver_id
          from driver
         where login_at = '19-APR-19'
    ),
    1000000,'20-MAY-19',500000,400000,100000
);

insert into driver_income(driver_id,total_income,paid_date,trip_income,bonus,customer_tip) values (
    (
        select driver_id
          from driver
         where login_at = '11-APR-20'
    ),
    500000,'21-JUN-20',300000,100000,100000
);


-- Create Table Document
create table document(
    document_id number,
    driver_id number not null,
    document_type varchar2(30) not null,
    expired_date date not null,
    created_at date,
    Constraint pk_document_id primary key (document_id),
    Constraint fk_document_driver_id foreign key(driver_id) references driver(driver_id)
);


-- Create Document Trigger
create or replace trigger DOCUMENT_PK_TRIGGER
    before insert or update on document
    for each row
begin
    if inserting and :new.document_id is null then
        :new.document_id := to_number(sys_guid(),'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
    end if;
end;
/


-- Add Data to Document
insert into document(driver_id,document_type,expired_date,created_at) values (
    (
        select driver_id
          from driver
         where login_at = '19-APR-19'
    ),
    'SIM','22-JUN-30','30-APR-19'
);
insert into document(driver_id,document_type,expired_date,created_at) values (
    (
        select driver_id
          from driver
         where login_at = '19-APR-19'
    ),
    'STNK','23-OCT-30','1-MAY-19'
);
insert into document(driver_id,document_type,expired_date,created_at) values (
    (
        select driver_id
          from driver
         where login_at = '11-APR-20'
    ),
    'STNK','22-FEB-30','20-APR-19'
);
insert into document(driver_id,document_type,expired_date,created_at) values (
    (
        select driver_id
          from driver
         where login_at = '11-APR-20'
    ),
    'SIM','25-DEC-30','21-APR-19'
);


-- Create Table Employee
create table employee(
    employee_id number,
    user_id number not null,
    employee_role_id number not null,
    address varchar2(255),
    date_of_birth date,
    token varchar2(50) not null,
    emergency_number char(12) not null,
    updated_at date,
    Constraint pk_employee_id primary key(employee_id),
    Constraint fk_employee_user_id foreign key(user_id) references users(user_id),
    Constraint fk_employee_role_id foreign key(employee_role_id) references employee_role(employee_role_id)
);


-- Create Employee Trigger
create or replace trigger EMPLOYEE_PK_TRIGGER
    before insert or update on employee
    for each row
begin
    if inserting and :new.employee_id is null then
        :new.employee_id := to_number(sys_guid(),'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
    end if;
end;
/


-- Add Data to Employee
insert into employee(user_id,employee_role_id,address,date_of_birth,token,emergency_number,updated_at) values (
    (
        select user_id
          from users
         where user_type='3' and created_at = '17-MAR-20'
    ), 
    (
        select employee_role_id
          from employee_role
         where role_name='cloud_engineer'
    ),
    '592 Wayne Ave.Wadsworth, OH 44281','12-MAR-01','123767bdsdh02230','082374462832','20-JUL-20'
);
insert into employee(user_id,employee_role_id,address,date_of_birth,token,emergency_number,updated_at) values (
    (
        select user_id
          from users
         where user_type='3' and created_at = '16-FEB-20'
    ), 
    (
        select employee_role_id
          from employee_role
         where role_name='database_administrator'
    ),
    '19 Hartford St.Bethpage, NY 11714','08-MAY-00','12376asdkk3202230','082311422442','21-DEC-20'
);


-- Create Table Truck
create table truck(
    truck_id number,
    driver_id number not null,
    truck_type_id number not null,
    brand_name varchar2(30),
    model_description varchar2(255),
    model_name varchar2(50),
    model_year number(4,0),
    plat_number char(7) not null,
    color varchar2(30),
    created_at date,
    Constraint pk_truck_id primary key (truck_id),
    Constraint fk_truck_type_id foreign key(truck_type_id) references truck_type(truck_type_id),
    Constraint fk_truck_driver_id foreign key(driver_id) references driver(driver_id)
);


-- Create Truck Trigger
create or replace trigger TRUCK_PK_TRIGGER
    before insert or update on truck
    for each row
begin
    if inserting and :new.truck_id is null then
        :new.truck_id := to_number(sys_guid(),'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
    end if;
end;
/


-- Add Data to Truck
insert into truck(driver_id,truck_type_id,brand_name,model_description,model_name,model_year,plat_number,color,created_at) values (
    (
        select driver_id
          from driver
         where login_at = '19-APR-19'
    ), 
    (
        select truck_type_id
        from truck_type
        where type='pickup_bak'
    ),
    'Suzuki','Model terbaru dar Suzuki.','New Carry Pick-Up Flat-Deck',2020,'B1042PJ','Putih','19-APR-29'
);

insert into truck(driver_id,truck_type_id,brand_name,model_description,model_name,model_year,plat_number,color,created_at) values (
    (
        select driver_id
          from driver
         where login_at = '11-APR-20'
    ), 
    (
        select truck_type_id
        from truck_type
        where type='engkel_bak'
    ),
    'Isuzu','Sangat cocok untuk bisnis pertambangan atau transportasi','NLR55TLX Isuzu Elf engkel LONG bak besi triway',2018,'L1996YZ','Kuning','20-DEC-29'
);


-- Create Table Phone Verification
create table phone_verification(
    verification_id number,
    user_id number not null,
    phone_no char(12) not null,
    is_verified char(1) not null,
    created_at date,
    Constraint pk_phone_verification primary key (verification_id),
    Constraint fk_phone_user_id foreign key(user_id) references users(user_id)
);


-- Create Phone Verification Trigger
create or replace trigger PV_PK_TRIGGER
    before insert or update on phone_verification
    for each row
begin
    if inserting and :new.verification_id is null then
        :new.verification_id := to_number(sys_guid(),'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
    end if;
end;
/


-- Add Data to Phone Verification
insert into phone_verification(user_id,phone_no,is_verified,created_at) values (
    (
        select user_id
        from users
        where phone_no = '081123422423'
    ),
    '081123422423','1','22-JAN-2012'
);
insert into phone_verification(user_id,phone_no,is_verified,created_at) values (
    (
        select user_id
        from users
        where phone_no = '082323412443'
    ),
    '082323412443','1','21-FEB-2012'
);
insert into phone_verification(user_id,phone_no,is_verified,created_at) values (
    (
        select user_id
        from users
        where phone_no = '081121232343'
    ),
    '081121232343','0','20-MAR-2011'
);
insert into phone_verification(user_id,phone_no,is_verified,created_at) values (
    (
        select user_id
        from users
        where phone_no = '081113225443'
    ),
    '081113225443','0','10-SEP-2010'
);
insert into phone_verification(user_id,phone_no,is_verified,created_at) values (
    (
        select user_id
        from users
        where phone_no = '081322566543'
    ),
    '081322566543','0','01-JAN-2000'
);
insert into phone_verification(user_id,phone_no,is_verified,created_at) values (
    (
        select user_id
        from users
        where phone_no = '082362385634'
    ),
    '082362385634','1','11-AUG-2001'
);


-- Create Table Customer
create table customer(
    customer_id number,
    user_id number not null,
    home_location varchar2(255),
    saved_delivery_destination varchar2(255),
    profile_pic varchar2(255),
    rating number(3,0),
    is_verified char(1) not null,
    is_actived char(1) not null,
    login_at date not null,
    Constraint pk_customer_id primary key (customer_id),
    Constraint fk_customer_user_id foreign key(user_id) references users(user_id)
); 


-- Create Customer Trigger
create or replace trigger CUSTOMER_PK_TRIGGER
    before insert or update on customer
    for each row
begin
    if inserting and :new.customer_id is null then
        :new.customer_id := to_number(sys_guid(),'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
    end if;
end;
/


-- Add Data to Customer 
insert into customer(user_id,home_location,saved_delivery_destination,profile_pic,rating,is_verified,is_actived,login_at) values (
    (
        select user_id
        from users
        where user_type = '1' and created_at = '11-JAN-20'
    ),
    'Jl Hayam Wuruk Glodok Harco Bl B/113, Dki Jakarta','Jl Pintu Kecil Gg Burung 59, Dki Jakarta','http://www.example.com/pictures34',88,'0','1','12-MAY-2020'
);
insert into customer(user_id,home_location,saved_delivery_destination,profile_pic,rating,is_verified,is_actived,login_at) values (
    (
        select user_id
        from users
        where user_type = '1' and created_at = '22-JUN-19'
    ),
    'Jl Kb Sirih 61, Jakarta','Jl Peta 201 F Ruko Kopo Plaza Kav B/24','http://www.example.com/pictures55',98,'1','1','03-SEP-2020'
);


-- Create Table Service
create table service(
    service_id number,
    service_name varchar2(100) not null,
    delivery_time varchar2(100) not null,
    rates_per_mile number(*,0),
    rates_per_km number(*,0) not null,
    updated_at date,
    created_at date,
    Constraint pk_service_id primary key (service_id)
);


-- Create Service Trigger
create or replace trigger SERVICE_PK_TRIGGER
    before insert or update on service
    for each row
begin
    if inserting and :new.service_id is null then
        :new.service_id := to_number(sys_guid(),'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
    end if;
end;
/


-- Add Data to Service
insert into service(service_name,delivery_time,rates_per_mile,rates_per_km,updated_at,created_at) 
values ('REG (Reguler)','1 - 7 hari kerja',1864,3000,'05-JAN-2021','04-JAN-2021');
insert into service(service_name,delivery_time,rates_per_mile,rates_per_km,updated_at,created_at) 
values ('Ekonomi','> 7 hari kerja',1242,2000,'11-MAR-2020','04-FEB-2019');
insert into service(service_name,delivery_time,rates_per_mile,rates_per_km,updated_at,created_at) 
values ('Express','< 24 jam',2485,4000,'20-MAY-2020','04-JUL-2019');
insert into service(service_name,delivery_time,rates_per_mile,rates_per_km,updated_at,created_at) 
values ('Hari Esok','hari besok (termasuk hari Minggu dan hari libur nasional)',2175,3500,'22-JUN-2020','28-OCT-2019');
insert into service(service_name,delivery_time,rates_per_mile,rates_per_km,updated_at,created_at) 
values ('Super Express','1 - 2 jam setelah diambil oleh driver',3106,5000,'19-JUN-2019','05-NOV-2018');


-- Create Table Payment Method
create table payment_method (
    payment_method_id number,
    method varchar2(50) not null,
    details varchar2(255),
    created_at date,
    Constraint pk_payment_method_id primary key (payment_method_id)
);


-- Create Payment Method Trigger
create or replace trigger PAYMENT_METHOD_PK_TRIGGER
    before insert or update on payment_method
    for each row
begin
    if inserting and :new.payment_method_id is null then
        :new.payment_method_id := to_number(sys_guid(),'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
    end if;
end;
/


-- Add Data to Payment Method
insert into payment_method(method,details,created_at) 
values ('Kartu Debit','Pembayaran menggunakan kartu debit bank yang tersedia.','30-MAY-2020');
insert into payment_method(method,details,created_at) 
values ('Kartu Kredit','Pembayaran menggunakan kartu kredit bank yang tersedia.','04-JUL-2019');
insert into payment_method(method,details,created_at) 
values ('Tunai','Pembayaran menggunakan uang tunai yang langsung dibayar kepada driver ketika akan mengirim barang.','23-FEB-2003');
insert into payment_method(method,details,created_at) 
values ('E-money','Pembayaran dompet digital yang tersedia','12-JUL-2003');


-- Create Table Emoney
create table emoney(
    emoney_id number,
    customer_id number not null,
    phone_number char(12) not null,
    email varchar2(100) not null,
    balance number(*,0),
    emoney_type varchar2(10) not null, 
    Constraint pk_emoney_id primary key (emoney_id),
    Constraint fk_emoney_customer_id foreign key(customer_id) references customer(customer_id)
);


-- Create Emoney Trigger
create or replace trigger EMONEY_PK_TRIGGER
    before insert or update on emoney
    for each row
begin
    if inserting and :new.emoney_id is null then
        :new.emoney_id := to_number(sys_guid(),'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
    end if;
end;
/


-- Add Data to Emoney
insert into emoney(customer_id,phone_number,email,balance,emoney_type) values (
    (
        select customer_id
        from customer
        where login_at = '12-MAY-2020'
    ), '081322566543','example5@gmail.com',1000000,'Gopay'
);
insert into emoney(customer_id,phone_number,email,balance,emoney_type) values (
    (
        select customer_id
        from customer
        where login_at = '03-SEP-2020'
    ), '082362385634','example6@gmail.com',550342,'OVO'
);


-- Create Table Promo Code 
create table promo_code (
    promo_code_id number,
    promo_code_number char(18) not null,
    discount_percentage number(3),
    max_promo_amount number(*,0),
    promo_start_date date,
    promo_end_date date,
    city_id char(3),
    promo_type varchar2(50),
    item_type varchar2(50),
    max_use_per_user number(*,0),
    description varchar2(255),
    is_recurring char(1) not null,
    promo_status char(1) not null,
    created_at date,
    Constraint pk_promo_code_id primary key (promo_code_id)
);


-- Create Promo Code Trigger
create or replace trigger PROMO_CODE_PK_TRIGGER
    before insert or update on promo_code
    for each row
begin
    if inserting and :new.promo_code_id is null then
        :new.promo_code_id := to_number(sys_guid(),'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
    end if;
end;
/


-- Add Data to Promo Code
insert into promo_code(promo_code_number,discount_percentage,max_promo_amount,promo_start_date,promo_end_date,city_id,promo_type,item_type,max_use_per_user,description,is_recurring,promo_status,created_at) 
values ('k$$D6t^F1agnDSAMpu',15,345,'12-MAR-2010','11-MAY-2010','JKT','Diskon Reguler','Barang biasa',3,'Pengguna akan mendapatkan diskon sebesar 15% dari biaya pengiriman jenis barang biasa','1','0','10-MAR-2010');
insert into promo_code(promo_code_number,discount_percentage,max_promo_amount,promo_start_date,promo_end_date,city_id,promo_type,item_type,max_use_per_user,description,is_recurring,promo_status,created_at) 
values ('xQtp!ptS%eS65h@gaI',100,200,'03-JUL-2011','01-OCT-2011','BDO','Gratis Ongkir','Barang berat dan Barang biasa ',2,'Pengguna tidak harus membayar biaya pengiriman','0','1','25-SEP-2011');
insert into promo_code(promo_code_number,discount_percentage,max_promo_amount,promo_start_date,promo_end_date,city_id,promo_type,item_type,max_use_per_user,description,is_recurring,promo_status,created_at) 
values ('br1&oxW7RMvzr5MMzd',10,300,'02-JAN-2021','01-APR-2021','SBY','Promo Bank','Barang mudah pecah',4,'Pengguna akan mendapatkan diskon sebesar 10% dari biaya pengiriman jenis barang mudah pecah untuk pembayaran dengan bank tertentu','1','1','01-JAN-2021');


-- Create Table Promo Usage
create table promo_usage(
    promo_usage_id number,
    promo_code_id number not null,
    customer_id number not null,
    promo_code char(18) not null,
    is_applied char(1) not null,
    is_used char(1) not null,
    applied_at date,
    created_at date,
    Constraint pk_promo_usage_id primary key (promo_usage_id),
    Constraint fk_usage_promo_code_id foreign key(promo_code_id) references promo_code(promo_code_id),
    Constraint fk_promo_usage_customer_id foreign key(customer_id) references customer(customer_id)
);


-- Create Promo Usage Trigger
create or replace trigger PROMO_USAGE_PK_TRIGGER
    before insert or update on promo_usage
    for each row
begin
    if inserting and :new.promo_usage_id is null then
        :new.promo_usage_id := to_number(sys_guid(),'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
    end if;
end;
/


-- Add Data to Promo Usage
insert into promo_usage(promo_code_id,customer_id,promo_code,is_applied,is_used,applied_at,created_at)
values (
    (
        select promo_code_id
        from promo_code
        where promo_code_number = 'k$$D6t^F1agnDSAMpu'
    ),
    (
        select customer_id
        from customer
        where login_at = '12-MAY-2020'
    ),
    'k$$D6t^F1agnDSAMpu','1','0','17-MAR-2010','17-MAR-2010'
);
insert into promo_usage(promo_code_id,customer_id,promo_code,is_applied,is_used,applied_at,created_at)
values (
    (
        select promo_code_id
        from promo_code
        where promo_code_number = 'xQtp!ptS%eS65h@gaI'
    ),
    (
        select customer_id
        from customer
        where login_at = '12-MAY-2020'
    ),
    'xQtp!ptS%eS65h@gaI','0','1',null,'5-JUL-2011'
);
insert into promo_usage(promo_code_id,customer_id,promo_code,is_applied,is_used,applied_at,created_at)
values (
    (
        select promo_code_id
        from promo_code
        where promo_code_number = 'k$$D6t^F1agnDSAMpu'
    ),
    (
        select customer_id
        from customer
        where login_at = '12-MAY-2020'
    ),
    'k$$D6t^F1agnDSAMpu','0','1',null,'18-MAR-2010'
);
insert into promo_usage(promo_code_id,customer_id,promo_code,is_applied,is_used,applied_at,created_at)
values (
    (
        select promo_code_id
        from promo_code
        where promo_code_number = 'br1&oxW7RMvzr5MMzd'
    ),
    (
        select customer_id
        from customer
        where login_at = '03-SEP-2020'
    ),
    'br1&oxW7RMvzr5MMzd','1','0','15-JAN-2021','15-JAN-2021'
);
insert into promo_usage(promo_code_id,customer_id,promo_code,is_applied,is_used,applied_at,created_at)
values (
    (
        select promo_code_id
        from promo_code
        where promo_code_number = 'xQtp!ptS%eS65h@gaI'
    ),
    (
        select customer_id
        from customer
        where login_at = '03-SEP-2020'
    ),
    'xQtp!ptS%eS65h@gaI','1','0','11-JUL-2011','11-JUL-2011'
);


-- Create Table Top Up Method 
create table top_up_method (
    top_up_method_id number,
    top_up_method_name varchar2(30) not null,
    details varchar2(255),
    created_at date,
    Constraint pk_top_up_method_id primary key (top_up_method_id)
);


-- Create Top Up Method Trigger
create or replace trigger TOP_UP_METHOD_PK_TRIGGER
    before insert or update on top_up_method
    for each row
begin
    if inserting and :new.top_up_method_id is null then
        :new.top_up_method_id := to_number(sys_guid(),'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
    end if;
end;
/


-- Add Data to Top Up Method 
insert into top_up_method (top_up_method_name,details,created_at) values ('Driver','Pengguna meminta driver untuk mengisi saldo e-money. Bebas biaya admin!','24-MAR-2020');
insert into top_up_method (top_up_method_name,details,created_at) values ('Minimarket','Pengguna dapat mengisi saldo e-money di minimarket terdekat.','28-MAR-2020');
insert into top_up_method (top_up_method_name,details,created_at) values ('Mobile Banking','Pengguna dapat mengisi saldo e-money kapan pun, di mana pun lewat aplikasi hp nya.','30-APR-2020');
insert into top_up_method (top_up_method_name,details,created_at) values ('Internet Banking','Pengguna dapat mengisi saldo e-money kapan pun, di mana pun lewat PC, laptop, tablet atau hp nya.','01-APR-2020');
insert into top_up_method (top_up_method_name,details,created_at) values ('ATM','Pengguna dapat mengisi saldo e-money lewat ATM terdekat','15-JUN-2020');


-- Create Table Top Up 
create table top_up (
    top_up_id number,
    top_up_method_id number not null,
    emoney_id number not null,
    amount number(*,0) not null,
    top_up_time date,
    Constraint pk_top_up_id primary key (top_up_id),
    Constraint fk_top_up_method_id foreign key(top_up_method_id) references top_up_method(top_up_method_id),
    Constraint fk_top_up_emoney_id foreign key(emoney_id) references emoney(emoney_id)
);


-- Create Top Up Trigger
create or replace trigger TOP_UP_PK_TRIGGER
    before insert or update on top_up
    for each row
begin
    if inserting and :new.top_up_id is null then
        :new.top_up_id := to_number(sys_guid(),'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
    end if;
end;
/


-- Add Data to Top Up
insert into top_up(top_up_method_id,emoney_id,amount,top_up_time) values (
    (
        select top_up_method_id
        from top_up_method
        where top_up_method_name = 'Minimarket'
    ), 
    (
        select emoney_id
        from emoney
        where phone_number = '081322566543'
    ),
    250000,'12-FEB-2021'
);
insert into top_up(top_up_method_id,emoney_id,amount,top_up_time) values (
    (
        select top_up_method_id
        from top_up_method
        where top_up_method_name = 'ATM'
    ), 
    (
        select emoney_id
        from emoney
        where phone_number = '081322566543'
    ),
    350000,'13-FEB-2021'
);
insert into top_up(top_up_method_id,emoney_id,amount,top_up_time) values (
    (
        select top_up_method_id
        from top_up_method
        where top_up_method_name = 'Mobile Banking'
    ), 
    (
        select emoney_id
        from emoney
        where phone_number = '082362385634'
    ),
    50000,'12-MAR-2021'
);
insert into top_up(top_up_method_id,emoney_id,amount,top_up_time) values (
    (
        select top_up_method_id
        from top_up_method
        where top_up_method_name = 'Internet Banking'
    ), 
    (
        select emoney_id
        from emoney
        where phone_number = '082362385634'
    ),
    100000,'20-MAR-2021'
);
insert into top_up(top_up_method_id,emoney_id,amount,top_up_time) values (
    (
        select top_up_method_id
        from top_up_method
        where top_up_method_name = 'Driver'
    ), 
    (
        select emoney_id
        from emoney
        where phone_number = '082362385634'
    ),
    20000,'21-MAR-2021'
);


-- Create Table Emoney History 
create table emoney_history (
    emoney_history_id number,
    emoney_id number not null,
    payment_time date,
    payment_name varchar2(255),
    payment_type varchar2(30),
    amount number(*,0) not null,
    Constraint pk_emoney_history_id primary key (emoney_history_id),
    Constraint fk_history_emoney_id foreign key(emoney_id) references emoney(emoney_id)
);


-- Create Emoney History Trigger
create or replace trigger EMONEY_HISTORY_PK_TRIGGER
    before insert or update on emoney_history
    for each row
begin
    if inserting and :new.emoney_history_id is null then
        :new.emoney_history_id := to_number(sys_guid(),'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
    end if;
end;
/


-- Add Data to Emoney History
insert into emoney_history(emoney_id,payment_time,payment_name,payment_type,amount) values (
    (
        select emoney_id
        from emoney
        where phone_number = '081322566543'
    ),
    '20-JUN-2021','Pembayaran pengiriman paket biasa dari Jakarta ke Bandung','Barang Biasa',12000
);
insert into emoney_history(emoney_id,payment_time,payment_name,payment_type,amount) values (
    (
        select emoney_id
        from emoney
        where phone_number = '081322566543'
    ),
    '21-JUN-2021','Pembayaran pengiriman paket biasa dari Jakarta ke Surabaya','Barang Biasa',20000
);
insert into emoney_history(emoney_id,payment_time,payment_name,payment_type,amount) values (
    (
        select emoney_id
        from emoney
        where phone_number = '082362385634'
    ),
    '19-APR-2021','Pembayaran pengiriman paket mudah pecah dari Padang ke Bengkulu','Barang MUdah Pecah',11000
);
insert into emoney_history(emoney_id,payment_time,payment_name,payment_type,amount) values (
    (
        select emoney_id
        from emoney
        where phone_number = '082362385634'
    ),
    '30-MAY-2021','Pembayaran pengiriman paket Berharga dari Semarang ke Solo','Barang Berharga',10000
);


-- Create Table Card
create table card(
    card_id number,
    customer_id number not null,
    card_number char(16) not null,
    cvv char(3) not null,
    expired_date number(4,0) not null,
    bank_name varchar2(20) not null,
    card_type varchar2(12) not null,
    created_at date,
    Constraint pk_card_id primary key (card_id),
    Constraint fk_card_customer_id foreign key (customer_id) references customer(customer_id)
);


-- Create Trigger Card Trigger
create or replace trigger CARD_PK_TRIGGER
    before insert or update on card
    for each row
begin
    if inserting and :new.card_id is null then
        :new.card_id := to_number(sys_guid(),'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
    end if;
end;
/


-- Add Data to Card 
insert into card (customer_id,card_number,cvv,expired_date,bank_name,card_type,created_at)
values (
    (
        select customer_id
        from customer
        where login_at = '12-MAY-2020'
    ),
    '2283764140247862','861',2029,'BCA','Kartu Kredit','23-APR-2021'
);
insert into card (customer_id,card_number,cvv,expired_date,bank_name,card_type,created_at)
values (
    (
        select customer_id
        from customer
        where login_at = '12-MAY-2020'
    ),
    '2494625437456224','996',2022,'BNI','Kartu Debit','22-APR-2021'
);
insert into card (customer_id,card_number,cvv,expired_date,bank_name,card_type,created_at)
values (
    (
        select customer_id
        from customer
        where login_at = '03-SEP-2020'
    ),
    '4860342358022629','972',2027,'Mandiri','Kartu Debit','30-APR-2021'
);
insert into card (customer_id,card_number,cvv,expired_date,bank_name,card_type,created_at)
values (
    (
        select customer_id
        from customer
        where login_at = '03-SEP-2020'
    ),
    '2342566258334765','269',2022,'BNI Syariah','Kartu Kredit','11-FEB-2021'
);


-- Create Table Trip 
create table trip (
    trip_id number,
    customer_id number not null,
    driver_id number not null,
    payment_method_id number not null,
    promo_code_id number,
    service_id number not null,
    user_request_time TIMESTAMP(0),
    trip_start_time TIMESTAMP(0),
    trip_accept_time TIMESTAMP(0),
    trip_end_time TIMESTAMP(0),
    expected_rates number(*,0),
    expected_distance number,
    expected_duration number,
    total_dintance_km number,
    total_distance_mile number,
    total_duration number,
    total_rates number(*,0),
    start_location varchar2(255),
    end_location varchar2(255),
    driver_remarks varchar2(255),
    driver_rating number(3,0),
    truck_choice char(10) not null,
    Constraint pk_trip_id primary key (trip_id),
    Constraint fk_trip_customer_id foreign key (customer_id) references customer(customer_id),
    Constraint fk_trip_driver_id foreign key (driver_id) references driver(driver_id),
    Constraint fk_trip_payment_method_id foreign key (payment_method_id) references payment_method(payment_method_id),
    Constraint fk_trip_promo_code_id foreign key (promo_code_id) references promo_code(promo_code_id),
    Constraint fk_trip_service_id foreign key (service_id) references service(service_id)
);


-- Create Trip Trigger
create or replace trigger TRIP_PK_TRIGGER
    before insert or update on trip
    for each row
begin
    if inserting and :new.trip_id is null then
        :new.trip_id := to_number(sys_guid(),'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
    end if;
end;
/


-- Add Data to Trip
insert into trip (customer_id,driver_id,payment_method_id,promo_code_id,service_id,user_request_time,trip_start_time,trip_accept_time,trip_end_time,expected_rates,expected_distance,expected_duration,total_dintance_km,total_distance_mile,total_duration,total_rates,start_location,end_location,driver_remarks,driver_rating,truck_choice)
values (
    (
        select customer_id
        from customer
        where login_at = '12-MAY-2020'
    ), (
        select driver_id
        from driver
        where login_at = '19-APR-19'
    ), (
        select payment_method_id
        from payment_method
        where method = 'Tunai'
    ), (
        select promo_code_id
        from promo_code
        where promo_code_number = 'k$$D6t^F1agnDSAMpu'
    ), (
        select service_id
        from service
        where service_name = 'Ekonomi'
    ), TIMESTAMP '2021-04-11 9:15:43', TIMESTAMP '2021-04-11 10:10:13', TIMESTAMP '2021-04-11 9:16:20', TIMESTAMP '2021-04-19 6:00:22',24000,12000,691200,12345,7.6708274,701200,20400,'Ds Jurangmanggu Brt 58, Dki Jakarta','Jl Bahagia Permai Raya 29, Jawa Barat','Paket sampai dengan selamat.',88,'engkel_box'
);
insert into trip (customer_id,driver_id,payment_method_id,promo_code_id,service_id,user_request_time,trip_start_time,trip_accept_time,trip_end_time,expected_rates,expected_distance,expected_duration,total_dintance_km,total_distance_mile,total_duration,total_rates,start_location,end_location,driver_remarks,driver_rating,truck_choice)
values (
    (
        select customer_id
        from customer
        where login_at = '12-MAY-2020'
    ), (
        select driver_id
        from driver
        where login_at = '11-APR-20'
    ), (
        select payment_method_id
        from payment_method
        where method = 'E-money'
    ), (
        select promo_code_id
        from promo_code
        where promo_code_number = 'xQtp!ptS%eS65h@gaI'
    ), (
        select service_id
        from service
        where service_name = 'Express'
    ), TIMESTAMP '2021-05-09 08:00:55', TIMESTAMP '2021-05-09 10:01:00', TIMESTAMP '2021-05-09 08:02:45', TIMESTAMP '2021-05-09 21:11:09',40000,10000,39600,11089,6890.3852,40123,0,'JL Jend. A.Yani, Bekasi','Jl Hayam Wuruk Harco Glodok Baru Bl D Lt 3/130,Mangga Besar','Driver baik.',79,'engkel_bak'
);
insert into trip (customer_id,driver_id,payment_method_id,promo_code_id,service_id,user_request_time,trip_start_time,trip_accept_time,trip_end_time,expected_rates,expected_distance,expected_duration,total_dintance_km,total_distance_mile,total_duration,total_rates,start_location,end_location,driver_remarks,driver_rating,truck_choice)
values (
    (
        select customer_id
        from customer
        where login_at = '03-SEP-2020'
    ), (
        select driver_id
        from driver
        where login_at = '19-APR-19'
    ), (
        select payment_method_id
        from payment_method
        where method = 'Kartu Debit'
    ), null, (
        select service_id
        from service
        where service_name = 'REG (Reguler)'
    ), TIMESTAMP '2021-11-01 11:23:11', TIMESTAMP '2021-11-01 12:04:12', TIMESTAMP '2021-11-01 11:28:22', TIMESTAMP '2021-11-03 16:44:00',87000,29000,259200,30324,18.84246,265432,87000,'Jl Songoyudan 72,Nyamplungan','Jl Pandean 10-B,Pandean','Performa pelayanan yang cukup.',74,'pickup_bak'
);
insert into trip (customer_id,driver_id,payment_method_id,promo_code_id,service_id,user_request_time,trip_start_time,trip_accept_time,trip_end_time,expected_rates,expected_distance,expected_duration,total_dintance_km,total_distance_mile,total_duration,total_rates,start_location,end_location,driver_remarks,driver_rating,truck_choice)
values (
    (
        select customer_id
        from customer
        where login_at = '03-SEP-2020'
    ), (
        select driver_id
        from driver
        where login_at = '11-APR-20'
    ), (
        select payment_method_id
        from payment_method
        where method = 'Kartu Kredit'
    ), (
        select promo_code_id
        from promo_code
        where promo_code_number = 'br1&oxW7RMvzr5MMzd'
    ), (
        select service_id
        from service
        where service_name = 'Super Express'
    ), TIMESTAMP '2021-06-09 15:45:33', TIMESTAMP '2021-06-09 16:05:22', TIMESTAMP '2021-06-09 15:46:44', TIMESTAMP '2021-06-09 17:45:22',25000,5000,7200,5346,3.32185,7624,22500,'Jl Ampera Raya Kampus IIP, Dki Jakarta','Wisma Kusuma Indah VII 29-B,Jati Rahayu','Drive ramah dan amanah.',95,'pickup_box'
);
insert into trip (customer_id,driver_id,payment_method_id,promo_code_id,service_id,user_request_time,trip_start_time,trip_accept_time,trip_end_time,expected_rates,expected_distance,expected_duration,total_dintance_km,total_distance_mile,total_duration,total_rates,start_location,end_location,driver_remarks,driver_rating,truck_choice)
values (
    (
        select customer_id
        from customer
        where login_at = '03-SEP-2020'
    ), (
        select driver_id
        from driver
        where login_at = '11-APR-20'
    ), (
        select payment_method_id
        from payment_method
        where method = 'Kartu Kredit'
    ),null, (
        select service_id
        from service
        where service_name = 'Super Express'
    ), TIMESTAMP '2021-06-09 15:45:33', null, TIMESTAMP '2021-06-09 15:46:44', null,25000,5000,7200,null,null,null,null,'Jl Ampera Raya Kampus IIP, Dki Jakarta','Wisma Kusuma Indah VII 29-B,Jati Rahayu',null,null,'pickup_box'
);
insert into trip (customer_id,driver_id,payment_method_id,promo_code_id,service_id,user_request_time,trip_start_time,trip_accept_time,trip_end_time,expected_rates,expected_distance,expected_duration,total_dintance_km,total_distance_mile,total_duration,total_rates,start_location,end_location,driver_remarks,driver_rating,truck_choice)
values (
    (
        select customer_id
        from customer
        where login_at = '12-MAY-2020'
    ), (
        select driver_id
        from driver
        where login_at = '11-APR-20'
    ), (
        select payment_method_id
        from payment_method
        where method = 'E-money'
    ), (
        select promo_code_id
        from promo_code
        where promo_code_number = 'xQtp!ptS%eS65h@gaI'
    ), (
        select service_id
        from service
        where service_name = 'Express'
    ), TIMESTAMP '2021-05-09 08:00:55',null, TIMESTAMP '2021-05-09 08:02:45', null,40000,10000,39600,null,null,null,null,'JL Jend. A.Yani, Bekasi','Jl Hayam Wuruk Harco Glodok Baru Bl D Lt 3/130,Mangga Besar',null,null,'engkel_bak'
);


-- Create Table Canceled Reason
create table canceled_reason(
    canceled_reason_id number,
    trip_id number not null,
    cancelation_title varchar2(100) not null,
    cancelation_details varchar2(255),
    Constraint pk_canceled_reason_id primary key (canceled_reason_id),
    Constraint fk_canceled_reason_trip_id foreign key (trip_id) references trip(trip_id)
);


-- Create Canceled Reason Trigger
create or replace trigger CANCELED_REASON_PK_TRIGGER
    before insert or update on canceled_reason
    for each row
begin
    if inserting and :new.canceled_reason_id is null then
        :new.canceled_reason_id := to_number(sys_guid(),'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
    end if;
end;
/


-- Add Data to Canceled Reason
insert into canceled_reason(trip_id,cancelation_title,cancelation_details) values (
    (
        select trip_id
        from trip
        where trip_end_time is null and truck_choice = 'engkel_bak'
    ),
    'Harga terlalu mahal','Maaf, saya harus membatalkan pemesanannya karena harga nya terlalu mahal bagi saya.'
);
insert into canceled_reason(trip_id,cancelation_title,cancelation_details) values (
    (
        select trip_id
        from trip
        where trip_end_time is null and truck_choice = 'pickup_box'
    ),
    'Waktu pengiriman terlalu lama','Maaf, saya harus membatalkan pemesanannya karena estimasi waktu pengiriman terlalu lama bagi saya.'
);


-- Create Table Item 
create table item (
    item_id number,
    trip_id number not null,
    truck_id number not null,
    item_type_id number not null,
    item_name varchar2(100) not null,
    weight number,
    description varchar2(255),
    dimension varchar2(50),
    Constraint pk_item_id primary key (item_id),
    Constraint fk_item_trip_id foreign key (trip_id) references trip(trip_id),
    Constraint fk_item_truck_id foreign key (truck_id) references truck(truck_id),
    Constraint fk_item_type_id foreign key (item_type_id) references item_type(item_type_id)
);


-- Create Item Trigger
create or replace trigger ITEM_PK_TRIGGER
    before insert or update on item
    for each row
begin
    if inserting and :new.item_id is null then
        :new.item_id := to_number(sys_guid(),'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
    end if;
end;
/


-- Add Data to Item 
insert into item (trip_id,truck_id,item_type_id,item_name,weight,description,dimension) values (
    (
        select trip_id
        from trip
        where total_duration = 7624
    ), (
        select truck_id
        from truck
        where plat_number = 'B1042PJ'
    ), (
        select item_type_id
        from item_type
        where type = 'barang_mudah_pecah'
    ),
    'Piring kaca',2300,'Beberapa piring yang terbuat dari kaca yang mudah pecah yang bernilai tinggi','25–30cm'
);
insert into item (trip_id,truck_id,item_type_id,item_name,weight,description,dimension) values (
    (
        select trip_id
        from trip
        where total_duration = 7624
    ), (
        select truck_id
        from truck
        where plat_number = 'B1042PJ'
    ), (
        select item_type_id
        from item_type
        where type = 'barang_berat'
    ),
    '1000 batu bata',4500000,'1000 batu bata merah yang sangat berat yang berkisar 4,5 ton','225mm x 112.5mm x 75mm'
);
insert into item (trip_id,truck_id,item_type_id,item_name,weight,description,dimension) values (
    (
        select trip_id
        from trip
        where total_duration = 7624
    ), (
        select truck_id
        from truck
        where plat_number = 'B1042PJ'
    ), (
        select item_type_id
        from item_type
        where type = 'barang_biasa'
    ),
    'Buku',7,'Sebuah buku biasa yang tidak berat dan berharga','12.70 × 20.32cm'
);
insert into item (trip_id,truck_id,item_type_id,item_name,weight,description,dimension) values (
    (
        select trip_id
        from trip
        where total_duration = 265432
    ), (
        select truck_id
        from truck
        where plat_number = 'L1996YZ'
    ), (
        select item_type_id
        from item_type
        where type = 'barang_berat'
    ),
    '50kg besi',50000,'Pemberat yang terbuat dari besi seberat kurang lebih 50kg','250 x 200 x 150cm'
);
insert into item (trip_id,truck_id,item_type_id,item_name,weight,description,dimension) values (
    (
        select trip_id
        from trip
        where total_duration = 265432
    ), (
        select truck_id
        from truck
        where plat_number = 'L1996YZ'
    ), (
        select item_type_id
        from item_type
        where type = 'barang_berharga'
    ),
    'Emas 1kg',1000,'Emas batangan murni seberat kurang lebih 1kg','112 x 52mm'
);
