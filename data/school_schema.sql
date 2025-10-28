DROP TABLE IF EXISTS student;
DROP TABLE IF EXISTS teachers;
DROP TABLE IF EXISTS subjects;

CREATE TABLE subjects(
    id SERIAL PRIMARY KEY,
    subject VARCHAR(255)
);

CREATE TABLE student (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    age INT,
    subject INT,
    CONSTRAINT student_subject
    FOREIGN KEY (subject)
    REFERENCES subjects(id)
);

CREATE TABLE teachers (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    age INT,
    subject INT,
    CONSTRAINT teachers_subject
    FOREIGN KEY (subject)
    REFERENCES subjects(id)
);

\COPY subjects(id, subject) FROM './subjects.csv' DELIMITER ',' CSV HEADER;
\COPY student(id, first_name, last_name, age, subject) FROM './student.csv' DELIMITER ',' CSV HEADER;
\COPY teachers(id, first_name, last_name, age, subject) FROM './teachers.csv' DELIMITER ',' CSV HEADER;