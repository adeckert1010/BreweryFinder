
-- Switch to the system (aka master) database
USE master;
GO

-- Delete the DemoDB Database (IF EXISTS)
IF EXISTS(select * from sys.databases where name='DemoDB')
DROP DATABASE DemoDB;
GO

-- Create a new DemoDB Database
CREATE DATABASE DemoDB;
GO

-- Switch to the DemoDB Database
USE DemoDB
GO

BEGIN TRANSACTION;

CREATE TABLE users
(
	id			int			identity(1,1),
	username	varchar(50)	not null,
	password	varchar(50)	not null,
	salt		varchar(50)	not null,
	role		varchar(50)	default('user'),

	constraint pk_users primary key (id)
);

CREATE TABLE main
(
	location_id int identity(1,1),
	location_name varchar(50) not null,
	bar	bit,
	brewery bit,
	brewpub bit,
	image_address varchar(200),
	established date,
	background_info varchar(500),
	address_line1 varchar(50) not null,
	address_line2 varchar(50),
	city varchar(50) not null,
	district varchar(20) not null,
	zipcode varchar(15) not null,

	constraint pk_location_id primary key (location_id)
);

CREATE TABLE beer_info
(
	beer_id int identity(1,1),
	beer_name varchar(50) not null,
	beer_description varchar(500) not null,
	beer_image varchar(200),
	abv decimal not null,
	ibu decimal,
	beer_type varchar(50)

	constraint pk_beer_id primary key (beer_id)
);

CREATE TABLE beer_location
(
	beer_id int not null,
	location_id int not null,

	foreign key (beer_id) references beer_info(beer_id),
	foreign key (location_id) references main(location_id)
);

-- default username of 'user' and default password of 'greatwall'
INSERT INTO users
  (username,password,salt,role)
VALUES
  ('user', 'jUE98uhvS5tdIlxRsmz1W7/Qaqo=', '9CWPUTvXqQ4=', 'User');

COMMIT TRANSACTION;

BEGIN TRANSACTION;

INSERT INTO main
	(location_name,brewpub,image_address,background_info,address_line1,city,district,zipcode)
VALUES ('Taft', 1, 'https://cdn.citybeat.com/files/base/scomm/cb/image/2016/06/960w/eats_tafts-ale-house_photo-jesse-fox.jpg','This is a brewery AND a pub', '1429 Race Street', 'Cincinnati', 'OH', '45202' )

COMMIT TRANSACTION;