
select *
from Customer natural join Orders;

select name, saleprice
from Customer natural join Orders;

Select name, bookname
from Customer natural join Orders natural join Book;

Select name, bookname
from Customer natural join Orders natural join Book
where saleprice=20000;

select name, phone
from Customer natural join Orders natural join Book
where bookname=“야구를 부탁해”;

select bookname, publisher,price
from Customer natural join Orders natural join Book
where name=“박지성”;

select bookname, publisher, price
from Customer natural join Book natural join Orders
where name=“박지성” or name=“장미란”

select *
from Customer natural join Orders
order by custid;

select bookname, publisher
from Book
where bookname like “%축구%”;

select bookname, publisher
from Book
where bookname like “%축구%”;

select *
from Book
where publisher=“굿스포츠” or publisher=“대한미디어”;

select *
from Book
order by bookname;

select *
from Book
order by price desc;

select bookname, name, address
from Book natural join Customer natural join Orders
order by bookname desc;

select name, address, bookname
from Book natural join Customer natural join Orders
where publisher=“이상미디어” or publisher=“대한미디어”
order by bookname desc;

select bookname,price,publisher
from Book
where publisher="이상미디어" 
union
select bookname, price,publisher
from Book
where publisher="대한미디어";

Select *
from Book
where publisher=“이상미디어”
union
select *
from Book
where publisher=“굿스포츠”;

select bookid
from Orders
where custid=“2”
intersect
select bookid
from Orders
where custid=“3";

select bookid
from Orders
where custid=“2”
except 
select bookid
from Orders
where custid=“3”;

select bookid, bookname
from Book natural join Orders
where custid=“2”
except
select bookid, bookname
from Book natural join Orders
where custid=“3”;

