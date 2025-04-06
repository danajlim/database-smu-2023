-- 기존 데이터베이스 삭제 및 생성
DROP DATABASE db3;
CREATE DATABASE db3;
USE db3;

-- 회사 테이블 생성
CREATE TABLE company (
    company_name VARCHAR(15) PRIMARY KEY,
    location VARCHAR(4),
    num_employee INT
);

-- 연락처 플랜 테이블 생성
CREATE TABLE contact (
    contact_ID VARCHAR(2) PRIMARY KEY,
    international_plan VARCHAR(3),
    voice_mail_plan VARCHAR(3)
);

-- 고객 테이블 생성
CREATE TABLE customer (
    area_code VARCHAR(3),
    phone_number VARCHAR(9),
    name VARCHAR(10),
    contact_ID VARCHAR(2),
    company_name VARCHAR(15),
    age INT,
    salary NUMERIC(7,2),
    PRIMARY KEY(area_code, phone_number),
    FOREIGN KEY (contact_ID) REFERENCES contact(contact_ID) 
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (company_name) REFERENCES company(company_name) 
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- 월별 사용량 테이블 생성
CREATE TABLE monthlyusage (
    area_code VARCHAR(3),
    phone_number VARCHAR(9),
    month VARCHAR(10),
    call_min NUMERIC(4,1),
    voice_mail_count INT,
    international_call_min NUMERIC(3,1),
    PRIMARY KEY(area_code, phone_number, month),
    FOREIGN KEY (area_code, phone_number) REFERENCES customer(area_code, phone_number)
);

-- 회사 데이터 삽입
INSERT INTO company VALUES ('Coupang', '서울', 1000);
INSERT INTO company VALUES ('Hyundai Motor', '울산', 20000);
INSERT INTO company VALUES ('Kakao', '성남', 5000);
INSERT INTO company VALUES ('Kakao Bank', '서울', 100);
INSERT INTO company VALUES ('naver', '성남', 7000);
INSERT INTO company VALUES ('SK', '서울', 10000);

-- 연락처 플랜 데이터 삽입
INSERT INTO contact VALUES ('C1', '있음', '있음');
INSERT INTO contact VALUES ('C2', '없음', '없음');
INSERT INTO contact VALUES ('C3', '없음', '없음');
INSERT INTO contact VALUES ('C4', '있음', '있음');
INSERT INTO contact VALUES ('C5', '있음', '있음');
INSERT INTO contact VALUES ('C6', '없음', '있음');
INSERT INTO contact VALUES ('C7', '없음', '없음');
INSERT INTO contact VALUES ('C8', '있음', '있음');
INSERT INTO contact VALUES ('C9', '있음', '없음');

-- 고객 데이터 삽입
INSERT INTO customer VALUES ('02', '1111-1111', 'Srinivasan', 'C1', 'SK', 40, 65000);
INSERT INTO customer VALUES ('02', '1111-1112', 'Wu', 'C2', 'SK', 35, 90000);
INSERT INTO customer VALUES ('02', '1111-1113', 'Gold', 'C3', 'Coupang', 51, 87000);
INSERT INTO customer VALUES ('02', '1111-1114', 'Katz', 'C4', 'Coupang', 20, 75000);
INSERT INTO customer VALUES ('031', '2222-1111', 'Mozart', 'C5', 'Kakao', 26, 40000);
INSERT INTO customer VALUES ('031', '2222-1112', 'Einstein', 'C6', 'Kakao', 42, 95000);
INSERT INTO customer VALUES ('031', '2222-1113', 'El Said', 'C7', 'naver', 45, 60000);
INSERT INTO customer VALUES ('052', '3333-1111', 'Califieri', 'C8', 'Hyundai Motor', 28, 62000);
INSERT INTO customer VALUES ('052', '3333-1112', 'Singh', 'C9', 'Hyundai Motor', 34, NULL);

-- 월별 사용 데이터 삽입
INSERT INTO monthlyusage VALUES ('02', '1111-1111', '10월', 161.6, 26, 3);
INSERT INTO monthlyusage VALUES ('02', '1111-1111', '9월', 265.1, 25, 3);
INSERT INTO monthlyusage VALUES ('02', '1111-1112', '10월', 299.4, 0, 7);
INSERT INTO monthlyusage VALUES ('02', '1111-1112', '9월', 243.4, 0, 5);
INSERT INTO monthlyusage VALUES ('02', '1111-1113', '10월', 157.0, 0, 6);
INSERT INTO monthlyusage VALUES ('02', '1111-1113', '9월', 218.2, 24, 7);
INSERT INTO monthlyusage VALUES ('02', '1111-1114', '10월', 224.4, 0, 2);
INSERT INTO monthlyusage VALUES ('02', '1111-1114', '9월', 189.7, 33, 5);
INSERT INTO monthlyusage VALUES ('031', '2222-1111', '10월', 81.1, 0, 2);
INSERT INTO monthlyusage VALUES ('031', '2222-1111', '9월', 183.0, 0, 19);
INSERT INTO monthlyusage VALUES ('031', '2222-1112', '10월', 101.6, 26, 3);
INSERT INTO monthlyusage VALUES ('031', '2222-1112', '9월', 124.3, 0, 5);
INSERT INTO monthlyusage VALUES ('031', '2222-1113', '10월', 134.3, 0, 4);
INSERT INTO monthlyusage VALUES ('031', '2222-1113', '9월', 265.1, 5, 3);
INSERT INTO monthlyusage VALUES ('052', '3333-1111', '9월', 65.1, 25, 3);

-- 전체 테이블 조회
SELECT * FROM company;
SELECT * FROM contact;
SELECT * FROM customer;
SELECT * FROM monthlyusage;

-- 직원 수가 3000명 이상인 회사 조회
SELECT company_name, location 
FROM company 
WHERE num_employee > 3000;

-- 급여 정보가 없는 고객 조회
SELECT name 
FROM customer 
WHERE salary IS NULL;

-- 'Ka'로 시작하는 회사에 속한 고객 중 나이 내림차순
SELECT name, age 
FROM customer 
WHERE company_name LIKE 'Ka%' 
ORDER BY age DESC;

-- 급여 8만 이상이며 국제전화 가능 고객 조회 (JOIN)
SELECT name, area_code, phone_number, salary 
FROM customer, contact 
WHERE customer.contact_ID = contact.contact_ID 
  AND salary >= 80000 
  AND international_plan = '있음';

-- 위와 동일하지만 NATURAL JOIN 사용
SELECT name, area_code, phone_number, salary 
FROM customer NATURAL JOIN contact 
WHERE international_plan = '있음' 
  AND salary >= 80000;

-- 음성사서함 있음 + 직원 수 10000명 이상인 고객 조회
SELECT name, area_code, phone_number 
FROM customer 
NATURAL JOIN company 
NATURAL JOIN contact 
WHERE voice_mail_plan = '있음' 
  AND num_employee >= 10000;

-- 고객별 월별 통화량 집계
SELECT area_code, phone_number, 
       SUM(call_min), 
       SUM(international_call_min) 
FROM customer 
NATURAL JOIN monthlyusage 
GROUP BY area_code, phone_number;

-- 통화량이 400분 이상인 고객만 필터링
SELECT area_code, phone_number, 
       SUM(call_min), 
       SUM(international_call_min) 
FROM customer 
NATURAL JOIN monthlyusage 
GROUP BY area_code, phone_number 
HAVING SUM(call_min) >= 400;

-- 서브쿼리 방식으로 통화량 필터링
SELECT * 
FROM (
    SELECT area_code, phone_number, 
           SUM(call_min), 
           SUM(international_call_min) 
    FROM customer 
    NATURAL JOIN monthlyusage 
    GROUP BY area_code, phone_number
) AS A 
WHERE A.SUM(call_min) >= 400;

-- 회사별 고객 수 및 국제전화 요금제 보유 수
SELECT company_name, location,
       (SELECT COUNT(*) 
        FROM Customer 
        WHERE company.company_name = customer.company_name) AS num_emp,
       (SELECT COUNT(*) 
        FROM customer 
        JOIN contact ON customer.contact_ID = contact.contact_ID 
        WHERE international_plan = '있음') AS num_int_plan
FROM company 
NATURAL JOIN customer 
NATURAL JOIN contact 
GROUP BY company_name, location;

-- 회사 기준으로 고객 LEFT OUTER JOIN
SELECT company_name, area_code, phone_number, name 
FROM company 
LEFT OUTER JOIN customer 
ON company.company_name = customer.company_name;

-- 특정 조건의 고객 정보 뷰 생성
CREATE VIEW customer_plan AS
SELECT area_code, phone_number, name, contact_ID, international_plan, voice_mail_plan
FROM customer 
NATURAL JOIN contact 
WHERE international_plan = '있음' 
  AND voice_mail_plan = '있음';

-- FK 제약 조건 때문에 area_code 직접 변경이 안될 수 있음
UPDATE customer 
SET area_code = '031' 
WHERE name = 'Srinivasan';  
-- 주석: monthlyusage 테이블이 area_code와 phone_number를 외래키로 사용하므로 직접 변경 시 오류 발생 가능

-- company_name 변경 시 CASCADE로 고객 테이블에도 적용됨
UPDATE company 
SET company_name = 'Kakao mobile' 
WHERE company_name = 'Kakao';  
-- 주석: customer 테이블에 ON UPDATE CASCADE 설정이 있으므로, 해당 변경이 자동 전파됨
