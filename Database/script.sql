CREATE DATABASE IF NOT EXISTS DSMTDB;

USE DSMTDB;

CREATE TABLE IF NOT EXISTS user (
    username varchar(16) NOT NULL,
    password text NOT NULL,
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
    FOREIGN KEY (user1) REFERENCES user(username) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (user2) REFERENCES user(username) ON DELETE CASCADE ON UPDATE CASCADE,
    UNIQUE(user1, user2)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS message (
    id INT PRIMARY KEY AUTO_INCREMENT,
    content varchar(256) NOT NULL,
    sender varchar(16) NOT NULL,
    chatID INT NOT NULL,
    creationTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (sender) REFERENCES user(username) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (chatID) REFERENCES chat(id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS appointment (
    host varchar(16) NOT NULL,
    guest varchar(16) NOT NULL,
    content varchar(60) NOT NULL,
    timeslot date NOT NULL,
    creationTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (host, guest, timeslot),
    FOREIGN KEY (host) REFERENCES user(username) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (guest) REFERENCES user(username) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS notification (
    id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    user varchar(16) NOT NULL,
    sender varchar(16) NOT NULL,
    chatID int NOT NULL,
    creationTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user) REFERENCES user(username) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (sender) REFERENCES user(username) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (chatID) REFERENCES chat(id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Add a check constraint to the chat table
ALTER TABLE chat
ADD CONSTRAINT UNIQUE_CHAT
CHECK (NOT EXISTS (
    SELECT 1
    FROM chat AS c
    WHERE (c.user1 = chat.user1 AND c.user2 = chat.user2)
       OR (c.user1 = chat.user2 AND c.user2 = chat.user1)
));

-- Add a check constraint to the appointment table
ALTER TABLE appointment
ADD CONSTRAINT UNIQUE_APPOINTMENT
CHECK (NOT EXISTS (
    SELECT 1
    FROM appointment AS a
    WHERE (a.host = appointment.host AND a.guest = appointment.guest)
       OR (a.host = appointment.guest AND a.guest = appointment.host)
));