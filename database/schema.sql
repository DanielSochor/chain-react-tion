Drop database if exists healthapp;
CREATE database healthapp;
USE healthapp;

CREATE TABLE users (    
    id int(11) NOT NULL AUTO_INCREMENT,
    username VARCHAR(20) NOT NULL UNIQUE,
    password varchar(50)  NOT NULL,
    email varchar(50) NOT NULL,
    salt varchar(50)  NOT NULL,
    session_token varchar(50),
    created DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL,
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