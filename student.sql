DROP TABLE IF EXISTS student;
DROP TABLE IF EXISTS mentor;
DROP TABLE IF EXISTS secretary;
DROP TABLE IF EXISTS collage_leader;
DROP TABLE IF EXISTS student_leader;  
DROP TABLE IF EXISTS university_leader; 
DROP TABLE IF EXISTS account;


CREATE TABLE account (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    role VARCHAR(20) CHECK (role IN ('student', 'mentor', 'secretary', 'collage_leader', 'student_manager', 'student_leader', 'university_leader', 'system_manager', 'auditor_manager', NULL)),
    failed_times INTEGER DEFAULT 0,
    lock_time TIMESTAMP,
    last_password_change_date TIMESTAMP
);


CREATE TABLE mentor (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    collage VARCHAR(100),
    account_id INTEGER UNIQUE,
    FOREIGN KEY (account_id) REFERENCES account(id) ON DELETE SET NULL
);


CREATE TABLE student (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    gender VARCHAR(10),
    nation VARCHAR(50),
    birth_date DATE,
    birth_place VARCHAR(100),
    id_number VARCHAR(20),
    country VARCHAR(50),
    home_address VARCHAR(200),
    phone_number VARCHAR(20),
    email VARCHAR(50),
    dorm_id VARCHAR(20),
    grade INTEGER,
    collage VARCHAR(100),
    major VARCHAR(100),
    campus VARCHAR(50),
    entrance_date DATE,
    class VARCHAR(50),
    wechat VARCHAR(50),
    qq VARCHAR(20),
    home_phone_number VARCHAR(20),
    home_contact_man VARCHAR(50),
    account_id INTEGER UNIQUE,
    mentor_id INTEGER,
    mentor VARCHAR(50),
    FOREIGN KEY (account_id) REFERENCES account(id) ON DELETE SET NULL,
    FOREIGN KEY (mentor_id) REFERENCES mentor(id) ON DELETE SET NULL
);


CREATE TABLE secretary (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    collage VARCHAR(100),
    account_id INTEGER UNIQUE,
    FOREIGN KEY (account_id) REFERENCES account(id) ON DELETE SET NULL
);


CREATE TABLE collage_leader (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    collage VARCHAR(100),
    account_id INTEGER UNIQUE,
    FOREIGN KEY (account_id) REFERENCES account(id) ON DELETE SET NULL
);


CREATE TABLE student_leader (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    account_id INTEGER UNIQUE,
    FOREIGN KEY (account_id) REFERENCES account(id) ON DELETE SET NULL
);


CREATE TABLE university_leader (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    
    account_id INTEGER UNIQUE,
    FOREIGN KEY (account_id) REFERENCES account(id) ON DELETE SET NULL
);


CREATE INDEX idx_account_username ON account(username);
CREATE INDEX idx_student_collage ON student(collage);
CREATE INDEX idx_student_major ON student(major);
CREATE INDEX idx_student_mentor_id ON student(mentor_id);


