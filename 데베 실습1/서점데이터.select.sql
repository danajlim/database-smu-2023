select book name, price 
from Book;

select * 
from Book;

select distinct publisher 
from Book;

select bookname 
from Book 
where price<20000;

select bookname 
from Book 
where price>=10000 and price<=20000;

select bookname 
from Book 
where publisher='이상미디어' and price<15000;

select bookname 
from Book 
where publisher='이상미디어' or publisher='대한미디어' and price<25000;

select address, phone
from Customer
where name='장미란';