CREATE DATABASE baseball;

USE baseball;

CREATE TABLE players (
    id INT AUTO_INCREMENT,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    throws VARCHAR(1) NOT NULL,
    hits VARCHAR(1) NOT NULL,
    PRIMARY KEY (ID)
);

