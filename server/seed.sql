DROP DATABASE IF EXISTS	seed;
#CREATE DATABASE seed DEFAULT CHARACTER SET сp1251;
create database `seed` default charset cp1251;

USE seed;


DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id 				    INT 			NOT NULL 	AUTO_INCREMENT PRIMARY KEY,
	username	 		varchar(50) 	NOT NULL,
	password 	 		varchar(255) 	NOT NULL,
	role 				varchar(50) 	NOT NULL
	
);

DROP TABLE IF EXISTS sessions;
CREATE TABLE sessions (
	id 				INT 			NOT NULL 	AUTO_INCREMENT PRIMARY KEY,
	userId	 		INT 			NOT NULL,
	token	 		varchar(255) 	NOT NULL
);

DROP TABLE IF EXISTS categories;
CREATE TABLE categories (
	id		 			INT 			NOT NULL 	AUTO_INCREMENT PRIMARY KEY,
	name 	 		    varchar(255)    NOT NULL,
    categoryType	 	varchar(255)    NOT NULL
);


DROP TABLE IF EXISTS seedCategories;
CREATE TABLE seedCategories (
	id		 			INT 			NOT NULL 	AUTO_INCREMENT PRIMARY KEY,
    seedId				INT,
	categoryId			INT
);

DROP TABLE IF EXISTS picturies;
CREATE TABLE picturies (
	id		 			INT 			NOT NULL 	AUTO_INCREMENT PRIMARY KEY,
    seedId				INT             NOT NULL,
    picture				varchar(255) 	NOT NULL
);

DROP TABLE IF EXISTS catalogs;
CREATE TABLE catalogs (
	id		 			INT 			NOT NULL 	AUTO_INCREMENT PRIMARY KEY,
    catalog				varchar(255) 	NOT NULL
);

DROP TABLE IF EXISTS seeds;
CREATE TABLE seeds (
	id		 			INT 			    NOT NULL 	AUTO_INCREMENT PRIMARY KEY,
    name				varchar(255)        NOT NULL,
    info				TEXT,        
    price               INT
);


DROP TABLE IF EXISTS carts;
CREATE TABLE carts (
	id		 			INT 			    NOT NULL 	AUTO_INCREMENT PRIMARY KEY,
    seedId				int                 NOT NULL,
    userId              int                 NOT NULL,
    amount				int                 NOT NULL,
    price               INT                 NOT NULL
);

DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
	id		 			INT 			    NOT NULL 	AUTO_INCREMENT PRIMARY KEY,
    number				varchar(255)        NOT NULL,
    totalPrice          INT 			    NOT NULL 
);

DROP TABLE IF EXISTS baskets;
CREATE TABLE baskets (
	id		 			INT 			    NOT NULL 	AUTO_INCREMENT PRIMARY KEY,
    seedId				int                 NOT NULL,
    orderId             int                 NOT NULL,
    amount				int                 NOT NULL,
    totalPrice          INT                 NOT NULL
);

DROP TABLE IF EXISTS additionalInformations;
CREATE TABLE additionalInformations (
	id		 			INT 			    NOT NULL 	AUTO_INCREMENT PRIMARY KEY,
    seedId				int                 NOT NULL,
    title				varchar(255)        NOT NULL,
    content				varchar(255)        NOT NULL
);

ALTER TABLE `additionalInformations` 
	ADD CONSTRAINT `FK_seeds_id_addInfo_seedId` 
    FOREIGN KEY (`seedId`) REFERENCES `seeds`(`id`)
		ON DELETE CASCADE 
		ON UPDATE CASCADE;        

ALTER TABLE `seedCategories` 
	ADD CONSTRAINT `FK_categories_id_seedCategories_categoryId` 
    FOREIGN KEY (`categoryId`) REFERENCES `categories`(`id`)
		ON DELETE CASCADE 
		ON UPDATE CASCADE;

ALTER TABLE `picturies` 
	ADD CONSTRAINT `FK_seeds_id_picturies_seedId` 
    FOREIGN KEY (`seedId`) REFERENCES `seeds`(`id`)
		ON DELETE CASCADE 
		ON UPDATE CASCADE;
        
ALTER TABLE `carts` 
	ADD CONSTRAINT `FK_seeds_id_carts_seedId` 
    FOREIGN KEY (`seedId`) REFERENCES `seeds`(`id`)
		ON DELETE CASCADE 
		ON UPDATE CASCADE;

ALTER TABLE `seedCategories` 
	ADD CONSTRAINT `FK_seeds_id_seedCategories_seedId` 
    FOREIGN KEY (`seedId`) REFERENCES `seeds`(`id`)
		ON DELETE CASCADE 
		ON UPDATE CASCADE;        

        
ALTER TABLE `baskets` 
	ADD CONSTRAINT `FK_seeds_id_baskets_seedId` 
    FOREIGN KEY (`seedId`) REFERENCES `seeds`(`id`)
		ON DELETE CASCADE 
		ON UPDATE CASCADE;
        
ALTER TABLE `baskets` 
	ADD CONSTRAINT `FK_orders_id_baskets_orderId` 
    FOREIGN KEY (`orderId`) REFERENCES `orders`(`id`)
		ON DELETE CASCADE 
		ON UPDATE CASCADE;        


        
INSERT INTO `seeds` (name,info,price)
VALUES 
       ( "tomat","info1",228),
       ( "bean","info3",228),
       ( "white tomat","info4",228),
       ( "melon","info2",333),
		( "tomat","info1",228),
		( "tomat","info1",228),
		( "tomat","info1",228),
		( "tomat","info1",228),
		( "tomat","info1",228),
		( "tomat","info1",228),
		( "tomat","info1",228),
		( "tomat","info1",228),
        ( "tomat","info1",228),
        ( "tomat","info1",228),
        ( "tomat","info1",228),
        ( "tomat","info1",228),
        ( "tomat","info1",228),
        ( "tomat","info1",228),
        ( "tomat","info1",228),
        ( "tomat","info1",228),
       ( "pepper","info5",228);
           
INSERT INTO `orders` (number, totalPrice)
VALUES 
       ( "8-800-555-35-35",222),
       ( "7-986-888-21-22",333);  
              
INSERT INTO `baskets` (seedId,orderId,amount,totalPrice)
VALUES 
       ( 1,1,228,1),
       ( 2,1,11,1),
       ( 2,2,2,333);
        
INSERT INTO `picturies` (id,seedId,picture)
VALUES 
       ( 1,1,"1713438902906-1303507287_Tomato.png"),
       ( 2,1,"1713438975545-1303507287_Tomato.png"),
       ( 3,3,"1713438948850-1303507287_Tomato.png");        
        
INSERT INTO `categories` (name,categoryType)
VALUES 
       ( "тепличное","growType"),
       ( "груновое","growType"),
       ( "теплично-груптовое","growType"),
       
	   ( "Огурцы детерминантные","seedType"),
       ( "Огурцы индетерминантные","seedType"),
       ( "Томат","seedType"),
       ( "Рукола","seedType"),
       ( "Баклажан","seedType"),
       ( "Кабачок","seedType"),
       ( "Тыква","seedType"),
       ( "Капуста белокочанная поздняя","seedType"),
       ( "Капуста белокочанная средне-поздняя","seedType"),
       ( "Капуста белокочанная ранняя","seedType"),
       ( "Сельдерей","seedType"),
       ( "Лук батун","seedType"),
       ( "Лук репчатый ","seedType"),
       ( "Петрушка","seedType"),
       ( "Укроп","seedType"),
       ( "Шпинат","seedType"),
       ( "Кориандр","seedType"),
       ( "Щавель","seedType"),
       ( "Редис","seedType"),
       ( "Редька","seedType"),
       ( "Мангольд","seedType"),
       ( "Свёкла","seedType"),
       ( "Морковь","seedType"),
       ( "Салаты","seedType"),
       ( "Брокколи","seedType"),
       ( "Цветная капуста","seedType"),
       ( "Капуста пекинская ","seedType"),
	   ( "Перец","seedType"),
	   ( "Арбуз","seedType"),
	   ( "Дыня","seedType"),
       ( "Подвои","seedType"),
       ( "Кукуруза","seedType"),
       ( "Патиссон","seedType"),
       ("Sad i Ogorod","provider"),
       ("Usadba","provider"),
       ("Dobronom","provider"),	
       ("Sakata","provider"),	
	   ("Greenomica","provider"),
       ("Агрофирма поиск","provider"),
       ("Vilmorin","provider"),
       ("Maraldi","provider"),
       ("May","provider"),
	   ("Clause","provider"),
       ("Enza Zaden","provider"),
       ("Semo","provider"),
       ("Seminis","provider"),
       ("Singenta","provider"),
       ("Nunhems","provider"),
       ("Bejo","provider"),
       ("Rijk Zwaan","provider");

 

INSERT INTO `seedCategories` (seedId, categoryId)
VALUES 
       ( 1,1),
       ( 1,2),
       ( 1,5),
       (1,7),
       (1,8),
       ( 2,1),
       ( 2,4),
       ( 3,7),
       ( 3,1);   

INSERT INTO `additionalInformations` (seedId, title, content)
VALUES 
       ( 1,"topic1","info1"),
       ( 1,"topic2","info2"),
       ( 2,"topic3","info3"),
       ( 2,"topic4","info4"),
       ( 3,"topic5","info5"),
       ( 3,"topic6","info6");  

INSERT INTO `catalogs` (id, catalog)
VALUES 
       ( 1,"1714628175303-1.txt"),
       ( 2,"1714629211217-2910_Switch_Management_and_Configuration_Guide.pdf")



