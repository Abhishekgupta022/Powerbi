create database hsptlms;

create table patient(p_id bigint  primary key   , p_fname varchar(20) not null,
p_lname varchar(20), 
p_age int not null,
p_gender varchar(1) not null,
p_symptoms varchar(75),
p_add varchar(50) ,
p_pin bigint not null, 
p_country varchar(15),
p_cont bigint not null  ,
p_mail varchar(75));
-- ---------------------------------------------------------
create table doctor(d_id bigint primary key , d_fname varchar(20) , d_lname varchar(20) ,
d_field varchar(50) not null, d_age int , d_gender varchar(1)
,d_cont bigint not null , d_mail varchar(75),p_id bigint,
foreign key(p_id) references patient(p_id) on delete set null);
-- ---------------------------------------------------------------
create table appointment(appt_id int primary key , p_id bigint , appt_date date, appt_time time ,d_id bigint,
foreign key(p_id) references patient(p_id) on delete set null ,
foreign key(d_id) references doctor(d_id) on delete set null);

-- --------------------------------------------------------------------------
create table testprice(test_code  varchar(5) primary key , test_price int ); 

-- ---------------------------------------------------------------------------
create table lab(labno int primary key , p_id bigint , test_code varchar(5), p_height_cm int, p_weight_kg int,
 p_lab_date date, p_bp int not null , p_blood_grp varchar(5), 
 foreign key(p_id) references patient(p_id)   on delete set null ,
 foreign key (test_code) references testprice(test_code) on delete set null 
  );
  select * from lab;

-- ----------------------------------------------------
create table patient_report(report_id int primary key , p_id bigint,
diagnose varchar(140),
foreign key(p_id) references patient(p_id) on delete set null );
-- ---------------------
create table medicine(med_id bigint primary key, med_name varchar(150), 
med_type varchar(150),med_descrip varchar(150), med_price int);
-- ---------------------------------------------------------
create table prescribed_med(presc_med_id int primary key , p_id bigint ,
med_id bigint ,meda_id bigint,medb_id bigint,medc_id bigint,medd_id bigint  , report_id int,
foreign key (p_id) references patient(p_id) on delete set null ,
 foreign key (report_id) references patient_report(report_id)on delete set null);
 -- --------------BOUNDARY---------------------BOUNDARY---------------------BOUNDARY-------------------------
create table hospital(hospital_id int primary key , hospital_name varchar(120),hospital_add varchar(175), 
hospital_code bigint, hospital_phone bigint, hospital_country varchar(25));
 -- --------------BOUNDARY---------------------BOUNDARY---------------------BOUNDARY-------------------------
create table room(room_no int primary key, room_type varchar(6),p_id bigint , 
hospital_id int, room_status varchar(20),
foreign key (p_id) references patient(p_id) on delete set null ,
foreign key (hospital_id) references hospital(hospital_id) on delete set null );
 -- --------------BOUNDARY---------------------BOUNDARY---------------------BOUNDARY-------------------------
create table insurance(ins_no bigint primary key, p_id bigint ,insurance_company varchar(25),
 publish_date date, exp_date date,insurance_plan varchar(50),entry_fee int,cover_pay int,
cover_insurance int,medicine_cover int,
foreign key (p_id) references patient(p_id) on delete set null);

 -- --------------BOUNDARY---------------------BOUNDARY---------------------BOUNDARY-------------------------
create table bill(bill_no bigint primary key , p_id bigint, doc_charges int,
medicine_charge int , room_charge int , operation_charge bigint ,
nurse_charge int , lab_charge int , adv_charge int , ins_no bigint,
foreign key (p_id) references patient(p_id) on delete set null ,
foreign key (ins_no) references insurance(ins_no) on delete set null);

select * from bill;
