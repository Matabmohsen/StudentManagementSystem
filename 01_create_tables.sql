/* ============================= */
/* Student Management Tables      */
/* ============================= */

-- Student table
CREATE TABLE Student (
    Student_id NUMBER PRIMARY KEY,
    S_First_name VARCHAR2(20),
    S_Last_name VARCHAR2(20),
    S_Email VARCHAR2(50) UNIQUE,
    S_enrollment_date DATE
);

-- Instructor table
CREATE TABLE Instructor (
    Instructor_id NUMBER PRIMARY KEY,
    First_name VARCHAR2(20),
    Last_name VARCHAR2(20),
    Email VARCHAR2(50) UNIQUE,
    Department VARCHAR2(50)
);

-- Courses table
CREATE TABLE Courses (
    Course_id NUMBER PRIMARY KEY,
    Course_name VARCHAR2(50),
    Credits NUMBER(2),
    Instructor_id NUMBER,
    FOREIGN KEY (Instructor_id) REFERENCES Instructor(Instructor_id)
);

-- Enrollments table
CREATE TABLE Enrollments (
    Enrollment_id NUMBER PRIMARY KEY,
    Student_id NUMBER NOT NULL,
    Course_id NUMBER NOT NULL,
    Semester VARCHAR2(10),
    FOREIGN KEY (Student_id) REFERENCES Student(Student_id),
    FOREIGN KEY (Course_id) REFERENCES Courses(Course_id)
);

-- Grades table
CREATE TABLE Grades (
    Grade_id NUMBER PRIMARY KEY,
    Enrollment_id NUMBER NOT NULL,
    Instructor_id NUMBER,
    Exam_score NUMBER(5,2),
    Grade CHAR(2),
    Grade_date DATE DEFAULT SYSDATE,
    FOREIGN KEY (Enrollment_id) REFERENCES Enrollments(Enrollment_id),
    FOREIGN KEY (Instructor_id) REFERENCES Instructor(Instructor_id)
);
