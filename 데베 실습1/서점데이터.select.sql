-- 도서 이름과 가격 조회
SELECT bookname, price
FROM book;

-- 도서 테이블의 전체 컬럼 조회
SELECT *
FROM book;

-- 중복을 제거한 출판사 목록 조회
SELECT DISTINCT publisher
FROM book;

-- 가격이 20000원 미만인 도서 이름 조회
SELECT bookname
FROM book
WHERE price < 20000;

-- 가격이 10000원 이상 20000원 이하인 도서 이름 조회
SELECT bookname
FROM book
WHERE price >= 10000 AND price <= 20000;

-- 출판사가 '이상미디어'이고 가격이 15000원 미만인 도서 이름 조회
SELECT bookname
FROM book
WHERE publisher = '이상미디어' AND price < 15000;

-- 괄호 추가하여 논리 연산 우선순위 명확히 함
-- 출판사가 '이상미디어' 또는 '대한미디어'이고, 가격이 25000원 미만인 도서 이름 조회
SELECT bookname
FROM book
WHERE (publisher = '이상미디어' OR publisher = '대한미디어') AND price < 25000;

-- 고객 이름이 '장미란'인 사람의 주소와 전화번호 조회
SELECT address, phone
FROM customer
WHERE name = '장미란';
