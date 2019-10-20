SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS property;
DROP TABLE IF EXISTS user;




/* Create Tables */

CREATE TABLE property
(
	id int NOT NULL AUTO_INCREMENT,
	address varchar(255) NOT NULL,
	title varchar(255) NOT NULL,
	district varchar(255) NOT NULL,
	city varchar(255) NOT NULL,
	country varchar(255) NOT NULL,
	price float NOT NULL,
	realtor varchar(255) NOT NULL,
	owner varbinary(255) NOT NULL,
	owner_email varchar(255) NOT NULL,
	owner_phone varchar(15) NOT NULL,
	funded boolean NOT NULL,
	owns boolean NOT NULL,
	trade boolean NOT NULL,
	not_updated boolean DEFAULT '0' NOT NULL,
	created_at datetime DEFAULT NOW(), SYSDATE() NOT NULL,
	updated_at datetime DEFAULT NOW(), SYSDATE() NOT NULL,
	created_by int NOT NULL,
	PRIMARY KEY (id),
	UNIQUE (id)
);


CREATE TABLE user
(
	id int NOT NULL AUTO_INCREMENT,
	name varchar(160) NOT NULL,
	email varchar(255) NOT NULL,
	password varchar(255) NOT NULL,
	latitude float NOT NULL,
	longitude float NOT NULL,
	created_at datetime DEFAULT NOW(), SYSDATE() NOT NULL,
	PRIMARY KEY (id),
	UNIQUE (id),
	UNIQUE (email)
);



/* Create Foreign Keys */

ALTER TABLE property
	ADD FOREIGN KEY (created_by)
	REFERENCES user (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



