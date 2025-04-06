select custid, (select count(*) from Orders where Customer.custid=Orders.custid) as 도서수량, (select sum(saleprice) from Orders where Customer.custid=Orders.custid) as 총액
from Customer
group by custid;

insert into Book
values('11','스포츠의학','한솔의학서적',90000);

update customer
set address='대한민국 부산'
where custid='5';

update customer 
set address=(select address from Customer where name='김연아')
where name='박세리';

delete from Customer
where custid='5'

custid가 orders에서 reference되고 있기 때문에 삭제가 되지 않는다.

create table Orders(
orderid varchar (2),
custid varchar (1),
bookid varchar (2),
saleprice numeric (5,0),
orderdate varchar (10),
primary key (orderid),
foreign key (custid) references Customer (custid),
foreign key (bookid) references Book (bookid)
on delete cascade
on update cascade);

Delete from customer where name='박지성';

update Customer set custid=’12' where name='김연아';

Delete from Book where publisher='굿스포츠'

select * from customer left outer join orders on customer.custid=orders.custid;

select * from Customer right outer join orders on customer.custid=orders.custid;

select name,saleprice
from customer right outer join orders on customer.custid=orders.custid;
