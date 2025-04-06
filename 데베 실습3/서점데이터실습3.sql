-- 전체 총매출 구하기
SELECT SUM(saleprice) AS 총매출
FROM orders;

-- 고객 ID가 2번인 고객의 총매출 구하기
SELECT SUM(saleprice) AS 총매출
FROM orders
WHERE custid = 2;

-- 전체 매출의 총합, 평균, 최저, 최고값 구하기
SELECT SUM(saleprice) AS total,
       AVG(saleprice) AS average,
       MIN(saleprice) AS minimum,
       MAX(saleprice) AS maximum
FROM orders;

-- 전체 주문 건수 구하기
SELECT COUNT(*)
FROM orders;

-- 고객별 도서 수량과 총매출 구하기
SELECT custid,
       COUNT(bookid) AS 도서수량,
       SUM(saleprice) AS 총액
FROM orders
GROUP BY custid;

-- 고객 이름별 도서 수량과 총매출 구하기 (Customer와 Orders 자연 조인)
SELECT name,
       COUNT(bookid),
       SUM(saleprice)
FROM customer NATURAL JOIN orders
GROUP BY name;

-- 고객 이름별 도서 수량과 총매출 구하기 (도서수량, 총액 컬럼명 명시)
SELECT name,
       COUNT(bookid) AS 도서수량,
       SUM(saleprice) AS 총액
FROM customer NATURAL JOIN orders
GROUP BY name;

-- 고객 이름별 도서 수량과 총매출을 총액 기준 내림차순 정렬
SELECT name,
       COUNT(bookid) AS 도서수량,
       SUM(saleprice) AS 총액
FROM customer NATURAL JOIN orders
GROUP BY name
ORDER BY 총액 DESC;

-- 출판사, 고객 이름별 도서 수량 구하기
SELECT publisher,
       name,
       COUNT(bookid) AS 도서수량
FROM book NATURAL JOIN customer NATURAL JOIN orders
GROUP BY publisher, name;

-- 도서 2권 이상 주문한 고객 ID와 수량 조회
SELECT custid,
       COUNT(bookid) AS 도서수량
FROM orders
GROUP BY custid
HAVING 도서수량 >= 2;

-- 8000원 이상 도서를 2권 이상 구매한 고객 조회
SELECT custid,
       COUNT(bookid) AS 도서수량
FROM orders
WHERE saleprice >= 8000
GROUP BY custid
HAVING 도서수량 >= 2;

-- 주소에 '대한민국'이 포함된 고객 중 도서 3권 이상 구매한 사람
SELECT name,
       COUNT(bookid) AS 도서수량
FROM customer NATURAL JOIN orders
WHERE address LIKE '%대한민국%'
GROUP BY name
HAVING 도서수량 >= 3;

-- 주소에 '대한민국'이 포함된 고객 중 도서 2권 이상 구매한 사람
SELECT name,
       COUNT(bookid) AS 도서수량
FROM customer NATURAL JOIN orders
WHERE address LIKE '%대한민국%'
GROUP BY name
HAVING 도서수량 >= 2;

-- 같은 출판사의 평균 가격보다 비싼 책의 이름 조회
SELECT bookname
FROM book AS a
WHERE price > (
    SELECT AVG(price)
    FROM book AS b
    WHERE a.publisher = b.publisher
);

-- 가장 비싼 책의 이름 조회
SELECT bookname
FROM book
WHERE price = (SELECT MAX(price) FROM book);

-- 주문한 적이 있는 고객 이름 조회 (서브쿼리 사용)
SELECT name
FROM customer
WHERE custid IN (SELECT custid FROM orders);

-- 주문한 적이 있는 고객 이름과 주소 조회 (EXISTS 사용)
SELECT name,
       address
FROM customer AS c
WHERE EXISTS (
    SELECT *
    FROM orders AS o
    WHERE c.custid = o.custid
);
