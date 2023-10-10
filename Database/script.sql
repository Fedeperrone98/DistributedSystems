CREATE DATABASE IF NOT EXISTS DSMTDB;

USE DSMTDB;

CREATE TABLE IF NOT EXISTS user (
    username varchar(16) NOT NULL,
    password varchar(12) NOT NULL,
    name varchar(16) NOT NULL,
    surname varchar(16) NOT NULL,
    department ENUM('IT', 'HR', 'Administration','Buying', 'Selling') NOT NULL,
    onlineFlag boolean NOT NULL,
    creationTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (username)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS chat (
    id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    user1 varchar(16) NOT NULL,
    user2 varchar(16) NOT NULL,
    creationTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user1) REFERENCES user(username),
    FOREIGN KEY (user2) REFERENCES user(username)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE IF NOT EXISTS message (
    messageID INT PRIMARY KEY AUTO_INCREMENT,
    content varchar(256) NOT NULL,
    sender varchar(32) NOT NULL,
    chatID INT NOT NULL,
    creationTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (sender) REFERENCES user(username),
    FOREIGN KEY (chatID) REFERENCES chat(id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS appointment (
    host varchar(16) NOT NULL,
    guest varchar(16) NOT NULL,
    content varchar(60) NOT NULL,
    timeslot date NOT NULL,
    creationTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (host, guest, timeslot),
    FOREIGN KEY (host) REFERENCES user(username),
    FOREIGN KEY (guest) REFERENCES user(username)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;