/*
 Navicat MySQL Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50624
 Source Host           : localhost:3306
 Source Schema         : tp_blog

 Target Server Type    : MySQL
 Target Server Version : 50624
 File Encoding         : 65001

 Date: 10/04/2019 04:50:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tp_admin
-- ----------------------------
DROP TABLE IF EXISTS `tp_admin`;
CREATE TABLE `tp_admin`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '管理员账户',
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `nickname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '昵称',
  `email` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` enum('1','0') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '0是禁用 ，1是可用',
  `is_super` enum('1','0') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '0是普通，1是超级管理员',
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL COMMENT '更新时间',
  `delete_time` int(11) NULL DEFAULT NULL COMMENT '软删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tp_admin
-- ----------------------------
INSERT INTO `tp_admin` VALUES (1, 'y', 'f', 'yang', '318277446@qq.com', '0', '0', 2019, 2019, NULL);
INSERT INTO `tp_admin` VALUES (2, 'yjy', 'f', 'yang', '3', '1', '1', 0, 1554841404, NULL);
INSERT INTO `tp_admin` VALUES (3, 'f', 'f', 'yang', '318277446@qq.com', '1', '1', 1554573298, 1554830878, NULL);
INSERT INTO `tp_admin` VALUES (4, 'f', 'f', 'yang', '318277446@qq.com', '0', '0', 1554576974, 1554576974, NULL);
INSERT INTO `tp_admin` VALUES (5, 'f', 'f', 'yang', '318277446@qq.com', '0', '1', 1554577101, 1554830793, NULL);
INSERT INTO `tp_admin` VALUES (6, 'f', 'f', 'PHP管理员', '318277446@qq.com', '0', '0', 1554577165, 1554724665, 1554724665);
INSERT INTO `tp_admin` VALUES (7, 'e', 'e', 'PHP管理员', '318277446@qq.com', '0', '0', 1554612775, 1554725779, 1554725779);
INSERT INTO `tp_admin` VALUES (8, 'e', 'e', 'PHP管理员', '318277446@qq.com', '0', '0', 1554612831, 1554725774, 1554725774);
INSERT INTO `tp_admin` VALUES (9, 'e', '', 'PHP管理员', 'exploer6@163.com', '1', '1', 1554614202, 1554830849, NULL);
INSERT INTO `tp_admin` VALUES (10, 'e', 'etta', 'PHP管理员', 'et@qq.com', '1', '1', 1554614250, 1554830824, NULL);
INSERT INTO `tp_admin` VALUES (11, 'a2', '2', 'PHP管理员', '31826@qq.com', '0', '0', 1554724165, 1554724660, 1554724660);
INSERT INTO `tp_admin` VALUES (12, 'Jack6', 'd', 'PHP管理员', '318d277446@qq.com', '0', '0', 1554724562, 1554724671, 1554724671);

-- ----------------------------
-- Table structure for tp_article
-- ----------------------------
DROP TABLE IF EXISTS `tp_article`;
CREATE TABLE `tp_article`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `author` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '作者',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文章标题',
  `desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '概要',
  `tags` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标签',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `is_top` enum('1','0') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '0是未推荐，1是推荐',
  `click` int(11) NOT NULL DEFAULT 0 COMMENT '阅读量',
  `comm_num` int(11) NOT NULL DEFAULT 0 COMMENT '评论量',
  `cate_id` int(11) NOT NULL COMMENT '所属导航id',
  `create_time` int(11) NOT NULL COMMENT '添加时间',
  `update_time` int(11) NOT NULL COMMENT '更新时间',
  `delete_time` int(11) NULL DEFAULT NULL COMMENT '软删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tp_article
-- ----------------------------
INSERT INTO `tp_article` VALUES (1, '杨', 'php部署', '执行命令解析', '基础', 'Java 简介\r\nJava是由Sun Microsystems公司于1995年5月推出的Java面向对象程序设计语言和Java平台的总称。由James Gosling和同事们共同研发，并在1995年正式推出。\r\n\r\nJava分为三个体系：\r\n\r\nJavaSE（J2SE）（Java2 Platform Standard Edition，java平台标准版）\r\nJavaEE(J2EE)(Java 2 Platform,Enterprise Edition，java平台企业版)\r\nJavaME(J2ME)(Java 2 Platform Micro Edition，java平台微型版)。\r\n2005年6月，JavaOne大会召开，SUN公司公开Java SE 6。此时，Java的各种版本已经更名以取消其中的数字\"2\"：J2EE更名为Java EE, J2SE更名为Java SE，J2ME更名为Java ME。\r\n\r\n主要特性\r\nJava语言是简单的：\r\nJava语言的语法与C语言和C++语言很接近，使得大多数程序员很容易学习和使用。另一方面，Java丢弃了C++中很少使用的、很难理解的、令人迷惑的那些特性，如操作符重载、多继承、自动的强制类型转换。特别地，Java语言不使用指针，而是引用。并提供了自动的废料收集，使得程序员不必为内存管理而担忧。\r\n\r\nJava语言是面向对象的：\r\nJava语言提供类、接口和继承等面向对象的特性，为了简单起见，只支持类之间的单继承，但支持接口之间的多继承，并支持类与接口之间的实现机制（关键字为implements）。Java语言全面支持动态绑定，而C++语言只对虚函数使用动态绑定。总之，Java语言是一个纯的面向对象程序设计语言。\r\n\r\nJava语言是分布式的：\r\nJava语言支持Internet应用的开发，在基本的Java应用编程接口中有一个网络应用编程接口（java net），它提供了用于网络应用编程的类库，包括URL、URLConnection、Socket、ServerSocket等。Java的RMI（远程方法激活）机制也是开发分布式应用的重要手段。\r\n\r\nJava语言是健壮的：\r\nJava的强类型机制、异常处理、垃圾的自动收集等是Java程序健壮性的重要保证。对指针的丢弃是Java的明智选择。Java的安全检查机制使得Java更具健壮性。\r\n\r\nJava语言是安全的：\r\nJava通常被用在网络环境中，为此，Java提供了一个安全机制以防恶意代码的攻击。除了Java语言具有的许多安全特性以外，Java对通过网络下载的类具有一个安全防范机制（类ClassLoader），如分配不同的名字空间以防替代本地的同名类、字节代码检查，并提供安全管理机制（类SecurityManager）让Java应用设置安全哨兵。\r\n\r\nJava语言是体系结构中立的：\r\nJava程序（后缀为java的文件）在Java平台上被编译为体系结构中立的字节码格式（后缀为class的文件），然后可以在实现这个Java平台的任何系统中运行。这种途径适合于异构的网络环境和软件的分发。\r\n\r\nJava语言是可移植的：\r\n这种可移植性来源于体系结构中立性，另外，Java还严格规定了各个基本数据类型的长度。Java系统本身也具有很强的可移植性，Java编译器是用Java实现的，Java的运行环境是用ANSI C实现的。\r\n\r\nJava语言是解释型的：\r\n如前所述，Java程序在Java平台上被编译为字节码格式，然后可以在实现这个Java平台的任何系统中运行。在运行时，Java平台中的Java解释器对这些字节码进行解释执行，执行过程中需要的类在联接阶段被载入到运行环境中。\r\n\r\nJava是高性能的：\r\n与那些解释型的高级脚本语言相比，Java的确是高性能的。事实上，Java的运行速度随着JIT(Just-In-Time）编译器技术的发展越来越接近于C++。\r\n\r\nJava语言是多线程的：\r\n在Java语言中，线程是一种特殊的对象，它必须由Thread类或其子（孙）类来创建。通常有两种方法来创建线程：其一，使用型构为Thread(Runnable)的构造子类将一个实现了Runnable接口的对象包装成一个线程，其二，从Thread类派生出子类并重写run方法，使用该子类创建的对象即为线程。值得注意的是Thread类已经实现了Runnable接口，因此，任何一个线程均有它的run方法，而run方法中包含了线程所要运行的代码。线程的活动由一组方法来控制。Java语言支持多个线程的同时执行，并提供多线程之间的同步机制（关键字为synchronized）。\r\n\r\nJava语言是动态的：\r\nJava语言的设计目标之一是适应于动态变化的环境。Java程序需要的类能够动态地被载入到运行环境，也可以通过网络来载入所需要的类。这也有利于软件的升级。另外，Java中的类有一个运行时刻的表示，能进行运行时刻的类型检查。', '1', 0, 0, 1, 1554661687, 1554736790, NULL);
INSERT INTO `tp_article` VALUES (2, 'yang', 'JAVA', '执行命令解析', '基础', 'Java 简介\r\nJava是由Sun Microsystems公司于1995年5月推出的Java面向对象程序设计语言和Java平台的总称。由James Gosling和同事们共同研发，并在1995年正式推出。\r\n\r\nJava分为三个体系：\r\n\r\nJavaSE（J2SE）（Java2 Platform Standard Edition，java平台标准版）\r\nJavaEE(J2EE)(Java 2 Platform,Enterprise Edition，java平台企业版)\r\nJavaME(J2ME)(Java 2 Platform Micro Edition，java平台微型版)。\r\n2005年6月，JavaOne大会召开，SUN公司公开Java SE 6。此时，Java的各种版本已经更名以取消其中的数字\"2\"：J2EE更名为Java EE, J2SE更名为Java SE，J2ME更名为Java ME。\r\n\r\n主要特性\r\nJava语言是简单的：\r\nJava语言的语法与C语言和C++语言很接近，使得大多数程序员很容易学习和使用。另一方面，Java丢弃了C++中很少使用的、很难理解的、令人迷惑的那些特性，如操作符重载、多继承、自动的强制类型转换。特别地，Java语言不使用指针，而是引用。并提供了自动的废料收集，使得程序员不必为内存管理而担忧。\r\n\r\nJava语言是面向对象的：\r\nJava语言提供类、接口和继承等面向对象的特性，为了简单起见，只支持类之间的单继承，但支持接口之间的多继承，并支持类与接口之间的实现机制（关键字为implements）。Java语言全面支持动态绑定，而C++语言只对虚函数使用动态绑定。总之，Java语言是一个纯的面向对象程序设计语言。\r\n\r\nJava语言是分布式的：\r\nJava语言支持Internet应用的开发，在基本的Java应用编程接口中有一个网络应用编程接口（java net），它提供了用于网络应用编程的类库，包括URL、URLConnection、Socket、ServerSocket等。Java的RMI（远程方法激活）机制也是开发分布式应用的重要手段。\r\n\r\nJava语言是健壮的：\r\nJava的强类型机制、异常处理、垃圾的自动收集等是Java程序健壮性的重要保证。对指针的丢弃是Java的明智选择。Java的安全检查机制使得Java更具健壮性。\r\n\r\nJava语言是安全的：\r\nJava通常被用在网络环境中，为此，Java提供了一个安全机制以防恶意代码的攻击。除了Java语言具有的许多安全特性以外，Java对通过网络下载的类具有一个安全防范机制（类ClassLoader），如分配不同的名字空间以防替代本地的同名类、字节代码检查，并提供安全管理机制（类SecurityManager）让Java应用设置安全哨兵。\r\n\r\nJava语言是体系结构中立的：\r\nJava程序（后缀为java的文件）在Java平台上被编译为体系结构中立的字节码格式（后缀为class的文件），然后可以在实现这个Java平台的任何系统中运行。这种途径适合于异构的网络环境和软件的分发。\r\n\r\nJava语言是可移植的：\r\n这种可移植性来源于体系结构中立性，另外，Java还严格规定了各个基本数据类型的长度。Java系统本身也具有很强的可移植性，Java编译器是用Java实现的，Java的运行环境是用ANSI C实现的。\r\n\r\nJava语言是解释型的：\r\n如前所述，Java程序在Java平台上被编译为字节码格式，然后可以在实现这个Java平台的任何系统中运行。在运行时，Java平台中的Java解释器对这些字节码进行解释执行，执行过程中需要的类在联接阶段被载入到运行环境中。\r\n\r\nJava是高性能的：\r\n与那些解释型的高级脚本语言相比，Java的确是高性能的。事实上，Java的运行速度随着JIT(Just-In-Time）编译器技术的发展越来越接近于C++。\r\n\r\nJava语言是多线程的：\r\n在Java语言中，线程是一种特殊的对象，它必须由Thread类或其子（孙）类来创建。通常有两种方法来创建线程：其一，使用型构为Thread(Runnable)的构造子类将一个实现了Runnable接口的对象包装成一个线程，其二，从Thread类派生出子类并重写run方法，使用该子类创建的对象即为线程。值得注意的是Thread类已经实现了Runnable接口，因此，任何一个线程均有它的run方法，而run方法中包含了线程所要运行的代码。线程的活动由一组方法来控制。Java语言支持多个线程的同时执行，并提供多线程之间的同步机制（关键字为synchronized）。\r\n\r\nJava语言是动态的：\r\nJava语言的设计目标之一是适应于动态变化的环境。Java程序需要的类能够动态地被载入到运行环境，也可以通过网络来载入所需要的类。这也有利于软件的升级。另外，Java中的类有一个运行时刻的表示，能进行运行时刻的类型检查。', '1', 0, 0, 2, 1554661839, 1554709442, NULL);
INSERT INTO `tp_article` VALUES (3, 'yang', '程序人生', '执行命令解析', '基础', 'Java 简介\r\nJava是由Sun Microsystems公司于1995年5月推出的Java面向对象程序设计语言和Java平台的总称。由James Gosling和同事们共同研发，并在1995年正式推出。\r\n\r\nJava分为三个体系：\r\n\r\nJavaSE（J2SE）（Java2 Platform Standard Edition，java平台标准版）\r\nJavaEE(J2EE)(Java 2 Platform,Enterprise Edition，java平台企业版)\r\nJavaME(J2ME)(Java 2 Platform Micro Edition，java平台微型版)。\r\n2005年6月，JavaOne大会召开，SUN公司公开Java SE 6。此时，Java的各种版本已经更名以取消其中的数字\"2\"：J2EE更名为Java EE, J2SE更名为Java SE，J2ME更名为Java ME。\r\n\r\n主要特性\r\nJava语言是简单的：\r\nJava语言的语法与C语言和C++语言很接近，使得大多数程序员很容易学习和使用。另一方面，Java丢弃了C++中很少使用的、很难理解的、令人迷惑的那些特性，如操作符重载、多继承、自动的强制类型转换。特别地，Java语言不使用指针，而是引用。并提供了自动的废料收集，使得程序员不必为内存管理而担忧。\r\n\r\nJava语言是面向对象的：\r\nJava语言提供类、接口和继承等面向对象的特性，为了简单起见，只支持类之间的单继承，但支持接口之间的多继承，并支持类与接口之间的实现机制（关键字为implements）。Java语言全面支持动态绑定，而C++语言只对虚函数使用动态绑定。总之，Java语言是一个纯的面向对象程序设计语言。\r\n\r\nJava语言是分布式的：\r\nJava语言支持Internet应用的开发，在基本的Java应用编程接口中有一个网络应用编程接口（java net），它提供了用于网络应用编程的类库，包括URL、URLConnection、Socket、ServerSocket等。Java的RMI（远程方法激活）机制也是开发分布式应用的重要手段。\r\n\r\nJava语言是健壮的：\r\nJava的强类型机制、异常处理、垃圾的自动收集等是Java程序健壮性的重要保证。对指针的丢弃是Java的明智选择。Java的安全检查机制使得Java更具健壮性。\r\n\r\nJava语言是安全的：\r\nJava通常被用在网络环境中，为此，Java提供了一个安全机制以防恶意代码的攻击。除了Java语言具有的许多安全特性以外，Java对通过网络下载的类具有一个安全防范机制（类ClassLoader），如分配不同的名字空间以防替代本地的同名类、字节代码检查，并提供安全管理机制（类SecurityManager）让Java应用设置安全哨兵。\r\n\r\nJava语言是体系结构中立的：\r\nJava程序（后缀为java的文件）在Java平台上被编译为体系结构中立的字节码格式（后缀为class的文件），然后可以在实现这个Java平台的任何系统中运行。这种途径适合于异构的网络环境和软件的分发。\r\n\r\nJava语言是可移植的：\r\n这种可移植性来源于体系结构中立性，另外，Java还严格规定了各个基本数据类型的长度。Java系统本身也具有很强的可移植性，Java编译器是用Java实现的，Java的运行环境是用ANSI C实现的。\r\n\r\nJava语言是解释型的：\r\n如前所述，Java程序在Java平台上被编译为字节码格式，然后可以在实现这个Java平台的任何系统中运行。在运行时，Java平台中的Java解释器对这些字节码进行解释执行，执行过程中需要的类在联接阶段被载入到运行环境中。\r\n\r\nJava是高性能的：\r\n与那些解释型的高级脚本语言相比，Java的确是高性能的。事实上，Java的运行速度随着JIT(Just-In-Time）编译器技术的发展越来越接近于C++。\r\n\r\nJava语言是多线程的：\r\n在Java语言中，线程是一种特殊的对象，它必须由Thread类或其子（孙）类来创建。通常有两种方法来创建线程：其一，使用型构为Thread(Runnable)的构造子类将一个实现了Runnable接口的对象包装成一个线程，其二，从Thread类派生出子类并重写run方法，使用该子类创建的对象即为线程。值得注意的是Thread类已经实现了Runnable接口，因此，任何一个线程均有它的run方法，而run方法中包含了线程所要运行的代码。线程的活动由一组方法来控制。Java语言支持多个线程的同时执行，并提供多线程之间的同步机制（关键字为synchronized）。\r\n\r\nJava语言是动态的：\r\nJava语言的设计目标之一是适应于动态变化的环境。Java程序需要的类能够动态地被载入到运行环境，也可以通过网络来载入所需要的类。这也有利于软件的升级。另外，Java中的类有一个运行时刻的表示，能进行运行时刻的类型检查。', '0', 0, 0, 7, 1554661876, 1554827298, NULL);
INSERT INTO `tp_article` VALUES (4, 'yang', 'PHP之道', '执行命令解析', '基础', 'Java 简介\r\nJava是由Sun Microsystems公司于1995年5月推出的Java面向对象程序设计语言和Java平台的总称。由James Gosling和同事们共同研发，并在1995年正式推出。\r\n\r\nJava分为三个体系：\r\n\r\nJavaSE（J2SE）（Java2 Platform Standard Edition，java平台标准版）\r\nJavaEE(J2EE)(Java 2 Platform,Enterprise Edition，java平台企业版)\r\nJavaME(J2ME)(Java 2 Platform Micro Edition，java平台微型版)。\r\n2005年6月，JavaOne大会召开，SUN公司公开Java SE 6。此时，Java的各种版本已经更名以取消其中的数字\"2\"：J2EE更名为Java EE, J2SE更名为Java SE，J2ME更名为Java ME。\r\n\r\n主要特性\r\nJava语言是简单的：\r\nJava语言的语法与C语言和C++语言很接近，使得大多数程序员很容易学习和使用。另一方面，Java丢弃了C++中很少使用的、很难理解的、令人迷惑的那些特性，如操作符重载、多继承、自动的强制类型转换。特别地，Java语言不使用指针，而是引用。并提供了自动的废料收集，使得程序员不必为内存管理而担忧。\r\n\r\nJava语言是面向对象的：\r\nJava语言提供类、接口和继承等面向对象的特性，为了简单起见，只支持类之间的单继承，但支持接口之间的多继承，并支持类与接口之间的实现机制（关键字为implements）。Java语言全面支持动态绑定，而C++语言只对虚函数使用动态绑定。总之，Java语言是一个纯的面向对象程序设计语言。\r\n\r\nJava语言是分布式的：\r\nJava语言支持Internet应用的开发，在基本的Java应用编程接口中有一个网络应用编程接口（java net），它提供了用于网络应用编程的类库，包括URL、URLConnection、Socket、ServerSocket等。Java的RMI（远程方法激活）机制也是开发分布式应用的重要手段。\r\n\r\nJava语言是健壮的：\r\nJava的强类型机制、异常处理、垃圾的自动收集等是Java程序健壮性的重要保证。对指针的丢弃是Java的明智选择。Java的安全检查机制使得Java更具健壮性。\r\n\r\nJava语言是安全的：\r\nJava通常被用在网络环境中，为此，Java提供了一个安全机制以防恶意代码的攻击。除了Java语言具有的许多安全特性以外，Java对通过网络下载的类具有一个安全防范机制（类ClassLoader），如分配不同的名字空间以防替代本地的同名类、字节代码检查，并提供安全管理机制（类SecurityManager）让Java应用设置安全哨兵。\r\n\r\nJava语言是体系结构中立的：\r\nJava程序（后缀为java的文件）在Java平台上被编译为体系结构中立的字节码格式（后缀为class的文件），然后可以在实现这个Java平台的任何系统中运行。这种途径适合于异构的网络环境和软件的分发。\r\n\r\nJava语言是可移植的：\r\n这种可移植性来源于体系结构中立性，另外，Java还严格规定了各个基本数据类型的长度。Java系统本身也具有很强的可移植性，Java编译器是用Java实现的，Java的运行环境是用ANSI C实现的。\r\n\r\nJava语言是解释型的：\r\n如前所述，Java程序在Java平台上被编译为字节码格式，然后可以在实现这个Java平台的任何系统中运行。在运行时，Java平台中的Java解释器对这些字节码进行解释执行，执行过程中需要的类在联接阶段被载入到运行环境中。\r\n\r\nJava是高性能的：\r\n与那些解释型的高级脚本语言相比，Java的确是高性能的。事实上，Java的运行速度随着JIT(Just-In-Time）编译器技术的发展越来越接近于C++。\r\n\r\nJava语言是多线程的：\r\n在Java语言中，线程是一种特殊的对象，它必须由Thread类或其子（孙）类来创建。通常有两种方法来创建线程：其一，使用型构为Thread(Runnable)的构造子类将一个实现了Runnable接口的对象包装成一个线程，其二，从Thread类派生出子类并重写run方法，使用该子类创建的对象即为线程。值得注意的是Thread类已经实现了Runnable接口，因此，任何一个线程均有它的run方法，而run方法中包含了线程所要运行的代码。线程的活动由一组方法来控制。Java语言支持多个线程的同时执行，并提供多线程之间的同步机制（关键字为synchronized）。\r\n\r\nJava语言是动态的：\r\nJava语言的设计目标之一是适应于动态变化的环境。Java程序需要的类能够动态地被载入到运行环境，也可以通过网络来载入所需要的类。这也有利于软件的升级。另外，Java中的类有一个运行时刻的表示，能进行运行时刻的类型检查。', '0', 0, 0, 3, 1554663785, 1554827188, NULL);
INSERT INTO `tp_article` VALUES (5, 'yang', '电脑管家', '执行命令解析', '基础', 'Java 简介\r\nJava是由Sun Microsystems公司于1995年5月推出的Java面向对象程序设计语言和Java平台的总称。由James Gosling和同事们共同研发，并在1995年正式推出。\r\n\r\nJava分为三个体系：\r\n\r\nJavaSE（J2SE）（Java2 Platform Standard Edition，java平台标准版）\r\nJavaEE(J2EE)(Java 2 Platform,Enterprise Edition，java平台企业版)\r\nJavaME(J2ME)(Java 2 Platform Micro Edition，java平台微型版)。\r\n2005年6月，JavaOne大会召开，SUN公司公开Java SE 6。此时，Java的各种版本已经更名以取消其中的数字\"2\"：J2EE更名为Java EE, J2SE更名为Java SE，J2ME更名为Java ME。\r\n\r\n主要特性\r\nJava语言是简单的：\r\nJava语言的语法与C语言和C++语言很接近，使得大多数程序员很容易学习和使用。另一方面，Java丢弃了C++中很少使用的、很难理解的、令人迷惑的那些特性，如操作符重载、多继承、自动的强制类型转换。特别地，Java语言不使用指针，而是引用。并提供了自动的废料收集，使得程序员不必为内存管理而担忧。\r\n\r\nJava语言是面向对象的：\r\nJava语言提供类、接口和继承等面向对象的特性，为了简单起见，只支持类之间的单继承，但支持接口之间的多继承，并支持类与接口之间的实现机制（关键字为implements）。Java语言全面支持动态绑定，而C++语言只对虚函数使用动态绑定。总之，Java语言是一个纯的面向对象程序设计语言。\r\n\r\nJava语言是分布式的：\r\nJava语言支持Internet应用的开发，在基本的Java应用编程接口中有一个网络应用编程接口（java net），它提供了用于网络应用编程的类库，包括URL、URLConnection、Socket、ServerSocket等。Java的RMI（远程方法激活）机制也是开发分布式应用的重要手段。\r\n\r\nJava语言是健壮的：\r\nJava的强类型机制、异常处理、垃圾的自动收集等是Java程序健壮性的重要保证。对指针的丢弃是Java的明智选择。Java的安全检查机制使得Java更具健壮性。\r\n\r\nJava语言是安全的：\r\nJava通常被用在网络环境中，为此，Java提供了一个安全机制以防恶意代码的攻击。除了Java语言具有的许多安全特性以外，Java对通过网络下载的类具有一个安全防范机制（类ClassLoader），如分配不同的名字空间以防替代本地的同名类、字节代码检查，并提供安全管理机制（类SecurityManager）让Java应用设置安全哨兵。\r\n\r\nJava语言是体系结构中立的：\r\nJava程序（后缀为java的文件）在Java平台上被编译为体系结构中立的字节码格式（后缀为class的文件），然后可以在实现这个Java平台的任何系统中运行。这种途径适合于异构的网络环境和软件的分发。\r\n\r\nJava语言是可移植的：\r\n这种可移植性来源于体系结构中立性，另外，Java还严格规定了各个基本数据类型的长度。Java系统本身也具有很强的可移植性，Java编译器是用Java实现的，Java的运行环境是用ANSI C实现的。\r\n\r\nJava语言是解释型的：\r\n如前所述，Java程序在Java平台上被编译为字节码格式，然后可以在实现这个Java平台的任何系统中运行。在运行时，Java平台中的Java解释器对这些字节码进行解释执行，执行过程中需要的类在联接阶段被载入到运行环境中。\r\n\r\nJava是高性能的：\r\n与那些解释型的高级脚本语言相比，Java的确是高性能的。事实上，Java的运行速度随着JIT(Just-In-Time）编译器技术的发展越来越接近于C++。\r\n\r\nJava语言是多线程的：\r\n在Java语言中，线程是一种特殊的对象，它必须由Thread类或其子（孙）类来创建。通常有两种方法来创建线程：其一，使用型构为Thread(Runnable)的构造子类将一个实现了Runnable接口的对象包装成一个线程，其二，从Thread类派生出子类并重写run方法，使用该子类创建的对象即为线程。值得注意的是Thread类已经实现了Runnable接口，因此，任何一个线程均有它的run方法，而run方法中包含了线程所要运行的代码。线程的活动由一组方法来控制。Java语言支持多个线程的同时执行，并提供多线程之间的同步机制（关键字为synchronized）。\r\n\r\nJava语言是动态的：\r\nJava语言的设计目标之一是适应于动态变化的环境。Java程序需要的类能够动态地被载入到运行环境，也可以通过网络来载入所需要的类。这也有利于软件的升级。另外，Java中的类有一个运行时刻的表示，能进行运行时刻的类型检查。', '0', 0, 0, 3, 1554706315, 1554827272, NULL);
INSERT INTO `tp_article` VALUES (6, 'yang', 'qq端口问题', '执行命令解析', '基础', 'Java 简介\r\nJava是由Sun Microsystems公司于1995年5月推出的Java面向对象程序设计语言和Java平台的总称。由James Gosling和同事们共同研发，并在1995年正式推出。\r\n\r\nJava分为三个体系：\r\n\r\nJavaSE（J2SE）（Java2 Platform Standard Edition，java平台标准版）\r\nJavaEE(J2EE)(Java 2 Platform,Enterprise Edition，java平台企业版)\r\nJavaME(J2ME)(Java 2 Platform Micro Edition，java平台微型版)。\r\n2005年6月，JavaOne大会召开，SUN公司公开Java SE 6。此时，Java的各种版本已经更名以取消其中的数字\"2\"：J2EE更名为Java EE, J2SE更名为Java SE，J2ME更名为Java ME。\r\n\r\n主要特性\r\nJava语言是简单的：\r\nJava语言的语法与C语言和C++语言很接近，使得大多数程序员很容易学习和使用。另一方面，Java丢弃了C++中很少使用的、很难理解的、令人迷惑的那些特性，如操作符重载、多继承、自动的强制类型转换。特别地，Java语言不使用指针，而是引用。并提供了自动的废料收集，使得程序员不必为内存管理而担忧。\r\n\r\nJava语言是面向对象的：\r\nJava语言提供类、接口和继承等面向对象的特性，为了简单起见，只支持类之间的单继承，但支持接口之间的多继承，并支持类与接口之间的实现机制（关键字为implements）。Java语言全面支持动态绑定，而C++语言只对虚函数使用动态绑定。总之，Java语言是一个纯的面向对象程序设计语言。\r\n\r\nJava语言是分布式的：\r\nJava语言支持Internet应用的开发，在基本的Java应用编程接口中有一个网络应用编程接口（java net），它提供了用于网络应用编程的类库，包括URL、URLConnection、Socket、ServerSocket等。Java的RMI（远程方法激活）机制也是开发分布式应用的重要手段。\r\n\r\nJava语言是健壮的：\r\nJava的强类型机制、异常处理、垃圾的自动收集等是Java程序健壮性的重要保证。对指针的丢弃是Java的明智选择。Java的安全检查机制使得Java更具健壮性。\r\n\r\nJava语言是安全的：\r\nJava通常被用在网络环境中，为此，Java提供了一个安全机制以防恶意代码的攻击。除了Java语言具有的许多安全特性以外，Java对通过网络下载的类具有一个安全防范机制（类ClassLoader），如分配不同的名字空间以防替代本地的同名类、字节代码检查，并提供安全管理机制（类SecurityManager）让Java应用设置安全哨兵。\r\n\r\nJava语言是体系结构中立的：\r\nJava程序（后缀为java的文件）在Java平台上被编译为体系结构中立的字节码格式（后缀为class的文件），然后可以在实现这个Java平台的任何系统中运行。这种途径适合于异构的网络环境和软件的分发。\r\n\r\nJava语言是可移植的：\r\n这种可移植性来源于体系结构中立性，另外，Java还严格规定了各个基本数据类型的长度。Java系统本身也具有很强的可移植性，Java编译器是用Java实现的，Java的运行环境是用ANSI C实现的。\r\n\r\nJava语言是解释型的：\r\n如前所述，Java程序在Java平台上被编译为字节码格式，然后可以在实现这个Java平台的任何系统中运行。在运行时，Java平台中的Java解释器对这些字节码进行解释执行，执行过程中需要的类在联接阶段被载入到运行环境中。\r\n\r\nJava是高性能的：\r\n与那些解释型的高级脚本语言相比，Java的确是高性能的。事实上，Java的运行速度随着JIT(Just-In-Time）编译器技术的发展越来越接近于C++。\r\n\r\nJava语言是多线程的：\r\n在Java语言中，线程是一种特殊的对象，它必须由Thread类或其子（孙）类来创建。通常有两种方法来创建线程：其一，使用型构为Thread(Runnable)的构造子类将一个实现了Runnable接口的对象包装成一个线程，其二，从Thread类派生出子类并重写run方法，使用该子类创建的对象即为线程。值得注意的是Thread类已经实现了Runnable接口，因此，任何一个线程均有它的run方法，而run方法中包含了线程所要运行的代码。线程的活动由一组方法来控制。Java语言支持多个线程的同时执行，并提供多线程之间的同步机制（关键字为synchronized）。\r\n\r\nJava语言是动态的：\r\nJava语言的设计目标之一是适应于动态变化的环境。Java程序需要的类能够动态地被载入到运行环境，也可以通过网络来载入所需要的类。这也有利于软件的升级。另外，Java中的类有一个运行时刻的表示，能进行运行时刻的类型检查。', '1', 0, 0, 3, 1554706755, 1554708926, NULL);
INSERT INTO `tp_article` VALUES (7, 'yang', '请求', '执行命令解析', '基础', 'Java 简介\r\nJava是由Sun Microsystems公司于1995年5月推出的Java面向对象程序设计语言和Java平台的总称。由James Gosling和同事们共同研发，并在1995年正式推出。\r\n\r\nJava分为三个体系：\r\n\r\nJavaSE（J2SE）（Java2 Platform Standard Edition，java平台标准版）\r\nJavaEE(J2EE)(Java 2 Platform,Enterprise Edition，java平台企业版)\r\nJavaME(J2ME)(Java 2 Platform Micro Edition，java平台微型版)。\r\n2005年6月，JavaOne大会召开，SUN公司公开Java SE 6。此时，Java的各种版本已经更名以取消其中的数字\"2\"：J2EE更名为Java EE, J2SE更名为Java SE，J2ME更名为Java ME。\r\n\r\n主要特性\r\nJava语言是简单的：\r\nJava语言的语法与C语言和C++语言很接近，使得大多数程序员很容易学习和使用。另一方面，Java丢弃了C++中很少使用的、很难理解的、令人迷惑的那些特性，如操作符重载、多继承、自动的强制类型转换。特别地，Java语言不使用指针，而是引用。并提供了自动的废料收集，使得程序员不必为内存管理而担忧。\r\n\r\nJava语言是面向对象的：\r\nJava语言提供类、接口和继承等面向对象的特性，为了简单起见，只支持类之间的单继承，但支持接口之间的多继承，并支持类与接口之间的实现机制（关键字为implements）。Java语言全面支持动态绑定，而C++语言只对虚函数使用动态绑定。总之，Java语言是一个纯的面向对象程序设计语言。\r\n\r\nJava语言是分布式的：\r\nJava语言支持Internet应用的开发，在基本的Java应用编程接口中有一个网络应用编程接口（java net），它提供了用于网络应用编程的类库，包括URL、URLConnection、Socket、ServerSocket等。Java的RMI（远程方法激活）机制也是开发分布式应用的重要手段。\r\n\r\nJava语言是健壮的：\r\nJava的强类型机制、异常处理、垃圾的自动收集等是Java程序健壮性的重要保证。对指针的丢弃是Java的明智选择。Java的安全检查机制使得Java更具健壮性。\r\n\r\nJava语言是安全的：\r\nJava通常被用在网络环境中，为此，Java提供了一个安全机制以防恶意代码的攻击。除了Java语言具有的许多安全特性以外，Java对通过网络下载的类具有一个安全防范机制（类ClassLoader），如分配不同的名字空间以防替代本地的同名类、字节代码检查，并提供安全管理机制（类SecurityManager）让Java应用设置安全哨兵。\r\n\r\nJava语言是体系结构中立的：\r\nJava程序（后缀为java的文件）在Java平台上被编译为体系结构中立的字节码格式（后缀为class的文件），然后可以在实现这个Java平台的任何系统中运行。这种途径适合于异构的网络环境和软件的分发。\r\n\r\nJava语言是可移植的：\r\n这种可移植性来源于体系结构中立性，另外，Java还严格规定了各个基本数据类型的长度。Java系统本身也具有很强的可移植性，Java编译器是用Java实现的，Java的运行环境是用ANSI C实现的。\r\n\r\nJava语言是解释型的：\r\n如前所述，Java程序在Java平台上被编译为字节码格式，然后可以在实现这个Java平台的任何系统中运行。在运行时，Java平台中的Java解释器对这些字节码进行解释执行，执行过程中需要的类在联接阶段被载入到运行环境中。\r\n\r\nJava是高性能的：\r\n与那些解释型的高级脚本语言相比，Java的确是高性能的。事实上，Java的运行速度随着JIT(Just-In-Time）编译器技术的发展越来越接近于C++。\r\n\r\nJava语言是多线程的：\r\n在Java语言中，线程是一种特殊的对象，它必须由Thread类或其子（孙）类来创建。通常有两种方法来创建线程：其一，使用型构为Thread(Runnable)的构造子类将一个实现了Runnable接口的对象包装成一个线程，其二，从Thread类派生出子类并重写run方法，使用该子类创建的对象即为线程。值得注意的是Thread类已经实现了Runnable接口，因此，任何一个线程均有它的run方法，而run方法中包含了线程所要运行的代码。线程的活动由一组方法来控制。Java语言支持多个线程的同时执行，并提供多线程之间的同步机制（关键字为synchronized）。\r\n\r\nJava语言是动态的：\r\nJava语言的设计目标之一是适应于动态变化的环境。Java程序需要的类能够动态地被载入到运行环境，也可以通过网络来载入所需要的类。这也有利于软件的升级。另外，Java中的类有一个运行时刻的表示，能进行运行时刻的类型检查。', '1', 0, 0, 3, 1554706793, 1554708767, NULL);
INSERT INTO `tp_article` VALUES (8, 'yang', 'request方法', '执行命令解析', '基础', 'Java 简介\r\nJava是由Sun Microsystems公司于1995年5月推出的Java面向对象程序设计语言和Java平台的总称。由James Gosling和同事们共同研发，并在1995年正式推出。\r\n\r\nJava分为三个体系：\r\n\r\nJavaSE（J2SE）（Java2 Platform Standard Edition，java平台标准版）\r\nJavaEE(J2EE)(Java 2 Platform,Enterprise Edition，java平台企业版)\r\nJavaME(J2ME)(Java 2 Platform Micro Edition，java平台微型版)。\r\n2005年6月，JavaOne大会召开，SUN公司公开Java SE 6。此时，Java的各种版本已经更名以取消其中的数字\"2\"：J2EE更名为Java EE, J2SE更名为Java SE，J2ME更名为Java ME。\r\n\r\n主要特性\r\nJava语言是简单的：\r\nJava语言的语法与C语言和C++语言很接近，使得大多数程序员很容易学习和使用。另一方面，Java丢弃了C++中很少使用的、很难理解的、令人迷惑的那些特性，如操作符重载、多继承、自动的强制类型转换。特别地，Java语言不使用指针，而是引用。并提供了自动的废料收集，使得程序员不必为内存管理而担忧。\r\n\r\nJava语言是面向对象的：\r\nJava语言提供类、接口和继承等面向对象的特性，为了简单起见，只支持类之间的单继承，但支持接口之间的多继承，并支持类与接口之间的实现机制（关键字为implements）。Java语言全面支持动态绑定，而C++语言只对虚函数使用动态绑定。总之，Java语言是一个纯的面向对象程序设计语言。\r\n\r\nJava语言是分布式的：\r\nJava语言支持Internet应用的开发，在基本的Java应用编程接口中有一个网络应用编程接口（java net），它提供了用于网络应用编程的类库，包括URL、URLConnection、Socket、ServerSocket等。Java的RMI（远程方法激活）机制也是开发分布式应用的重要手段。\r\n\r\nJava语言是健壮的：\r\nJava的强类型机制、异常处理、垃圾的自动收集等是Java程序健壮性的重要保证。对指针的丢弃是Java的明智选择。Java的安全检查机制使得Java更具健壮性。\r\n\r\nJava语言是安全的：\r\nJava通常被用在网络环境中，为此，Java提供了一个安全机制以防恶意代码的攻击。除了Java语言具有的许多安全特性以外，Java对通过网络下载的类具有一个安全防范机制（类ClassLoader），如分配不同的名字空间以防替代本地的同名类、字节代码检查，并提供安全管理机制（类SecurityManager）让Java应用设置安全哨兵。\r\n\r\nJava语言是体系结构中立的：\r\nJava程序（后缀为java的文件）在Java平台上被编译为体系结构中立的字节码格式（后缀为class的文件），然后可以在实现这个Java平台的任何系统中运行。这种途径适合于异构的网络环境和软件的分发。\r\n\r\nJava语言是可移植的：\r\n这种可移植性来源于体系结构中立性，另外，Java还严格规定了各个基本数据类型的长度。Java系统本身也具有很强的可移植性，Java编译器是用Java实现的，Java的运行环境是用ANSI C实现的。\r\n\r\nJava语言是解释型的：\r\n如前所述，Java程序在Java平台上被编译为字节码格式，然后可以在实现这个Java平台的任何系统中运行。在运行时，Java平台中的Java解释器对这些字节码进行解释执行，执行过程中需要的类在联接阶段被载入到运行环境中。\r\n\r\nJava是高性能的：\r\n与那些解释型的高级脚本语言相比，Java的确是高性能的。事实上，Java的运行速度随着JIT(Just-In-Time）编译器技术的发展越来越接近于C++。\r\n\r\nJava语言是多线程的：\r\n在Java语言中，线程是一种特殊的对象，它必须由Thread类或其子（孙）类来创建。通常有两种方法来创建线程：其一，使用型构为Thread(Runnable)的构造子类将一个实现了Runnable接口的对象包装成一个线程，其二，从Thread类派生出子类并重写run方法，使用该子类创建的对象即为线程。值得注意的是Thread类已经实现了Runnable接口，因此，任何一个线程均有它的run方法，而run方法中包含了线程所要运行的代码。线程的活动由一组方法来控制。Java语言支持多个线程的同时执行，并提供多线程之间的同步机制（关键字为synchronized）。\r\n\r\nJava语言是动态的：\r\nJava语言的设计目标之一是适应于动态变化的环境。Java程序需要的类能够动态地被载入到运行环境，也可以通过网络来载入所需要的类。这也有利于软件的升级。另外，Java中的类有一个运行时刻的表示，能进行运行时刻的类型检查。', '1', 0, 0, 2, 1554710394, 1554819602, NULL);
INSERT INTO `tp_article` VALUES (9, 'yang', 'Java', '执行命令解析', '基础 ', 'Java 简介\r\nJava是由Sun Microsystems公司于1995年5月推出的Java面向对象程序设计语言和Java平台的总称。由James Gosling和同事们共同研发，并在1995年正式推出。\r\n\r\nJava分为三个体系：\r\n\r\nJavaSE（J2SE）（Java2 Platform Standard Edition，java平台标准版）\r\nJavaEE(J2EE)(Java 2 Platform,Enterprise Edition，java平台企业版)\r\nJavaME(J2ME)(Java 2 Platform Micro Edition，java平台微型版)。\r\n2005年6月，JavaOne大会召开，SUN公司公开Java SE 6。此时，Java的各种版本已经更名以取消其中的数字\"2\"：J2EE更名为Java EE, J2SE更名为Java SE，J2ME更名为Java ME。\r\n\r\n主要特性\r\nJava语言是简单的：\r\nJava语言的语法与C语言和C++语言很接近，使得大多数程序员很容易学习和使用。另一方面，Java丢弃了C++中很少使用的、很难理解的、令人迷惑的那些特性，如操作符重载、多继承、自动的强制类型转换。特别地，Java语言不使用指针，而是引用。并提供了自动的废料收集，使得程序员不必为内存管理而担忧。\r\n\r\nJava语言是面向对象的：\r\nJava语言提供类、接口和继承等面向对象的特性，为了简单起见，只支持类之间的单继承，但支持接口之间的多继承，并支持类与接口之间的实现机制（关键字为implements）。Java语言全面支持动态绑定，而C++语言只对虚函数使用动态绑定。总之，Java语言是一个纯的面向对象程序设计语言。\r\n\r\nJava语言是分布式的：\r\nJava语言支持Internet应用的开发，在基本的Java应用编程接口中有一个网络应用编程接口（java net），它提供了用于网络应用编程的类库，包括URL、URLConnection、Socket、ServerSocket等。Java的RMI（远程方法激活）机制也是开发分布式应用的重要手段。\r\n\r\nJava语言是健壮的：\r\nJava的强类型机制、异常处理、垃圾的自动收集等是Java程序健壮性的重要保证。对指针的丢弃是Java的明智选择。Java的安全检查机制使得Java更具健壮性。\r\n\r\nJava语言是安全的：\r\nJava通常被用在网络环境中，为此，Java提供了一个安全机制以防恶意代码的攻击。除了Java语言具有的许多安全特性以外，Java对通过网络下载的类具有一个安全防范机制（类ClassLoader），如分配不同的名字空间以防替代本地的同名类、字节代码检查，并提供安全管理机制（类SecurityManager）让Java应用设置安全哨兵。\r\n\r\nJava语言是体系结构中立的：\r\nJava程序（后缀为java的文件）在Java平台上被编译为体系结构中立的字节码格式（后缀为class的文件），然后可以在实现这个Java平台的任何系统中运行。这种途径适合于异构的网络环境和软件的分发。\r\n\r\nJava语言是可移植的：\r\n这种可移植性来源于体系结构中立性，另外，Java还严格规定了各个基本数据类型的长度。Java系统本身也具有很强的可移植性，Java编译器是用Java实现的，Java的运行环境是用ANSI C实现的。\r\n\r\nJava语言是解释型的：\r\n如前所述，Java程序在Java平台上被编译为字节码格式，然后可以在实现这个Java平台的任何系统中运行。在运行时，Java平台中的Java解释器对这些字节码进行解释执行，执行过程中需要的类在联接阶段被载入到运行环境中。\r\n\r\nJava是高性能的：\r\n与那些解释型的高级脚本语言相比，Java的确是高性能的。事实上，Java的运行速度随着JIT(Just-In-Time）编译器技术的发展越来越接近于C++。\r\n\r\nJava语言是多线程的：\r\n在Java语言中，线程是一种特殊的对象，它必须由Thread类或其子（孙）类来创建。通常有两种方法来创建线程：其一，使用型构为Thread(Runnable)的构造子类将一个实现了Runnable接口的对象包装成一个线程，其二，从Thread类派生出子类并重写run方法，使用该子类创建的对象即为线程。值得注意的是Thread类已经实现了Runnable接口，因此，任何一个线程均有它的run方法，而run方法中包含了线程所要运行的代码。线程的活动由一组方法来控制。Java语言支持多个线程的同时执行，并提供多线程之间的同步机制（关键字为synchronized）。\r\n\r\nJava语言是动态的：\r\nJava语言的设计目标之一是适应于动态变化的环境。Java程序需要的类能够动态地被载入到运行环境，也可以通过网络来载入所需要的类。这也有利于软件的升级。另外，Java中的类有一个运行时刻的表示，能进行运行时刻的类型检查。', '1', 0, 0, 2, 1554710713, 1554827422, NULL);
INSERT INTO `tp_article` VALUES (10, '杰克', '谷歌的go', '执行命令解析', '基础', 'Java 简介\r\nJava是由Sun Microsystems公司于1995年5月推出的Java面向对象程序设计语言和Java平台的总称。由James Gosling和同事们共同研发，并在1995年正式推出。\r\n\r\nJava分为三个体系：\r\n\r\nJavaSE（J2SE）（Java2 Platform Standard Edition，java平台标准版）\r\nJavaEE(J2EE)(Java 2 Platform,Enterprise Edition，java平台企业版)\r\nJavaME(J2ME)(Java 2 Platform Micro Edition，java平台微型版)。\r\n2005年6月，JavaOne大会召开，SUN公司公开Java SE 6。此时，Java的各种版本已经更名以取消其中的数字\"2\"：J2EE更名为Java EE, J2SE更名为Java SE，J2ME更名为Java ME。\r\n\r\n主要特性\r\nJava语言是简单的：\r\nJava语言的语法与C语言和C++语言很接近，使得大多数程序员很容易学习和使用。另一方面，Java丢弃了C++中很少使用的、很难理解的、令人迷惑的那些特性，如操作符重载、多继承、自动的强制类型转换。特别地，Java语言不使用指针，而是引用。并提供了自动的废料收集，使得程序员不必为内存管理而担忧。\r\n\r\nJava语言是面向对象的：\r\nJava语言提供类、接口和继承等面向对象的特性，为了简单起见，只支持类之间的单继承，但支持接口之间的多继承，并支持类与接口之间的实现机制（关键字为implements）。Java语言全面支持动态绑定，而C++语言只对虚函数使用动态绑定。总之，Java语言是一个纯的面向对象程序设计语言。\r\n\r\nJava语言是分布式的：\r\nJava语言支持Internet应用的开发，在基本的Java应用编程接口中有一个网络应用编程接口（java net），它提供了用于网络应用编程的类库，包括URL、URLConnection、Socket、ServerSocket等。Java的RMI（远程方法激活）机制也是开发分布式应用的重要手段。\r\n\r\nJava语言是健壮的：\r\nJava的强类型机制、异常处理、垃圾的自动收集等是Java程序健壮性的重要保证。对指针的丢弃是Java的明智选择。Java的安全检查机制使得Java更具健壮性。\r\n\r\nJava语言是安全的：\r\nJava通常被用在网络环境中，为此，Java提供了一个安全机制以防恶意代码的攻击。除了Java语言具有的许多安全特性以外，Java对通过网络下载的类具有一个安全防范机制（类ClassLoader），如分配不同的名字空间以防替代本地的同名类、字节代码检查，并提供安全管理机制（类SecurityManager）让Java应用设置安全哨兵。\r\n\r\nJava语言是体系结构中立的：\r\nJava程序（后缀为java的文件）在Java平台上被编译为体系结构中立的字节码格式（后缀为class的文件），然后可以在实现这个Java平台的任何系统中运行。这种途径适合于异构的网络环境和软件的分发。\r\n\r\nJava语言是可移植的：\r\n这种可移植性来源于体系结构中立性，另外，Java还严格规定了各个基本数据类型的长度。Java系统本身也具有很强的可移植性，Java编译器是用Java实现的，Java的运行环境是用ANSI C实现的。\r\n\r\nJava语言是解释型的：\r\n如前所述，Java程序在Java平台上被编译为字节码格式，然后可以在实现这个Java平台的任何系统中运行。在运行时，Java平台中的Java解释器对这些字节码进行解释执行，执行过程中需要的类在联接阶段被载入到运行环境中。\r\n\r\nJava是高性能的：\r\n与那些解释型的高级脚本语言相比，Java的确是高性能的。事实上，Java的运行速度随着JIT(Just-In-Time）编译器技术的发展越来越接近于C++。\r\n\r\nJava语言是多线程的：\r\n在Java语言中，线程是一种特殊的对象，它必须由Thread类或其子（孙）类来创建。通常有两种方法来创建线程：其一，使用型构为Thread(Runnable)的构造子类将一个实现了Runnable接口的对象包装成一个线程，其二，从Thread类派生出子类并重写run方法，使用该子类创建的对象即为线程。值得注意的是Thread类已经实现了Runnable接口，因此，任何一个线程均有它的run方法，而run方法中包含了线程所要运行的代码。线程的活动由一组方法来控制。Java语言支持多个线程的同时执行，并提供多线程之间的同步机制（关键字为synchronized）。\r\n\r\nJava语言是动态的：\r\nJava语言的设计目标之一是适应于动态变化的环境。Java程序需要的类能够动态地被载入到运行环境，也可以通过网络来载入所需要的类。这也有利于软件的升级。另外，Java中的类有一个运行时刻的表示，能进行运行时刻的类型检查。', '1', 0, 0, 3, 0, 1554827366, NULL);
INSERT INTO `tp_article` VALUES (11, '中二病后期', 'f', 'f', 'fas', 'f', '0', 0, 0, 6, 1554840356, 1554840356, NULL);
INSERT INTO `tp_article` VALUES (12, '中二病后期', 'f', 'f', 'ces', 'f', '0', 0, 0, 7, 1554840393, 1554840393, NULL);
INSERT INTO `tp_article` VALUES (13, '中二病后期', 'f', 'f', 'ces', 'f', '0', 0, 0, 7, 1554840447, 1554840447, NULL);
INSERT INTO `tp_article` VALUES (14, '中二病后期', 'ThinkPHP 伍！', 'ThinkPHP 5.0完全开发手册 ThinkPHP是一个免费开源的，快速、简单的面向对象的轻量级PHP开发框架。', '框架', '\r\nThinkPHP 5.0完全开发手册 ThinkPHP是一个免费开源的，快速、简单的面向对象的轻量级PHP开发框架， 是为了敏捷WEB应用开发和简化企业应用开发而诞生的。ThinkPHP从诞生以来一直秉承简洁实用的设计原则 ，在保持出色的性能和至简的代码的同时，也注重易用性。遵循Apache2开源许可协议发布， 意味着你可以免费使用ThinkPHP，甚至允许把你基于ThinkPHP开发的应用开源或商业产品发布/销售。', '0', 0, 0, 3, 1554840620, 1554840620, NULL);

-- ----------------------------
-- Table structure for tp_cate
-- ----------------------------
DROP TABLE IF EXISTS `tp_cate`;
CREATE TABLE `tp_cate`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `catename` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '导航名称',
  `sort` int(11) NOT NULL COMMENT '排序',
  `create_time` int(11) NOT NULL COMMENT '添加时间',
  `update_time` int(11) NOT NULL COMMENT '更新时间',
  `delete_time` int(11) NULL DEFAULT NULL COMMENT '软删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tp_cate
-- ----------------------------
INSERT INTO `tp_cate` VALUES (1, 'Go', 2, 1554631232, 1554835655, 1554835655);
INSERT INTO `tp_cate` VALUES (2, 'Java', 7, 1554631576, 1554835979, NULL);
INSERT INTO `tp_cate` VALUES (3, 'C#', 2, 1554631623, 1554835697, NULL);
INSERT INTO `tp_cate` VALUES (4, 'C++', 1, 1554710377, 1554737392, 1554737392);
INSERT INTO `tp_cate` VALUES (6, 'C', 3, 1554710699, 1554835994, NULL);
INSERT INTO `tp_cate` VALUES (7, 'Go', 1, 1554715962, 1554836003, NULL);
INSERT INTO `tp_cate` VALUES (8, 'THINKPHP', 4, 1554840578, 1554840595, NULL);

-- ----------------------------
-- Table structure for tp_comment
-- ----------------------------
DROP TABLE IF EXISTS `tp_comment`;
CREATE TABLE `tp_comment`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评论内容',
  `article_id` int(11) NOT NULL COMMENT '评论文章',
  `member_id` int(11) NOT NULL COMMENT '评论用户',
  `create_time` int(11) NOT NULL COMMENT '评论时间',
  `update_time` int(11) NOT NULL COMMENT '更新时间',
  `delete_time` int(11) NULL DEFAULT NULL COMMENT '软删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tp_comment
-- ----------------------------
INSERT INTO `tp_comment` VALUES (1, 'order 方法为什么不支持子查询呢？', 2, 2, 1554731636, 1554736392, NULL);
INSERT INTO `tp_comment` VALUES (3, 'order 方法为什么不支持子查询呢？', 1, 1, 1554732453, 1554736790, NULL);
INSERT INTO `tp_comment` VALUES (4, 'order 方法为什么不支持子查询呢？', 2, 5, 1554789260, 1554827513, 1554827513);
INSERT INTO `tp_comment` VALUES (5, 'order 方法为什么不支持子查询呢？', 2, 5, 1554789348, 1554827521, 1554827521);
INSERT INTO `tp_comment` VALUES (6, 'order 方法为什么不支持子查询呢？', 2, 5, 1554789531, 1554827529, 1554827529);
INSERT INTO `tp_comment` VALUES (7, 'order 方法为什么不支持子查询呢？', 2, 5, 1554789571, 1554827536, 1554827536);
INSERT INTO `tp_comment` VALUES (8, 'order 方法为什么不支持子查询呢？', 2, 5, 1554789603, 1554827542, 1554827542);
INSERT INTO `tp_comment` VALUES (9, 'order 方法为什么不支持子查询呢？', 2, 5, 1554789673, 1554827503, 1554827503);
INSERT INTO `tp_comment` VALUES (10, 'order 方法为什么不支持子查询呢？', 2, 5, 1554789746, 1554825313, 1554825313);
INSERT INTO `tp_comment` VALUES (11, 'order 方法为什么不支持子查询呢？', 9, 2, 1554789906, 1554789906, NULL);
INSERT INTO `tp_comment` VALUES (12, 'order 方法为什么不支持子查询呢？', 9, 2, 1554789935, 1554789935, NULL);
INSERT INTO `tp_comment` VALUES (13, 'order 方法为什么不支持子查询呢？', 9, 2, 1554789968, 1554789968, NULL);
INSERT INTO `tp_comment` VALUES (14, 'order 方法为什么不支持子查询呢？', 9, 2, 1554789983, 1554789983, NULL);
INSERT INTO `tp_comment` VALUES (15, '如何运行\r\n', 9, 7, 1554823489, 1554823489, NULL);
INSERT INTO `tp_comment` VALUES (16, '测试评论\r\n', 5, 7, 1554823521, 1554823521, NULL);
INSERT INTO `tp_comment` VALUES (17, '测试评论\r\n', 3, 7, 1554823623, 1554823623, NULL);
INSERT INTO `tp_comment` VALUES (18, '赞一个！', 14, 7, 1554840651, 1554840651, NULL);

-- ----------------------------
-- Table structure for tp_member
-- ----------------------------
DROP TABLE IF EXISTS `tp_member`;
CREATE TABLE `tp_member`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '会员账户',
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nickname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '昵称',
  `email` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` int(11) NOT NULL COMMENT '注册时间',
  `update_time` int(11) NOT NULL COMMENT '更新时间',
  `delete_time` int(11) NULL DEFAULT NULL COMMENT '软删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tp_member
-- ----------------------------
INSERT INTO `tp_member` VALUES (1, 'a', 'awefwa', '探索者', 'eee@qq.com', 1554714274, 1554722581, NULL);
INSERT INTO `tp_member` VALUES (2, 'jack', 'as', 'Jack', '318277446@qq.com', 1554714467, 1554736392, NULL);
INSERT INTO `tp_member` VALUES (3, 'a', 'f', 'Cookie', '318277446@qq.com', 1554714679, 1554722497, NULL);
INSERT INTO `tp_member` VALUES (4, 'yang2', 'a', 'Yang', '31826ffff@qq.com', 1554724517, 1554724517, NULL);
INSERT INTO `tp_member` VALUES (7, 'f', 'f', '中二病后期', '31826@qq.com', 1554782612, 1554782612, NULL);
INSERT INTO `tp_member` VALUES (8, 'f', 'f', 'ffftest', '318277446@qq.com', 1554825474, 1554828787, NULL);
INSERT INTO `tp_member` VALUES (9, 'd', 'dd', 'dddt', '31ddt@qq.com', 1554825564, 1554828810, NULL);

-- ----------------------------
-- Table structure for tp_system
-- ----------------------------
DROP TABLE IF EXISTS `tp_system`;
CREATE TABLE `tp_system`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `webname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '网站标题',
  `copyright` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '版权信息',
  `create_time` int(11) NOT NULL COMMENT '设置时间',
  `update_time` int(11) NOT NULL COMMENT '更新时间',
  `delete_time` int(11) NULL DEFAULT NULL COMMENT '软删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tp_system
-- ----------------------------
INSERT INTO `tp_system` VALUES (1, 'PHP之家', 'www.yang.com', 0, 1554825616, NULL);

SET FOREIGN_KEY_CHECKS = 1;
