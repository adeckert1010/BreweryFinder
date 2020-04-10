
-- Switch to the system (aka master) database
USE master;
GO

-- Delete the DemoDB Database (IF EXISTS)
--IF EXISTS(select * from sys.databases where name='DemoDB')
DROP DATABASE IF EXISTS DemoDB;
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
	image_address varchar(500),
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
	beer_image varchar(500),
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

--location 1
INSERT INTO brewery
	(location_name,bar_brewery_brewpub,image_address,background_info,address_line1,city,district,zipcode)
VALUES ('Taft', 'Brewpub', 'https://cdn.citybeat.com/files/base/scomm/cb/image/2016/06/960w/eats_tafts-ale-house_photo-jesse-fox.jpg','This is a brewery AND a pub', '1429 Race Street', 'Cincinnati', 'OH', '45202' );

--location 2
INSERT INTO brewery
	(location_name,bar_brewery_brewpub,image_address,background_info,address_line1,city,district,zipcode)
VALUES ('Rhinegeist Brewery', 'Brewpub', 'https://cincinnatiusa.com/sites/default/files/styles/Array/public/articlephotos/rhinegeist8.JPG', 'Locally made brews and local people.  What more do you need in life?', '1910 Elm Street', 'Cincinnati', 'OH', '45202');

--location 3
INSERT INTO brewery
	(location_name,bar_brewery_brewpub,image_address,background_info,address_line1,city,district,zipcode)
VALUES ('Madtree Brewing', 'Brewpub', 'https://www.cincinnatidesignawards.com/wp-content/uploads/05_MadTree_AIA-1024x672.jpg', 'Madtree sounded cooler than Happytree.  Drink-Up', '3301 Madison Road', 'Cincinnati', 'OH', '45209');

--location 4
INSERT INTO brewery
	(location_name, bar_brewery_brewpub, image_address,background_info,address_line1,city,district,zipcode)
VALUES ('Urban Artifact', 'Brewpub', 'https://www.artifactbeer.com/wp-content/uploads/2020/01/3.jpeg', 'Come for the beer -  Stay for the revolution.', '1660 Blue Rock Street', 'Cincinnati','OH','45223');

--location 5
INSERT INTO brewery
	(location_name, bar_brewery_brewpub, image_address,background_info,address_line1,address_line2,city,district,zipcode)
VALUES ('Alexandria Brewing Company', 'Brewpub', 'http://static1.squarespace.com/static/55afe3f5e4b0bc7c3d4444e2/t/57617497f699bb5f854f2e00/1586213468079/?format=1500w', 'Cincinnati style brewery in Kentucky', '7926 Alexandria Pike','Suite 1', 'Alexandria','KY','41001');

--location 6
INSERT INTO brewery
	(location_name, bar_brewery_brewpub, image_address, background_info, address_line1, city, district,zipcode)
VALUES ('13 Below Brewery', 'Brewpub','https://365cincinnati.com/wp-content/uploads/2019/04/13points-Brewery-taproom-seating-scaled.jpg','A micro craft brewery in Sayler Park along the Ohio River.','7391 Forbes Road','Cincinnati','OH','45233');  

--b1 l1
INSERT INTO beer_info
	(beer_name, beer_description, beer_image, abv, ibu, beer_type)
VALUES ('Nellie''s Keylime', 'Delicious and nutritious, part of this balanced breakfast', 'https://i1.wp.com/www.thegnarlygnome.com/wp-content/uploads/2017/09/Tafts-Nellies-1.jpg?resize=300%2C300&ssl=1', 4.8, 19,'Fruit and Field');

--b2 l1
INSERT INTO beer_info
	(beer_name, beer_description, beer_image, abv, ibu, beer_type)
VALUES ('Gavel Banger', 'American IPA brewed and dry hopped with heaps of Amariolla, Citra and Simcoe hops.', 'http://taftsbeer.com/content/uploads/2019/09/gavelbanger_can.png', 7.0, 65,'American IPA');

--b3 l1
INSERT INTO beer_info
	(beer_name, beer_description, beer_image, abv, ibu, beer_type)
VALUES ('Juicy Jubilee', 'Mandarin orange, grapefruit, papaya, and golden pineapple in a juicy IPA', 'http://taftsbeer.com/content/uploads/2019/10/jubliee_can.png', 8.6, 55,'Double India Pale Ale');

--b4 l2
INSERT INTO beer_info
	(beer_name, beer_description, beer_image, abv, ibu, beer_type)
VALUES ('Cheetah Lager', 'No cheetahs were harmed in the making of this delicious Lager', 'https://rhinegeist.com/wp-content/uploads/2018/08/Cheetah_Can_Render-576x865.png', 4.8, 6,'Lager');

--b5 l2
INSERT INTO beer_info
	(beer_name, beer_description, beer_image, abv, ibu, beer_type)
VALUES ('Little Bubs', 'Delicious Ale for the sweeter side of life.  Made with cranberry, apple, and peach', 'https://rhinegeist.com/wp-content/uploads/2019/02/LittleBubs_12oz.png', 4.7, 0,'Session Rosé Ale');

--b6 l3
INSERT INTO beer_info
	(beer_name, beer_description, beer_image, abv, ibu, beer_type)
VALUES ('Psychopathy', 'Bright ale with floral and citrus flavors', 'https://beerconnoisseur.com/sites/default/files/styles/beer_page_245w/public/beer/psychopathy-by-madtree-brewing-co.jpg?itok=dTC5asrA', 6.9, 60,'India Pale Ale');

--b7 l3
INSERT INTO beer_info
	(beer_name, beer_description, beer_image, abv, ibu, beer_type)
VALUES ('Happy Amber', 'Delightful caramel meets a floral adventure in this ale.  You deserve to indulge', 'https://images.ctfassets.net/qe08557i7rmu/6b4I8eg6CAIg8WCo4QaeE6/9d2027abc5d4cf8a5766c9d3d758d71f/Madtree_Happy_Amber_17-10-25_CBB_Issue23_reviews-051_8x10.jpg?w=900', 6.0, 30,'Amber Ale');

--b8 l1
INSERT INTO beer_info
	(beer_name, beer_description, beer_image, abv, ibu, beer_type)
VALUES ('Maverick Chocolate Porter', 'Brown porter and Maverick chocolate.  Questions?', 'https://taftsbeer.com/content/uploads/2019/10/mav.png', 5.5, 23,'Porter');

--beer 9 location 1
INSERT INTO beer_info
	(beer_name, beer_description, beer_image, abv, ibu, beer_type)
VALUES ('Nellie''s Raspberry', 'Caribbean ale with a touch of raspberry. Nellie wouldn''t steer you wrong.', 'https://taftsbeer.com/content/uploads/2019/10/nellies-pink_can.png', 4.8, 19,'Raspberry Ale');

--b10 l1
INSERT INTO beer_info
	(beer_name, beer_description, beer_image, abv, ibu, beer_type)
VALUES ('Cincy Cobra', 'Packs the citrus punch of Cincinnati legend Ezzard Charles.', 'https://taftsbeer.com/content/uploads/2019/10/cinci_can.png', 6.7, 44,'New England IPA');

--b11 l1
INSERT INTO beer_info
	(beer_name, beer_description, beer_image, abv, ibu, beer_type)
VALUES ('Nellie''s Winter Ale', 'Sweet orange peel and freshly ground coriander. A tasty wheat treat.', 'https://taftsbeer.com/content/uploads/2019/10/WinterNellies.png', 4.0, 12,'Witbier');

--b12 l2
INSERT INTO beer_info
	(beer_name, beer_description, beer_image, abv, ibu, beer_type)
VALUES ('Knowledge', 'Zesty, sharp, refined, with ingredients including dank sap.  Know it.', 'https://rhinegeist.com/wp-content/uploads/2018/08/Knowledge_Can_Render-768x1153.png', 8.5, 98,'Imperial IPA');

--b13 l1
INSERT INTO beer_info
	(beer_name, beer_description, beer_image, abv, ibu, beer_type)
VALUES ('Citrus IPA', 'Brewed with the Japanese Yuzu fruit alongside orange and pineapple hops.  A tasty seasonal treat.', 'https://taftsbeer.com/content/uploads/2019/10/citrus_can.png', 6.6, 45,'Citrus IPA');

--b14 l2
INSERT INTO beer_info
	(beer_name, beer_description, beer_image, abv, ibu, beer_type)
VALUES ('Oddjob', 'Bravely hopped with notes of pine, resin, blood orange, and ruby red grapefruit. It isn''t playing dirty to pick this Oddjob in multiplayer events.', 'https://rhinegeist.com/wp-content/uploads/2018/11/OddJob_Can_Render-768x1153.png', 8.3, 96,'Imperial IPA');

--b15 l2
INSERT INTO beer_info
	(beer_name, beer_description, beer_image, abv, ibu, beer_type)
VALUES ('Saber Tooth Tiger', 'This tiger will uppercut your senses with papaya, mango, and peach flavors across a lowkey bitter backdrop. ', 'https://rhinegeist.com/wp-content/uploads/2018/08/SaberToothTiger-768x1153.png', 8.5, 95,'Imperial IPA');

--b16 l2
INSERT INTO beer_info
	(beer_name, beer_description, beer_image, abv, ibu, beer_type)
VALUES ('Andromeda', 'This ale is as good as the similarly named Mass Effect title is bad.  Drink one for the commander.', 'https://rhinegeist.com/wp-content/uploads/2018/08/Andromeda_Can_Render-768x1153.png', 5.7, 48,'Pale Ale');

--b17 l2
INSERT INTO beer_info
	(beer_name, beer_description, beer_image, abv, ibu, beer_type)
VALUES ('Crash', 'So much to say about this beer...Too much for here.  Explosively hoppy - Tropically robust.', 'https://rhinegeist.com/wp-content/uploads/2018/08/SingleCalendarCan_Crash_001a-768x1300.png', 5.4, 44,'Pale Ale');

--b18 l2
INSERT INTO beer_info
	(beer_name, beer_description, beer_image, abv, ibu, beer_type)
VALUES ('Fiction', 'For the digital dreamer, New Zealand hops meet Belgian yeast.', 'https://rhinegeist.com/wp-content/uploads/2018/08/SingleCalendarCan_Fiction_001a-768x1300.png', 6.0, 40,'Belgian Style Pale Ale');

--b19 l2
INSERT INTO beer_info
	(beer_name, beer_description, beer_image, abv, ibu, beer_type)
VALUES ('Zen', 'A dry hopped beer with high level fruit and citrus aroma. Let Zen embrace you. ', 'https://rhinegeist.com/wp-content/uploads/2018/08/SingleCalendarCan_Zen_001a-768x1300.png', 4.8, 45,'Session IPA');

--b20 l3
INSERT INTO beer_info
	(beer_name, beer_description, beer_image, abv, ibu, beer_type)
VALUES ('Lift', 'This refreshing brew will take you to a relaxing place with a hint of orange goodness.', 'https://beerconnoisseur.com/sites/default/files/styles/beer_page_245w/public/beer/lift-by-madtree-brewing-co.jpg?itok=JdcC9sBa', 4.7, 11,'Crisp Golden Ale');

--b21 l3
INSERT INTO beer_info
	(beer_name, beer_description, beer_image, abv, ibu, beer_type)
VALUES ('Shade', 'A beer not to be thrown, this tart treat is a delicious blend of blackberry and sea salt that goes perfect with a summer day.', 'https://images.ctfassets.net/qe08557i7rmu/72RSIEJvJwDwB4qyjrd7LT/102672cad868e60d6f1d9409e840d688/Madtree_Shade.jpg?w=900', 4.6, 10,'Tart Fruit Ale');

--b22 l4
INSERT INTO beer_info
	(beer_name, beer_description, beer_image, abv, ibu, beer_type)
VALUES ('Finn', 'A golden, citrus adventure with a crisp and gleeful experience.', 'https://cdn.beeradvocate.com/im/beers/169704.jpg', 5.4, 36,'Berliner Weisse');

--b23 l4
INSERT INTO beer_info
	(beer_name, beer_description, beer_image, abv, ibu, beer_type)
VALUES ('Trivet', 'A bright and sparkling sour trip for the fruitier drinker', 'https://images.ctfassets.net/qe08557i7rmu/641N9wIVmZ4bkDkfUBfnsn/486f798c3d4042c2cb57dbb2c489f78d/Urban_Artifact_Trivet.jpg?w=900', 4.5, 11,'Cranberry Lemonade Gose');

--b24 l4
INSERT INTO beer_info
	(beer_name, beer_description, beer_image, abv, ibu, beer_type)
VALUES ('Post Card', 'A sour that delivers.', 'https://cdn.beeradvocate.com/im/beers/335773.jpg', 7.2, 30,'Double Dry-Hopped IPA');

--b25 l5
INSERT INTO beer_info
	(beer_name, beer_description, beer_image, abv, ibu, beer_type)
VALUES ('All In - Blonde Melon', 'Light, easy, and spring ready: For the ''No Rain'' fan in all of us.', 'https://untappd.akamaized.net/photos/2020_02_29/54d0f2145509cc41dabd3be21ea74288_640x640.jpg', 5.4, 17,'Blonde Ale');

--b26 l5
INSERT INTO beer_info
	(beer_name, beer_description, beer_image, abv, ibu, beer_type)
VALUES ('Grain In Blood', 'Made in honor of the great Slayer, this hard hitting barleywine is only for those who can fend for themselves.', 'https://images.squarespace-cdn.com/content/v1/55afe3f5e4b0bc7c3d4444e2/1484872292462-IEJ7S3KSC919I5OLA4HP/ke17ZwdGBToddI8pDm48kIzNWfZh9v0nvEHU3WAJ1tF7gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z4YTzHvnKhyp6Da-NYroOW3ZGjoBKy3azqku80C789l0ooWhOa5cxQSJsU3rXf8luXAp4RuSF8fCIvAJcvjt_IcZoixb7Wm7IaIkEuLM8C6Ew/_DSC5817.jpg', 8.8, 67,'American Barleywine');

--b27 l5
INSERT INTO beer_info
	(beer_name, beer_description, beer_image, abv, ibu, beer_type)
VALUES ('Bare Knuckle Brawler', 'An Irish ale with a nice malty caramel taste alongside tasty noble hops.', 'https://i1.wp.com/www.thegnarlygnome.com/wp-content/uploads/2019/08/8BC781DC-2BA6-4D61-A734-53C2782006B7.jpeg?ssl=1', 5.9, 44,'Irish Red Ale');

--b28 l5
INSERT INTO beer_info
	(beer_name, beer_description, beer_image, abv, ibu, beer_type)
VALUES ('Smokey the Pear', 'Do your part to prevent forest fires by indulging in this cider.', 'https://untappd.akamaized.net/photos/2020_02_02/dd52ac69d0cf7c3c22f92902cbd2c531_640x640.jpg', 4.9, 0,'Traditional Cider');

--b29 l5
INSERT INTO beer_info
	(beer_name, beer_description, beer_image, abv, ibu, beer_type)
VALUES ('Saturn Ascends', 'A stout made with coffee and semi-sweet dark chocolate.', 'https://untappd.akamaized.net/photos/2019_09_20/58bd7c8ed4d2ddf27a8c8c76bc90abfc_640x640.jpg', 10.3, 44,'Russian Imperial Stout');

--b30 l6
INSERT INTO beer_info
	(beer_name, beer_description, beer_image, abv, ibu, beer_type)
VALUES ('Submerged', 'This Belgian Style Wheat Ale has a moderate body profile with hints of orange and a slight hop. ', 'https://images.squarespace-cdn.com/content/v1/586009ecd1758e4fc993d43d/1509818959654-2WF6IZ9JFU3LB4WFV6H3/ke17ZwdGBToddI8pDm48kLAcPFQtsHUuAKM8TE3zhDN7gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z5QPOohDIaIeljMHgDF5CVlOqpeNLcJ80NK65_fV7S1UX2h3-7q3Q6wJPuklG__L23dQ044IoT3Xh7VO-y5bScAH3bqxw7fF48mhrq5Ulr0Hg/Submerged-Reflection.png?format=1000w', 4.7, 22,'Witbier');

--b31 l6
INSERT INTO beer_info
	(beer_name, beer_description, beer_image, abv, ibu, beer_type)
VALUES ('Fernbank', 'Malty taste and color and is made with Czech yeast, barley, and Saaz hops.', 'https://images.squarespace-cdn.com/content/v1/586009ecd1758e4fc993d43d/1531666659119-846NGWWYWB7DE1O2EI4B/ke17ZwdGBToddI8pDm48kEtbx6y5fjO5ZQ2C-tODv-17gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z4YTzHvnKhyp6Da-NYroOW3ZGjoBKy3azqku80C789l0gbmotiUu1Bj2yro-ZWLi0pm0D9si7POgSdDESS89jA-Tfy9CGOcSB4a7pXHTDfR2A/image-asset.png?format=1000w', 5.3, 36,'Czech Lager');


INSERT INTO beer_location (beer_id, location_id) VALUES (31,6);
INSERT INTO beer_location (beer_id, location_id) VALUES (30,6);
INSERT INTO beer_location (beer_id, location_id) VALUES (29,5);
INSERT INTO beer_location (beer_id, location_id) VALUES (28,5);
INSERT INTO beer_location (beer_id, location_id) VALUES (27,5);
INSERT INTO beer_location (beer_id, location_id) VALUES (26,5);
INSERT INTO beer_location (beer_id, location_id) VALUES (25,5);
INSERT INTO beer_location (beer_id, location_id) VALUES (24,4);
INSERT INTO beer_location (beer_id, location_id) VALUES (23,4);
INSERT INTO beer_location (beer_id, location_id) VALUES (22,4);
INSERT INTO beer_location (beer_id, location_id) VALUES (21,3);
INSERT INTO beer_location (beer_id, location_id) VALUES (20,3);
INSERT INTO beer_location (beer_id, location_id) VALUES (19,2);
INSERT INTO beer_location (beer_id, location_id) VALUES (18,2);
INSERT INTO beer_location (beer_id, location_id) VALUES (17,2);
INSERT INTO beer_location (beer_id, location_id) VALUES (16,2);
INSERT INTO beer_location (beer_id, location_id) VALUES (15,2);
INSERT INTO beer_location (beer_id, location_id) VALUES (14,2);
INSERT INTO beer_location (beer_id, location_id) VALUES (13,1);
INSERT INTO beer_location (beer_id, location_id) VALUES (12,2);
INSERT INTO beer_location (beer_id, location_id) VALUES (11,1);
INSERT INTO beer_location (beer_id, location_id) VALUES (10,1);
INSERT INTO beer_location (beer_id, location_id) VALUES (9,1);
INSERT INTO beer_location (beer_id, location_id) VALUES (1,1);
INSERT INTO beer_location (beer_id, location_id) VALUES (2,1);
INSERT INTO beer_location (beer_id, location_id) VALUES (3,1);
INSERT INTO beer_location (beer_id, location_id) VALUES (4,2);
INSERT INTO beer_location (beer_id, location_id) VALUES (5,2);
INSERT INTO beer_location (beer_id, location_id) VALUES (6,3);
INSERT INTO beer_location (beer_id, location_id) VALUES (7,3);
INSERT INTO beer_location (beer_id, location_id) VALUES (8,1);

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