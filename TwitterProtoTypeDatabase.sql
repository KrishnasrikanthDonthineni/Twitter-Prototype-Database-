

create database project; 

use project;




-- ----------------------------
-- Table structure for admin
-- ----------------------------

CREATE TABLE `Admin` (
                      `Admin_id` int  NOT NULL  ,
                      `Admin_name` VARCHAR(100) NOT NULL,
                      `Admin_pass` VARCHAR(100) NOT NULL,

 CONSTRAINT Admin_PK PRIMARY KEY(Admin_id) 
) ;

-- ----------------------------
-- Table structure for USER
-- ----------------------------

CREATE TABLE `User` (
                    `User_id` int NOT NULL ,
                    `User_name` VARCHAR(100) NOT NULL,
                    `User_Password` VARCHAR(100) NOT NULL,
                    `User_E-Mail` VARCHAR(200),
                    `User_mobile` bigint,
                    `User_address` VARCHAR(200),
                    `Admin_id`   int,

 CONSTRAINT User_PK PRIMARY KEY  (User_id),
 CONSTRAINT User_FK FOREIGN KEY (Admin_id )   REFERENCES Admin(Admin_id) 
);


-- -----------------------------------
-- Table structure for Twitter_Filter
-- -----------------------------------

CREATE TABLE `Twitter_Filter`(
                              `Twitter_Filter_Id` int NOT NULL auto_increment ,
                              `Admin_id` int,
                              `Twitter_Filter_Category` text,
                              `Twitter_Filter_Type` text,

CONSTRAINT Twitter_Filter_PK PRIMARY KEY  (Twitter_Filter_Id),
CONSTRAINT Twitter_Filter_FK FOREIGN KEY  (Admin_id) REFERENCES Admin(Admin_id) 
);

-- ----------------------------
-- Table structure for Tweets
-- ----------------------------

CREATE TABLE `Tweets`(
                      `Tweet_id` int NOT NULL auto_increment,
                      `Tweet_Title` VARCHAR(100),
                      `Tweet_Description` TEXT, 
                      `Tweet_Date` DATE,
                      `Tweet_Time` TIME,

   CONSTRAINT Tweets_PK PRIMARY KEY (Tweet_id)
);


-- -----------------------------------
-- Table structure for User_Tweet
-- -----------------------------------

CREATE TABLE `User_Tweet`(
                          `User_id` int NOT NULL REFERENCES User(User_id),
                          `Tweet_id` int NOT NULL REFERENCES Tweets(Tweet_id) ,
                         
CONSTRAINT User_Tweet_PK PRIMARY KEY (User_id,Tweet_id)

);

-- -----------------------------
-- Table structure for Re_Tweet
-- -----------------------------

CREATE TABLE `RE_Tweet`(
                        `RE_Tweet_id` int NOT NULL ,
                        `RE_Tweet_Title` VARCHAR(100),
                        `RE_Tweet_Description` text,
                        `RE_Tweet_Date`  date,
                        `RE_Tweet_Time` time,
                        `Tweet_id` int NOT NULL,
                        `User_id` int  NOT NULL,
CONSTRAINT RE_Tweet_PK PRIMARY KEY (Re_Tweet_id),
CONSTRAINT RE_Tweet_FK FOREIGN KEY (Tweet_id) REFERENCES Tweets(Tweet_id),
CONSTRAINT RE_Tweet_FK1 FOREIGN KEY (User_id) REFERENCES User(User_id)
);

-- -------------------------------------
-- Table structure for Recommend_Friend
-- -------------------------------------

CREATE TABLE `Recommend_Friend`(
                                `Recommend_Friend_Id` int NOT NULL,
                                `Rcommend_Id` int NOT NULL,
                                `User_id` int,
                                `Recommend_Friend_Rating` text,
CONSTRAINT Recommend_Friend_PK PRIMARY KEY (Recommend_Friend_Id),
CONSTRAINT Recommend_Friend_FK FOREIGN KEY (User_id) REFERENCES User(User_id)
);

-- -------------------------------------
-- Table structure for Friend_Request
-- -------------------------------------

CREATE TABLE `Friend_Request`(
                              `Friend_Request_id` int NOT NULL,
                              `Friend_Request_From` VARCHAR(100),
                              `Friend_Request_TO` VARCHAR(100),
                              `Friend_Request_Time` time,
                              `Friend_Request_Date` date,
CONSTRAINT Friend_Request_PK PRIMARY KEY (Friend_Request_id)

);

-- ------------------------------------------
-- Table structure for Friend_Request_Status
-- ------------------------------------------

CREATE TABLE `Friend_Request_Status`(
                                    `User_id` int NOT NULL REFERENCES User(User_id) ,
                                    `Friend_Request_id` int NOT NULL REFERENCES Friend_Request(Friend_Request_id) ,
                                    `Friend_Request_Status` VARCHAR(50),
CONSTRAINT Friend_Request_Status_PK  PRIMARY KEY (User_id,Friend_Request_id)

);

-- --------------------------------------
-- Table structure for User_Access_Limit
-- --------------------------------------

CREATE TABLE `User_Access_Limit`(
                                `User_Access_Limit_id` VARCHAR(20) NOT NULL,
                                `Limit_Count` int NOT NULL,
CONSTRAINT User_Access_Limit_PK PRIMARY KEY (User_Access_Limit_id)
);

-- --------------------------------
-- Table structure for User_Status
-- --------------------------------

CREATE TABLE `User_Status`(
                            `User_id` int NOT NULL  REFERENCES User(User_id)  ,
                            `User_Access_Limit_id` VARCHAR(20) NOT NULL REFERENCES User_Access_Limit(User_Access_Limit_id) ,
                            `User_limit_count` int,
                            `User_Status` VARCHAR(50) NOT NULL,
CONSTRAINT User_Status_PK PRIMARY KEY (User_id,User_Access_Limit_id)

);                                                                  



-- ----------------------------
-- Records 
-- ----------------------------       
-- ----------------------------
-- Admin
-- ----------------------------                                                                                              

insert into `Admin`values ('6492240','Krishna','99Krishna45@');
insert into `Admin`values ('6492241','John','helloSri&');
insert into `Admin`values ('6492242','Madhu','#Madhu118#');
insert into `Admin`values ('6492243','Delina','!@#845623*()');

-- ----------------------------
-- User
-- ----------------------------    

insert into `User`values ('1','Nithin','julakanti123','nithinreddy@gmail.com','8456221430','28 A colonial NewPaltz','6492240');
insert into `User`values ('2','Max','Max@23&*','maxhasmanager@gmail.com','8455222300','25 Kingston NY','6492240');
insert into `User`values ('3','Alton','&beHappy&','Altonsup@gmail.com','6239221430','150  A colonial NewPaltz','6492241');
insert into `User`values ('4','Manasa','luvUpapa90','Manasagopisetty@gmail.com','9703501802','Guntur India','6492242');
insert into `User`values ('5','Pranay','9963730322','Pranaymbbs@gmail.com','9963730322','India','6492243');
insert into `User`values ('6','Sophia','Sophi123','Sophi123@gmail.com','8452211120','Main Street NewPaltz NY','6492243');


-- ----------------------------
-- User Twitter_Filter
-- ----------------------------
insert into `Twitter_Filter` values('1','6492240','Word','bullying');
insert into `Twitter_Filter` values('2','6492241','Word','fuck');
insert into `Twitter_Filter` values('3','6492240','Link','http://www.hacktheuser.com');
insert into `Twitter_Filter` values('4','6492242','Link','http://2www.clickonit.com');
insert into `Twitter_Filter` values('5','6492243','Link','http://www.hacksyou.com');
insert into `Twitter_Filter` values('6','6492242','Word','Mother Fucker');


-- ----------------------------
-- User Tweets
-- ----------------------------
                    
insert into  `Tweets` values('1','Foot Ball','The football between SUNY teams is going pretty well.','2017/09/09','10:39:08');
insert into  `Tweets` values('2','Politics','The elections are pre-poned due to some problems in the administration.','2017/01/10','10:39:08');
insert into  `Tweets` values('3','Soccer','Soccer is a big thing in United States Of America .','2017/01/11','10:39:08');
insert into  `Tweets` values('4','Silicon Valley','According to the stats the use of artificial intelligence has been increased in Silicon Valley.','2017/09/03','10:39:08');

-- ----------------------------
-- User_Tweet
-- ----------------------------
                          
insert into `User_Tweet` values('1','1');
insert into `User_Tweet` values('2','2');
insert into `User_Tweet` values('1','3');
insert into `User_Tweet` values('2','4');


-- ----------------------------
-- Re_Tweet
-- ----------------------------

insert into `RE_Tweet` values ('1','Politics Reply','The latest update is that they are still discussing about yet to make the final decision','2017/01/10','10:40:08','2','5');
insert into `RE_Tweet` values ('2','Politics Reply','It is expected to take lot of time.it seems they have lot of issues to deal with it','2017/01/10','10:41:08','2','2');
insert into `RE_Tweet` values ('3','Soccer Reply','It is one of the big thing football is also a big thing ','2018/05/11','9:50:08','3','6');
insert into `RE_Tweet` values ('4','Soccer Reply','I also agree with you sophia  ','2018/05/11','9:55:08','3','3');


-- ----------------------------
-- Recommend_Friend
-- ----------------------------
/*`Recommend_Friend_Id` int ,`Rcommend_Id` int ,`User_id` int,`Recommend_Friend_Rating` text, */
insert into `Recommend_Friend` values ('1','1','6','Good');
insert into `Recommend_Friend` values ('2','2','6','Good in Communication');
insert into `Recommend_Friend` values ('3','3','6','Excellent Person');
insert into `Recommend_Friend` values ('4','2','1','Good in Communication');
insert into `Recommend_Friend` values ('5','3','1','Excellent Person');

-- ----------------------------
-- Friend_Request
-- ----------------------------

insert into `Friend_Request` values ('1','sophia','Pranay','12:55:08','2018/12/22');
insert into `Friend_Request` values ('2','sophia','Max','1:50:08','2018/12/22');
insert into `Friend_Request` values ('3','Pranay','Alton','10:55:08','2019/01/22');
insert into `Friend_Request` values ('4','Nithin','Alton','11:55:08','2019/02/22');

-- ----------------------------
-- Friend_Request_Status
-- ----------------------------

insert into `Friend_Request_Status` values('6','1','Pending');
insert into `Friend_Request_Status` values('2','2','ACCEPTED');
insert into `Friend_Request_Status` values('3','3','ACCEPTED');
insert into `Friend_Request_Status` values('3','4','Declined');

-- ----------------------------
-- User_Access_Limit
-- ----------------------------

insert into `User_Access_Limit` values('1','3');

-- ----------------------------
-- UUser_Status
-- ----------------------------

insert into `User_Status`values('1','1','1','Active');
insert into `User_Status`values('2','1','0','Active');
insert into `User_Status`values('3','1','2','Active');
insert into `User_Status`values('4','1','3','Compromise');
insert into `User_Status`values('5','1','1','Active');
insert into `User_Status`values('6','1','3','Compromise');  

-- ----------------------------
-- INNER JOIN
-- ----------------------------
Select ' INNER JOIN ';
 select U.User_id,U.User_name,R.Rcommend_Id,R.Recommend_Friend_Rating 
          from User U INNER JOIN Recommend_Friend R ON U.User_id = R.User_id;


-- ----------------------------
-- Outer JOIN
-- ----------------------------
Select ' Outer JOIN ';
 select U.User_id,U.User_name,T.Tweet_id from User U LEFT JOIN User_Tweet T ON U.User_id = T.User_id;

-- ----------------------------
--  SUB QUERY
-- ----------------------------
Select ' SUB QUERY ';
select User_id,User_name from User u   WHERE User_id IN (SELECT User_id from User_Status  WHERE User_limit_count ='3' );

-- ----------------------------
--  Correlated Sub Query
-- ----------------------------

select ' Correlated Sub Query ';

 SELECT * FROM user u  WHERE User_id = ANY (SELECT User_id FROM User_Tweet t  WHERE t.User_id= u.User_id);





 