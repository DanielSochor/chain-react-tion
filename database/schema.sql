CREATE database healthy;
USE healthy;

CREATE TABLE users ( 
    
id INTEGER AUTO_INCREMENT,
username VARCHAR(20) NOT NULL UNIQUE,
password VARCHAR(256) NOT NULL,
user_email VARCHAR(256) NOT NULL UNIQUE,
createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY (id)

)ENGINE=InnoDB DEFAULT CHARSET=utf8MB4;

CREATE TABLE group_challenges (

id INTEGER AUTO_INCREMENT,
challenge_type VARCHAR(256),
challenge_name VARCHAR(30) NOT NULL,
start_date DATE,
end_date DATE,
createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY (id)

)ENGINE=InnoDB DEFAULT CHARSET=utf8MB4;

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

CREATE TABLE challenge_members (

id INTEGER AUTO_INCREMENT,
user_id int(11),
KEY user_id (user_id),
FOREIGN KEY (user_id) REFERENCES users(id)
ON DELETE CASCADE ON UPDATE CASCADE,
group_challenge_id int(11),
KEY group_challenge_id (group_challenge_id),
FOREIGN KEY (group_challenge_id) REFERENCES group_challenges(id)
ON DELETE CASCADE ON UPDATE CASCADE,
createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY (id)

)ENGINE=InnoDB DEFAULT CHARSET=utf8MB4;

CREATE TABLE running_distance_logs (

id INTEGER AUTO_INCREMENT,
user_id int(11),
KEY user_id (user_id),
FOREIGN KEY (user_id) REFERENCES users(id)
ON DELETE CASCADE ON UPDATE CASCADE,
group_challenge_id int(11),
KEY group_challenge_id (group_challenge_id),
FOREIGN KEY (group_challenge_id) REFERENCES group_challenges(id)
ON DELETE CASCADE ON UPDATE CASCADE,
running_distance DECIMAL(4,2),
createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY (id)

)ENGINE=InnoDB DEFAULT CHARSET=utf8MB4;

CREATE TABLE running_pace_logs (

id INTEGER AUTO_INCREMENT,
user_id int(11),
KEY user_id (user_id),
FOREIGN KEY (user_id) REFERENCES users(id)
ON DELETE CASCADE ON UPDATE CASCADE,
group_challenge_id int(11),
KEY group_challenge_id (group_challenge_id),
FOREIGN KEY (group_challenge_id) REFERENCES group_challenges(id)
ON DELETE CASCADE ON UPDATE CASCADE,
running_pace DECIMAL(4,2),
createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY (id)

)ENGINE=InnoDB DEFAULT CHARSET=utf8MB4;

CREATE TABLE biking_distance_logs (

id INTEGER AUTO_INCREMENT,
user_id int(11),
KEY user_id (user_id),
FOREIGN KEY (user_id) REFERENCES users(id)
ON DELETE CASCADE ON UPDATE CASCADE,
group_challenge_id int(11),
KEY group_challenge_id (group_challenge_id),
FOREIGN KEY (group_challenge_id) REFERENCES group_challenges(id)
ON DELETE CASCADE ON UPDATE CASCADE,
biking_distance DECIMAL(4,2),
createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY (id)

)ENGINE=InnoDB DEFAULT CHARSET=utf8MB4;

CREATE TABLE biking_pace_logs (

id INTEGER AUTO_INCREMENT,
user_id int(11),
KEY user_id (user_id),
FOREIGN KEY (user_id) REFERENCES users(id)
ON DELETE CASCADE ON UPDATE CASCADE,
group_challenge_id int(11),
KEY group_challenge_id (group_challenge_id),
FOREIGN KEY (group_challenge_id) REFERENCES group_challenges(id)
ON DELETE CASCADE ON UPDATE CASCADE,
biking_pace DECIMAL(4,2),
createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY (id)

)ENGINE=InnoDB DEFAULT CHARSET=utf8MB4;