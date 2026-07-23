SET DEFINE OFF;

CREATE TABLE DEPARTMENT (
    DEPT_ID         INTEGER PRIMARY KEY,
    DEPARTMENT_NAME VARCHAR2(30),
    HOD_NAME        VARCHAR2(30),
    OFFICE_LOCATION VARCHAR2(30),
    BUDGET          INTEGER
);

INSERT INTO DEPARTMENT VALUES ( 101,
                                'Computer Science',
                                'Dr. R. Kumar',
                                'AB-1 Block',
                                2500000 );

INSERT INTO DEPARTMENT VALUES ( 102,
                                'Information Technology',
                                'Dr. S. Mehta',
                                'AB-2 Block',
                                2200000 );

INSERT INTO DEPARTMENT VALUES ( 103,
                                'Electronics & Communication',
                                'Dr. P. Nair',
                                'AB-3 Block',
                                2600000 );

INSERT INTO DEPARTMENT VALUES ( 104,
                                'Mechanical Engineering',
                                'Dr. A. Sharma',
                                'MB-1 Block',
                                2800000 );

INSERT INTO DEPARTMENT VALUES ( 105,
                                'Civil Engineering',
                                'Dr. D. Singh',
                                'CB-1 Block',
                                2000000 );

INSERT INTO DEPARTMENT VALUES ( 106,
                                'Electrical Engineering',
                                'Dr. K. Rao',
                                'EB-2 Block',
                                2400000 );

INSERT INTO DEPARTMENT VALUES ( 107,
                                'Biotechnology',
                                'Dr. M. Joseph',
                                'BT Block',
                                2100000 );

INSERT INTO DEPARTMENT VALUES ( 108,
                                'Artificial Intelligence',
                                'Dr. N. Das',
                                'AI Block',
                                3000000 );

INSERT INTO DEPARTMENT VALUES ( 109,
                                'Data Science',
                                'Dr. T. Patel',
                                'DS Block',
                                3200000 );

INSERT INTO DEPARTMENT VALUES ( 110,
                                'Mathematics',
                                'Dr. G. Roy',
                                'Science Block',
                                1800000 );

CREATE TABLE FACULTY (
    FACULTY_ID   VARCHAR2(30) PRIMARY KEY,
    FACULTY_NAME VARCHAR2(30),
    DESIGNATION  VARCHAR2(30),
    DEPT_ID      INTEGER
        REFERENCES DEPARTMENT,
    DOJ          VARCHAR2(30),
    SALARY       INTEGER CHECK ( SALARY > 50000 )
);

INSERT INTO FACULTY VALUES ( 'F101',
                             'Dr. Anita Sharma',
                             'Professor',
                             101,
                             '15-Jul-12',
                             145000 );

INSERT INTO FACULTY VALUES ( 'F102',
                             'Dr. Vivek Rao',
                             'Professor',
                             102,
                             '11-Jan-14',
                             142000 );

INSERT INTO FACULTY VALUES ( 'F103',
                             'Dr. Rahul Das',
                             'Associate Professor',
                             103,
                             '20-Jun-16',
                             118000 );

INSERT INTO FACULTY VALUES ( 'F104',
                             'Dr. Priya Nair',
                             'Assistant Professor',
                             104,
                             '18-May-19',
                             82000 );

INSERT INTO FACULTY VALUES ( 'F105',
                             'Dr. Arvind Kumar',
                             'Professor',
                             105,
                             '14-Aug-13',
                             138000 );

INSERT INTO FACULTY VALUES ( 'F106',
                             'Dr. Sneha Gupta',
                             'Associate Professor',
                             106,
                             '01-Apr-17',
                             112000 );

INSERT INTO FACULTY VALUES ( 'F107',
                             'Dr. Ramesh Patel',
                             'Assistant Professor',
                             107,
                             '09-Nov-20',
                             78000 );

INSERT INTO FACULTY VALUES ( 'F108',
                             'Dr. Neha Singh',
                             'Professor',
                             108,
                             '15-Feb-11',
                             155000 );

INSERT INTO FACULTY VALUES ( 'F109',
                             'Dr. Mohan Roy',
                             'Associate Professor',
                             109,
                             '30-Sep-18',
                             110000 );

INSERT INTO FACULTY VALUES ( 'F110',
                             'Dr. Kavita Bose',
                             'Assistant Professor',
                             110,
                             '21-Jul-21',
                             76000 );

CREATE TABLE STUDENT (
    STUDENT_ID   VARCHAR2(30) PRIMARY KEY,
    STUDENT_NAME VARCHAR2(30),
    DOB          VARCHAR2(30),
    GENDER       VARCHAR2(30) CHECK ( GENDER IN ( 'M', 'F' ) ),
    DEPT_ID      INTEGER
        REFERENCES DEPARTMENT,
    SEMESTER     INTEGER CHECK ( SEMESTER >= 1
                             AND SEMESTER <= 8 ),
    CGPA         DECIMAL(3, 2) CHECK ( CGPA >= 0
                               AND CGPA <= 10 )
);

INSERT INTO STUDENT VALUES ( 'S101',
                             'Aditya Sharma',
                             '15-May-04',
                             'M',
                             101,
                             5,
                             8.9 );

INSERT INTO STUDENT VALUES ( 'S102',
                             'Harini Subramanian',
                             '22-Aug-04',
                             'F',
                             102,
                             5,
                             9.12 );

INSERT INTO STUDENT VALUES ( 'S103',
                             'Arindam Chatterjee',
                             '12-Feb-03',
                             'M',
                             103,
                             7,
                             8.35 );

INSERT INTO STUDENT VALUES ( 'S104',
                             'Mehak Kaur',
                             '30-Oct-04',
                             'F',
                             104,
                             5,
                             8.02 );

INSERT INTO STUDENT VALUES ( 'S105',
                             'Rohan Deshmukh',
                             '18-Jan-03',
                             'M',
                             105,
                             7,
                             7.88 );

INSERT INTO STUDENT VALUES ( 'S106',
                             'Ananya Mishra',
                             '09-Sep-04',
                             'F',
                             106,
                             5,
                             9.35 );

INSERT INTO STUDENT VALUES ( 'S107',
                             'Tashi Bhutia',
                             '16-Jun-03',
                             'M',
                             107,
                             7,
                             8.41 );

INSERT INTO STUDENT VALUES ( 'S108',
                             'Nandini Reddy',
                             '05-Mar-04',
                             'F',
                             108,
                             5,
                             9.48 );

INSERT INTO STUDENT VALUES ( 'S109',
                             'Devansh Patel',
                             '28-Apr-04',
                             'M',
                             109,
                             5,
                             8.66 );

INSERT INTO STUDENT VALUES ( 'S110',
                             'Isha Boro',
                             '01-Dec-03',
                             'F',
                             110,
                             7,
                             8.72 );

INSERT INTO STUDENT VALUES ( 'S111',
                             'Rahul Nayak',
                             '19-Jul-04',
                             'M',
                             101,
                             3,
                             7.95 );

INSERT INTO STUDENT VALUES ( 'S112',
                             'Kavya Menon',
                             '11-Nov-04',
                             'F',
                             108,
                             3,
                             9.21 );

CREATE TABLE COURSE (
    COURSE_ID   VARCHAR2(30) PRIMARY KEY,
    COURSE_NAME VARCHAR2(30),
    CREDITS     INTEGER CHECK ( CREDITS IN ( 2, 3, 4 ) ),
    DEPT_ID     INTEGER
        REFERENCES DEPARTMENT,
    FACULTY_ID  VARCHAR2(30)
        REFERENCES FACULTY,
    SEMESTER    INTEGER CHECK ( SEMESTER >= 1
                             AND SEMESTER <= 8 )
);

INSERT INTO COURSE VALUES ( 'C101',
                            'Database Systems',
                            4,
                            101,
                            'F101',
                            5 );

INSERT INTO COURSE VALUES ( 'C102',
                            'Operating Systems',
                            4,
                            101,
                            'F101',
                            5 );

INSERT INTO COURSE VALUES ( 'C103',
                            'Computer Networks',
                            4,
                            102,
                            'F102',
                            5 );

INSERT INTO COURSE VALUES ( 'C104',
                            'Digital Electronics',
                            3,
                            103,
                            'F103',
                            5 );

INSERT INTO COURSE VALUES ( 'C105',
                            'Thermodynamics',
                            4,
                            104,
                            'F104',
                            5 );

INSERT INTO COURSE VALUES ( 'C106',
                            'Structural Analysis',
                            4,
                            105,
                            'F105',
                            5 );

INSERT INTO COURSE VALUES ( 'C107',
                            'Power Systems',
                            3,
                            106,
                            'F106',
                            5 );

INSERT INTO COURSE VALUES ( 'C108',
                            'Bioinformatics',
                            3,
                            107,
                            'F107',
                            5 );

INSERT INTO COURSE VALUES ( 'C109',
                            'Machine Learning',
                            4,
                            108,
                            'F108',
                            5 );

INSERT INTO COURSE VALUES ( 'C110',
                            'Data Mining',
                            4,
                            109,
                            'F109',
                            5 );

INSERT INTO COURSE VALUES ( 'C111',
                            'Linear Algebra',
                            3,
                            110,
                            'F110',
                            3 );

INSERT INTO COURSE VALUES ( 'C112',
                            'Artificial Intelligence',
                            4,
                            108,
                            'F108',
                            3 );

CREATE TABLE ENROLLEMNT (
    ENROLLMENT_ID     VARCHAR2(30) PRIMARY KEY,
    STUDENT_ID        VARCHAR2(30)
        REFERENCES STUDENT,
    COURSE_ID         VARCHAR2(30)
        REFERENCES COURSE,
    ENROLLEMENT_DATES VARCHAR2(30),
    GRADE             VARCHAR2(30)
);

INSERT INTO ENROLLEMNT VALUES ( 'E101',
                                'S101',
                                'C101',
                                '15-Jul-25',
                                'A' );

INSERT INTO ENROLLEMNT VALUES ( 'E102',
                                'S102',
                                'C103',
                                '15-Jul-25',
                                'A+' );

INSERT INTO ENROLLEMNT VALUES ( 'E103',
                                'S103',
                                'C104',
                                '15-Jul-25',
                                'B+' );

INSERT INTO ENROLLEMNT VALUES ( 'E104',
                                'S104',
                                'C105',
                                '15-Jul-25',
                                'A' );

INSERT INTO ENROLLEMNT VALUES ( 'E105',
                                'S105',
                                'C106',
                                '15-Jul-25',
                                'B' );

INSERT INTO ENROLLEMNT VALUES ( 'E106',
                                'S106',
                                'C107',
                                '15-Jul-25',
                                'A+' );

INSERT INTO ENROLLEMNT VALUES ( 'E107',
                                'S107',
                                'C108',
                                '15-Jul-25',
                                'A' );

INSERT INTO ENROLLEMNT VALUES ( 'E108',
                                'S108',
                                'C109',
                                '15-Jul-25',
                                'O' );

INSERT INTO ENROLLEMNT VALUES ( 'E109',
                                'S109',
                                'C110',
                                '15-Jul-25',
                                'A' );

INSERT INTO ENROLLEMNT VALUES ( 'E110',
                                'S110',
                                'C111',
                                '15-Jul-25',
                                'B+' );

INSERT INTO ENROLLEMNT VALUES ( 'E111',
                                'S111',
                                'C102',
                                '15-Jul-25',
                                'A' );

INSERT INTO ENROLLEMNT VALUES ( 'E112',
                                'S112',
                                'C112',
                                '15-Jul-25',
                                'O' );

DESCRIBE COURSE ;
DESCRIBE DEPARTMENT ;
DESCRIBE ENROLLEMNT ;
DESCRIBE FACULTY;
DESCRIBE STUDENT;

SELECT
    *
FROM
    COURSE;

SELECT
    *
FROM
    DEPARTMENT;

SELECT
    *
FROM
    ENROLLEMNT;

SELECT
    *
FROM
    FACULTY;

SELECT
    *
FROM
    STUDENT;

SELECT
    STUDENT.STUDENT_ID,
    STUDENT.STUDENT_NAME,
    DEPARTMENT.DEPARTMENT_NAME,
    STUDENT.SEMESTER
FROM
         STUDENT
    INNER JOIN DEPARTMENT ON STUDENT.DEPT_ID = DEPARTMENT.DEPT_ID
WHERE
    ( DEPARTMENT.DEPARTMENT_NAME = 'Computer Science'
      OR DEPARTMENT.DEPARTMENT_NAME = 'Information Technology'
      AND STUDENT.CGPA >= 8.20 )
ORDER BY
    STUDENT.CGPA DESC;

/*Display the names of faculty members who are handling more than one course along with the 
total number of courses assigned to each faculty member.*/
SELECT
    FACULTY.FACULTY_NAME,
    COUNT(COURSE.COURSE_ID) AS TOTAL_COURSES
FROM
         FACULTY
    INNER JOIN COURSE ON COURSE.FACULTY_ID = FACULTY.FACULTY_ID
GROUP BY
    FACULTY.FACULTY_NAME
HAVING
    COUNT(COURSE.COURSE_ID) > 1;

/*Update the semester of all students whose CGPA is greater than 9.00 from Semester 5 to 
Semester 6. Display the updated records.*/

UPDATE STUDENT
SET STUDENT.SEMESTER = 6
WHERE (STUDENT.CGPA > 9 AND STUDENT.SEMESTER = 5);  
SELECT * FROM STUDENT;

/*Add a new column named StudentEmail to the STUDENT table. Populate the email addresses 
for all students and later modify the column by applying the UNIQUE constraint. */

ALTER TABLE STUDENT
ADD STUDENT_EMAIL VARCHAR2(40);

ALTER TABLE STUDENT
MODIFY STUDENT_EMAIL UNIQUE


UPDATE STUDENT
SET STUDENT_EMAIL = STUDENT_NAME || '@vit.ac.in';

SELECT * FROM STUDENT

/*Rename the StudentEmail column as UniversityEmail. Verify the changes using DESCRIBE 
command. */

ALTER TABLE STUDENT
RENAME COLUMN STUDENT_EMAIL TO UNIVERSITY_EMAIL
DESC STUDENT

/*Increase the size of FacultyDesignation from VARCHAR2(20) to VARCHAR2(40) using ALTER 
TABLE. */

ALTER TABLE FACULTY
MODIFY DESIGNATION VARCHAR(40)
DESC FACULTY

/*Delete the enrollment record of a student whose enrollment date is earlier than ‘01-JAN-2025’. 
Display the updated ENROLLMENT table. */
UPDATE ENROLLEMNT
SET ENROLLEMENT_DATES = TO_DATE(ENROLLEMENT_DATES,'DD-Mon-YY');
SELECT * FROM ENROLLEMNT

DELETE FROM ENROLLEMNT WHERE (ENROLLEMENT_DATES < '01-JAN-2025');

/*Rename the COURSE table as SUBJECT and verify the schema. */
ALTER TABLE COURSE RENAME TO SUBJECT;
DESC SUBJECT;

/*Remove the UniversityEmail column from STUDENT table and display the modified table 
structure.*/

ALTER TABLE STUDENT
DROP COLUMN UNIVERSITY_EMAIL 

DESC STUDENT