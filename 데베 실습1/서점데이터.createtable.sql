-- 기존 데이터베이스 삭제 후 새로 생성
DROP DATABASE db1;
CREATE DATABASE db1;
USE db1;

-- 도서 테이블 생성
CREATE TABLE book (
    bookid VARCHAR(2),
    bookname VARCHAR(50),
    publisher VARCHAR(10),
    price NUMERIC(5,0),
    PRIMARY KEY (bookid)
);

-- 고객 테이블 생성
CREATE TABLE customer (
    custid VARCHAR(1),
    name VARCHAR(3),
    address VARCHAR(10),
    phone VARCHAR(13),
    PRIMARY KEY (custid)
);

-- 주문 테이블 생성
CREATE TABLE orders (
    orderid VARCHAR(2),
    custid VARCHAR(1),
    bookid VARCHAR(2),
    saleprice NUMERIC(5,0),
    orderdate VARCHAR(10),
    PRIMARY KEY (orderid),
    FOREIGN KEY (custid) REFERENCES customer (custid),
    FOREIGN KEY (bookid) REFERENCES book (bookid)
);

-- 도서 데이터 삽입
INSERT INTO book VALUES('1', '축구의 역사', '굿스포츠', 7000);
INSERT INTO book VALUES('2', '축구 아는 여자', '나무수', 13000);
INSERT INTO book VALUES('3', '축구의 이해', '대한미디어', 22000);
INSERT INTO book VALUES('4', '골프 바이블', '대한미디어', 35000);
INSERT INTO book VALUES('5', '피겨 교본', '굿스포츠', 8000);
INSERT INTO book VALUES('6', '역도 단계별기술', '굿스포츠', 6000);
INSERT INTO book VALUES('7', '야구의 추억', '이상미디어', 20000);
INSERT INTO book VALUES('8', '야구를 부탁해', '이상미디어', 13000);
INSERT INTO book VALUES('9', '올림픽 이야기', '삼성당', 7500);
INSERT INTO book VALUES('10', 'Olympic Champions', 'Pearson', 13000);

-- 고객 데이터 삽입
INSERT INTO customer VALUES('1', '박지성', '영국 맨체스타', '000-5000-0001');
INSERT INTO customer VALUES('2', '김연아', '대한민국 서울', '000-6000-0001');
INSERT INTO customer VALUES('3', '장미란', '대한민국 강원도', '000-7000-0001');
INSERT INTO customer VALUES('4', '추신수', '미국 클리블랜드', '000-8000-0001');
INSERT INTO customer VALUES('5', '박세리', '대한민국 대전', NULL);

-- 주문 데이터 삽입
INSERT INTO orders VALUES('1', '1', '1', 6000, '2013-07-01');
INSERT INTO orders VALUES('2', '1', '3', 21000, '2013-07-03');
INSERT INTO orders VALUES('3', '2', '5', 8000, '2013-07-03');
INSERT INTO orders VALUES('4', '3', '6', 6000, '2013-07-04');
INSERT INTO orders VALUES('5', '4', '7', 20000, '2013-07-05');
INSERT INTO orders VALUES('6', '1', '2', 12000, '2013-07-07');
INSERT INTO orders VALUES('7', '4', '8', 13000, '2013-07-07');
INSERT INTO orders VALUES('8', '3', '10', 12000, '2013-07-08');
INSERT INTO orders VALUES('9', '2', '10', 7000, '2013-07-09');
INSERT INTO orders VALUES('10', '3', '8', 13000, '2013-07-10');

-- 전체 테이블 조회
SELECT * FROM book;
SELECT * FROM customer;
SELECT * FROM orders;
