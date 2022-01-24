/*
 Navicat Premium Data Transfer

 Source Server         : root
 Source Server Type    : MySQL
 Source Server Version : 50735
 Source Host           : localhost:3306
 Source Schema         : login

 Target Server Type    : MySQL
 Target Server Version : 50735
 File Encoding         : 65001

 Date: 24/01/2022 09:08:54
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth
-- ----------------------------
DROP TABLE IF EXISTS `auth`;
CREATE TABLE `auth`  (
  `auth_token` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `auth_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `auth_state` int(1) NOT NULL DEFAULT 0 COMMENT '0等待验证，1验证成功，2正在验证，3验证失败（过期）',
  `user_id` int(12) NOT NULL,
  `auth_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`auth_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth
-- ----------------------------
INSERT INTO `auth` VALUES ('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjo4NDQwLCJpYXQiOjE2NDI2NjQyNjQsImV4cCI6MTY0MjY2NjA2NH0.NE05EV6Om8mmS8VRHK3thcOgndEPUIrjIq2477Et7rc', '2022-01-20 15:37:44', 0, 0, 1);
INSERT INTO `auth` VALUES ('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjo5NjA4LCJpYXQiOjE2NDI2NjQyNjksImV4cCI6MTY0MjY2NjA2OX0.T2G7nRMknsAQD_uIKWSk49gSlSGRKDDprP_pPzzlRxI', '2022-01-20 15:37:49', 0, 0, 2);
INSERT INTO `auth` VALUES ('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjozNzk2NywiaWF0IjoxNjQyNjY0MzUxLCJleHAiOjE2NDI2NjYxNTF9.cmBClpy695KI-FfgTVyRaE5HkYKWmMjX5bpYt3Xj1ME', '2022-01-20 15:39:11', 0, 0, 23);
INSERT INTO `auth` VALUES ('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjo4OTcyMSwiaWF0IjoxNjQyNjY0MzUxLCJleHAiOjE2NDI2NjYxNTF9.1rusGQdEk6qNzXclzQhCKBj65ZChcg5F0EKAmbBInzo', '2022-01-20 15:39:11', 0, 0, 24);
INSERT INTO `auth` VALUES ('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjo2MjM3NCwiaWF0IjoxNjQyNjY0MzUyLCJleHAiOjE2NDI2NjYxNTJ9.WR9aHCH0H_QzZlNEXoGf5oE_ELWIFH0UA0PiqZR1kog', '2022-01-20 15:39:12', 0, 0, 25);
INSERT INTO `auth` VALUES ('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjo3MDAxNiwiaWF0IjoxNjQyNjY0MzUyLCJleHAiOjE2NDI2NjYxNTJ9.vqWEngckONN1OZ9amwVEpEwLvyp9_tram6H7ihQ2SHc', '2022-01-20 15:39:12', 0, 0, 26);
INSERT INTO `auth` VALUES ('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjoyMDQsImlhdCI6MTY0MjY2NDM2MywiZXhwIjoxNjQyNjY2MTYzfQ.UJ_LInDYr1xeFPzj-_oOI1EArm5hiIhjKBkvT8EeuIk', '2022-01-20 15:39:23', 0, 0, 27);
INSERT INTO `auth` VALUES ('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjoyNTcyNSwiaWF0IjoxNjQyNjY0MzYzLCJleHAiOjE2NDI2NjYxNjN9.i0c1OrqlNRVZMi4aPvl7O0JtMt-x2sotda8f7QGd1X4', '2022-01-20 15:39:23', 0, 0, 28);
INSERT INTO `auth` VALUES ('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjo4MzkyOCwiaWF0IjoxNjQyNjY0MzY1LCJleHAiOjE2NDI2NjYxNjV9.n37xo-jIcu0X45P3bdw_EsVboAjjSChw9JwP66EbwIE', '2022-01-20 15:39:25', 0, 0, 29);
INSERT INTO `auth` VALUES ('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjo3NDUxNSwiaWF0IjoxNjQyNjY0MzY1LCJleHAiOjE2NDI2NjYxNjV9.j-w84Xv33DGzy8w4rWBy9DzNusLZjHmHkmqvPvIxNvY', '2022-01-20 15:39:25', 0, 0, 30);
INSERT INTO `auth` VALUES ('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjo5MTA2MCwiaWF0IjoxNjQyNjY0Mzg5LCJleHAiOjE2NDI2NjYxODl9.6brx0n3UI0fl0d2WjWAXTO0n7ibQldvGHtmILE1Td5k', '2022-01-20 15:39:49', 0, 0, 31);
INSERT INTO `auth` VALUES ('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjo3OTUyNCwiaWF0IjoxNjQyNjY0NDA3LCJleHAiOjE2NDI2NjYyMDd9.5HuxWOBLy-aj6cJRIx9_yaNaedx8tPh9P9OscboyUGs', '2022-01-20 15:40:07', 0, 0, 32);
INSERT INTO `auth` VALUES ('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjo5MDgwMSwiaWF0IjoxNjQyNjY0NDA3LCJleHAiOjE2NDI2NjYyMDd9.SUTY5JZ0u1UWV9HEezrmGaw4apT3rRTZ1d4PioROT2k', '2022-01-20 15:40:07', 0, 0, 33);
INSERT INTO `auth` VALUES ('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjozNzEwOSwiaWF0IjoxNjQyNjY0NDEyLCJleHAiOjE2NDI2NjYyMTJ9.4TP0ajD9mXYVFm3ERZFw3WtP9v8j79hsOXFbGpygF2A', '2022-01-20 15:40:12', 0, 0, 34);
INSERT INTO `auth` VALUES ('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjozNDY1MiwiaWF0IjoxNjQyNjY0NDEyLCJleHAiOjE2NDI2NjYyMTJ9.3ixBnP_x9Xc1li8j0TNxy57G0cFwLkQ-ZqVw7FqlpOE', '2022-01-20 15:40:12', 0, 0, 35);
INSERT INTO `auth` VALUES ('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjo5NjI4NiwiaWF0IjoxNjQyNjY0NDQxLCJleHAiOjE2NDI2NjYyNDF9.325CyFfrb6W0Dd3tBSL6a9h10aZEfY2OqsbbdmDzK-U', '2022-01-20 15:40:41', 0, 0, 36);
INSERT INTO `auth` VALUES ('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjoyODk2MiwiaWF0IjoxNjQyNjY0NDQxLCJleHAiOjE2NDI2NjYyNDF9.k0Zf3SElazQIMrzU0e_jBbR56Sagv9r_vxMngINYZIc', '2022-01-20 15:40:41', 0, 0, 37);
INSERT INTO `auth` VALUES ('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjo2MzI4NiwiaWF0IjoxNjQyNjY0NDQ0LCJleHAiOjE2NDI2NjYyNDR9.6luUjCBCS2YvzerAMg7uhgfvR0kHWPi2VAQgXV3aLkE', '2022-01-20 15:40:44', 0, 0, 38);
INSERT INTO `auth` VALUES ('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjoyNjU0OSwiaWF0IjoxNjQyNjY0NDQ1LCJleHAiOjE2NDI2NjYyNDV9.Ql7KiBvL-eeV9R7NyvBtIAXcw5hpvlRHCt_TTtHXcMA', '2022-01-20 15:40:45', 0, 0, 39);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` int(12) NOT NULL,
  `user_password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_phone` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', 'admin', '大哥！我是你孙子！', 11);
INSERT INTO `user` VALUES (2, '123456', '123456', '小弟，我是你爷爷！', 12);

SET FOREIGN_KEY_CHECKS = 1;
