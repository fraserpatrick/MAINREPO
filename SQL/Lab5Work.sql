DROP TABLE Enrollment;
DROP TABLE Student;
DROP TABLE Class;
DROP TABLE Department;

CREATE TABLE Department(
  Dep_no int NOT NULL PRIMARY KEY,
  Name char(20)
);

CREATE TABLE Student(
  Reg_No char(8) NOT NULL PRIMARY KEY,
  Firstname char(20),
  Lastname char(20),
  DOB DATE,
  Dep_no int,
  FOREIGN KEY (Dep_no) REFERENCES Department(Dep_no)
);

CREATE TABLE Class(
  Classcode char(8) NOT NULL PRIMARY KEY,
  Dep_no int,
  Title char(20),
  Max_Number int,
  FOREIGN KEY (Dep_no) REFERENCES Department(Dep_no)
);

CREATE TABLE Enrollment(
  Enrollment_id char(8) NOT NULL PRIMARY KEY,
  Reg_No char(8),
  Classcode char(8),
  FOREIGN KEY (Reg_No) REFERENCES Student(Reg_No),
  FOREIGN KEY (Classcode) REFERENCES Class(Classcode)
);

INSERT INTO Department
VALUES (34, NULL);

INSERT INTO Student
VALUES ('00223451', NULL, 'Clever', '10-10-2000', 34);

ALTER TABLE Student
ADD UNIQUE (Reg_No);
