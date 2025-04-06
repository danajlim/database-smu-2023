-- 기존 데이터베이스 삭제
DROP DATABASE db2;

-- 새 데이터베이스 생성
CREATE DATABASE db2;

-- 사용할 데이터베이스 선택
USE db2;

-- 학과 테이블 생성
CREATE TABLE department (
    dept_name       VARCHAR(20), 
    building        VARCHAR(15), 
    budget          NUMERIC(12,2),
    PRIMARY KEY (dept_name)
);

-- 교수 테이블 생성
CREATE TABLE instructor (
    ID              CHAR(5),
    name            VARCHAR(20) NOT NULL,
    dept_name       VARCHAR(20),    
    salary          NUMERIC(8,2),
    PRIMARY KEY (ID),
    FOREIGN KEY (dept_name) REFERENCES department(dept_name)
);

-- 강의 과목 테이블 생성
CREATE TABLE course (
    course_id       VARCHAR(8) PRIMARY KEY,
    title           VARCHAR(50),
    dept_name       VARCHAR(20),
    credits         NUMERIC(2,0),
    FOREIGN KEY (dept_name) REFERENCES department(dept_name)
);

-- 강의 섹션 테이블 생성
CREATE TABLE section (
    course_id        VARCHAR(8),
    sec_id           VARCHAR(8),
    semester         VARCHAR(6),
    year             NUMERIC(4,0),
    building         VARCHAR(15),
    room_number      VARCHAR(7),
    tile_slod_id     VARCHAR(4),
    PRIMARY KEY (course_id, sec_id, semester, year),
    FOREIGN KEY (course_id) REFERENCES course(course_id)
);

-- 강의 담당 교수 테이블 생성
CREATE TABLE teaches (
    ID               VARCHAR(5),
    course_id        VARCHAR(8),
    sec_id           VARCHAR(8),
    semester         VARCHAR(6),
    year             NUMERIC(4,0),
    PRIMARY KEY (ID, course_id, sec_id, semester, year),
    FOREIGN KEY (course_id, sec_id, semester, year) REFERENCES section(course_id, sec_id, semester, year),
    FOREIGN KEY (ID) REFERENCES instructor(ID)
);

-- 학생 테이블 생성
CREATE TABLE student (
    ID               VARCHAR(5) PRIMARY KEY,
    name             VARCHAR(20) NOT NULL,
    dept_name        VARCHAR(20),
    tot_cred         NUMERIC(3,0),
    FOREIGN KEY (dept_name) REFERENCES department(dept_name)
);

-- 수강 내역 테이블 생성
CREATE TABLE takes (
    ID              VARCHAR(5),
    course_id       VARCHAR(8),
    sec_id          VARCHAR(8),
    semester        VARCHAR(6),
    year            NUMERIC(4,0),
    grade           VARCHAR(2),
    PRIMARY KEY (ID, course_id, sec_id, semester, year),
    FOREIGN KEY (ID) REFERENCES student(ID),
    FOREIGN KEY (course_id, sec_id, semester, year) REFERENCES section(course_id, sec_id, semester, year)
);

-- 학과 데이터 삽입
INSERT INTO department VALUES ('Biology',    'Watson',  90000);
INSERT INTO department VALUES ('Comp. Sci.', 'Taylor',  100000);
INSERT INTO department VALUES ('Elec. Eng.', 'Taylor',  85000);
INSERT INTO department VALUES ('Finance',    'Painter', 120000);
INSERT INTO department VALUES ('History',    'Painter', 50000);
INSERT INTO department VALUES ('Music',      'Packard', 80000);
INSERT INTO department VALUES ('Physics',    'Watson',  70000);

-- 교수 데이터 삽입
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

-- 강의 과목 데이터 삽입
INSERT INTO course VALUES ('BIO-101', 'Intro. to Biology',         'Biology',    4);
INSERT INTO course VALUES ('BIO-301', 'Genetics',                  'Biology',    4);
INSERT INTO course VALUES ('BIO-399', 'Computational Biology',     'Biology',    3);
INSERT INTO course VALUES ('CS-101',  'Intro. to CS',              'Comp. Sci.', 4);
INSERT INTO course VALUES ('CS-190',  'Game Design',               'Comp. Sci.', 4);
INSERT INTO course VALUES ('CS-315',  'Robotics',                  'Comp. Sci.', 3);
INSERT INTO course VALUES ('CS-319',  'Image Processing',          'Comp. Sci.', 3);
INSERT INTO course VALUES ('CS-347',  'Database System',           'Comp. Sci.', 3);
INSERT INTO course VALUES ('EE-181',  'Intro. to Digital Systems', 'Elec. Eng.', 3);
INSERT INTO course VALUES ('FIN-201', 'Investment Banking',        'Finance',    3);
INSERT INTO course VALUES ('HIS-351', 'World History',             'History',    3);
INSERT INTO course VALUES ('MU-199',  'Music Video Production',    'Music',      3);
INSERT INTO course VALUES ('PHY-101', 'Physical Principles',       'Physics',    4);

-- 섹션 데이터 삽입
INSERT INTO section VALUES ('BIO-101', '1', 'Summer', 2009, 'Painter', '514', 'B');
INSERT INTO section VALUES ('BIO-301', '1', 'Summer', 2010, 'Painter', '514', 'A');
INSERT INTO section VALUES ('CS-101',  '1', 'Fall',   2009, 'Packard', '101', 'H');
INSERT INTO section VALUES ('CS-101',  '1', 'Spring', 2010, 'Packard', '101', 'F');
INSERT INTO section VALUES ('CS-190',  '1', 'Spring', 2009, 'Taylor',  '3128', 'E');
INSERT INTO section VALUES ('CS-190',  '2', 'Spring', 2009, 'Taylor',  '3128', 'A');
INSERT INTO section VALUES ('CS-315',  '1', 'Spring', 2010, 'Watson',  '120',  'D');
INSERT INTO section VALUES ('CS-319',  '1', 'Spring', 2010, 'Watson',  '100',  'B');
INSERT INTO section VALUES ('CS-319',  '2', 'Spring', 2010, 'Taylor',  '3128', 'C');
INSERT INTO section VALUES ('CS-347',  '1', 'Fall',   2009, 'Taylor',  '3128', 'A');
INSERT INTO section VALUES ('EE-181',  '1', 'Spring', 2009, 'Taylor',  '3128', 'C');
INSERT INTO section VALUES ('FIN-201', '1', 'Spring', 2010, 'Packard', '101',  'B');
INSERT INTO section VALUES ('HIS-351', '1', 'Spring', 2010, 'Painter', '514',  'D');
INSERT INTO section VALUES ('MU-199',  '1', 'Spring', 2010, 'Packard', '101',  'D');
INSERT INTO section VALUES ('PHY-101', '1', 'Fall',   2009, 'Watson',  '100',  'A');

-- 강의 담당 교수 데이터 삽입
INSERT INTO teaches VALUES ('10101', 'CS-101',  '1', 'Fall',   2009);
INSERT INTO teaches VALUES ('10101', 'CS-315',  '1', 'Spring', 2010);
INSERT INTO teaches VALUES ('10101', 'CS-347',  '1', 'Fall',   2009);
INSERT INTO teaches VALUES ('12121', 'FIN-201', '1', 'Spring', 2010);
INSERT INTO teaches VALUES ('15151', 'MU-199',  '1', 'Spring', 2010);
INSERT INTO teaches VALUES ('22222', 'PHY-101', '1', 'Fall',   2009);
INSERT INTO teaches VALUES ('32343', 'HIS-351', '1', 'Spring', 2010);
INSERT INTO teaches VALUES ('45565', 'CS-101',  '1', 'Spring', 2010);
INSERT INTO teaches VALUES ('45565', 'CS-319',  '1', 'Spring', 2010);
INSERT INTO teaches VALUES ('76766', 'BIO-101', '1', 'Summer', 2009);
INSERT INTO teaches VALUES ('76766', 'BIO-301', '1', 'Summer', 2010);
INSERT INTO teaches VALUES ('83821', 'CS-190',  '1', 'Spring', 2009);
INSERT INTO teaches VALUES ('83821', 'CS-190',  '2', 'Spring', 2009);
INSERT INTO teaches VALUES ('83821', 'CS-319',  '2', 'Spring', 2010);
INSERT INTO teaches VALUES ('98345', 'EE-181',  '1', 'Spring', 2009);

-- 학생 데이터 삽입
INSERT INTO student VALUES ('00128', 'Zhang',     'Comp. Sci.', 102);
INSERT INTO student VALUES ('12345', 'Shankar',   'Comp. Sci.', 32);
INSERT INTO student VALUES ('19991', 'Brandt',    'History',    80);
INSERT INTO student VALUES ('23121', 'Chavez',    'Finance',    120);
INSERT INTO student VALUES ('44553', 'Peltier',   'Physics',    56);
INSERT INTO student VALUES ('45678', 'Levy',      'Physics',    46);
INSERT INTO student VALUES ('54321', 'Williams',  'Comp. Sci.', 54);
INSERT INTO student VALUES ('55739', 'Sanchez',   'Music',      38);
INSERT INTO student VALUES ('70557', 'Snow',      'Physics',    0);
INSERT INTO student VALUES ('76543', 'Brown',     'Comp. Sci.', 58);
INSERT INTO student VALUES ('76653', 'Aoi',       'Elec. Eng.', 60);
INSERT INTO student VALUES ('98765', 'Bourikas',  'Elec. Eng.', 98);
INSERT INTO student VALUES ('98988', 'Tanaka',    'Biology',    120);

-- 수강 내역 데이터 삽입
INSERT INTO takes VALUES ('00128', 'CS-101',  '1', 'Fall',   2009, 'A');
INSERT INTO takes VALUES ('00128', 'CS-347',  '1', 'Fall',   2009, 'A-');
INSERT INTO takes VALUES ('12345', 'CS-101',  '1', 'Fall',   2009, 'C');
INSERT INTO takes VALUES ('12345', 'CS-190',  '2', 'Spring', 2009, 'A');
INSERT INTO takes VALUES ('12345', 'CS-315',  '1', 'Spring', 2010, 'A');
INSERT INTO takes VALUES ('12345', 'CS-347',  '1', 'Fall',   2009, 'B');
INSERT INTO takes VALUES ('19991', 'HIS-351', '1', 'Spring', 2010, 'B');
INSERT INTO takes VALUES ('23121', 'FIN-201', '1', 'Spring', 2010, 'C+');
INSERT INTO takes VALUES ('44553', 'PHY-101', '1', 'Fall',   2009, 'B-');
INSERT INTO takes VALUES ('45678', 'CS-101',  '1', 'Fall',   2009, 'F');
INSERT INTO takes VALUES ('45678', 'CS-101',  '1', 'Spring', 2010, 'B+');
INSERT INTO takes VALUES ('45678', 'CS-319',  '1', 'Spring', 2010, 'B');
INSERT INTO takes VALUES ('54321', 'CS-101',  '1', 'Fall',   2009, 'A-');
INSERT INTO takes VALUES ('54321', 'CS-190',  '2', 'Spring', 2009, 'B+');
INSERT INTO takes VALUES ('55739', 'MU-199',  '1', 'Spring', 2010, 'A-');
INSERT INTO takes VALUES ('76543', 'CS-101',  '1', 'Fall',   2009, 'A');
INSERT INTO takes VALUES ('76543', 'CS-319',  '2', 'Spring', 2010, 'A');
INSERT INTO takes VALUES ('76653', 'EE-181',  '1', 'Spring', 2009, 'C');
INSERT INTO takes VALUES ('98765', 'CS-101',  '1', 'Fall',   2009, 'C-');
INSERT INTO takes VALUES ('98765', 'CS-315',  '1', 'Spring', 2010, 'B');
INSERT INTO takes VALUES ('98988', 'BIO-101', '1', 'Summer', 2009, 'A');
INSERT INTO takes VALUES ('98988', 'BIO-301', '1', 'Summer', 2010, NULL);

-- 모든 테이블 조회
SELECT * FROM department;
SELECT * FROM instructor;
SELECT * FROM course;    
SELECT * FROM section;    
SELECT * FROM teaches;   
SELECT * FROM student;
SELECT * FROM takes;
