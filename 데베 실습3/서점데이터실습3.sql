Select sum(saleprice) as 총매출
from Orders;

Select sum(saleprice) as 총매출
from Orders
where custid=2;

Select sum(saleprice) as total,avg(saleprice) as average,min(saleprice) as minimum,max(saleprice) as maximum
from Orders;

Select count(*)
from Orders;

Select custid,count(bookid) as 도서수량,sum(saleprice) as 총액
from Orders
group by custid;

Select name,count(bookid),sum(saleprice)
from Customer natural join Orders
group by name;

Select name,count(bookid) as 도서수량 ,sum(saleprice) as 총액
from Customer natural join Orders
group by name;

Select name, count(bookid) as 도서수량, sum(saleprice) as 총액
from Customer natural join Orders
group by name
order by 총액 desc;

Select publisher, name, count(bookid) as 도서수량
from Book natural join Customer natural join Orders
group by publisher,name;

Select custid, count(bookid) as 도서수량
from Orders
group by custid
having 도서수량>=2;

Select custid, count(bookid) as 도서수량
from Orders
where saleprice>=8000
group by custid
having 도서수량>=2;

Select name, count(bookid) as 도서수량
from Customer natural join Orders
where address like '%대한민국%'
group by name
having 도서수량>=3;

Select name, count(bookid) as 도서수량
from Customer natural join Orders
where address like '%대한민국%'
group by name
having 도서수량>=2;

Select bookname
from Book as A
where price>(select avg(price)
from Book as B
where A.publisher=B.publisher);

Select bookname
from Book
where price=(select max(price) from Book);

Select name
from Customer
where Customer.custid in (select custid from Orders);

Select name,address
from Customer as C
where exists(select * from Orders as O where C.custid=O.custid);


