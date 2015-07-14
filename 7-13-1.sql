/*
MySQL Data Transfer
Source Host: localhost
Source Database: library
Target Host: localhost
Target Database: library
Date: 2015/7/13 21:40:02
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `bookId` int(11) NOT NULL auto_increment,
  `bookName` varchar(80) NOT NULL,
  `bookAuthor` varchar(20) NOT NULL,
  `bookPress` varchar(30) NOT NULL,
  `bookPressTime` varchar(4) NOT NULL,
  `bookISBN` varchar(100) NOT NULL,
  `bookPicture` varchar(100) NOT NULL,
  `bookType` int(11) NOT NULL,
  `bookInfo` text NOT NULL,
  `bookAddTime` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `bookFindNumber` varchar(20) NOT NULL,
  `bookTotalAmount` tinyint(4) NOT NULL,
  `bookAccessAmount` tinyint(4) NOT NULL,
  `bookHistory` int(11) default '0',
  PRIMARY KEY  (`bookId`),
  UNIQUE KEY `bookISBN` (`bookISBN`),
  UNIQUE KEY `bookFindNumber` (`bookFindNumber`),
  KEY `book_type_fk1` (`bookType`),
  CONSTRAINT `book_type_fk1` FOREIGN KEY (`bookType`) REFERENCES `type` (`typeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bookstore
-- ----------------------------
DROP TABLE IF EXISTS `bookstore`;
CREATE TABLE `bookstore` (
  `userId` int(11) NOT NULL default '0',
  `bookId` int(11) NOT NULL default '0',
  PRIMARY KEY  (`userId`,`bookId`),
  KEY `bookStore_book_fk1` (`bookId`),
  CONSTRAINT `bookStore_book_fk1` FOREIGN KEY (`bookId`) REFERENCES `book` (`bookId`),
  CONSTRAINT `bookStore_user_fk1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for borrow
-- ----------------------------
DROP TABLE IF EXISTS `borrow`;
CREATE TABLE `borrow` (
  `borrowId` int(11) NOT NULL auto_increment,
  `userId` int(11) NOT NULL default '0',
  `bookId` int(11) NOT NULL default '0',
  `borrowDate` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `borrowReturnDate` timestamp NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`borrowId`,`userId`,`bookId`),
  KEY `borrow_user_fk1` (`userId`),
  KEY `borrow_book_fk1` (`bookId`),
  CONSTRAINT `borrow_book_fk1` FOREIGN KEY (`bookId`) REFERENCES `book` (`bookId`),
  CONSTRAINT `borrow_user_fk1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for returning
-- ----------------------------
DROP TABLE IF EXISTS `returning`;
CREATE TABLE `returning` (
  `returnId` int(11) NOT NULL auto_increment,
  `userId` int(11) NOT NULL default '0',
  `bookId` int(11) NOT NULL default '0',
  `returnDate` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`returnId`,`userId`,`bookId`),
  KEY `return_user_fk1` (`userId`),
  KEY `return_book_fk1` (`bookId`),
  CONSTRAINT `return_book_fk1` FOREIGN KEY (`bookId`) REFERENCES `book` (`bookId`),
  CONSTRAINT `return_user_fk1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for subscribe
-- ----------------------------
DROP TABLE IF EXISTS `subscribe`;
CREATE TABLE `subscribe` (
  `subscribId` int(11) NOT NULL auto_increment,
  `userId` int(11) NOT NULL default '0',
  `bookId` int(11) NOT NULL default '0',
  `stete` varchar(20) default NULL,
  PRIMARY KEY  (`subscribId`,`userId`,`bookId`),
  KEY `subscribe_user_fk1` (`userId`),
  KEY `subscribe_book_fk1` (`bookId`),
  CONSTRAINT `subscribe_book_fk1` FOREIGN KEY (`bookId`) REFERENCES `book` (`bookId`),
  CONSTRAINT `subscribe_user_fk1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type` (
  `typeId` int(11) NOT NULL auto_increment,
  `typeName` varchar(20) NOT NULL,
  PRIMARY KEY  (`typeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userId` int(11) NOT NULL auto_increment,
  `userName` varchar(16) NOT NULL,
  `userPassword` char(32) NOT NULL,
  `useright` tinyint(4) default '0',
  `userNickname` varchar(20) default NULL,
  `userEmail` varchar(50) default NULL,
  `userPhone` varchar(11) default NULL,
  PRIMARY KEY  (`userId`),
  UNIQUE KEY `userName` (`userName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `book` VALUES ('2', '福尔摩斯探案全集', '亚瑟·柯南·道尔', '中华书局', '2012', '978-7-101-08911-0', 'http://localhost:8000/LibraryTest/context/img/book/1507130858142.jpg', '3', '《福尔摩斯探案全集》可谓是开辟了侦探小说历史“黄金时代”的不朽经典。福尔摩斯小说，一百多年来被译成57种文字，风靡全世界，被推理迷们称为推理小说中的《圣经》，是历史上最受读者推崇、绝对不能错过的侦探小说，也是一本老少咸宜的奇妙书籍。从《暗红习作 》诞生到现在的一百多年间，福尔摩斯打遍天下无敌手，影响力早已越过推理一隅，成为人们心中神探的代名词。《福尔摩斯探案全集》的出版使福尔摩斯在英国读者中成为妇孺皆知的英雄，也使其作者柯南·道尔一举成名，后人更是称其为“侦探小说之父”。', '2015-07-13 20:58:14', 'I561.456', '4', '3', '0');
INSERT INTO `book` VALUES ('3', '平凡的世界', '路遥', '北京十月文艺出版社', '2012', '978-7-5302-1200-4', 'http://localhost:8000/LibraryTest/context/img/book/1507130904203.jpg', '4', '《平凡的世界(套装共3册)》是一部现实主义小说，也是小说化的家族史。作家高度浓缩了中国西北农村的历史变迁过程，作品达到了思想性与艺术性的高度统一，特别是主人公面对困境艰苦奋斗的精神，对今天的大学生朋友仍有启迪。这是一部全景式地表现中国当代城乡社会生活的长篇小说。《平凡的 世界(套装共3册)》共三部。作者在近十年问广阔背景上，通过复杂的矛盾纠葛，刻画了社会各阶层众多普通人的形象。劳动与爱情，挫折与追求，痛苦与欢乐，日常生活与巨大社会冲突，纷繁地交织在一起，深刻地展示了普通人在大时代历史进程中所走过的艰难曲折的道路。', '2015-07-13 21:04:20', 'I247.57', '5', '4', '0');
INSERT INTO `book` VALUES ('4', '神雕侠侣', '金庸', '广州出版社', '2013', '978-7-5462-1335-4', 'http://localhost:8000/LibraryTest/context/img/book/1507130905244.jpg', '5', '《神雕侠侣》讲述了南宋年间，蒙古大军围攻襄阳城。大侠郭靖带领城内军民殊死抵抗。郭靖义弟杨康的遗腹子杨过投身古墓派，并与师父小龙女展开一场为世俗所不容的师徒之恋。欲杀郭靖为父报仇的杨过，最终却感于郭靖“侠之大者、为国为民”的赤子之心，毅然助其守城。屡建奇功的神雕大侠杨过，身受断臂之痛、情花之毒，却不畏艰难险阻，一心追求自己的真爱，经历世人难以想象的种种磨难，有情人终成眷属。', '2015-07-13 21:05:24', 'I247.58', '6', '6', '0');
INSERT INTO `book` VALUES ('5', '鲁迅全集', '鲁迅', '人民文学出版社', '2005', '7-02-005033-6', 'http://localhost:8000/LibraryTest/context/img/book/1507130906445.jpg', '11', '新版《鲁迅全集》由原来的16卷增至18卷，书信、日记各增加了一卷，共计创作10卷，书信4卷，日记3卷，索引1卷，总字数约700万字。与1981年版相比，此次《鲁迅全集》修订集中在三个方面：佚文佚信的增收；原著的文本校勘；注释的增补修改。 ★收文：书信、日记各增加了一卷 此次修订，增收新的佚文23篇，佚信20封，鲁迅致许广平的《两地书》原信68封，鲁迅与增田涉答问函件集编文字约10万字。 ', '2015-07-13 21:06:44', 'I210.1', '9', '5', '0');
INSERT INTO `book` VALUES ('11', '倚天屠龙记', '金庸', '广州出版社', '2013', '978-7-5462-1337-8', 'http://localhost:8000/LibraryTest/context/img/book/1507130910136.jpg', '5', '《金庸作品集(16-19):倚天屠龙记(新修版)(套装共4册)》以元朝末年为历史背景，叙述了明教教主、武当弟子张无忌率领明教教众和江湖豪杰反抗元朝暴政的故事。不祥的屠龙刀使主人公少年张无忌幼失怙恃，身中玄冥毒掌，历尽江湖险恶、种种磨难，最终却造就他一身的绝世武功和慈悲心怀。他是统驭万千教众和武林豪杰的盟主，为救世人于水火可以慷慨赴死；他是优柔寡断的多情少年，面对深爱他的赵敏、周芷若和蛛儿，始终无法做出感情抉择。\r\n', '2015-07-13 21:10:13', 'I247', '5', '3', '0');
INSERT INTO `book` VALUES ('12', '南音', '笛安', '长江文艺出版社', '2012', '978-7-5354-5252-8', 'http://localhost:8000/LibraryTest/context/img/book/1507130913557.jpg', '4', '《南音(上)》编辑推荐：经过了《西决》的舒缓，以及《东霓》的恣意，“龙城三部曲”的落幕之作——《南音》更为复杂，也更为沉重。前两部中登场过的几乎所有角色，在《南音》里都将面临全新的考验。一幕幕更为尖锐的冲突就此上演，关于忠诚和背叛，关于在几种质地不同却同样真诚的“爱”里 的选择，甚至关于正邪是非，关于罪孽和救赎，关于生死。笛安用超越年龄的睿智、沉稳与娴熟的文字，丰满而立体的展现了一个家族的命运。', '2015-07-13 21:13:55', 'I247.5', '4', '2', '0');
INSERT INTO `book` VALUES ('13', '最好的我们', '八月长安', '湖南文艺出版社', '2013', '978-7-5404-6264-2', 'http://localhost:8000/LibraryTest/context/img/book/1507130914358.jpg', '4', '本书以怀旧的笔触讲述了女主角耿耿和男主角余淮同桌三年的故事，耿耿余淮，这么多年一路走过的成长故事极为打动人心，整个故事里有的都是在成长过程中细碎的点点滴滴，将怀旧写到了极致，将记忆也写到了极致。', '2015-07-13 21:14:35', 'I247.56', '6', '5', '0');
INSERT INTO `book` VALUES ('14', '原来你还在这里', '辛夷坞', '朝华出版社', '2007', '978-7-5054-1773-1', 'http://localhost:8000/LibraryTest/context/img/book/1507130918069.jpg', '13', '苏韵锦爱上了高中同学程铮，程铮也深深爱着她。但是家庭背景不同的二人，生活上的差异要彼此分开。而韵锦在分开之后才发觉有了程铮的孩子。个性强的韵锦没有告知程铮。在几年后，韵锦事业有成发觉程铮又出现在她的生活中，她们的爱情会开花结果吗？\r\n', '2015-07-13 21:18:06', 'I247.1', '6', '1', '0');
INSERT INTO `book` VALUES ('15', '超级公务员', '水浒', '中国青年出版社', '2014', '978-7-5153-1772-4', 'http://localhost:8000/LibraryTest/context/img/book/15071309185110.jpg', '4', '这是一部当代的新官场小说，也是一部标准的主旋律小说。把官场小说和主旋律小说结合到一起，是这部小说的最大特色。小说写了一个出身草根家庭的“普通”青年，是怎样从一个社会底层的大学生一步步成为你不大可能想象的超级公务员，三十岁出头就担任了正局级市委书记。这位主人公的仕途，可谓惊心动魄。他靠着自己的良心和智慧，一路过五关斩六将，横扫江湖混混儿、黑商和贪官。这部小说还触及了当今社会改革的部分难点和热点。从书中，你可以体会到做一个受人民欢迎的好官实在太难。钢铁是怎样炼成的，看了本书你就会有答案。', '2015-07-13 21:18:51', 'I247.50', '7', '5', '0');
INSERT INTO `book` VALUES ('16', '人的问题', '托马斯·内格尔', '上海译文出版社', '2014', '978-7-5327-6561-4', 'http://localhost:8000/LibraryTest/context/img/book/15071309193811.jpg', '8', '《人的问题》探讨人生的意义、本质和价值。作者从对待死亡、性行为、社会不平等、自由和价值等更为基本的哲学问题，引申出有关人格同一性、意识、自由和价值等更为基本的哲学问题。贯串全书的中心，乃是个体的人生观及其与各种非个人的实在概念的关系这一问题。正是这个问题，突破了哲学内部的界线，从伦理学延伸到形而上学。同样出于对这个问题的关注，引发了论述心的哲学、论荒诞、论道德运气的文章。作者的论述清晰明了，体现了分析哲学的特有风格。\r\n', '2015-07-13 21:19:38', 'B821-49', '4', '3', '0');
INSERT INTO `book` VALUES ('17', '圣经导读', '戈登·菲 道格拉斯·斯图尔特', '北京大学出版社', '2005', '7-301-09324-1', 'http://localhost:8000/LibraryTest/context/img/book/15071309204112.jpg', '12', '《圣经导读》由两位著名的圣经学者联手合著。书中概述了圣经著作的主要文学类型，并且提出了不同类型的解释原则。作者在每一部分都提供了深入浅出的实例分析，帮助读者学会解读圣经的方法。该书出版后备受欢迎，已成为圣经读者必备的参考书。\r\n', '2015-07-13 21:20:41', 'B971', '2', '2', '0');
INSERT INTO `book` VALUES ('19', '微观经济理论', '安德鲁·马斯-科莱尔', '中国人民大学出版社', '2014', '978-7-300-19986-3', 'http://localhost:8000/LibraryTest/context/img/book/15071309215413.jpg', '9', '《微观经济理论》一书是最近十余年来欧美经济学界最具影响力的微观经济学教科书。本书涵盖了当今经济学基础理论中的几乎所有重大命题、核心思想和严格的数学证明，是一本高度抽象和严谨但又强调直觉的大作。本书是公认的微观经济理论的圣经，已被国外几乎所有的一流大学采用，是经济学学子的必读教科书。\r\n', '2015-07-13 21:21:54', 'F016', '6', '1', '0');
INSERT INTO `book` VALUES ('20', '山月不知心底事', '辛夷坞', '朝华出版社', '2008', '978-7-5054-1834-9', 'http://localhost:8000/LibraryTest/context/img/book/15071309225314.jpg', '13', '十七年前的月亮下，叶骞泽对向远说：我们永远不会分开，后来他还是离开了，向远一直以为，分开他们的是时间，是距离，是人生不可控制的转折，后来才知道，即使他贸住了叶骞泽，总有一天，当他遇上了叶灵，她还是会爱上她。\r\n', '2015-07-13 21:22:53', 'I247.23', '3', '1', '0');
INSERT INTO `book` VALUES ('21', '元好问诗编年校注', '元好问', '中华书局', '2011', '978-7-101-07579-3', 'http://localhost:8000/LibraryTest/context/img/book/15071309234415.jpg', '11', '此为金元大家元好问诗集的全新整理本，分校勘、编年、注释三部分。校勘部分以毛本为底本，以李诗本、李全本、施本为主校本，参校方本、郭本、姚本，力求超越前贤，接近元好问诗的原貌；编年方面，主要以狄宝心的《元好问年谱新编》为基础，结合校注成果，对元氏全部诗作做系统考察，对相关成果得失做全面梳理；注释方面，近世注本皆为选本，此次针对现今研究需要提供较详的全诗注释\r\n', '2015-07-13 21:23:44', 'I222.746', '2', '2', '0');
INSERT INTO `book` VALUES ('22', '晨昏', '辛夷坞', '江苏文艺出版社', '2013', '978-7-5399-6200-9', 'http://localhost:8000/LibraryTest/context/img/book/15071309243016.jpg', '13', '“有我陪着你，什么都不用害怕。”一句话，像是一个魔咒，攥住了两个人的心，注定了三个人的宿命。妖艳的止安是一团火，柔软的止怡是一汪水。纪廷就在这水火之间，辜负了水的温柔，却无法触及火的热烈。或许是可以触及的，只是太过滚烫，所以更多的时候只是远望。如果他不顾一切，那火将焚毁的又岂止是他一个人的身？“你到底是不想，不敢，还是……不行？” “你知道吗，纪廷，我看不起你。”为了报复，也是因为疲惫，止安选择了远离。可逃得越远，也意味着她的不安越深。 夜航鸟不停地飞啊飞啊飞，心中的岛屿就在那里，却不敢停下。 这才发现自己走得那么急，竟然是因为不敢回头，害怕蓦然回首，再也找不到当初的那个少年。\r\n', '2015-07-13 21:24:30', 'I246.56', '4', '0', '0');
INSERT INTO `book` VALUES ('23', '天机', '蔡骏', '南海出版公司', '2014', '978-7-5442-7051-9', 'http://localhost:8000/LibraryTest/context/img/book/15071309253117.jpg', '4', '本书是中国当代长篇小说。本套书共四本。一个十九人的旅游团无意中来到泰国一个神秘城市南明市，找不到出口离开。这个神秘城市设施一应俱全，但空无一人，时间定格在一年前，手机也没有信号。十九人开始寻找出路，在此过程中，三个人接连神秘死去。\r\n', '2015-07-13 21:25:31', 'I24.34', '3', '3', '0');
INSERT INTO `book` VALUES ('24', '长相思', '桐华', '湖南文艺出版社', '2013', '978-7-5404-6007-5', 'http://localhost:8000/LibraryTest/context/img/book/15071309261218.jpg', '13', '本书为中国当代长篇小说。讲述了：生命是一场又一场的相遇和别离，是一次又一次的遗忘和开始，可总有些事，一旦发生，就留下印迹；总有个人，一旦来过，就无法忘记。这一场清水镇的相遇改变了所有人的命运，甚至改变了整个大荒的命运。只为贪图那一点温暖、一点陪伴，一点不知道什么时候会消散的死心塌地。相思是一杯有毒的美酒，入喉甘美，销魂蚀骨，直到入心入肺，便再也无药可解，毒发时撕心裂肺，只有心上人的笑容可解，陪伴可解，若是不得，便只余刻骨相思，至死不休。\r\n', '2015-07-13 21:26:12', 'I243.5', '3', '2', '0');
INSERT INTO `book` VALUES ('27', '亚瑟王之死', '托马斯·马洛礼', '人民文学出版社', '2005', '978-7-02-006135-8', 'http://localhost:8000/LibraryTest/context/img/book/15071309272619.jpg', '4', '《亚瑟王之死(上下册)(插图本)》是欧洲骑士文学中的一朵奇葩，在西方流传之广仅次于《圣经》和莎士比亚的作品。他讲述了著名的不列颠国王亚瑟及其圆桌骑士的故事。字里行间充满了冒险、传奇、各种奇迹和精彩的打斗场面。最令人爱不释手的是骑士与贵妇人之间惊世骇俗的爱情描写。', '2015-07-13 21:27:26', 'I561.41', '2', '2', '0');
INSERT INTO `book` VALUES ('28', '金粉世家', '张恨水', '人民文学出版社', '2009', '978-7-02-007192-0', 'http://localhost:8000/LibraryTest/context/img/book/15071309281320.jpg', '4', '小说以豪门公子金燕西与平民女子冷清秋恋爱、结婚、反目、离散为主线，深刻描写了北洋军阀统治时期贵族之家的盛衰，多角度地透视了上层显宦世家金玉其外、败絮其中的生活与思想面貌。\r\n', '2015-07-13 21:28:13', 'I146.57', '3', '2', '0');
INSERT INTO `book` VALUES ('29', '一九八四', '乔治·奥威尔', '译林出版社', '2011', '978-7-5447-2002-1', 'http://localhost:8000/LibraryTest/context/img/book/15071309285621.jpg', '4', '本书是一本英汉对照的英国现代长篇小说。', '2015-07-13 21:28:56', 'I561.45', '2', '2', '0');
INSERT INTO `book` VALUES ('30', '牧羊少年奇幻之旅', '保罗·柯艾略', '南海出版公司', '2009', '978-7-5442-4419-0', 'http://localhost:8000/LibraryTest/context/img/book/15071309294422.jpg', '6', '牧羊少年圣地亚哥接连两次做了同一个梦，梦见埃及金字塔附近藏有一批宝藏。少年卖掉羊群，历尽千辛万苦一路向南，跨海来到非洲，穿越“死亡之海”撒哈拉大沙漠……期间奇遇不断，在一位炼金术士的指引下，他终于到达金字塔前，悟出了宝藏的真正所在……\r\n', '2015-07-13 21:29:44', 'I777.45', '2', '2', '0');
INSERT INTO `book` VALUES ('31', '偷影子的人', '马克·莱维', '湖南文艺出版社', '2012', '978-7-5404-5595-8', 'http://localhost:8000/LibraryTest/context/img/book/15071309303723.jpg', '4', '不知道姓氏的克蕾儿。这就是你在我生命里的角色，我童年时的小女孩，今日蜕变成了女人，一段青梅竹马的回忆，一个时间之神没有应允的愿望。\r\n', '2015-07-13 21:30:37', 'I565.45', '6', '3', '0');
INSERT INTO `book` VALUES ('32', '谁杀了她', '东野圭吾', '南海出版公司', '2012', '978-7-5442-5699-5', 'http://localhost:8000/LibraryTest/context/img/book/15071309311624.jpg', '3', '本书是一部让东野圭吾提心吊胆、日本出版社吃足苦头、引爆网路推理大战的最高争议作，《谁杀了她》回归究极解谜之趣、开启实验推理新格局，东野圭吾向读者下战书，书末为谜团投下未解悬念震撼弹！\r\n', '2015-07-13 21:31:16', 'I313.45', '7', '3', '0');
INSERT INTO `book` VALUES ('34', '你的孤独虽败犹荣', '刘同', '中信出版社', '2014', '978-7-5086-4505-6', 'http://localhost:8000/LibraryTest/context/img/book/15071309320625.jpg', '8', '“很长一段日子里，我靠写东西度过了太多的小无聊，伪伤感，假满足与真茫然 。我在意细节，算敏感。但知道体谅，算善良。我说喜欢便是喜欢，我不想回答便是真的不知道如何作答。有时我佯装镇定或笑得开心，心里总觉得自己与这个世界格格不入。不停对抗，学着顺从，冷静旁观，终明白我们都不应该是别人世界的参与者，而是自己世界的建造者。\r\n', '2015-07-13 21:32:06', 'B821.49', '6', '1', '0');
INSERT INTO `book` VALUES ('35', '我是猫', '夏目漱石', '安徽师范大学出版社', '2014', '978-7-5676-0512-1', 'http://localhost:8000/LibraryTest/context/img/book/15071309333926.jpg', '4', '本书主人公以一只猫的身份, 俯视着日本当时的社会, 俯视着二十世纪所谓现代文明的大潮, 同时发出种种嘲弄和讥讽。\r\n', '2015-07-13 21:33:39', 'I313.44', '2', '0', '0');
INSERT INTO `book` VALUES ('36', '安娜·卡列尼娜', '列夫·托尔斯泰', '上海译文出版社', '2013', '978-7-5327-5899-9', 'http://localhost:8000/LibraryTest/context/img/book/15071309342427.jpg', '4', '本书是俄罗斯文豪列夫·托尔斯泰的主要作品之一。贵族妇女安娜追求爱情幸福，却在卡列宁的虚伪、冷漠和弗龙斯基的自私面前碰得头破血流，最终落得卧轨自杀、陈尸车站的下场。庄园主莱温反对土地私有制，抵制资本主义制度，同情贫苦农民，却又无法摆脱贵族习气而陷入无法解脱的矛盾之中。矛盾的时期、矛盾的制度、矛盾的人物、矛盾的心理，使全书在矛盾的漩涡中颠簸。\r\n', '2015-07-13 21:34:24', 'I512.44', '2', '2', '0');
INSERT INTO `book` VALUES ('37', '目送', '龙应台', '生活·读书·新知三联书店', '2009', '978-7-108-03291-1', 'http://localhost:8000/LibraryTest/context/img/book/15071309350528.jpg', '11', '目送共由七十四篇散文组成，是为一本极具亲情、感人至深的文集。由父亲的逝世、母亲的苍老、儿子的离开、朋友的牵挂、兄弟的携手共行，写出失败和脆弱、失落和放手，写出缠绵不舍和绝然的虚无。正如作者所说：“我慢慢地、慢慢地了解到，所谓父女母子一场，只不过意味着，你和他的缘分就是今生今世不断地在目送他的背影渐行渐远。\r\n', '2015-07-13 21:35:05', 'I267', '2', '2', '0');
INSERT INTO `book` VALUES ('39', '白夜行', '东野圭吾', '南海出版社', '2008', '978-7-5442-4251-6', 'http://localhost:8000/LibraryTest/context/img/book/15071309354929.jpg', '4', '“我的天空里没有太阳，总是黑夜，但并不暗，因为有东西代替了太阳。虽然没有太阳那么明亮，但对我来说已经足够。凭借着这份光，我便能把黑夜当成白天。我从来就没有太阳，所以不怕失去”。\r\n', '2015-07-13 21:35:49', 'I313.4', '7', '4', '0');
INSERT INTO `book` VALUES ('40', '货币金融学', '弗雷德里克·S·米什金', '中国人民大学出版社', '2011', '978-7-300-12926-6', 'http://localhost:8000/LibraryTest/context/img/book/15071309363330.jpg', '3', '本书是货币银行学领域的一本经典著作，自十几年前引入中国以来，一直畅销不衰。由于次贷危机及其所引发的一系列事件极大地改变了金融体系的结构与中央银行的运作模式，因此，本书有关这方面的内容几乎全部进行了改写。此外，围绕次贷危机，本书适时增加了很多新的内容、应用和专栏。虽然本版较前一版做了较大的改动，但依然保留了其作为最畅销货币银行学教材的基本优点，即建立一个统一的分析框架，用基本经济学理论帮助学生理解金融市场结构、外汇市场、金融机构管理以及货币政策在经济中的作用等问题。本书适用于货币金融学课程，同时，作为一部经典著作，它也可以作为很多渴望了解货币金融知识的人的学习用书和参考读物。\r\n', '2015-07-13 21:36:33', 'F820', '4', '2', '0');
INSERT INTO `book` VALUES ('42', '微观经济学十八讲', '平新乔', '北京大学出版社', '2001', '7-301-04880-7', 'http://localhost:8000/LibraryTest/context/img/book/15071309371131.jpg', '9', '本书包括了消费者选择、企业行为、市场产业组织与博弈论、信息经济学与公共经济学等基本内容，反映了微观经济学在世纪之初的最新研究成果。\r\n', '2015-07-13 21:37:11', 'F16', '4', '3', '0');
INSERT INTO `book` VALUES ('43', '洞穴奇案', '彼得·萨伯', '三联书店', '2012', '978-7-108-03987-3', 'http://localhost:8000/LibraryTest/context/img/book/15071309380232.jpg', '10', '本书讲述五名洞穴探险人受困山洞，水尽粮绝；为了生存，大家约定抽签吃掉一人，牺牲一个以救活其余四人。威特摩尔是这一方案的提议人，不过抽签前又收回了意见，其它四人却执意坚持，结果恰好是威特摩尔被抽中。获救后，这四人以杀人罪被起诉。\r\n', '2015-07-13 21:38:02', 'D971.2', '2', '2', '0');
INSERT INTO `book` VALUES ('44', '风险社会', '乌尔里希·贝克', '译林出版社', '2004', '7-80657-565-0', 'http://localhost:8000/LibraryTest/context/img/book/15071309384233.jpg', '10', '乌尔里希·贝克将后现代社会诠释为风险社会，其主要特征在于:人类面临着威胁其生存的由社会所制造的风险。我们身处其中的社会充斥着组织化不负责任的态度,尤其是,风险的制造者以风险牺牲品为代价来保护自己的利益。作者认为西方的经济制度、法律制度和政治制度不仅卷入了风险制造,而且参与了对风险真相的掩盖。贝克力倡反思性现代化,其特点是既洞察到现代性中理性的困境,又试图以理性的精神来治疗这种困境。\r\n', '2015-07-13 21:38:42', 'C91', '5', '4', '0');
INSERT INTO `book` VALUES ('45', '相约星期二', '米奇·阿尔博姆', '上海译文出版社', '1998', '7-5327-2234-1', 'http://localhost:8000/LibraryTest/context/img/book/15071309391834.jpg', '8', '莫里是一位年逾七旬，身患绝症的社会学心理教授，1994年，当他知道自己即将因病离开这个世界的时候，他与自己的学生，美国著名专栏作家米奇・阿尔博姆相约，每个星期二给学生上最后一门课，课程的名字是人生，课程的内容是这位社会学教授对人生宝贵的思考，课程总共上了十四周，最后一堂是老人的葬礼。老人谢世后，学生把听课笔记整理出版，定名为《相约星期二》。书中涉及有关世界与死亡，家庭与感情，金钱与永恒的爱等人生永远的话题。该书一出，立即引起全美的轰动，连续40周名列美国图书畅销排行榜。中译本出版后，也引起了国内各界的广泛关注―――感召力是没有国界的。作家余秋雨在此书的序言中说：“他把课堂留下了，课堂越变越大，现在延伸到了中国。我向过路的朋友们大声招呼：来，值得进去听听。”\r\n', '2015-07-13 21:39:18', 'B821', '2', '1', '0');
INSERT INTO `type` VALUES ('3', '侦探小说');
INSERT INTO `type` VALUES ('4', '长篇小说');
INSERT INTO `type` VALUES ('5', '武侠小说');
INSERT INTO `type` VALUES ('6', '中篇小说');
INSERT INTO `type` VALUES ('7', '诗歌');
INSERT INTO `type` VALUES ('8', '哲学');
INSERT INTO `type` VALUES ('9', '经济学');
INSERT INTO `type` VALUES ('10', '社会学');
INSERT INTO `type` VALUES ('11', '作品集');
INSERT INTO `type` VALUES ('12', '文学研究');
INSERT INTO `type` VALUES ('13', '爱情小说');
INSERT INTO `user` VALUES ('14', 'caoxun01', 'df1af3438da74c1fda32b1f2490b6114', '0', null, '410507696@qq.com', '13902011060');
INSERT INTO `user` VALUES ('15', 'caoxun02', 'df1af3438da74c1fda32b1f2490b6114', '0', null, '410507696@qq.com', '13902011060');
INSERT INTO `user` VALUES ('16', 'admin', '670b14728ad9902aecba32e22fa4f6bd', '2', null, '410507696@qq.com', '13902011060');
INSERT INTO `user` VALUES ('20', 'library04', 'e10adc3949ba59abbe56e057f20f883e', '1', null, null, null);
INSERT INTO `user` VALUES ('21', 'library05', 'e10adc3949ba59abbe56e057f20f883e', '1', null, null, null);
INSERT INTO `user` VALUES ('24', 'library06', 'e10adc3949ba59abbe56e057f20f883e', '1', null, null, null);
INSERT INTO `user` VALUES ('26', 'library07', 'e10adc3949ba59abbe56e057f20f883e', '1', null, null, null);
INSERT INTO `user` VALUES ('28', 'library08', 'e10adc3949ba59abbe56e057f20f883e', '1', null, null, null);
