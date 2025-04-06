-- 고객과 주문 테이블을 자연 조인하여 전체 데이터 조회
SELECT *
FROM customer NATURAL JOIN orders;

-- 고객 이름과 판매 가격만 조회
SELECT name, saleprice
FROM customer NATURAL JOIN orders;

-- 고객 이름과 도서 이름 조회 (Book 테이블 포함)
SELECT name, bookname
FROM customer NATURAL JOIN orders NATURAL JOIN book;

-- 판매가가 20000원인 도서의 고객 이름과 도서 이름 조회
SELECT name, bookname
FROM customer NATURAL JOIN orders NATURAL JOIN book
WHERE saleprice = 20000;

-- 도서명이 '야구를 부탁해'인 책을 구매한 고객의 이름과 전화번호 조회
SELECT name, phone
FROM customer NATURAL JOIN orders NATURAL JOIN book
WHERE bookname = '야구를 부탁해';

-- 고객 '박지성'이 주문한 도서 정보 조회
SELECT bookname, publisher, price
FROM customer NATURAL JOIN orders NATURAL JOIN book
WHERE name = '박지성';

-- 고객 '박지성' 또는 '장미란'이 주문한 도서 정보 조회
SELECT bookname, publisher, price
FROM customer NATURAL JOIN orders NATURAL JOIN book
WHERE name = '박지성' OR name = '장미란';

-- 고객과 주문 정보를 고객 ID 기준으로 정렬
SELECT *
FROM customer NATURAL JOIN orders
ORDER BY custid;

-- 도서 제목에 '축구'가 포함된 도서의 제목과 출판사 조회
SELECT bookname, publisher
FROM book
WHERE bookname LIKE '%축구%';

-- 출판사가 '굿스포츠' 또는 '대한미디어'인 도서 전체 조회
SELECT *
FROM book
WHERE publisher = '굿스포츠' OR publisher = '대한미디어';

-- 도서를 이름 기준 오름차순 정렬
SELECT *
FROM book
ORDER BY bookname;

-- 도서를 가격 기준 내림차순 정렬
SELECT *
FROM book
ORDER BY price DESC;

-- 고객이 주문한 도서의 제목, 고객 이름, 주소를 도서 제목 기준 내림차순 정렬
SELECT bookname, name, address
FROM book NATURAL JOIN customer NATURAL JOIN orders
ORDER BY bookname DESC;

-- 출판사가 '이상미디어' 또는 '대한미디어'인 도서를 주문한 고객의 이름, 주소, 도서 이름 조회
SELECT name, address, bookname
FROM book NATURAL JOIN customer NATURAL JOIN orders
WHERE publisher = '이상미디어' OR publisher = '대한미디어'
ORDER BY bookname DESC;

-- 출판사가 '이상미디어' 또는 '대한미디어'인 도서 제목, 가격, 출판사 정보 조회 (중복 제거)
SELECT bookname, price, publisher
FROM book
WHERE publisher = '이상미디어'
UNION
SELECT bookname, price, publisher
FROM book
WHERE publisher = '대한미디어';

-- 출판사가 '이상미디어' 또는 '굿스포츠'인 도서 전체 조회 (중복 제거)
SELECT *
FROM book
WHERE publisher = '이상미디어'
UNION
SELECT *
FROM book
WHERE publisher = '굿스포츠';

-- 고객 2번과 고객 3번이 모두 구매한 도서 ID 조회 (공통 도서)
SELECT bookid
FROM orders
WHERE custid = 2
INTERSECT
SELECT bookid
FROM orders
WHERE custid = 3;

-- 고객 2번이 구매했지만 고객 3번은 구매하지 않은 도서 ID 조회
SELECT bookid
FROM orders
WHERE custid = 2
EXCEPT
SELECT bookid
FROM orders
WHERE custid = 3;

-- 고객 2번이 구매했지만 고객 3번은 구매하지 않은 도서 ID 및 도서명 조회
SELECT bookid, bookname
FROM book NATURAL JOIN orders
WHERE custid = 2
EXCEPT
SELECT bookid, bookname
FROM book NATURAL JOIN orders
WHERE custid = 3;
