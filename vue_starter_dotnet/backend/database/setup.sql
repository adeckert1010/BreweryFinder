
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
USE DemoDB;
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

CREATE TABLE brewery
(
	location_id int identity(1,1),
	location_name varchar(50) not null,
	bar_brewery_brewpub varchar(8) not null,
	image_address varchar(200),
	established date,
	background_info varchar(500),
	address_line1 varchar(50) not null,
	address_line2 varchar(50),
	city varchar(50) not null,
	district varchar(20) not null,
	zipcode varchar(15) not null,

	constraint pk_location_id primary key (location_id),
	constraint ck_brewery_bar_brewpub CHECK (bar_brewery_brewpub IN ('Bar', 'Brewery','Brewpub'))
);

CREATE TABLE beer_info
(
	beer_id int identity(1,1),
	beer_name varchar(50) not null,
	beer_description varchar(500) not null,
	beer_image varchar(200),
	abv decimal not null,
	ibu int,
	beer_type varchar(50)

	constraint pk_beer_id primary key (beer_id)
);

CREATE TABLE beer_location
(
	beer_id int not null,
	location_id int not null,

   CONSTRAINT pk_beer_location_beer_id_location_id PRIMARY KEY (beer_id,location_id)
);

CREATE TABLE user_beer
(
	id_user int not null,
	beer_id int not null,

	CONSTRAINT pk_user_beer_id PRIMARY KEY (id_user, beer_id)
);

-- default username of 'user' and default password of 'greatwall'
INSERT INTO users
  (username,password,salt,role)
VALUES
  ('user', 'jUE98uhvS5tdIlxRsmz1W7/Qaqo=', '9CWPUTvXqQ4=', 'User');

INSERT INTO brewery
	(location_name,brewpub,image_address,background_info,address_line1,city,district,zipcode)
VALUES ('Taft', 1, 'https://cdn.citybeat.com/files/base/scomm/cb/image/2016/06/960w/eats_tafts-ale-house_photo-jesse-fox.jpg','This is a brewery AND a pub', '1429 Race Street', 'Cincinnati', 'OH', '45202' );

INSERT INTO beer_info
	(beer_name, beer_description, beer_image, abv, ibu, beer_type)
VALUES ('Nellies Keylime', 'Delicious and nutritious, part of this balanced breakfast', 'https://i1.wp.com/www.thegnarlygnome.com/wp-content/uploads/2017/09/Tafts-Nellies-1.jpg?resize=300%2C300&ssl=1', 4.8, 19,'Fruit and Field')

INSERT INTO beer_location
 (beer_id, location_id)
 VALUES (1,1)

 ALTER TABLE user_beer 
 ADD FOREIGN KEY (id_user)
 REFERENCES users(id); 
 
 ALTER TABLE user_beer
 ADD FOREIGN KEY (beer_id)
 REFERENCES beer_info(beer_id);

 ALTER TABLE beer_location
 ADD FOREIGN KEY (location_id)
 REFERENCES brewery(location_id);

 ALTER TABLE beer_location
 ADD FOREIGN KEY (beer_id)
 REFERENCES beer_info(beer_id);

COMMIT TRANSACTION;