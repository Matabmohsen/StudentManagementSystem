/* ============================= */
/* Sequences & Triggers           */
/* ============================= */

-- Sequence for Student ID
CREATE SEQUENCE student_seq START WITH 1 INCREMENT BY 1 NOCACHE;

-- Trigger for Student ID & enrollment date
CREATE OR REPLACE TRIGGER student_id_trigger
BEFORE INSERT ON Student
FOR EACH ROW
BEGIN
    IF :NEW.Student_id IS NULL THEN
        :NEW.Student_id := student_seq.NEXTVAL;
    END IF;
    IF :NEW.S_enrollment_date IS NULL THEN
        :NEW.S_enrollment_date := SYSDATE;
    END IF;
END;
/

-- Sequence & trigger for Courses
CREATE SEQUENCE course_seq START WITH 101 INCREMENT BY 1 NOCACHE;
CREATE OR REPLACE TRIGGER course_id_trigger
BEFORE INSERT ON Courses
FOR EACH ROW
BEGIN
    IF :NEW.Course_id IS NULL THEN
        :NEW.Course_id := course_seq.NEXTVAL;
    END IF;
END;
/

-- Sequence & trigger for Enrollments
CREATE SEQUENCE enrollment_seq START WITH 1 INCREMENT BY 1 NOCACHE;
CREATE OR REPLACE TRIGGER enrollment_id_trigger
BEFORE INSERT ON Enrollments
FOR EACH ROW
BEGIN
    IF :NEW.Enrollment_id IS NULL THEN
        :NEW.Enrollment_id := enrollment_seq.NEXTVAL;
    END IF;
END;
/

-- Sequence & trigger for Grades
CREATE SEQUENCE grade_seq START WITH 1 INCREMENT BY 1 NOCACHE;
CREATE OR REPLACE TRIGGER grade_id_trigger
BEFORE INSERT ON Grades
FOR EACH ROW
BEGIN
    :NEW.Grade_id := grade_seq.NEXTVAL;
END;
/

-- Trigger to assign letter grades automatically
CREATE OR REPLACE TRIGGER assign_grade_trigger
BEFORE INSERT OR UPDATE ON Grades
FOR EACH ROW
BEGIN
    IF :NEW.Exam_score >= 90 THEN
        :NEW.Grade := 'A';
    ELSIF :NEW.Exam_score >= 80 THEN
        :NEW.Grade := 'B';
    ELSIF :NEW.Exam_score >= 70 THEN
        :NEW.Grade := 'C';
    ELSIF :NEW.Exam_score >= 60 THEN
        :NEW.Grade := 'D';
    ELSE
        :NEW.Grade := 'F';
    END IF;
END;
/
