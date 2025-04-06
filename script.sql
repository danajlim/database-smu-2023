-- 기존 데이터베이스 삭제
DROP DATABASE mydb3;

-- 새 데이터베이스 생성
CREATE DATABASE mydb3;

-- 사용할 데이터베이스 지정
USE mydb3;

-- instructor 테이블 생성
CREATE TABLE instructor (
    ID              CHAR(5),
    name            VARCHAR(20) NOT NULL,
    dept_name       VARCHAR(20),
    salary          NUMERIC(8,2),
    PRIMARY KEY (ID)
);

-- teaches 테이블 생성
CREATE TABLE teaches (
    ID               VARCHAR(5),
    course_id        VARCHAR(8),
    sec_id           VARCHAR(8),
    semester         VARCHAR(6),
    year             NUMERIC(4,0),
    PRIMARY KEY (ID, course_id, sec_id, semester, year)
);

-- instructor 테이블에 데이터 삽입
INSERT INTO instructor VALUES ('10101', 'Srinivasan', 'Comp. Sci.', 65000);
INSERT INTO instructor VALUES ('12121', 'Wu',         'Finance',    90000);
INSERT INTO instructor VALUES ('15151', 'Mozart',     'Music',      40000);
INSERT INTO instructor VALUES ('22222', 'Einstein',   'Physics',    95000);
INSERT INTO instructor VALUES ('32343', 'El Said',    'History',    60000);
INSERT INTO instructor VALUES ('33456', 'Gold',       'Physics',    87000);
INSERT INTO instructor VALUES ('45565', 'Katz',       'Comp. Sci.', 75000);
INSERT INTO instructor VALUES ('58583', 'Califieri',  'History',    62000);
INSERT INTO instructor VALUES ('76543', 'Singh',      'Finance',    80000);
INSERT INTO instructor VALUES ('76766', 'Crick',      'Biology',    72000);
INSERT INTO instructor VALUES ('83821', 'Brandt',     'Comp. Sci.', 80000);    
INSERT INTO instructor VALUES ('98345', 'Kim',        'Elec. Eng.', 80000);

-- teaches 테이블에 데이터 삽입
INSERT INTO teaches VALUES ('10101', 'CS-101',  1, 'Fall',   2009);
INSERT INTO teaches VALUES ('10101', 'CS-315',  1, 'Spring', 2010);
INSERT INTO teaches VALUES ('10101', 'CS-347',  1, 'Fall',   2009);
INSERT INTO teaches VALUES ('12121', 'FIN-201', 1, 'Spring', 2010);
INSERT INTO teaches VALUES ('15151', 'MU-199',  1, 'Spring', 2010);
INSERT INTO teaches VALUES ('22222', 'PHY-101', 1, 'Fall',   2009);
INSERT INTO teaches VALUES ('32343', 'HIS-351', 1, 'Spring', 2010);
INSERT INTO teaches VALUES ('45565', 'CS-101',  1, 'Spring', 2010);
INSERT INTO teaches VALUES ('45565', 'CS-319',  1, 'Spring', 2010);
INSERT INTO teaches VALUES ('76766', 'BIO-101', 1, 'Summer', 2009);
INSERT INTO teaches VALUES ('76766', 'BIO-301', 1, 'Summer', 2010);
INSERT INTO teaches VALUES ('83821', 'CS-190',  1, 'Spring', 2009);
INSERT INTO teaches VALUES ('83821', 'CS-190',  2, 'Spring', 2009);
INSERT INTO teaches VALUES ('83821', 'CS-319',  2, 'Spring', 2010);
INSERT INTO teaches VALUES ('98345', 'EE-181',  1, 'Spring', 2009);
