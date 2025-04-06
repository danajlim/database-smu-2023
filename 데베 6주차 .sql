-- 고객별 주문한 도서 수량과 총액 조회
SELECT custid, 
       (SELECT COUNT(*) FROM Orders WHERE Customer.custid = Orders.custid) AS 도서수량,
       (SELECT SUM(saleprice) FROM Orders WHERE Customer.custid = Orders.custid) AS 총액
FROM Customer
GROUP BY custid;

-- 새로운 도서 등록
INSERT INTO Book
VALUES ('11', '스포츠의학', '한솔의학서적', 90000);

-- 고객 ID가 '5'인 고객의 주소를 '대한민국 부산'으로 변경
UPDATE Customer
SET address = '대한민국 부산'
WHERE custid = '5';

-- '박세리' 고객의 주소를 '김연아' 고객의 주소로 변경
UPDATE Customer 
SET address = (SELECT address FROM Customer WHERE name = '김연아')
WHERE name = '박세리';

-- 고객 ID가 '5'인 고객 삭제 시도 (Orders에서 참조 중이면 삭제 불가)
DELETE FROM Customer
WHERE custid = '5';

-- Orders 테이블 생성 (외래키 제약 조건 포함)
CREATE TABLE Orders (
    orderid    VARCHAR(2),
    custid     VARCHAR(1),
    bookid     VARCHAR(2),
    saleprice  NUMERIC(5,0),
    orderdate  VARCHAR(10),
    PRIMARY KEY (orderid),
    FOREIGN KEY (custid) REFERENCES Customer(custid),
    FOREIGN KEY (bookid) REFERENCES Book(bookid)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- 이름이 '박지성'인 고객 삭제
DELETE FROM Customer 
WHERE name = '박지성';

-- '김연아'의 custid를 '12'로 수정
UPDATE Customer 
SET custid = '12' 
WHERE name = '김연아';

-- 출판사가 '굿스포츠'인 도서 삭제
DELETE FROM Book 
WHERE publisher = '굿스포츠';

-- 고객과 주문 LEFT OUTER JOIN
SELECT * 
FROM Customer 
LEFT OUTER JOIN Orders 
ON Customer.custid = Orders.custid;

-- 고객과 주문 RIGHT OUTER JOIN
SELECT * 
FROM Customer 
RIGHT OUTER JOIN Orders 
ON Customer.custid = Orders.custid;

-- RIGHT OUTER JOIN 후 고객 이름과 판매가만 출력
SELECT name, saleprice
FROM Customer 
RIGHT OUTER JOIN Orders 
ON Customer.custid = Orders.custid;
