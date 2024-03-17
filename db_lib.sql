/*
 Navicat Premium Data Transfer

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 50718
 Source Host           : sql.iku5862.top:20455
 Source Schema         : db_lib

 Target Server Type    : MySQL
 Target Server Version : 50718
 File Encoding         : 65001

 Date: 01/06/2022 18:25:12
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book`  (
  `book_id` varchar(7) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `isbn` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `book_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `book_writer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `book_edition` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `book_publishhouse` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `book_publishdate` date NULL DEFAULT NULL,
  `book_typeid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`book_id`) USING BTREE,
  INDEX `isbn`(`isbn`) USING BTREE,
  INDEX `图书分类`(`book_typeid`) USING BTREE,
  CONSTRAINT `book_ibfk_1` FOREIGN KEY (`book_typeid`) REFERENCES `book_type` (`book_typeid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES ('1841791', '9787515350264', '人世间·上', '梁晓声', NULL, '中国青年出版社', '2017-11-17', 'I');
INSERT INTO `book` VALUES ('1928744', '9787515350264', '人世间·上', '梁晓声', NULL, '中国青年出版社', '2017-11-01', 'I');

-- ----------------------------
-- Table structure for book_type
-- ----------------------------
DROP TABLE IF EXISTS `book_type`;
CREATE TABLE `book_type`  (
  `book_typeid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `book_typename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`book_typeid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book_type
-- ----------------------------
INSERT INTO `book_type` VALUES ('A', '马克思主义、列宁主义、毛泽东思想、邓小平理论');
INSERT INTO `book_type` VALUES ('B', '哲学、宗教');
INSERT INTO `book_type` VALUES ('C', '社会科学总论');
INSERT INTO `book_type` VALUES ('D', '政治、法律');
INSERT INTO `book_type` VALUES ('E', '军事');
INSERT INTO `book_type` VALUES ('F', '经济');
INSERT INTO `book_type` VALUES ('G', '文化、科学、教育、体育');
INSERT INTO `book_type` VALUES ('H', '语言、文字');
INSERT INTO `book_type` VALUES ('I', '文学');
INSERT INTO `book_type` VALUES ('J', '艺术');
INSERT INTO `book_type` VALUES ('K', '历史、地理');
INSERT INTO `book_type` VALUES ('N', '自然科学总论');
INSERT INTO `book_type` VALUES ('O', '数理科学和化学');
INSERT INTO `book_type` VALUES ('P', '天文学、地球科学');
INSERT INTO `book_type` VALUES ('Q', '生物科学');
INSERT INTO `book_type` VALUES ('R', '医药、卫生');
INSERT INTO `book_type` VALUES ('S', '农业科学');
INSERT INTO `book_type` VALUES ('T', '工业技术');
INSERT INTO `book_type` VALUES ('U', '交通运输');
INSERT INTO `book_type` VALUES ('V', '航空、航天');
INSERT INTO `book_type` VALUES ('X', '环境科学、安全科学');
INSERT INTO `book_type` VALUES ('Z', '综合性图书');

-- ----------------------------
-- Table structure for borrow
-- ----------------------------
DROP TABLE IF EXISTS `borrow`;
CREATE TABLE `borrow`  (
  `user_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `book_id` varchar(7) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `borrow_time` datetime NOT NULL,
  INDEX `book_id`(`book_id`) USING BTREE,
  INDEX `用户名`(`user_id`) USING BTREE,
  CONSTRAINT `borrow_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `borrow_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of borrow
-- ----------------------------
INSERT INTO `borrow` VALUES ('1719200006', '1841791', '2022-05-27 10:51:34');
INSERT INTO `borrow` VALUES ('1719200006', '1841791', '2022-05-29 23:01:56');

-- ----------------------------
-- Table structure for lib_info
-- ----------------------------
DROP TABLE IF EXISTS `lib_info`;
CREATE TABLE `lib_info`  (
  `lib_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lib_info
-- ----------------------------
INSERT INTO `lib_info` VALUES ('hello');

-- ----------------------------
-- Table structure for return
-- ----------------------------
DROP TABLE IF EXISTS `return`;
CREATE TABLE `return`  (
  `user_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `book_id` varchar(7) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `return_time` datetime NOT NULL,
  INDEX `book_id`(`book_id`) USING BTREE,
  INDEX `用户名`(`user_id`) USING BTREE,
  CONSTRAINT `return_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `return_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of return
-- ----------------------------
INSERT INTO `return` VALUES ('1719200006', '1841791', '2022-05-29 23:10:40');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_typeid` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`user_id`) USING BTREE,
  INDEX `user_type`(`user_typeid`) USING BTREE,
  CONSTRAINT `user_type` FOREIGN KEY (`user_typeid`) REFERENCES `user_type` (`user_typeid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1719200006', '刘家明', '2');

-- ----------------------------
-- Table structure for user_type
-- ----------------------------
DROP TABLE IF EXISTS `user_type`;
CREATE TABLE `user_type`  (
  `user_typeid` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_typename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`user_typeid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_type
-- ----------------------------
INSERT INTO `user_type` VALUES ('0', '管理员');
INSERT INTO `user_type` VALUES ('1', '教师');
INSERT INTO `user_type` VALUES ('2', '学生');

-- ----------------------------
-- View structure for libinfo
-- ----------------------------
DROP VIEW IF EXISTS `libinfo`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `libinfo` AS select count(distinct `book_type`.`book_typeid`) AS `lib_counttypenum`,count(distinct `book`.`book_id`) AS `lib_countbooknum`,`lib_info`.`lib_desc` AS `lib_desc` from ((`book_type` join `book`) join `lib_info`) group by `lib_info`.`lib_desc`;

-- ----------------------------
-- Function structure for ifavilable
-- ----------------------------
DROP FUNCTION IF EXISTS `ifavilable`;
delimiter ;;
CREATE FUNCTION `ifavilable`(`se_bookid` varchar(7))
 RETURNS int(1)
BEGIN
	declare avi int default 1;
	set @avi=if((select borrow.borrow_time from borrow where borrow.book_id=`se_bookid` order by borrow.borrow_time desc limit 1 )>(select `return`.return_time from `return` where `return`.book_id=`se_bookid` order by `return`.return_time desc limit 1 ),0,1);
	return @avi;
END
;;
delimiter ;

-- ----------------------------
-- Function structure for ifreturn
-- ----------------------------
DROP FUNCTION IF EXISTS `ifreturn`;
delimiter ;;
CREATE FUNCTION `ifreturn`(`se_bookid` varchar(7),`se_userid` varchar(10))
 RETURNS int(1)
BEGIN
	declare ret int default 1;
	set @ret=if((select borrow.borrow_time from borrow where borrow.book_id=`se_bookid`AND borrow.user_id=`se_userid` order by borrow.borrow_time desc limit 1 )>(select `return`.return_time from `return` where `return`.book_id=`se_bookid`AND `return`.user_id=`se_userid` order by `return`.return_time desc limit 1 ),0,1);
	RETURN @ret;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for 借书
-- ----------------------------
DROP PROCEDURE IF EXISTS `借书`;
delimiter ;;
CREATE PROCEDURE `借书`(IN `book_id` varchar(7),IN `user_id` varchar(10))
BEGIN
IF ifavilable(`book_id`)=1 THEN
	insert into borrow 
	values(user_id,book_id,now());
ELSE
	select ifavilable(`book_id`) AS 是否可借;
END IF;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for 查询书籍
-- ----------------------------
DROP PROCEDURE IF EXISTS `查询书籍`;
delimiter ;;
CREATE PROCEDURE `查询书籍`(IN `se_name` varchar(255),IN `se_isbn` varchar(13))
BEGIN
SELECT
	book.isbn AS isbn, 
	book.book_id AS 图书编号,
	book.book_name AS 书名, 
	book.book_writer AS 作者, 
	book.book_edition AS 版本号, 
	book.book_publishhouse AS 出版社, 
	book.book_publishdate AS 出版日期, 
	book_type.book_typename AS 中图法分类,
	ifavilable(book.book_id) AS 是否可借
FROM
	book
	INNER JOIN
	book_type
	ON 
		book.book_typeid = book_type.book_typeid
 WHERE
	(book.isbn=se_isbn OR book.book_name=se_name);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for 查询可借书籍
-- ----------------------------
DROP PROCEDURE IF EXISTS `查询可借书籍`;
delimiter ;;
CREATE PROCEDURE `查询可借书籍`(IN `se_name` varchar(255),IN `se_isbn` varchar(13))
BEGIN
SELECT
	book.isbn AS isbn, 
	book.book_id AS 图书编号,
	book.book_name AS 书名, 
	book.book_writer AS 作者, 
	book.book_edition AS 版本号, 
	book.book_publishhouse AS 出版社, 
	book.book_publishdate AS 出版日期, 
	book_type.book_typename AS 中图法分类
FROM
	book
	INNER JOIN
	book_type
	ON 
		book.book_typeid = book_type.book_typeid
 WHERE
	(book.isbn=se_isbn OR book.book_name=se_name) AND ifavilable(book_id)=1;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for 查询用户借出书籍_copy1
-- ----------------------------
DROP PROCEDURE IF EXISTS `查询用户借出书籍_copy1`;
delimiter ;;
CREATE PROCEDURE `查询用户借出书籍_copy1`(IN `in_userid` varchar(10))
BEGIN
select * from
(SELECT
	book.book_id AS 图书编号,
	book.isbn AS isbn, 
	book.book_name AS 书名, 
	book.book_writer AS 作者, 
	book.book_edition AS 版本号, 
	book.book_publishhouse AS 出版社, 
	book.book_publishdate AS 出版日期, 
	book_type.book_typename AS 中图法分类,
	borrow.borrow_time AS 借书时间
	FROM
	book
	INNER JOIN
	book_type
	ON 
		book.book_typeid = book_type.book_typeid
	INNER JOIN
	borrow
	ON 
		book.book_id = borrow.book_id
 WHERE
	ifreturn(book.book_id,`in_userid`)=0) AS lastborrow
 order by borrow_time desc limit 1;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for 查询用户借出书籍_copy2
-- ----------------------------
DROP PROCEDURE IF EXISTS `查询用户借出书籍_copy2`;
delimiter ;;
CREATE PROCEDURE `查询用户借出书籍_copy2`(IN `in_userid` varchar(10))
BEGIN
SELECT
	book.book_id AS 图书编号,
	book.isbn AS isbn, 
	book.book_name AS 书名, 
	book.book_writer AS 作者, 
	book.book_edition AS 版本号, 
	book.book_publishhouse AS 出版社, 
	book.book_publishdate AS 出版日期, 
	book_type.book_typename AS 中图法分类,
	borrow.borrow_time AS 借书时间
FROM
	book
	INNER JOIN
	book_type
	ON 
		book.book_typeid = book_type.book_typeid
	INNER JOIN
	(select * from borrow where borrow.book_id=`book.book_id` order by borrow.borrow_time desc limit 1) AS lastborrow
	ON 
		book.book_book_id = lastborrow.book_id
 WHERE
	ifreturn(book.book_id,`in_userid`)=0;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for 查询用户在借书籍
-- ----------------------------
DROP PROCEDURE IF EXISTS `查询用户在借书籍`;
delimiter ;;
CREATE PROCEDURE `查询用户在借书籍`(IN `in_userid` varchar(10))
BEGIN
SELECT
	book.book_id AS 图书编号,
	book.isbn AS isbn, 
	book.book_name AS 书名, 
	book.book_writer AS 作者, 
	book.book_edition AS 版本号, 
	book.book_publishhouse AS 出版社, 
	book.book_publishdate AS 出版日期, 
	book_type.book_typename AS 中图法分类
FROM
	book
	INNER JOIN
	book_type
	ON 
		book.book_typeid = book_type.book_typeid
 WHERE
	ifreturn(book.book_id,`in_userid`)=0;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for 还书
-- ----------------------------
DROP PROCEDURE IF EXISTS `还书`;
delimiter ;;
CREATE PROCEDURE `还书`(IN `user_id` varchar(10),IN `book_id` varchar(7))
BEGIN
		insert into `return`
		values(user_id,book_id,now());

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for 通过ISBN查询
-- ----------------------------
DROP PROCEDURE IF EXISTS `通过ISBN查询`;
delimiter ;;
CREATE PROCEDURE `通过ISBN查询`(IN `isbn_in` varchar(13))
BEGIN
SELECT
	book.isbn AS ISBN, 
	book.book_id AS 图书编号,
	book.book_name AS 书名, 
	book.book_writer AS 作者, 
	book.book_edition AS 版本号, 
	book.book_publishhouse AS 出版社, 
	book.book_publishdate AS 出版日期, 
	book_type.book_typename AS 中图法分类, 
	lend.lend_date AS 借出日期,
	ifavilable(book.book_id) AS 是否可借
FROM
	book
	INNER JOIN
	book_type
	ON 
		book.book_typeid = book_type.book_typeid
	INNER JOIN
	lend
	ON 
		book.book_id = lend.book_id
	WHERE
	book.isbn=isbn_in;

END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
