/*
 Navicat Premium Dump SQL

 Source Server         : xizi_connection
 Source Server Type    : MySQL
 Source Server Version : 80040 (8.0.40)
 Source Host           : localhost:3306
 Source Schema         : clevercode

 Target Server Type    : MySQL
 Target Server Version : 80040 (8.0.40)
 File Encoding         : 65001

 Date: 10/01/2025 06:36:18
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for avatar
-- ----------------------------
DROP TABLE IF EXISTS `avatar`;
CREATE TABLE `avatar`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `mimetype` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `size` int NULL DEFAULT NULL,
  `user_id` int NULL DEFAULT NULL,
  `createAt` timestamp NULL DEFAULT (now()),
  `updateAt` timestamp NULL DEFAULT (now()) ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `filename`(`filename` ASC) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `avatar_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of avatar
-- ----------------------------
INSERT INTO `avatar` VALUES (5, '1736454696937_80aaa2c16d7d4958b7d329112c2b2c91~tplv-p14lwwcsbr-7.jpg', 'image/jpeg', 637481, 7, '2025-01-10 04:31:36', '2025-01-10 04:31:36');
INSERT INTO `avatar` VALUES (6, '1736454701567_80aaa2c16d7d4958b7d329112c2b2c91~tplv-p14lwwcsbr-7.jpg', 'image/jpeg', 637481, 7, '2025-01-10 04:31:41', '2025-01-10 04:31:41');
INSERT INTO `avatar` VALUES (7, '1736454702257_80aaa2c16d7d4958b7d329112c2b2c91~tplv-p14lwwcsbr-7.jpg', 'image/jpeg', 637481, 7, '2025-01-10 04:31:42', '2025-01-10 04:31:42');
INSERT INTO `avatar` VALUES (8, '1736454851642_6.jpg', 'image/jpeg', 53717, 7, '2025-01-10 04:34:11', '2025-01-10 04:34:11');
INSERT INTO `avatar` VALUES (9, '1736454977696_6.jpg', 'image/jpeg', 53717, 7, '2025-01-10 04:36:17', '2025-01-10 04:36:17');
INSERT INTO `avatar` VALUES (10, '1736455039194_6.jpg', 'image/jpeg', 53717, 7, '2025-01-10 04:37:19', '2025-01-10 04:37:19');
INSERT INTO `avatar` VALUES (11, '1736455105836_6.jpg', 'image/jpeg', 53717, 7, '2025-01-10 04:38:25', '2025-01-10 04:38:25');
INSERT INTO `avatar` VALUES (12, '1736455860394_6.jpg', 'image/jpeg', 53717, 7, '2025-01-10 04:51:00', '2025-01-10 04:51:00');
INSERT INTO `avatar` VALUES (13, '1736455902044_6.jpg', 'image/jpeg', 53717, 7, '2025-01-10 04:51:42', '2025-01-10 04:51:42');
INSERT INTO `avatar` VALUES (14, '1736455933369_3.jpg', 'image/jpeg', 71791, 7, '2025-01-10 04:52:13', '2025-01-10 04:52:13');
INSERT INTO `avatar` VALUES (15, '1736456013935_6.jpg', 'image/jpeg', 53717, 7, '2025-01-10 04:53:33', '2025-01-10 04:53:33');
INSERT INTO `avatar` VALUES (16, '1736456065904_6.jpg', 'image/jpeg', 53717, 7, '2025-01-10 04:54:25', '2025-01-10 04:54:25');
INSERT INTO `avatar` VALUES (17, '1736456201359_6.jpg', 'image/jpeg', 53717, 7, '2025-01-10 04:56:41', '2025-01-10 04:56:41');
INSERT INTO `avatar` VALUES (18, '1736456460630_5.jpg', 'image/jpeg', 65894, 7, '2025-01-10 05:01:00', '2025-01-10 05:01:00');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `moment_id` int NOT NULL,
  `user_id` int NOT NULL,
  `comment_id` int NULL DEFAULT (NULL),
  `createAt` timestamp NULL DEFAULT (now()),
  `updateAt` timestamp NULL DEFAULT (now()) ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `moment_id`(`moment_id` ASC) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  INDEX `comment_id`(`comment_id` ASC) USING BTREE,
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`moment_id`) REFERENCES `moment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comment_ibfk_3` FOREIGN KEY (`comment_id`) REFERENCES `comment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (1, '5554466', 6, 7, NULL, '2025-01-08 20:55:28', '2025-01-08 20:55:28');
INSERT INTO `comment` VALUES (2, '5554466', 6, 7, NULL, '2025-01-08 20:56:32', '2025-01-08 20:56:32');
INSERT INTO `comment` VALUES (6, 'agahashytr', 6, 7, NULL, '2025-01-09 16:44:42', '2025-01-09 16:44:42');
INSERT INTO `comment` VALUES (7, '漂亮妹妹', 2, 7, NULL, '2025-01-09 18:33:18', '2025-01-09 18:33:18');
INSERT INTO `comment` VALUES (8, '神仙姐姐', 2, 7, NULL, '2025-01-09 18:33:43', '2025-01-09 18:33:43');
INSERT INTO `comment` VALUES (9, '神仙姐姐', 2, 7, 7, '2025-01-09 18:37:43', '2025-01-09 18:37:43');
INSERT INTO `comment` VALUES (10, '漂亮妹妹', 2, 7, 7, '2025-01-09 18:37:58', '2025-01-09 18:37:58');

-- ----------------------------
-- Table structure for label
-- ----------------------------
DROP TABLE IF EXISTS `label`;
CREATE TABLE `label`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `createAt` timestamp NULL DEFAULT (now()),
  `updateAt` timestamp NULL DEFAULT (now()) ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `note`(`name` ASC) USING BTREE,
  UNIQUE INDEX `name`(`name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of label
-- ----------------------------
INSERT INTO `label` VALUES (1, '篮球', '2025-01-09 20:29:26', '2025-01-09 20:29:26');
INSERT INTO `label` VALUES (6, '跳舞', '2025-01-09 20:44:28', '2025-01-09 20:44:28');
INSERT INTO `label` VALUES (7, '唱歌', '2025-01-09 20:44:35', '2025-01-09 20:44:35');
INSERT INTO `label` VALUES (8, 'rap', '2025-01-09 20:44:47', '2025-01-09 20:44:47');
INSERT INTO `label` VALUES (9, '哲学', '2025-01-09 22:14:19', '2025-01-09 22:14:19');
INSERT INTO `label` VALUES (10, '科学', '2025-01-09 22:14:19', '2025-01-09 22:14:19');
INSERT INTO `label` VALUES (11, '医学', '2025-01-09 22:14:19', '2025-01-09 22:14:19');
INSERT INTO `label` VALUES (12, '美食', '2025-01-09 22:14:19', '2025-01-09 22:14:19');

-- ----------------------------
-- Table structure for moment
-- ----------------------------
DROP TABLE IF EXISTS `moment`;
CREATE TABLE `moment`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `user_id` int NOT NULL,
  `createAt` timestamp NULL DEFAULT (now()),
  `updateAt` timestamp NULL DEFAULT (now()) ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `moment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 58 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of moment
-- ----------------------------
INSERT INTO `moment` VALUES (1, 'ikun永相随~', 7, '2025-01-07 19:48:12', '2025-01-07 19:48:12');
INSERT INTO `moment` VALUES (2, '唱跳rap打篮球~', 7, '2025-01-07 19:49:33', '2025-01-07 19:49:33');
INSERT INTO `moment` VALUES (3, '秋风萧瑟，洪波涌起，远望江天暮色苍茫。', 3, '2025-01-07 20:03:17', '2025-01-07 20:03:17');
INSERT INTO `moment` VALUES (4, '一是一二三四的一', 7, '2025-01-07 20:03:17', '2025-01-07 22:38:29');
INSERT INTO `moment` VALUES (6, '孤舟蓑笠翁，独钓寒江雪，静听风声入梦来。', 5, '2025-01-07 20:03:17', '2025-01-07 20:03:17');
INSERT INTO `moment` VALUES (7, '大漠孤烟直，长河落日圆，壮志酬天涯路遥。', 9, '2025-01-07 20:03:17', '2025-01-07 20:03:17');
INSERT INTO `moment` VALUES (8, '昨夜星辰昨夜风，画楼西畔桂堂东，寄语知音共婵娟。', 1, '2025-01-07 20:03:17', '2025-01-07 20:03:17');
INSERT INTO `moment` VALUES (9, '路漫漫其修远兮，吾将上下而求索，不负韶华光阴。', 11, '2025-01-07 20:03:17', '2025-01-07 20:03:17');
INSERT INTO `moment` VALUES (10, '闲云潭影日悠悠，物换星移几度秋，心境随之变幻。', 4, '2025-01-07 20:03:17', '2025-01-07 20:03:17');
INSERT INTO `moment` VALUES (11, '浮生若梦，为欢几何？珍惜当下才是永恒的追求。', 8, '2025-01-07 20:03:17', '2025-01-07 20:03:17');
INSERT INTO `moment` VALUES (12, '桃李春风一杯酒，江湖夜雨十年灯，往事历历在目。', 2, '2025-01-07 20:03:17', '2025-01-07 20:03:17');
INSERT INTO `moment` VALUES (13, '不识庐山真面目，只缘身在此山中，感慨人情冷暖。', 6, '2025-01-07 20:03:17', '2025-01-07 20:03:17');
INSERT INTO `moment` VALUES (14, '劝君更尽一杯酒，西出阳关无故人，送别依依不舍。', 13, '2025-01-07 20:03:17', '2025-01-07 20:03:17');
INSERT INTO `moment` VALUES (15, '春蚕到死丝方尽，蜡炬成灰泪始干，奉献总在不言中。', 10, '2025-01-07 20:03:17', '2025-01-07 20:03:17');
INSERT INTO `moment` VALUES (16, '云梦泽边天欲雪，青楼曲里月当空，幽情寄此长夜中。', 3, '2025-01-07 20:03:17', '2025-01-07 20:03:17');
INSERT INTO `moment` VALUES (18, '天边树若荠，江畔洲如月，心随景动情意长。', 2, '2025-01-07 20:03:17', '2025-01-07 20:03:17');
INSERT INTO `moment` VALUES (19, '问君能有几多愁，恰似一江春水向东流，愁绪难解。', 5, '2025-01-07 20:03:17', '2025-01-07 20:03:17');
INSERT INTO `moment` VALUES (20, '采菊东篱下，悠然见南山，世外桃源般的宁静时光。', 9, '2025-01-07 20:03:17', '2025-01-07 20:03:17');
INSERT INTO `moment` VALUES (21, '千山鸟飞绝，万径人踪灭，独处静默思万千。', 11, '2025-01-07 20:03:17', '2025-01-07 20:03:17');
INSERT INTO `moment` VALUES (22, '山重水复疑无路，柳暗花明又一村，豁然开朗。', 4, '2025-01-07 20:03:17', '2025-01-07 20:03:17');
INSERT INTO `moment` VALUES (23, '松间日暮愁无尽，流水落花春去也。', 8, '2025-01-07 20:03:17', '2025-01-07 20:03:17');
INSERT INTO `moment` VALUES (24, '人生如寄，唯有孤舟承载我长夜寂寞。', 1, '2025-01-07 20:03:17', '2025-01-07 20:03:17');
INSERT INTO `moment` VALUES (25, '花谢花飞花满天，红消香断有谁怜。', 10, '2025-01-07 20:03:17', '2025-01-07 20:03:17');
INSERT INTO `moment` VALUES (27, '落霞与孤鹜齐飞，秋水共长天一色。', 3, '2025-01-07 20:03:17', '2025-01-07 20:03:17');
INSERT INTO `moment` VALUES (28, '人生若只如初见，何事秋风悲画扇，唯留青涩记忆。', 6, '2025-01-07 20:03:17', '2025-01-07 20:03:17');
INSERT INTO `moment` VALUES (29, '天阶夜色凉如水，卧看牵牛织女星。', 13, '2025-01-07 20:03:17', '2025-01-07 20:03:17');
INSERT INTO `moment` VALUES (30, '春风又绿江南岸，明月何时照我还。', 2, '2025-01-07 20:03:17', '2025-01-07 20:03:17');
INSERT INTO `moment` VALUES (31, '独在异乡为异客，每逢佳节倍思亲。', 5, '2025-01-07 20:03:17', '2025-01-07 20:03:17');
INSERT INTO `moment` VALUES (32, '床前明月光，疑是地上霜。', 11, '2025-01-07 20:03:17', '2025-01-07 20:03:17');
INSERT INTO `moment` VALUES (33, '举头望明月，低头思故乡。', 4, '2025-01-07 20:03:17', '2025-01-07 20:03:17');
INSERT INTO `moment` VALUES (34, '春眠不觉晓，处处闻啼鸟，夜来风雨声，花落知多少。', 8, '2025-01-07 20:03:17', '2025-01-07 20:03:17');
INSERT INTO `moment` VALUES (35, '落花人独立，微雨燕双飞，愁绪随风散。', 1, '2025-01-07 20:03:17', '2025-01-07 20:03:17');
INSERT INTO `moment` VALUES (36, '世间无限丹青手，一片伤心画不成，岁月如歌。', 9, '2025-01-07 20:03:17', '2025-01-07 20:03:17');
INSERT INTO `moment` VALUES (37, '人生易老天难老，岁岁重阳。', 12, '2025-01-07 20:03:17', '2025-01-07 20:03:17');
INSERT INTO `moment` VALUES (38, '且放白鹿青崖间，须行即骑访名山。', 7, '2025-01-07 20:03:17', '2025-01-07 20:03:17');
INSERT INTO `moment` VALUES (39, '夕阳西下，断肠人在天涯。', 2, '2025-01-07 20:03:17', '2025-01-07 20:03:17');
INSERT INTO `moment` VALUES (40, '春风十里扬州路，卷上珠帘总不如。', 6, '2025-01-07 20:03:17', '2025-01-07 20:03:17');
INSERT INTO `moment` VALUES (41, '独怜幽草涧边生，上有黄鹂深树鸣。', 10, '2025-01-07 20:03:17', '2025-01-07 20:03:17');
INSERT INTO `moment` VALUES (42, '大江东去，浪淘尽，千古风流人物。', 13, '2025-01-07 20:03:17', '2025-01-07 20:03:17');
INSERT INTO `moment` VALUES (43, '江山如画，一时多少豪杰。', 3, '2025-01-07 20:03:17', '2025-01-07 20:03:17');
INSERT INTO `moment` VALUES (44, '人生若只如初见，何事秋风悲画扇。', 5, '2025-01-07 20:03:17', '2025-01-07 20:03:17');
INSERT INTO `moment` VALUES (45, '天地有大美而不言，四时有明法而不议。', 8, '2025-01-07 20:03:17', '2025-01-07 20:03:17');
INSERT INTO `moment` VALUES (46, '古来圣贤皆寂寞，惟有饮者留其名。', 11, '2025-01-07 20:03:17', '2025-01-07 20:03:17');
INSERT INTO `moment` VALUES (47, '长风破浪会有时，直挂云帆济沧海。', 4, '2025-01-07 20:03:17', '2025-01-07 20:03:17');
INSERT INTO `moment` VALUES (48, '会当凌绝顶，一览众山小。', 7, '2025-01-07 20:03:17', '2025-01-07 20:03:17');
INSERT INTO `moment` VALUES (49, '生当作人杰，死亦为鬼雄。', 2, '2025-01-07 20:03:17', '2025-01-07 20:03:17');
INSERT INTO `moment` VALUES (50, '会当凌绝顶，一览众山小。', 12, '2025-01-07 20:03:17', '2025-01-07 20:03:17');
INSERT INTO `moment` VALUES (51, '落霞与孤鹜齐飞，秋水共长天一色。', 9, '2025-01-07 20:03:17', '2025-01-07 20:03:17');
INSERT INTO `moment` VALUES (52, '天生我材必有用，千金散尽还复来。', 1, '2025-01-07 20:03:17', '2025-01-07 20:03:17');
INSERT INTO `moment` VALUES (53, '春风又绿江南岸，明月何时照我还。', 3, '2025-01-07 20:03:17', '2025-01-07 20:03:17');
INSERT INTO `moment` VALUES (54, '白日依山尽，黄河入海流。', 10, '2025-01-07 20:03:17', '2025-01-07 20:03:17');
INSERT INTO `moment` VALUES (55, '唱跳rap打篮球~', 7, '2025-01-07 22:14:43', '2025-01-07 22:14:43');
INSERT INTO `moment` VALUES (56, '唱跳rap打篮球~', 7, '2025-01-08 19:31:51', '2025-01-08 19:31:51');
INSERT INTO `moment` VALUES (57, '唱跳rap打篮球~', 7, '2025-01-10 05:03:34', '2025-01-10 05:03:34');

-- ----------------------------
-- Table structure for moment_label
-- ----------------------------
DROP TABLE IF EXISTS `moment_label`;
CREATE TABLE `moment_label`  (
  `moment_id` int NOT NULL,
  `label_id` int NOT NULL,
  `createAt` timestamp NULL DEFAULT (now()),
  `updateAt` timestamp NULL DEFAULT (now()) ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`moment_id`, `label_id`) USING BTREE,
  INDEX `label_id`(`label_id` ASC) USING BTREE,
  CONSTRAINT `moment_label_ibfk_1` FOREIGN KEY (`moment_id`) REFERENCES `moment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `moment_label_ibfk_2` FOREIGN KEY (`label_id`) REFERENCES `label` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of moment_label
-- ----------------------------
INSERT INTO `moment_label` VALUES (38, 1, '2025-01-09 22:34:06', '2025-01-09 22:34:06');
INSERT INTO `moment_label` VALUES (38, 8, '2025-01-09 22:34:06', '2025-01-09 22:34:06');
INSERT INTO `moment_label` VALUES (38, 9, '2025-01-09 22:34:06', '2025-01-09 22:34:06');
INSERT INTO `moment_label` VALUES (38, 10, '2025-01-09 22:34:06', '2025-01-09 22:34:06');
INSERT INTO `moment_label` VALUES (38, 11, '2025-01-09 22:34:06', '2025-01-09 22:34:06');
INSERT INTO `moment_label` VALUES (38, 12, '2025-01-09 22:34:06', '2025-01-09 22:34:06');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `createAt` timestamp NULL DEFAULT (now()),
  `updateAt` timestamp NULL DEFAULT (now()) ON UPDATE CURRENT_TIMESTAMP,
  `avatar_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '打个分', 'e10adc3949ba59abbe56e057f20f883e', '2025-01-07 19:56:15', '2025-01-07 19:56:15', NULL);
INSERT INTO `user` VALUES (2, 'safag', 'e10adc3949ba59abbe56e057f20f883e', '2025-01-07 19:56:24', '2025-01-07 19:56:24', NULL);
INSERT INTO `user` VALUES (3, '阿嘎噶', 'e10adc3949ba59abbe56e057f20f883e', '2025-01-07 19:56:50', '2025-01-07 19:56:50', NULL);
INSERT INTO `user` VALUES (4, '空间结构', 'e10adc3949ba59abbe56e057f20f883e', '2025-01-07 19:57:07', '2025-01-07 19:57:07', NULL);
INSERT INTO `user` VALUES (5, 'jamess', '9e0501e8d31a9114e4a1364bd5502e83', '2025-01-06 22:43:49', '2025-01-06 22:43:49', NULL);
INSERT INTO `user` VALUES (6, 'yixizi', '4297f44b13955235245b2497399d7a93', '2025-01-06 22:44:26', '2025-01-06 22:44:26', NULL);
INSERT INTO `user` VALUES (7, 'why', 'e10adc3949ba59abbe56e057f20f883e', '2025-01-07 17:28:05', '2025-01-10 04:52:13', 'http://127.0.0.1:8000/users/avatar/7');
INSERT INTO `user` VALUES (8, 'why32', 'e10adc3949ba59abbe56e057f20f883e', '2025-01-07 19:52:10', '2025-01-07 19:52:10', NULL);
INSERT INTO `user` VALUES (9, 'why2', 'e10adc3949ba59abbe56e057f20f883e', '2025-01-07 19:52:13', '2025-01-07 19:52:13', NULL);
INSERT INTO `user` VALUES (10, '1314', 'e10adc3949ba59abbe56e057f20f883e', '2025-01-07 19:52:16', '2025-01-07 19:52:16', NULL);
INSERT INTO `user` VALUES (11, '十大高手gg', 'e10adc3949ba59abbe56e057f20f883e', '2025-01-07 19:52:19', '2025-01-07 19:52:19', NULL);
INSERT INTO `user` VALUES (12, '喜欢就', 'e10adc3949ba59abbe56e057f20f883e', '2025-01-07 19:52:22', '2025-01-07 19:52:22', NULL);
INSERT INTO `user` VALUES (13, '16你的号', 'e10adc3949ba59abbe56e057f20f883e', '2025-01-07 19:52:26', '2025-01-07 19:52:26', NULL);

SET FOREIGN_KEY_CHECKS = 1;
