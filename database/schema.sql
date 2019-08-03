CREATE database healthApp;
USE healthApp;

CREATE TABLE users ( 
id INTEGER AUTO_INCREMENT,
username VARCHAR(20) NOT NULL UNIQUE,
password VARCHAR(256) NOT NULL,
user_email VARCHAR(256) NOT NULL UNIQUE,
createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY (id))ENGINE=InnoDB DEFAULT CHARSET=utf8MB4;

CREATE TABLE group_challenges (
id INTEGER AUTO_INCREMENT,
challenge_type VARCHAR(256),
challenge_name VARCHAR(30) NOT NULL,
start_date DATE,
end_date DATE,
createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY (id))ENGINE=InnoDB DEFAULT CHARSET=utf8MB4;

CREATE TABLE messages(
id INTEGER AUTO_INCREMENT,
message_body VARCHAR(120),
message_author VARCHAR(20),
group_challenge_id int(11),
KEY group_challenge_id (group_challenge_id),
FOREIGN KEY (group_challenge_id) REFERENCES group_challenges(id)
ON DELETE CASCADE ON UPDATE CASCADE,
user_id int(11),
KEY user_id (user_id),
FOREIGN KEY (user_id) REFERENCES users(id)
ON DELETE CASCADE ON UPDATE CASCADE,
createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY (id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8MB4;

CREATE TABLE challenge_logs (
id INTEGER AUTO_INCREMENT,
user_id int(11),
KEY user_id (user_id),
FOREIGN KEY (user_id) REFERENCES users(id)
ON DELETE CASCADE ON UPDATE CASCADE,
group_challenge_id int(11),
KEY group_challenge_id (group_challenge_id),
FOREIGN KEY (group_challenge_id) REFERENCES group_challenges(id)
ON DELETE CASCADE ON UPDATE CASCADE,
challenge_log LONGBLOB,
createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY (id)

)ENGINE=InnoDB DEFAULT CHARSET=utf8MB4;