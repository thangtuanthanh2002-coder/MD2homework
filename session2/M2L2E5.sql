CREATE TABLE classes (
    class_id INT PRIMARY KEY,
    class_name VARCHAR(100) NOT NULL,
    school_year VARCHAR(20) NOT NULL
);

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    birth_date DATE NOT NULL,
    gender VARCHAR(10) NOT NULL,
    class_id INT NOT NULL,
    FOREIGN KEY (class_id) REFERENCES classes(class_id)
);

