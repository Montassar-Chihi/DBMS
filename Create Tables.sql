DROP TABLE LANDLORD CASCADE CONSTRAINTS;
DROP TABLE Renter CASCADE CONSTRAINTS;
DROP TABLE residential_group CASCADE CONSTRAINTS;
DROP TABLE Appartment CASCADE CONSTRAINTS;
DROP TABLE payment CASCADE CONSTRAINTS;
DROP TABLE potential_renter CASCADE CONSTRAINTS;
DROP TABLE complaint CASCADE CONSTRAINTS;

CREATE TABLE Landlord ( 
Landlord_ID  INT  NOT NULL , 
Landlord_name CHAR(30) DEFAULT NULL,  
Land_lord_Adress  CHAR(30) DEFAULT NULL , 
PRIMARY KEY (Landlord_ID) 
) ;

CREATE TABLE Renter ( 
Renter_ID  INT NOT NULL , 
Renter_name CHAR(30) DEFAULT NULL, 
renter_email  CHAR(30) DEFAULT NULL,
renter_phone INT DEFAULT NULL,
Landlord_ID  INT  DEFAULT NULL , 
PRIMARY KEY (Renter_ID) ,
FOREIGN KEY (Landlord_ID) REFERENCES Landlord
(Landlord_ID) ON DELETE CASCADE
); 

CREATE TABLE residential_group ( 
Residential_group_ID  INT NOT NULL , 
Residential_group_name  CHAR(30) DEFAULT NULL,
Residential_group_adress  CHAR(30) DEFAULT NULL,
Number_of_blocks INT DEFAULT NULL,
Number_of_appartements INT DEFAULT NULL, 
Landlord_ID  INT  DEFAULT NULL , 
PRIMARY KEY (Residential_group_ID) ,
FOREIGN KEY (Landlord_ID) REFERENCES Landlord
(Landlord_ID) ON DELETE CASCADE
) ;
 
CREATE TABLE Appartment ( 
Appartment_ID  CHAR(6) NOT NULL , 
Appartment_Block CHAR(30) DEFAULT NULL, 
Appartment_specif INT DEFAULT NULL,
Available INT DEFAULT NULL,
Renter_ID  INT DEFAULT NULL, 
Residential_group_ID  INT DEFAULT NULL,
Landlord_ID  INT  DEFAULT NULL , 
PRIMARY KEY (Appartment_ID) ,
FOREIGN KEY (Residential_group_ID) REFERENCES Residential_group
(Residential_group_ID)ON DELETE CASCADE,
FOREIGN KEY (Renter_ID) REFERENCES Renter
(Renter_ID)ON DELETE CASCADE,
FOREIGN KEY (Landlord_ID) REFERENCES Landlord
(Landlord_ID)ON DELETE CASCADE
) ;

CREATE TABLE complaint(
complaint_ID INT NOT NULL,
complaint VARCHAR(100),
Landlord_ID  INT  DEFAULT NULL ,
Renter_ID  INT DEFAULT NULL ,
FOREIGN KEY (Renter_ID) REFERENCES Renter
(Renter_ID)ON DELETE CASCADE,
FOREIGN KEY (Landlord_ID) REFERENCES Landlord
(Landlord_ID)ON DELETE CASCADE
);

CREATE TABLE Payment ( 
Payment_ID  INT NOT NULL , 
Amount INT DEFAULT NULL, 
Renter_ID  INT DEFAULT NULL ,
PoN INT DEFAULT NULL, 
PRIMARY KEY (Payment_ID) ,
FOREIGN KEY (Renter_ID) REFERENCES Renter
(Renter_ID)ON DELETE CASCADE
) ;

CREATE TABLE Potential_renter ( 
Potential_Renter_ID  INT NOT NULL , 
Potential_renter_email  CHAR(50) DEFAULT NULL,
Potential_renter_name  CHAR(30) DEFAULT NULL, 
Number_of_App_visited INT DEFAULT NULL,
Residential_group_ID  INT DEFAULT NULL ,
PRIMARY KEY (Potential_Renter_ID) ,
FOREIGN KEY (Residential_group_ID) REFERENCES Residential_group
(Residential_group_ID)ON DELETE CASCADE
);

INSERT INTO Landlord (Landlord_ID , Landlord_name  , Land_lord_Adress )
VALUES (12345678,'Montassar Chihi','AFH Nabeul');
INSERT INTO Landlord (Landlord_ID , Landlord_name  , Land_lord_Adress )
VALUES (66235498,'Harry Mack','California');
INSERT INTO Landlord (Landlord_ID , Landlord_name  , Land_lord_Adress )
VALUES (99561437,'Nasty','Hawaria Nabeul');

INSERT INTO Renter (Renter_ID ,renter_email,renter_phone ,Renter_name,Landlord_ID)
VALUES(45635791,'Mohsen Ayedi@gmail.com',38103962,'Mohsen Ayedi',12345678);
INSERT INTO Renter (Renter_ID ,renter_email,renter_phone ,Renter_name,Landlord_ID)
VALUES(31625495,'Raja kah@gmail.com',34659710,'Raja kah',12345678);
INSERT INTO Renter (Renter_ID ,renter_email,renter_phone ,Renter_name,Landlord_ID)
VALUES(11349267,'Tupac shakur@gmail.com',34364987,'Tupac shakur',12345678);
INSERT INTO Renter (Renter_ID ,renter_email,renter_phone ,Renter_name,Landlord_ID)
VALUES(36251498,'Ahmed kr@gmail.com',24064914,'Ahmed kr',12345678);
INSERT INTO Renter (Renter_ID ,renter_email,renter_phone ,Renter_name,Landlord_ID)
VALUES(14253678,'Mohamed chaari@gmail.com',32649781,'Mohamed chaari',12345678);
INSERT INTO Renter (Renter_ID ,renter_email,renter_phone ,Renter_name,Landlord_ID)
VALUES(65123498,'Med taher slama@gmail.com',92346519,'Med taher slama',12345678);
INSERT INTO Renter (Renter_ID ,renter_email,renter_phone ,Renter_name,Landlord_ID)
VALUES(13467982,'Wissem Ayed@gmail.com',53126978,'Wissem Ayed',12345678);
INSERT INTO Renter (Renter_ID ,renter_email,renter_phone ,Renter_name,Landlord_ID)
VALUES(37914682,'Bilel karnita@gmail.com',97913402,'Bilel karnita',12345678);
INSERT INTO Renter (Renter_ID ,renter_email,renter_phone ,Renter_name,Landlord_ID)
VALUES(16349731,'Khalil Mekki@gmail.com',23479167,'Khalil Mekki',12345678);
INSERT INTO Renter (Renter_ID ,renter_email,renter_phone ,Renter_name,Landlord_ID)
VALUES(25987834,'Nour Houda@gmail.com',22063468,'Nour Houda',12345678);
INSERT INTO Renter (Renter_ID ,renter_email,renter_phone ,Renter_name,Landlord_ID)
VALUES(16342597,'Mahbouba El Wardi@gmail.com',97916734,'Mahbouba El Wardi',12345678);
INSERT INTO Renter (Renter_ID ,renter_email,renter_phone ,Renter_name,Landlord_ID)
VALUES(19736431,'Olfa ben@gmail.com',91346791,'Olfa ben',12345678);
INSERT INTO Renter (Renter_ID ,renter_email,renter_phone ,Renter_name,Landlord_ID)
VALUES(12459367,'Souaad ben rjab@gmail.com',30649785,'Souaad ben rjab',12345678);
INSERT INTO Renter (Renter_ID ,renter_email,renter_phone ,Renter_name,Landlord_ID)
VALUES(17643766,'Thomas Edison@gmail.com',22346197,'Thomas Edison',12345678);
INSERT INTO Renter (Renter_ID ,renter_email,renter_phone ,Renter_name,Landlord_ID)
VALUES(45639691,'Hsan Ayedi@gmail.com',93156354,'Hsan Ayedi',12345678);
INSERT INTO Renter (Renter_ID ,renter_email,renter_phone ,Renter_name,Landlord_ID)
VALUES(31623495,'Samia kah@gmail.com',50349167,'Samia kah',12345678);
INSERT INTO Renter (Renter_ID ,renter_email,renter_phone ,Renter_name,Landlord_ID)
VALUES(11343767,'Marshall Mathers@gmail.com',97643158,'Marshall Mathers',12345678);
INSERT INTO Renter (Renter_ID ,renter_email,renter_phone ,Renter_name,Landlord_ID)
VALUES(36261498,'Ahmed Chihi@gmail.com',54316791,'Ahmed Chihi',12345678);
INSERT INTO Renter (Renter_ID ,renter_email,renter_phone ,Renter_name,Landlord_ID)
VALUES(14264678,'Mohamed Harabi@gmail.com',27356891,'Mohamed Harabi',12345678);
INSERT INTO Renter (Renter_ID ,renter_email,renter_phone ,Renter_name,Landlord_ID)
VALUES(65137498,'Youssef slama@gmail.com',98649731,'Youssef slama',12345678);
INSERT INTO Renter (Renter_ID ,renter_email,renter_phone ,Renter_name,Landlord_ID)
VALUES(13437982,'Chiheb Ayed@gmail.com',50346197,'Chiheb Ayed',12345678);
INSERT INTO Renter (Renter_ID ,renter_email,renter_phone ,Renter_name,Landlord_ID)
VALUES(37967682,'Hamouda karnita@gmail.com',97943568,'Hamouda karnita',12345678);
INSERT INTO Renter (Renter_ID ,renter_email,renter_phone ,Renter_name,Landlord_ID)
VALUES(16679731,'Sdik Mekki@gmail.com',96949792,'Sdik Mekki',12345678);
INSERT INTO Renter (Renter_ID ,renter_email,renter_phone ,Renter_name,Landlord_ID)
VALUES(25257834,'Arsalen Khmiri@gmail.com',96857413,'Arsalen Khmiri',12345678);
INSERT INTO Renter (Renter_ID ,renter_email,renter_phone ,Renter_name,Landlord_ID)
VALUES(16162597,'Eya Ben@gmail.com',26353469,'Eya Ben',12345678);
INSERT INTO Renter (Renter_ID ,renter_email,renter_phone ,Renter_name,Landlord_ID)
VALUES(19196431,'Samar Trabelsi@gmail.com',24356897,'Samar Trabelsi',12345678);
INSERT INTO Renter (Renter_ID ,renter_email,renter_phone ,Renter_name,Landlord_ID)
VALUES(12412367,'Saida ben rjab@gmail.com',23456789,'Saida ben rjab',12345678);
INSERT INTO Renter (Renter_ID ,renter_email,renter_phone ,Renter_name,Landlord_ID)
VALUES(17617766,'Albert Einstein@gmail.com',25471174,'Albert Einstein',12345678);
INSERT INTO Renter (Renter_ID ,renter_email,renter_phone ,Renter_name,Landlord_ID)
VALUES(12459300,'Behija ben rjab@gmail.com',30649700,'Behija ben rjab',12345678);
INSERT INTO Renter (Renter_ID ,renter_email,renter_phone ,Renter_name,Landlord_ID)
VALUES(17643700,'Nicolas Tesla@gmail.com',22346100,'Nicolas Tesla',12345678);
INSERT INTO Renter (Renter_ID ,renter_email,renter_phone ,Renter_name,Landlord_ID)
VALUES(45639600,'raheem Ayedi@gmail.com',93156300,'raheem Ayedi',12345678);
INSERT INTO Renter (Renter_ID ,renter_email,renter_phone ,Renter_name,Landlord_ID)
VALUES(31623400,'Lioniel Messi@gmail.com',50349100,'Lioniel Messi',12345678);
INSERT INTO Renter (Renter_ID ,renter_email,renter_phone ,Renter_name,Landlord_ID)
VALUES(11343700,'Tupac Amaru shakur@gmail.com',97643100,'Tupac Amaru shakur',12345678);
INSERT INTO Renter (Renter_ID ,renter_email,renter_phone ,Renter_name,Landlord_ID)
VALUES(36261400,'Mohamed amine chihi@gmail.com',54316001,'Mohamed amine chihi',12345678);
INSERT INTO Renter (Renter_ID ,renter_email,renter_phone ,Renter_name,Landlord_ID)
VALUES(14264600,'Mohamed bachrouch@gmail.com',27356800,'Mohamed bachrouch',12345678);
INSERT INTO Renter (Renter_ID ,renter_email,renter_phone ,Renter_name,Landlord_ID)
VALUES(65137400,'Ali slama@gmail.com',98649001,'Ali slama',12345678);
INSERT INTO Renter (Renter_ID ,renter_email,renter_phone ,Renter_name,Landlord_ID)
VALUES(13437002,'abderahmen ayed@gmail.com',50346100,'abderahmen ayed',12345678);
INSERT INTO Renter (Renter_ID ,renter_email,renter_phone ,Renter_name,Landlord_ID)
VALUES(37967600,'Mohamed karnita@gmail.com',97943500,'Mohamed karnita',12345678);
INSERT INTO Renter (Renter_ID ,renter_email,renter_phone ,Renter_name,Landlord_ID)
VALUES(16679700,'Monji Mekki@gmail.com',96949002,'Monji Mekki',12345678);
INSERT INTO Renter (Renter_ID ,renter_email,renter_phone ,Renter_name,Landlord_ID)
VALUES(25257800,'Ezer Khmiri@gmail.com',96857400,'Ezer Khmiri',12345678);
INSERT INTO Renter (Renter_ID ,renter_email,renter_phone ,Renter_name,Landlord_ID)
VALUES(16162500,'Eya Ben hafsia@gmail.com',26350069,'Eya Ben hafsia',12345678);

INSERT INTO residential_group ( Residential_group_ID, Residential_group_name ,Residential_group_adress,Number_of_blocks,Number_of_appartements,Landlord_ID)
VALUES (8000,'California Sun','California',10,35,66235498);
INSERT INTO residential_group ( Residential_group_ID, Residential_group_name ,Residential_group_adress,Number_of_blocks,Number_of_appartements,Landlord_ID)
VALUES (4235,'Mrezgua Residence','Nabeul',3,12,12345678);
INSERT INTO residential_group ( Residential_group_ID, Residential_group_name ,Residential_group_adress,Number_of_blocks,Number_of_appartements,Landlord_ID)
VALUES (4395,'Tej Bhar','Nabeul',3,12,12345678);
INSERT INTO residential_group ( Residential_group_ID, Residential_group_name ,Residential_group_adress,Number_of_blocks,Number_of_appartements,Landlord_ID)
VALUES (1658,'El Aamra','Morouj',4,16,12345678);
INSERT INTO residential_group ( Residential_group_ID, Residential_group_name ,Residential_group_adress,Number_of_blocks,Number_of_appartements,Landlord_ID)
VALUES (3249,'Balls Residence','Aouina',5,25,99561437);

INSERT INTO Appartment ( Appartment_ID, Appartment_Block, Appartment_specif,Available,
Renter_ID,Residential_group_ID,Landlord_ID)
VALUES ('A42351',1,2, 0, 45635791,4235,12345678);
INSERT INTO Appartment ( Appartment_ID, Appartment_Block, Appartment_specif,Available,
Renter_ID,Residential_group_ID,Landlord_ID)
VALUES ('B42351',1,3, 0, 31625495,4235,12345678);
INSERT INTO Appartment ( Appartment_ID, Appartment_Block, Appartment_specif,Available,
Renter_ID,Residential_group_ID,Landlord_ID)
VALUES ('C42351',1,2, 0, 11349267,4235,12345678);
INSERT INTO Appartment ( Appartment_ID, Appartment_Block, Appartment_specif,Available,
Renter_ID,Residential_group_ID,Landlord_ID)
VALUES ('D42351',1,3, 0, 36251498,4235,12345678);
INSERT INTO Appartment ( Appartment_ID, Appartment_Block, Appartment_specif,Available,
Residential_group_ID,Landlord_ID)
VALUES ('A42352',2,2, 1,4235,12345678);
INSERT INTO Appartment ( Appartment_ID, Appartment_Block, Appartment_specif,Available,
Renter_ID,Residential_group_ID,Landlord_ID)
VALUES ('B42352',2,3, 0, 65123498,4235,12345678);
INSERT INTO Appartment ( Appartment_ID, Appartment_Block, Appartment_specif,Available,
Residential_group_ID,Landlord_ID)
VALUES ('C42352',2,1, 1,4235,12345678);
INSERT INTO Appartment ( Appartment_ID, Appartment_Block, Appartment_specif,Available,
Renter_ID,Residential_group_ID,Landlord_ID)
VALUES ('D42352',2,3, 0, 37914682,4235,12345678);
INSERT INTO Appartment ( Appartment_ID, Appartment_Block, Appartment_specif,Available,
Residential_group_ID,Landlord_ID)
VALUES ('A42353',3,2, 1,4235,12345678);
INSERT INTO Appartment ( Appartment_ID, Appartment_Block, Appartment_specif,Available,
Renter_ID,Residential_group_ID,Landlord_ID)
VALUES ('B42353',3,3, 0, 25987834,4235,12345678);
INSERT INTO Appartment ( Appartment_ID, Appartment_Block, Appartment_specif,Available,
Residential_group_ID,Landlord_ID)
VALUES ('C42353',3,1, 1,4235,12345678);
INSERT INTO Appartment ( Appartment_ID, Appartment_Block, Appartment_specif,Available,
Renter_ID,Residential_group_ID,Landlord_ID)
VALUES ('D42353',3,3, 0, 19736431,4235,12345678);
INSERT INTO Appartment ( Appartment_ID, Appartment_Block, Appartment_specif,Available,
Renter_ID,Residential_group_ID,Landlord_ID)
VALUES ('A16581',1,2, 0, 45639691,1658,12345678);
INSERT INTO Appartment ( Appartment_ID, Appartment_Block, Appartment_specif,Available,
Renter_ID,Residential_group_ID,Landlord_ID)
VALUES ('B16581',1,3, 0, 31623495,1658,12345678);
INSERT INTO Appartment ( Appartment_ID, Appartment_Block, Appartment_specif,Available,
Renter_ID,Residential_group_ID,Landlord_ID)
VALUES ('C16581',1,2, 0, 11343767,1658,12345678);
INSERT INTO Appartment ( Appartment_ID, Appartment_Block, Appartment_specif,Available,
Renter_ID,Residential_group_ID,Landlord_ID)
VALUES ('D16581',1,3, 0, 36261498,1658,12345678);
INSERT INTO Appartment ( Appartment_ID, Appartment_Block, Appartment_specif,Available,
Residential_group_ID,Landlord_ID)
VALUES ('A16582',2,2, 1,1658,12345678);
INSERT INTO Appartment ( Appartment_ID, Appartment_Block, Appartment_specif,Available,
Renter_ID,Residential_group_ID,Landlord_ID)
VALUES ('B16582',2,3, 0, 12412367,1658,12345678);
INSERT INTO Appartment ( Appartment_ID, Appartment_Block, Appartment_specif,Available,
Residential_group_ID,Landlord_ID)
VALUES ('C16582',2,1, 1,1658,12345678);
INSERT INTO Appartment ( Appartment_ID, Appartment_Block, Appartment_specif,Available,
Renter_ID,Residential_group_ID,Landlord_ID)
VALUES ('D16582',2,3, 0, 37967682,1658,12345678);
INSERT INTO Appartment ( Appartment_ID, Appartment_Block, Appartment_specif,Available,
Renter_ID,Residential_group_ID,Landlord_ID)
VALUES ('A16583',3,2, 0, 16679731,1658,12345678);
INSERT INTO Appartment ( Appartment_ID, Appartment_Block, Appartment_specif,Available,
Renter_ID,Residential_group_ID,Landlord_ID)
VALUES ('B16583',3,3, 0, 25257834,1658,12345678);
INSERT INTO Appartment ( Appartment_ID, Appartment_Block, Appartment_specif,Available,
Renter_ID,Residential_group_ID,Landlord_ID)
VALUES ('C16583',3,1, 0, 16162597,1658,12345678);
INSERT INTO Appartment ( Appartment_ID, Appartment_Block, Appartment_specif,Available,
Renter_ID,Residential_group_ID,Landlord_ID)
VALUES ('D16583',3,3, 0, 19196431,1658,12345678);
INSERT INTO Appartment ( Appartment_ID, Appartment_Block, Appartment_specif,Available,
Residential_group_ID,Landlord_ID)
VALUES ('A16584',4,2, 1,1658,12345678);
INSERT INTO Appartment ( Appartment_ID, Appartment_Block, Appartment_specif,Available,
Renter_ID,Residential_group_ID,Landlord_ID)
VALUES ('B16584',4,3, 0, 17617766,1658,12345678);
INSERT INTO Appartment ( Appartment_ID, Appartment_Block, Appartment_specif,Available,
Residential_group_ID,Landlord_ID)
VALUES ('C16584',4,2, 1,1658,12345678);
INSERT INTO Appartment ( Appartment_ID, Appartment_Block, Appartment_specif,Available,
Renter_ID,Residential_group_ID,Landlord_ID)
VALUES ('D16584',4,3, 0, 17643766,1658,12345678);
INSERT INTO Appartment ( Appartment_ID, Appartment_Block, Appartment_specif,Available,
Renter_ID,Residential_group_ID,Landlord_ID)
VALUES ('A43951',1,2, 0, 12459300,4395,12345678);
INSERT INTO Appartment ( Appartment_ID, Appartment_Block, Appartment_specif,Available,
Renter_ID,Residential_group_ID,Landlord_ID)
VALUES ('B43951',1,3, 0, 17643700,4395,12345678);
INSERT INTO Appartment ( Appartment_ID, Appartment_Block, Appartment_specif,Available,
Renter_ID,Residential_group_ID,Landlord_ID)
VALUES ('C43951',1,2, 0, 45639600,4395,12345678);
INSERT INTO Appartment ( Appartment_ID, Appartment_Block, Appartment_specif,Available,
Renter_ID,Residential_group_ID,Landlord_ID)
VALUES ('D43951',1,3, 0, 31623400,4395,12345678);
INSERT INTO Appartment ( Appartment_ID, Appartment_Block, Appartment_specif,Available,
Residential_group_ID,Landlord_ID)
VALUES ('A43952',2,2, 1,4395,12345678);
INSERT INTO Appartment ( Appartment_ID, Appartment_Block, Appartment_specif,Available,
Renter_ID,Residential_group_ID,Landlord_ID)
VALUES ('B43952',2,3, 0, 11343700,4395,12345678);
INSERT INTO Appartment ( Appartment_ID, Appartment_Block, Appartment_specif,Available,
Residential_group_ID,Landlord_ID)
VALUES ('C43952',2,1, 1,4395,12345678);
INSERT INTO Appartment ( Appartment_ID, Appartment_Block, Appartment_specif,Available,
Renter_ID,Residential_group_ID,Landlord_ID)
VALUES ('D43952',2,3, 0, 36261400,4395,12345678);
INSERT INTO Appartment ( Appartment_ID, Appartment_Block, Appartment_specif,Available,
Renter_ID,Residential_group_ID,Landlord_ID)
VALUES ('A43953',3,2, 0, 14264600,4395,12345678);
INSERT INTO Appartment ( Appartment_ID, Appartment_Block, Appartment_specif,Available,
Renter_ID,Residential_group_ID,Landlord_ID)
VALUES ('B43953',3,3, 0, 65137400,4395,12345678);
INSERT INTO Appartment ( Appartment_ID, Appartment_Block, Appartment_specif,Available,
Renter_ID,Residential_group_ID,Landlord_ID)
VALUES ('C43953',3,1, 0, 13437002,4395,12345678);
INSERT INTO Appartment ( Appartment_ID, Appartment_Block, Appartment_specif,Available,
Renter_ID,Residential_group_ID,Landlord_ID)
VALUES ('D43953',3,3, 0, 37967600,4395,12345678);
INSERT INTO Appartment ( Appartment_ID, Appartment_Block, Appartment_specif,Available,
Residential_group_ID,Landlord_ID)
VALUES ('A43954',4,2, 1,4395,12345678);
INSERT INTO Appartment ( Appartment_ID, Appartment_Block, Appartment_specif,Available,
Renter_ID,Residential_group_ID,Landlord_ID)
VALUES ('B43954',4,3, 0, 16679700,4395,12345678);
INSERT INTO Appartment ( Appartment_ID, Appartment_Block, Appartment_specif,Available,
Residential_group_ID,Landlord_ID)
VALUES ('C43954',4,2, 1,4395,12345678);
INSERT INTO Appartment ( Appartment_ID, Appartment_Block, Appartment_specif,Available,
Renter_ID,Residential_group_ID,Landlord_ID)
VALUES ('D43954',4,3, 0, 25257800,4395,12345678);

INSERT INTO complaint(complaint_ID,complaint,Landlord_ID,Renter_ID)
VALUES (1,'My neighbour is loud', 12345678, 14253678);
INSERT INTO complaint(complaint_ID,complaint,Landlord_ID,Renter_ID)
VALUES (2,'Ceiling is broken', 12345678, 65123498);
INSERT INTO complaint(complaint_ID,complaint,Landlord_ID,Renter_ID)
VALUES (3,'My neighbour is loud', 12345678, 37914682);
INSERT INTO complaint(complaint_ID,complaint,Landlord_ID,Renter_ID)
VALUES (4,'My neighbour is loud', 12345678, 16342597);
INSERT INTO complaint(complaint_ID,complaint,Landlord_ID,Renter_ID)
VALUES (5,'My neighbour is loud', 12345678, 45635791);
INSERT INTO complaint(complaint_ID,complaint,Landlord_ID,Renter_ID)
VALUES (6,'My hot water is not working', 12345678, 14253678);
INSERT INTO complaint(complaint_ID,complaint,Landlord_ID,Renter_ID)
VALUES (7,'OTHER', 12345678, 36261400);
INSERT INTO complaint(complaint_ID,complaint,Landlord_ID,Renter_ID)
VALUES (8,'OTHER', 12345678, 45639600);
INSERT INTO complaint(complaint_ID,complaint,Landlord_ID,Renter_ID)
VALUES (9,'My hot water is not working', 12345678, 65137400);

INSERT INTO Payment ( Payment_ID ,Amount,Renter_ID, PoN)
VALUES(1,500,45635791, 1);
INSERT INTO Payment ( Payment_ID ,Amount,Renter_ID, PoN)
VALUES(2,600,31625495, 1);
INSERT INTO Payment ( Payment_ID ,Amount,Renter_ID, PoN)
VALUES(3,600,11349267, 1);
INSERT INTO Payment ( Payment_ID ,Amount,Renter_ID, PoN)
VALUES(4,600,36251498, 1);
INSERT INTO Payment ( Payment_ID ,Amount,Renter_ID, PoN)
VALUES(5,500,14253678, 1);
INSERT INTO Payment ( Payment_ID ,Amount,Renter_ID, PoN)
VALUES(6,600,65123498, 1);
INSERT INTO Payment ( Payment_ID ,Amount,Renter_ID, PoN)
VALUES(7,500,13467982, 1);
INSERT INTO Payment ( Payment_ID ,Amount,Renter_ID, PoN)
VALUES(8,680,37914682, 0);
INSERT INTO Payment ( Payment_ID ,Amount,Renter_ID, PoN)
VALUES(9,450,16349731, 1);
INSERT INTO Payment ( Payment_ID ,Amount,Renter_ID, PoN)
VALUES(10,500,25987834, 1);
INSERT INTO Payment ( Payment_ID ,Amount,Renter_ID, PoN)
VALUES(11,700,16342597, 1);
INSERT INTO Payment ( Payment_ID ,Amount,Renter_ID, PoN)
VALUES(12,600,19736431, 1);
INSERT INTO Payment ( Payment_ID ,Amount,Renter_ID, PoN)
VALUES(14,730,17643766, 1);
INSERT INTO Payment ( Payment_ID ,Amount,Renter_ID, PoN)
VALUES(15,630,45639691, 1);
INSERT INTO Payment ( Payment_ID ,Amount,Renter_ID, PoN)
VALUES(16,600,31623495, 1);
INSERT INTO Payment ( Payment_ID ,Amount,Renter_ID, PoN)
VALUES(17,700,11343767, 1);
INSERT INTO Payment ( Payment_ID ,Amount,Renter_ID, PoN)
VALUES(18,500,36261498, 0);
INSERT INTO Payment ( Payment_ID ,Amount,Renter_ID, PoN)
VALUES(19,600,14264678, 1);
INSERT INTO Payment ( Payment_ID ,Amount,Renter_ID, PoN)
VALUES(20,480,65137498, 1);
INSERT INTO Payment ( Payment_ID ,Amount,Renter_ID, PoN)
VALUES(21,520,13437982, 1);
INSERT INTO Payment ( Payment_ID ,Amount,Renter_ID, PoN)
VALUES(22,600,37967682, 1);
INSERT INTO Payment ( Payment_ID ,Amount,Renter_ID, PoN)
VALUES(23,700,16679731, 1);
INSERT INTO Payment ( Payment_ID ,Amount,Renter_ID, PoN)
VALUES(24,400,25257834, 0);
INSERT INTO Payment ( Payment_ID ,Amount,Renter_ID, PoN)
VALUES(25,400,16162597, 1);
INSERT INTO Payment ( Payment_ID ,Amount,Renter_ID, PoN)
VALUES(26,600,19196431, 1);
INSERT INTO Payment ( Payment_ID ,Amount,Renter_ID, PoN)
VALUES(27,530,12412367, 1);
INSERT INTO Payment ( Payment_ID ,Amount,Renter_ID, PoN)
VALUES(28,720,17617766, 0);
INSERT INTO Payment ( Payment_ID ,Amount,Renter_ID, PoN)
VALUES(29,500,12459300, 1);
INSERT INTO Payment ( Payment_ID ,Amount,Renter_ID, PoN)
VALUES(30,600,17643700, 1);
INSERT INTO Payment ( Payment_ID ,Amount,Renter_ID, PoN)
VALUES(31,600,45639600, 1);
INSERT INTO Payment ( Payment_ID ,Amount,Renter_ID, PoN)
VALUES(32,600,31623400, 1);
INSERT INTO Payment ( Payment_ID ,Amount,Renter_ID, PoN)
VALUES(33,500,11343700, 1);
INSERT INTO Payment ( Payment_ID ,Amount,Renter_ID, PoN)
VALUES(34,600,36261400, 1);
INSERT INTO Payment ( Payment_ID ,Amount,Renter_ID, PoN)
VALUES(35,500,14264600, 1);
INSERT INTO Payment ( Payment_ID ,Amount,Renter_ID, PoN)
VALUES(36,650,65137400, 0);
INSERT INTO Payment ( Payment_ID ,Amount,Renter_ID, PoN)
VALUES(37,450,13437002, 1);
INSERT INTO Payment ( Payment_ID ,Amount,Renter_ID, PoN)
VALUES(38,500,37967600, 1);
INSERT INTO Payment ( Payment_ID ,Amount,Renter_ID, PoN)
VALUES(39,700,16679700, 1);
INSERT INTO Payment ( Payment_ID ,Amount,Renter_ID, PoN)
VALUES(40,600,25257800, 1);

INSERT INTO Potential_renter (Potential_Renter_ID,Potential_renter_email,
Potential_renter_name,Number_of_App_visited ,Residential_group_ID)
VALUES (1,'Pasta@gmail.com','Pasteur',1,4235);
INSERT INTO Potential_renter (Potential_Renter_ID,Potential_renter_email,
Potential_renter_name,Number_of_App_visited ,Residential_group_ID)
VALUES (2,'Bedis@gmail.com','Bedis',3,4235);
INSERT INTO Potential_renter (Potential_Renter_ID,Potential_renter_email,
Potential_renter_name,Number_of_App_visited ,Residential_group_ID)
VALUES (4,'Georginia@gmail.com','Ronaldo',12,4395);
INSERT INTO Potential_renter (Potential_Renter_ID,Potential_renter_email,
Potential_renter_name,Number_of_App_visited ,Residential_group_ID)
VALUES (3,'Icy@gmail.com','Ice Cube',10,1658);

COMMIT;