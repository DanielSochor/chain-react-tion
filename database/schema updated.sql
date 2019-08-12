DROP DATABASE IF EXISTS healthy;
CREATE DATABASE healthy;

USE healthy;

CREATE TABLE `users` (    
    `user_id` int(11) NOT NULL AUTO_INCREMENT,
    `username` VARCHAR(20) NOT NULL UNIQUE,
    `password` varchar(50)  NOT NULL,
    `email_address` varchar(50) NOT NULL,
    `salt` varchar(50)  NOT NULL,
    `session_token` varchar(50),
    `created` DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
    `updated` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL,
    PRIMARY KEY (`user_id`) 
)ENGINE=InnoDB DEFAULT CHARSET=utf8MB4;

CREATE TABLE `challenges` (
    `challenge_id` int(11) AUTO_INCREMENT,
    `challenge_type` VARCHAR(256),
    `challenge_name` VARCHAR(30) NOT NULL,
    `start_date` DATE,
    `end_date` DATE,
    `created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`challenge_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8MB4;

CREATE TABLE `messages` (
    `messages_id` INTEGER AUTO_INCREMENT,
    `message_body` VARCHAR(120),
    `message_author` VARCHAR(20),
    `challenge_id` int(11),
    KEY `challenge_id` (`challenge_id`),
    FOREIGN KEY (`challenge_id`) REFERENCES `challenges`(`challenge_id`)
    ON DELETE CASCADE ON UPDATE CASCADE,
    `user_id` int(11),
    KEY `user_id` (`user_id`),
    FOREIGN KEY (`user_id`) REFERENCES `users`(`user_id`)
    ON DELETE CASCADE ON UPDATE CASCADE,
    `created` DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
    PRIMARY KEY (`messages_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8MB4;

CREATE TABLE `challenge_members` (
    `challenge_id` int(11) INTEGER AUTO_INCREMENT,
    `user_id` int(11),
    KEY `user_id` (`user_id`),
    FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
    ON DELETE CASCADE ON UPDATE CASCADE,
    KEY `challenge_id` (`challenge_id`),
    FOREIGN KEY (`challenge_id`) REFERENCES `challenges`(`challenge_id`)
    ON DELETE CASCADE ON UPDATE CASCADE,
    `created` DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
    PRIMARY KEY (`challenge_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8MB4;

CREATE TABLE `challenge_logs` (
    `challenge_log_id` INTEGER AUTO_INCREMENT,
    `user_id` int(11),
    KEY `user_id` (`user_id`),
    FOREIGN KEY (`user_id`) REFERENCES users(`user_id`)
    ON DELETE CASCADE ON UPDATE CASCADE,
    `challenge_id` int(11),
    KEY `challenge_id` (`challenge_id`),
    FOREIGN KEY (`challenge_id`) REFERENCES `challenges`(`challenge_id`)
    ON DELETE CASCADE ON UPDATE CASCADE,
    `challenge_log` LONGBLOB,
    `created` DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
    PRIMARY KEY (`challenge_log_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8MB4;