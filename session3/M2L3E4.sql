CREATE TABLE users (
    user_id INT PRIMARY KEY,
    username VARCHAR(50) UNIQUE,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(100) UNIQUE,
    status VARCHAR(20) DEFAULT 'ACTIVE'
);

ALTER TABLE users
ADD CONSTRAINT chk_users_status
CHECK (status IN ('ACTIVE', 'INACTIVE'));

DROP TABLE users;