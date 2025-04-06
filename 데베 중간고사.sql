drop database db3;
create database db3;
use db3;

create table company(
company_name varchar(15) primary key,
location varchar(4),
num_employee int);

create table contact(
contact_ID varchar(2) primary key,
international_plan varchar(3),
voice_mail_plan varchar(3));

create table customer(
area_code varchar(3),
phone_number varchar(9),
name varchar(10),
contact_ID varchar(2),
company_name varchar(15),
age int,
salary numeric(7,2),
primary key(area_code,phone_number),
foreign key (contact_ID) references contact(contact_ID) on delete cascade on update cascade,
foreign key (company_name) references company(company_name) on delete cascade on update cascade);

create table monthlyusage(
area_code varchar(3),
phone_number varchar(9),
month varchar(3),
call_min numeric(4,1),
voice_mail_count int,
international_call_min numeric(3,1),
primary key(area_code,phone_number,month),
foreign key (area_code,phone_number) references customer(area_code,phone_number));




insert into company values ('Coupang','서울',1000);
insert into company values ('Hyundai Motor','울산',20000);
insert into company values ('Kakao','경기',5000);
insert into company values ('Kakao Bank','서울',100);
insert into company values ('naver','경기',7000);
insert into company values ('SK','서울',10000);

insert into contact values ('C1','미가입','미가입');
insert into contact values ('C2','가입','가입');
insert into contact values ('C3','가입','가입');
insert into contact values ('C4','미가입','미가입');
insert into contact values ('C5','미가입','미가입');
insert into contact values ('C6','가입','미가입');
insert into contact values ('C7','가입','가입');
insert into contact values ('C8','미가입','미가입');
insert into contact values ('C9','미가입','가입');

insert into customer values ('02','1111-1111','Srinivasan','C1','SK',40,65000);
insert into customer values ('02','1111-1112','Wu','C2','SK',35,90000);
insert into customer values ('02','1111-1113','Gold','C3','Coupang',51,87000);
insert into customer values ('02','1111-1114','Katz','C4','Coupang',20,75000);
insert into customer values ('031','2222-1111','Mozart','C5','Kakao',26,40000);
insert into customer values ('031','2222-1112','Einstein','C6','Kakao',42,95000);
insert into customer values ('031','2222-1113','El Said','C7','naver',45,60000);
insert into customer values ('052','3333-1111','Califieri','C8','Hyundai Motor',28,62000);
insert into customer values ('052','3333-1112','Singh','C9','Hyundai Motor',34,null);


insert into monthlyusage values ('02','1111-1111','10월',161.6,26,3);
insert into monthlyusage values ('02','1111-1111','9월',265.1,25,3);
insert into monthlyusage values ('02','1111-1112','10월',299.4,0,7);
insert into monthlyusage values ('02','1111-1112','9월',243.4,0,5);
insert into monthlyusage values ('02','1111-1113','10월',157,0,6);
insert into monthlyusage values ('02','1111-1113','9월',218.2,24,7);
insert into monthlyusage values ('02','1111-1114','10월',224.4,0,2);
insert into monthlyusage values ('02','1111-1114','9월',189.7,33,5);
insert into monthlyusage values ('031','2222-1111','10월',81.1,0,2);
insert into monthlyusage values ('031','2222-1111','9월',183,0,19);
insert into monthlyusage values ('031','2222-1112','10월',101.6,26,3);
insert into monthlyusage values ('031','2222-1112','9월',124.3,0,5);
insert into monthlyusage values ('031','2222-1113','10월',134.3,0,4);
insert into monthlyusage values ('031','2222-1113','9월',265.1,5,3);
insert into monthlyusage values ('052','3333-1111','9월',65.1,25,3);


select * from company;
select * from contact;
select * from customer;
select * from monthlyusage;


select company_name,location from company where num_employee>3000;

select name from customer where salary is null;

select name,age from customer where company_name like 'Ka%' order by age desc;

select name,area_code,phone_number,salary from customer,contact where customer.contact_ID=contact.contact_ID and salary>=80000 and international_plan='가입';

select name, area_code,phone_number,salary from customer natural join contact where international_plan='가입' and salary>=80000;

select name, area_code,phone_number from customer natural join company natural join contact where voice_mail_plan='가입' and num_employee>=10000;

select area_code,phone_number,sum(call_min),sum(international_call_min) from customer natural join monthlyusage group by area_code,phone_number;

select area_code,phone_number,sum(call_min),sum(international_call_min) from customer natural join monthlyusage group by area_code, phone_number having sum(call_min)>=400;

select * from (select area_code,phone_number,sum(call_min),sum(international_call_min) from customer natural join monthlyusage group by area_code, phone_number) as A where A.sum(call_min)>=400;

select company_name,location,(select count(*) from Customer,company where company.company_name=customer.company_name) as num_emp, (select count('가입') from customer,contact where Contact.contact_ID=customer.contact_ID) as num_int_plan from company natural join contact natural join customer group by company_name,location;

select company_name,area_code,phone_number,name from Company left outer join customer on company.company_name=customer.company_name;

create view customer_plan as
select area_code,phone_number,name,contact_ID,international_plan,voice_mail_plan
from customer natural join contact
where international_plan='미가입' and voice_mail_plan='미가입';

update customer set area_code='031' where name='Srinivasan' 
// monthlyusage relation이 customer relation의 area_code 속성을 foreign key로 참조하고 있기 때문에 바꾸지 못한다.

update company set company_name='Kakao mobile' where company_name='Kakao';
//customer 테이블에 update,delete cascade action을 추가했기 때문에 company_name을 바꾸거나 삭제해도 다른 참조하는것까지 똑같이 바뀌거나 삭제된다. 


