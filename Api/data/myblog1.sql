# Host: localhost  (Version: 5.5.53)
# Date: 2018-08-22 02:12:22
# Generator: MySQL-Front 5.3  (Build 4.234)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "blog_admin_app"
#

DROP TABLE IF EXISTS `blog_admin_app`;
CREATE TABLE `blog_admin_app` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `app_id` varchar(50) NOT NULL DEFAULT '' COMMENT '应用id',
  `app_secret` varchar(50) NOT NULL DEFAULT '' COMMENT '应用密码',
  `app_name` varchar(50) NOT NULL DEFAULT '' COMMENT '应用名称',
  `app_status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '应用状态：0表示禁用，1表示启用',
  `app_info` tinytext COMMENT '应用说明',
  `app_api` text COMMENT '当前应用允许请求的全部API接口',
  `app_group` varchar(128) NOT NULL DEFAULT 'default' COMMENT '当前应用所属的应用组唯一标识',
  `app_addTime` int(11) NOT NULL DEFAULT '0' COMMENT '应用创建时间',
  `app_api_show` text COMMENT '前台样式显示所需数据格式',
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_id` (`app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='appId和appSecret表';

#
# Data for table "blog_admin_app"
#


#
# Structure for table "blog_admin_app_group"
#

DROP TABLE IF EXISTS `blog_admin_app_group`;
CREATE TABLE `blog_admin_app_group` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL DEFAULT '' COMMENT '组名称',
  `description` text COMMENT '组说明',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '组状态',
  `hash` varchar(128) NOT NULL DEFAULT '' COMMENT '组标识',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='应用组，目前只做管理使用，没有实际权限控制';

#
# Data for table "blog_admin_app_group"
#


#
# Structure for table "blog_admin_article"
#

DROP TABLE IF EXISTS `blog_admin_article`;
CREATE TABLE `blog_admin_article` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL COMMENT '文章标题',
  `addtime` varchar(255) DEFAULT NULL COMMENT '添加时间',
  `updatetime` varchar(255) DEFAULT NULL COMMENT '更新时间',
  `from` text COMMENT '转载地址',
  `author` varchar(255) DEFAULT NULL COMMENT '作者',
  `content` text COMMENT '内容',
  `type` int(11) DEFAULT NULL COMMENT '文章分类id',
  `tags` varchar(255) DEFAULT NULL COMMENT '标签以json字符串数组形式报错标签id',
  `watchnum` int(11) DEFAULT NULL COMMENT '观看次数',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `abstract` text COMMENT '简介',
  `mainimg` text COMMENT '主图',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章';

#
# Data for table "blog_admin_article"
#

INSERT INTO `blog_admin_article` VALUES (1,'123','2018-08-06T16:00:00.000Z','1534874248','234','winljm001','<p>124134</p>',NULL,NULL,NULL,0,'123','http://localhost/upload/20180822/0bc683e5d5fdd104f63bf63d8faff031.png'),(2,NULL,'1533571200','1534875010',NULL,'winljm001',NULL,NULL,NULL,NULL,0,NULL,'');

#
# Structure for table "blog_admin_auth_group"
#

DROP TABLE IF EXISTS `blog_admin_auth_group`;
CREATE TABLE `blog_admin_auth_group` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '组名称',
  `description` varchar(50) DEFAULT '' COMMENT '组描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '组状态：为1正常，为0禁用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='权限组';

#
# Data for table "blog_admin_auth_group"
#


#
# Structure for table "blog_admin_auth_group_access"
#

DROP TABLE IF EXISTS `blog_admin_auth_group_access`;
CREATE TABLE `blog_admin_auth_group_access` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL,
  `groupId` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户和组的对应关系';

#
# Data for table "blog_admin_auth_group_access"
#


#
# Structure for table "blog_admin_auth_rule"
#

DROP TABLE IF EXISTS `blog_admin_auth_rule`;
CREATE TABLE `blog_admin_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `url` char(80) NOT NULL DEFAULT '' COMMENT '规则唯一标识',
  `groupId` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '权限所属组的ID',
  `auth` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '权限数值',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态：为1正常，为0禁用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='权限细节';

#
# Data for table "blog_admin_auth_rule"
#


#
# Structure for table "blog_admin_fields"
#

DROP TABLE IF EXISTS `blog_admin_fields`;
CREATE TABLE `blog_admin_fields` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `fieldName` varchar(50) NOT NULL DEFAULT '' COMMENT '字段名称',
  `hash` varchar(50) NOT NULL DEFAULT '' COMMENT '对应接口的唯一标识',
  `dataType` tinyint(2) NOT NULL DEFAULT '0' COMMENT '数据类型，来源于DataType类库',
  `default` varchar(500) NOT NULL DEFAULT '' COMMENT '默认值',
  `isMust` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否必须 0为不必须，1为必须',
  `range` varchar(500) NOT NULL DEFAULT '' COMMENT '范围，Json字符串，根据数据类型有不一样的含义',
  `info` varchar(500) NOT NULL DEFAULT '' COMMENT '字段说明',
  `type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '字段用处：0为request，1为response',
  `showName` varchar(50) NOT NULL DEFAULT '' COMMENT 'wiki显示用字段',
  PRIMARY KEY (`id`),
  KEY `hash` (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用于保存各个API的字段规则';

#
# Data for table "blog_admin_fields"
#


#
# Structure for table "blog_admin_group"
#

DROP TABLE IF EXISTS `blog_admin_group`;
CREATE TABLE `blog_admin_group` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL DEFAULT '' COMMENT '组名称',
  `description` text COMMENT '组说明',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '组状态',
  `hash` varchar(64) NOT NULL DEFAULT '' COMMENT '组唯一标识',
  `addTime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updateTime` int(11) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `image` varchar(256) DEFAULT NULL COMMENT '分组封面图',
  `hot` int(11) NOT NULL DEFAULT '0' COMMENT '分组热度',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='接口组管理';

#
# Data for table "blog_admin_group"
#

INSERT INTO `blog_admin_group` VALUES (1,'默认分组','默认分组',1,'default',0,0,'',0);

#
# Structure for table "blog_admin_list"
#

DROP TABLE IF EXISTS `blog_admin_list`;
CREATE TABLE `blog_admin_list` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `apiClass` varchar(50) NOT NULL DEFAULT '' COMMENT 'api索引，保存了类和方法',
  `hash` varchar(50) NOT NULL DEFAULT '' COMMENT 'api唯一标识',
  `accessToken` tinyint(2) NOT NULL DEFAULT '1' COMMENT '是否需要认证AccessToken 1：需要，0：不需要',
  `needLogin` tinyint(2) NOT NULL DEFAULT '1' COMMENT '是否需要认证用户token  1：需要 0：不需要',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT 'API状态：0表示禁用，1表示启用',
  `method` tinyint(2) NOT NULL DEFAULT '2' COMMENT '请求方式0：不限1：Post，2：Get',
  `info` varchar(500) DEFAULT '' COMMENT 'api中文说明',
  `isTest` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否是测试模式：0:生产模式，1：测试模式',
  `returnStr` text COMMENT '返回数据示例',
  `groupHash` varchar(64) NOT NULL DEFAULT 'default' COMMENT '当前接口所属的接口分组',
  PRIMARY KEY (`id`),
  UNIQUE KEY `hash` (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用于维护接口信息';

#
# Data for table "blog_admin_list"
#


#
# Structure for table "blog_admin_menu"
#

DROP TABLE IF EXISTS `blog_admin_menu`;
CREATE TABLE `blog_admin_menu` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '菜单名',
  `fid` int(11) NOT NULL COMMENT '父级菜单ID',
  `url` varchar(50) NOT NULL DEFAULT '' COMMENT '链接',
  `auth` tinyint(2) NOT NULL DEFAULT '0' COMMENT '访客权限',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `hide` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否显示',
  `icon` varchar(50) NOT NULL DEFAULT '' COMMENT '菜单图标',
  `level` tinyint(2) NOT NULL DEFAULT '0' COMMENT '菜单认证等级',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COMMENT='目录信息';

#
# Data for table "blog_admin_menu"
#

INSERT INTO `blog_admin_menu` VALUES (1,'用户登录',0,'admin/Login/index',0,0,0,'',0),(2,'用户登出',0,'admin/Login/logout',0,0,0,'',0),(3,'系统管理',0,'',0,1,0,'',0),(4,'菜单维护',3,'',0,1,0,'',0),(5,'菜单状态修改',4,'admin/Menu/changeStatus',0,0,0,'',0),(6,'新增菜单',4,'admin/Menu/add',0,0,0,'',0),(7,'编辑菜单',4,'admin/Menu/edit',0,0,0,'',0),(8,'菜单删除',4,'admin/Menu/del',0,0,0,'',0),(9,'用户管理',3,'',0,2,0,'',0),(10,'获取当前组的全部用户',9,'admin/User/getUsers',0,0,0,'',0),(11,'用户状态修改',9,'admin/User/changeStatus',0,0,0,'',0),(12,'新增用户',9,'admin/User/add',0,0,0,'',0),(13,'用户编辑',9,'admin/User/edit',0,0,0,'',0),(14,'用户删除',9,'admin/User/del',0,0,0,'',0),(15,'权限管理',3,'',0,3,0,'',0),(16,'权限组状态编辑',15,'admin/Auth/changeStatus',0,0,0,'',0),(17,'从指定组中删除指定用户',15,'admin/Auth/delMember',0,0,0,'',0),(18,'新增权限组',15,'admin/Auth/add',0,0,0,'',0),(19,'权限组编辑',15,'admin/Auth/edit',0,0,0,'',0),(20,'删除权限组',15,'admin/Auth/del',0,0,0,'',0),(21,'获取全部已开放的可选组',15,'admin/Auth/getGroups',0,0,0,'',0),(22,'获取组所有的权限列表',15,'admin/Auth/getRuleList',0,0,0,'',0),(23,'应用接入',0,'',0,2,0,'',0),(24,'应用管理',23,'',0,0,0,'',0),(25,'应用状态编辑',24,'admin/App/changeStatus',0,0,0,'',0),(26,'获取AppId,AppSecret,接口列表,应用接口权限细节',24,'admin/App/getAppInfo',0,0,0,'',0),(27,'新增应用',24,'admin/App/add',0,0,0,'',0),(28,'编辑应用',24,'admin/App/edit',0,0,0,'',0),(29,'删除应用',24,'admin/App/del',0,0,0,'',0),(30,'接口管理',0,'',0,3,0,'',0),(31,'接口维护',30,'',0,0,0,'',0),(32,'接口状态编辑',31,'admin/InterfaceList/changeStatus',0,0,0,'',0),(33,'获取接口唯一标识',31,'admin/InterfaceList/getHash',0,0,0,'',0),(34,'添加接口',31,'admin/InterfaceList/add',0,0,0,'',0),(35,'编辑接口',31,'admin/InterfaceList/edit',0,0,0,'',0),(36,'删除接口',31,'admin/InterfaceList/del',0,0,0,'',0),(37,'获取接口请求字段',31,'admin/Fields/request',0,0,0,'',0),(38,'获取接口返回字段',31,'admin/Fields/response',0,0,0,'',0),(39,'添加接口字段',31,'admin/Fields/add',0,0,0,'',0),(40,'上传接口返回字段',31,'admin/Fields/upload',0,0,0,'',0),(41,'编辑接口字段',31,'admin/Fields/edit',0,0,0,'',0),(42,'删除接口字段',31,'admin/Fields/del',0,0,0,'',0),(43,'接口分组',30,'',0,1,0,'',0),(44,'添加接口组',43,'admin/InterfaceGroup/add',0,0,0,'',0),(45,'编辑接口组',43,'admin/InterfaceGroup/edit',0,0,0,'',0),(46,'删除接口组',43,'admin/InterfaceGroup/del',0,0,0,'',0),(47,'获取全部有效的接口组',43,'admin/InterfaceGroup/getAll',0,0,0,'',0),(48,'接口组状态维护',43,'admin/InterfaceGroup/changeStatus',0,0,0,'',0),(49,'应用分组',23,'',0,1,0,'',0),(50,'添加应用组',49,'admin/AppGroup/add',0,0,0,'',0),(51,'编辑应用组',49,'admin/AppGroup/edit',0,0,0,'',0),(52,'删除应用组',49,'admin/AppGroup/del',0,0,0,'',0),(53,'获取全部可用应用组',49,'admin/AppGroup/getAll',0,0,0,'',0),(54,'应用组状态编辑',49,'admin/AppGroup/changeStatus',0,0,0,'',0),(55,'菜单列表',4,'admin/Menu/index',0,0,0,'',0),(56,'用户列表',9,'admin/User/index',0,0,0,'',0),(57,'权限列表',15,'admin/Auth/index',0,0,0,'',0),(58,'应用列表',24,'admin/App/index',0,0,0,'',0),(59,'应用分组列表',49,'admin/AppGroup/index',0,0,0,'',0),(60,'接口列表',31,'admin/InterfaceList/index',0,0,0,'',0),(61,'接口分组列表',43,'admin/InterfaceGroup/index',0,0,0,'',0),(62,'日志管理',3,'',0,4,0,'',0),(63,'获取操作日志列表',62,'admin/Log/index',0,0,0,'',0),(64,'删除单条日志记录',62,'admin/Log/del',0,0,0,'',0),(65,'刷新路由',31,'admin/InterfaceList/refresh',0,0,0,'',0),(67,'文件上传',0,'admin/Index/upload',0,0,0,'',0),(68,'更新个人信息',9,'admin/User/own',0,0,0,'',0),(69,'刷新AppSecret',24,'admin/App/refreshAppSecret',0,0,0,'',0),(70,'获取admin信息',0,'admin/Admin/getAdmin',0,0,0,'',0),(71,'设置admin信息',0,'admin/Admin/setAdmin',0,0,0,'',0),(72,'添加文章',0,'admin/Article/add',0,0,0,'',0),(73,'文章列表',0,'admin/Article/index',0,0,0,'',0),(74,'编辑文章',0,'admin/Article/edit',0,0,0,'',0),(75,'删除文章',0,'admin/Article/del',0,0,0,'',0),(76,'文章详情',0,'admin/Article/detail',0,0,0,'',0);

#
# Structure for table "blog_admin_user"
#

DROP TABLE IF EXISTS `blog_admin_user`;
CREATE TABLE `blog_admin_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(64) NOT NULL DEFAULT '' COMMENT '用户昵称',
  `password` char(32) NOT NULL DEFAULT '' COMMENT '用户密码',
  `regTime` int(10) NOT NULL DEFAULT '0' COMMENT '注册时间',
  `regIp` bigint(11) NOT NULL COMMENT '注册IP',
  `updateTime` int(10) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '账号状态 0封号 1正常',
  `openId` varchar(100) DEFAULT NULL COMMENT '三方登录唯一ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='管理员认证信息';

#
# Data for table "blog_admin_user"
#

INSERT INTO `blog_admin_user` VALUES (1,'root','winljm001','912601e4ad1b308c9ae41877cf6ca754',1519453594,3663623043,1524152828,1,NULL);

#
# Structure for table "blog_admin_user_action"
#

DROP TABLE IF EXISTS `blog_admin_user_action`;
CREATE TABLE `blog_admin_user_action` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `actionName` varchar(50) NOT NULL DEFAULT '' COMMENT '行为名称',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '操作用户ID',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '用户昵称',
  `addTime` int(11) NOT NULL DEFAULT '0' COMMENT '操作时间',
  `data` text COMMENT '用户提交的数据',
  `url` varchar(200) NOT NULL DEFAULT '' COMMENT '操作URL',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=utf8mb4 COMMENT='用户操作日志';

#
# Data for table "blog_admin_user_action"
#

INSERT INTO `blog_admin_user_action` VALUES (1,'菜单列表',1,'root',1532366802,'[]','admin/Menu/index'),(2,'用户列表',1,'root',1532366805,'{\"page\":\"1\",\"size\":\"10\",\"type\":\"\",\"keywords\":\"\",\"status\":\"\"}','admin/User/index'),(3,'菜单列表',1,'root',1532366806,'[]','admin/Menu/index'),(4,'用户列表',1,'root',1532366808,'{\"page\":\"1\",\"size\":\"10\",\"type\":\"\",\"keywords\":\"\",\"status\":\"\"}','admin/User/index'),(5,'权限列表',1,'root',1532366811,'{\"page\":\"1\",\"size\":\"10\",\"keywords\":\"\",\"status\":\"\"}','admin/Auth/index'),(6,'获取操作日志列表',1,'root',1532366812,'{\"page\":\"1\",\"size\":\"10\",\"type\":\"\",\"keywords\":\"\"}','admin/Log/index'),(7,'应用分组列表',1,'root',1532366816,'{\"page\":\"1\",\"size\":\"10\",\"type\":\"\",\"keywords\":\"\",\"status\":\"\"}','admin/AppGroup/index'),(8,'应用列表',1,'root',1532366817,'{\"page\":\"1\",\"size\":\"10\",\"type\":\"\",\"keywords\":\"\",\"status\":\"\"}','admin/App/index'),(9,'接口分组列表',1,'root',1532366820,'{\"page\":\"1\",\"size\":\"10\",\"type\":\"\",\"keywords\":\"\",\"status\":\"\"}','admin/InterfaceGroup/index'),(10,'接口列表',1,'root',1532366821,'{\"page\":\"1\",\"size\":\"10\",\"type\":\"\",\"keywords\":\"\",\"status\":\"\"}','admin/InterfaceList/index'),(11,'获取全部有效的接口组',1,'root',1532366821,'[]','admin/InterfaceGroup/getAll'),(12,'获取全部有效的接口组',1,'root',1532366823,'[]','admin/InterfaceGroup/getAll'),(13,'获取接口唯一标识',1,'root',1532366826,'[]','admin/InterfaceList/getHash'),(14,'菜单列表',1,'root',1532366842,'[]','admin/Menu/index'),(15,'应用分组列表',1,'root',1532366845,'{\"page\":\"1\",\"size\":\"10\",\"type\":\"\",\"keywords\":\"\",\"status\":\"\"}','admin/AppGroup/index'),(16,'应用列表',1,'root',1532366846,'{\"page\":\"1\",\"size\":\"10\",\"type\":\"\",\"keywords\":\"\",\"status\":\"\"}','admin/App/index'),(17,'菜单列表',1,'root',1532366847,'[]','admin/Menu/index'),(18,'用户列表',1,'root',1532366857,'{\"page\":\"1\",\"size\":\"10\",\"type\":\"\",\"keywords\":\"\",\"status\":\"\"}','admin/User/index'),(19,'权限列表',1,'root',1532366859,'{\"page\":\"1\",\"size\":\"10\",\"keywords\":\"\",\"status\":\"\"}','admin/Auth/index'),(20,'获取操作日志列表',1,'root',1532366860,'{\"page\":\"1\",\"size\":\"10\",\"type\":\"\",\"keywords\":\"\"}','admin/Log/index'),(21,'获取全部可用应用组',1,'root',1532366864,'[]','admin/AppGroup/getAll'),(22,'获取AppId,AppSecret,接口列表,应用接口权限细节',1,'root',1532366864,'[]','admin/App/getAppInfo'),(23,'获取接口唯一标识',1,'root',1532366870,'[]','admin/InterfaceList/getHash'),(24,'获取当前组的全部用户',1,'root',1532446718,'{\"token\":\"e364b35c5d81de8f8da62e5b21fd1adc\"}','admin/User/getUsers'),(25,'获取当前组的全部用户',1,'root',1532446730,'[]','admin/User/getUsers'),(26,'获取当前组的全部用户',1,'root',1534442546,'[]','admin/User/getUsers'),(27,'获取当前组的全部用户',1,'root',1534442711,'[]','admin/User/getUsers'),(28,'获取当前组的全部用户',1,'root',1534442991,'[]','admin/User/getUsers'),(29,'获取当前组的全部用户',1,'root',1534443028,'[]','admin/User/getUsers'),(30,'获取当前组的全部用户',1,'root',1534443067,'[]','admin/User/getUsers'),(31,'获取当前组的全部用户',1,'root',1534443068,'[]','admin/User/getUsers'),(32,'获取当前组的全部用户',1,'root',1534443078,'[]','admin/User/getUsers'),(33,'获取当前组的全部用户',1,'root',1534443169,'[]','admin/User/getUsers'),(34,'获取当前组的全部用户',1,'root',1534443241,'[]','admin/User/getUsers'),(35,'获取当前组的全部用户',1,'root',1534443247,'[]','admin/User/getUsers'),(36,'获取当前组的全部用户',1,'root',1534443341,'[]','admin/User/getUsers'),(37,'获取当前组的全部用户',1,'root',1534443354,'[]','admin/User/getUsers'),(38,'获取admin信息',1,'root',1534444743,'[]','admin/Admin/getAdmin'),(39,'获取admin信息',1,'root',1534444759,'[]','admin/Admin/getAdmin'),(40,'获取admin信息',1,'root',1534444985,'[]','admin/Admin/getAdmin'),(41,'获取admin信息',1,'root',1534445053,'[]','admin/Admin/getAdmin'),(42,'获取admin信息',1,'root',1534445058,'[]','admin/Admin/getAdmin'),(43,'获取admin信息',1,'root',1534445153,'[]','admin/Admin/getAdmin'),(44,'获取admin信息',1,'root',1534445174,'[]','admin/Admin/getAdmin'),(45,'获取admin信息',1,'root',1534445248,'[]','admin/Admin/getAdmin'),(46,'获取admin信息',1,'root',1534445257,'[]','admin/Admin/getAdmin'),(47,'获取admin信息',1,'root',1534445350,'[]','admin/Admin/getAdmin'),(48,'获取admin信息',1,'root',1534445367,'[]','admin/Admin/getAdmin'),(49,'获取admin信息',1,'root',1534445379,'[]','admin/Admin/getAdmin'),(50,'获取admin信息',1,'root',1534445438,'[]','admin/Admin/getAdmin'),(51,'获取admin信息',1,'root',1534445438,'[]','admin/Admin/getAdmin'),(52,'获取admin信息',1,'root',1534445481,'[]','admin/Admin/getAdmin'),(53,'获取admin信息',1,'root',1534445490,'{\"uid\":\"1\"}','admin/Admin/getAdmin'),(54,'获取admin信息',1,'root',1534445859,'{\"uid\":\"1\"}','admin/Admin/getAdmin'),(55,'获取admin信息',1,'root',1534445937,'{\"uid\":\"1\"}','admin/Admin/getAdmin'),(56,'获取admin信息',1,'root',1534445962,'{\"uid\":\"1\"}','admin/Admin/getAdmin'),(57,'获取admin信息',1,'root',1534446004,'{\"uid\":\"1\"}','admin/Admin/getAdmin'),(58,'获取admin信息',1,'root',1534446103,'{\"uid\":\"1\"}','admin/Admin/getAdmin'),(59,'获取admin信息',1,'root',1534446154,'{\"uid\":\"1\"}','admin/Admin/getAdmin'),(60,'获取admin信息',1,'root',1534446270,'{\"uid\":\"1\"}','admin/Admin/getAdmin'),(61,'获取admin信息',1,'root',1534446322,'{\"uid\":\"1\"}','admin/Admin/getAdmin'),(62,'获取admin信息',1,'root',1534446400,'{\"uid\":\"1\"}','admin/Admin/getAdmin'),(63,'获取admin信息',1,'root',1534446462,'{\"uid\":\"1\"}','admin/Admin/getAdmin'),(64,'获取admin信息',1,'root',1534503275,'{\"uid\":\"1\"}','admin/Admin/getAdmin'),(65,'获取admin信息',1,'root',1534507192,'{\"uid\":\"1\"}','admin/Admin/getAdmin'),(66,'获取admin信息',1,'root',1534507332,'{\"uid\":\"1\"}','admin/Admin/getAdmin'),(67,'获取admin信息',1,'root',1534507362,'{\"uid\":\"1\"}','admin/Admin/getAdmin'),(68,'获取admin信息',1,'root',1534507365,'{\"uid\":\"1\"}','admin/Admin/getAdmin'),(69,'获取admin信息',1,'root',1534507608,'{\"uid\":\"1\"}','admin/Admin/getAdmin'),(70,'获取admin信息',1,'root',1534507612,'{\"uid\":\"1\"}','admin/Admin/getAdmin'),(71,'获取admin信息',1,'root',1534507744,'{\"uid\":\"1\"}','admin/Admin/getAdmin'),(72,'获取admin信息',1,'root',1534507748,'{\"uid\":\"1\"}','admin/Admin/getAdmin'),(73,'文件上传',1,'root',1534507755,'[]','admin/Index/upload'),(74,'获取admin信息',1,'root',1534507874,'{\"uid\":\"1\"}','admin/Admin/getAdmin'),(75,'文件上传',1,'root',1534507893,'[]','admin/Index/upload'),(76,'文件上传',1,'root',1534507896,'[]','admin/Index/upload'),(77,'获取admin信息',1,'root',1534507955,'{\"uid\":\"1\"}','admin/Admin/getAdmin'),(78,'文件上传',1,'root',1534507959,'[]','admin/Index/upload'),(79,'获取admin信息',1,'root',1534508275,'{\"uid\":\"1\"}','admin/Admin/getAdmin'),(80,'获取admin信息',1,'root',1534508289,'{\"uid\":\"1\"}','admin/Admin/getAdmin'),(81,'获取admin信息',1,'root',1534508294,'{\"uid\":\"1\"}','admin/Admin/getAdmin'),(82,'获取admin信息',1,'root',1534508366,'{\"uid\":\"1\"}','admin/Admin/getAdmin'),(83,'获取admin信息',1,'root',1534508674,'{\"uid\":\"1\"}','admin/Admin/getAdmin'),(84,'文件上传',1,'root',1534508679,'[]','admin/Index/upload'),(85,'获取admin信息',1,'root',1534509059,'{\"uid\":\"1\"}','admin/Admin/getAdmin'),(86,'文件上传',1,'root',1534509073,'[]','admin/Index/upload'),(87,'获取admin信息',1,'root',1534509163,'{\"uid\":\"1\"}','admin/Admin/getAdmin'),(88,'获取admin信息',1,'root',1534509201,'{\"uid\":\"1\"}','admin/Admin/getAdmin'),(89,'文件上传',1,'root',1534509247,'[]','admin/Index/upload'),(90,'获取admin信息',1,'root',1534509897,'{\"uid\":\"1\"}','admin/Admin/getAdmin'),(91,'获取admin信息',1,'root',1534509923,'{\"uid\":\"1\"}','admin/Admin/getAdmin'),(92,'获取admin信息',1,'root',1534510028,'{\"uid\":\"1\"}','admin/Admin/getAdmin'),(93,'获取admin信息',1,'root',1534510030,'{\"uid\":\"1\"}','admin/Admin/getAdmin'),(94,'文件上传',1,'root',1534510057,'[]','admin/Index/upload'),(95,'文件上传',1,'root',1534510065,'[]','admin/Index/upload'),(96,'获取admin信息',1,'root',1534510939,'{\"uid\":\"1\"}','admin/Admin/getAdmin'),(97,'设置admin信息',1,'root',1534511396,'{\"nickname\":\"root1\",\"username\":\"root\",\"email\":\"winljm001@qq.com\",\"technology\":\"vue\\u5168\\u5bb6\\u6876\\uff0celement-ui\\uff0ctp5\",\"reference\":\"\\u6e1dICP\\u590717006757\\u53f7\",\"headImg\":\"https:\\/\\/apic.douyucdn.cn\\/upload\\/avatar\\/006\\/29\\/44\\/20_avatar_middle.jpg\",\"logo\":null}','admin/Admin/setAdmin'),(98,'获取admin信息',1,'root',1534511431,'{\"uid\":\"1\"}','admin/Admin/getAdmin'),(99,'获取admin信息',1,'root',1534511433,'{\"uid\":\"1\"}','admin/Admin/getAdmin'),(100,'设置admin信息',1,'root',1534511437,'{\"id\":1,\"nickname\":\"root1\",\"username\":\"root\",\"email\":\"winljm001@qq.com\",\"technology\":\"vue\\u5168\\u5bb6\\u6876\\uff0celement-ui\\uff0ctp5\",\"reference\":\"\\u6e1dICP\\u590717006757\\u53f7\",\"headImg\":\"https:\\/\\/apic.douyucdn.cn\\/upload\\/avatar\\/006\\/29\\/44\\/20_avatar_middle.jpg\",\"logo\":null}','admin/Admin/setAdmin'),(101,'获取admin信息',1,'root',1534511582,'{\"uid\":\"1\"}','admin/Admin/getAdmin'),(102,'设置admin信息',1,'root',1534511587,'{\"id\":1,\"nickname\":\"root1\",\"username\":\"root\",\"email\":\"winljm001@qq.com\",\"technology\":\"vue\\u5168\\u5bb6\\u6876\\uff0celement-ui\\uff0ctp5\",\"reference\":\"\\u6e1dICP\\u590717006757\\u53f7\",\"headImg\":\"https:\\/\\/apic.douyucdn.cn\\/upload\\/avatar\\/006\\/29\\/44\\/20_avatar_middle.jpg\",\"logo\":null}','admin/Admin/setAdmin'),(103,'设置admin信息',1,'root',1534511642,'{\"id\":1,\"nickname\":\"root1\",\"username\":\"root\",\"email\":\"winljm001@qq.com\",\"technology\":\"vue\\u5168\\u5bb6\\u6876\\uff0celement-ui\\uff0ctp5\",\"reference\":\"\\u6e1dICP\\u590717006757\\u53f7\",\"headImg\":\"https:\\/\\/apic.douyucdn.cn\\/upload\\/avatar\\/006\\/29\\/44\\/20_avatar_middle.jpg\",\"logo\":null}','admin/Admin/setAdmin'),(104,'设置admin信息',1,'root',1534511650,'{\"id\":1,\"nickname\":\"root\",\"username\":\"root\",\"email\":\"winljm001@qq.com\",\"technology\":\"vue\\u5168\\u5bb6\\u6876\\uff0celement-ui\\uff0ctp5\",\"reference\":\"\\u6e1dICP\\u590717006757\\u53f7\",\"headImg\":\"https:\\/\\/apic.douyucdn.cn\\/upload\\/avatar\\/006\\/29\\/44\\/20_avatar_middle.jpg\",\"logo\":null}','admin/Admin/setAdmin'),(105,'获取admin信息',1,'root',1534512295,'{\"uid\":\"1\"}','admin/Admin/getAdmin'),(106,'获取admin信息',1,'root',1534512338,'{\"uid\":\"1\"}','admin/Admin/getAdmin'),(107,'设置admin信息',1,'root',1534512345,'{\"id\":1,\"nickname\":\"root\",\"username\":\"root\",\"email\":\"winljm001@qq.com1\",\"technology\":\"vue\\u5168\\u5bb6\\u6876\\uff0celement-ui\\uff0ctp5\",\"reference\":\"\\u6e1dICP\\u590717006757\\u53f7\",\"headImg\":\"https:\\/\\/apic.douyucdn.cn\\/upload\\/avatar\\/006\\/29\\/44\\/20_avatar_middle.jpg\",\"logo\":null}','admin/Admin/setAdmin'),(108,'设置admin信息',1,'root',1534512365,'{\"id\":1,\"nickname\":\"root\",\"username\":\"root\",\"email\":\"winljm001@qq.com1\",\"technology\":\"vue\\u5168\\u5bb6\\u6876\\uff0celement-ui\\uff0ctp5\",\"reference\":\"\\u6e1dICP\\u590717006757\\u53f7\",\"headImg\":\"https:\\/\\/apic.douyucdn.cn\\/upload\\/avatar\\/006\\/29\\/44\\/20_avatar_middle.jpg\",\"logo\":null}','admin/Admin/setAdmin'),(109,'文件上传',1,'root',1534512400,'[]','admin/Index/upload'),(110,'文件上传',1,'root',1534512439,'[]','admin/Index/upload'),(111,'设置admin信息',1,'root',1534512441,'{\"id\":1,\"nickname\":\"root\",\"username\":\"root\",\"email\":\"winljm001@qq.com1\",\"technology\":\"vue\\u5168\\u5bb6\\u6876\\uff0celement-ui\\uff0ctp5\",\"reference\":\"\\u6e1dICP\\u590717006757\\u53f7\",\"headImg\":\"http:\\/\\/localhost\\/upload\\/20180817\\/25649aa6753f4733cc311183e521ee70.png\",\"logo\":\"http:\\/\\/localhost\\/upload\\/20180817\\/d9f1863fb35439601d029adf93df1ec0.png\"}','admin/Admin/setAdmin'),(112,'获取admin信息',1,'root',1534512455,'{\"uid\":\"1\"}','admin/Admin/getAdmin'),(113,'设置admin信息',1,'root',1534512662,'{\"id\":1,\"nickname\":\"root\",\"username\":\"admin\",\"password\":\"804020\",\"email\":\"winljm001@qq.com1\",\"technology\":\"vue\\u5168\\u5bb6\\u6876\\uff0celement-ui\\uff0ctp5\",\"reference\":\"\\u6e1dICP\\u590717006757\\u53f7\",\"headImg\":\"http:\\/\\/localhost\\/upload\\/20180817\\/25649aa6753f4733cc311183e521ee70.png\",\"logo\":\"http:\\/\\/localhost\\/upload\\/20180817\\/d9f1863fb35439601d029adf93df1ec0.png\"}','admin/Admin/setAdmin'),(114,'获取admin信息',1,'root',1534512797,'{\"uid\":\"1\"}','admin/Admin/getAdmin'),(115,'获取admin信息',1,'root',1534512798,'{\"uid\":\"1\"}','admin/Admin/getAdmin'),(116,'设置admin信息',1,'root',1534512808,'{\"id\":1,\"nickname\":\"winljm001\",\"username\":\"admin\",\"email\":\"winljm001@qq.com1\",\"technology\":\"vue\\u5168\\u5bb6\\u6876\\uff0celement-ui\\uff0ctp5\",\"reference\":\"\\u6e1dICP\\u590717006757\\u53f7\",\"headImg\":\"http:\\/\\/localhost\\/upload\\/20180817\\/25649aa6753f4733cc311183e521ee70.png\",\"logo\":\"http:\\/\\/localhost\\/upload\\/20180817\\/d9f1863fb35439601d029adf93df1ec0.png\"}','admin/Admin/setAdmin'),(117,'设置admin信息',1,'root',1534512821,'{\"id\":1,\"nickname\":\"root\",\"username\":\"admin\",\"email\":\"winljm001@qq.com1\",\"technology\":\"vue\\u5168\\u5bb6\\u6876\\uff0celement-ui\\uff0ctp5\",\"reference\":\"\\u6e1dICP\\u590717006757\\u53f7\",\"headImg\":\"http:\\/\\/localhost\\/upload\\/20180817\\/25649aa6753f4733cc311183e521ee70.png\",\"logo\":\"http:\\/\\/localhost\\/upload\\/20180817\\/d9f1863fb35439601d029adf93df1ec0.png\"}','admin/Admin/setAdmin'),(118,'获取admin信息',1,'root',1534512832,'{\"uid\":\"1\"}','admin/Admin/getAdmin'),(119,'设置admin信息',1,'root',1534512842,'{\"id\":1,\"nickname\":\"winljm001\",\"username\":\"admin\",\"email\":\"winljm001@qq.com1\",\"technology\":\"vue\\u5168\\u5bb6\\u6876\\uff0celement-ui\\uff0ctp5\",\"reference\":\"\\u6e1dICP\\u590717006757\\u53f7\",\"headImg\":\"http:\\/\\/localhost\\/upload\\/20180817\\/25649aa6753f4733cc311183e521ee70.png\",\"logo\":\"http:\\/\\/localhost\\/upload\\/20180817\\/d9f1863fb35439601d029adf93df1ec0.png\"}','admin/Admin/setAdmin'),(120,'设置admin信息',1,'root',1534512847,'{\"id\":1,\"nickname\":\"winljm001\",\"username\":\"admin\",\"email\":\"winljm001@qq.com1\",\"technology\":\"vue\\u5168\\u5bb6\\u6876\\uff0celement-ui\\uff0ctp5\",\"reference\":\"\\u6e1dICP\\u590717006757\\u53f7\",\"headImg\":\"http:\\/\\/localhost\\/upload\\/20180817\\/25649aa6753f4733cc311183e521ee70.png\",\"logo\":\"http:\\/\\/localhost\\/upload\\/20180817\\/d9f1863fb35439601d029adf93df1ec0.png\"}','admin/Admin/setAdmin'),(121,'获取admin信息',1,'root',1534512856,'{\"uid\":\"1\"}','admin/Admin/getAdmin'),(122,'获取admin信息',1,'winljm001',1534524988,'[]','admin/Admin/getAdmin'),(123,'获取admin信息',1,'winljm001',1534524999,'{\"uid\":\"1\"}','admin/Admin/getAdmin'),(124,'获取admin信息',1,'winljm001',1534525015,'{\"uid\":\"1\"}','admin/Admin/getAdmin'),(125,'获取admin信息',1,'winljm001',1534525195,'[]','admin/Admin/getAdmin'),(126,'获取admin信息',1,'winljm001',1534525205,'{\"uid\":\"1\"}','admin/Admin/getAdmin'),(127,'获取admin信息',1,'winljm001',1534525259,'[]','admin/Admin/getAdmin'),(128,'获取admin信息',1,'winljm001',1534525263,'{\"uid\":\"1\"}','admin/Admin/getAdmin'),(129,'设置admin信息',1,'winljm001',1534525272,'{\"id\":1,\"nickname\":\"winljm001\",\"username\":\"root\",\"password\":\"123456\",\"email\":\"winljm001@qq.com1\",\"technology\":\"vue\\u5168\\u5bb6\\u6876\\uff0celement-ui\\uff0ctp5\",\"reference\":\"\\u6e1dICP\\u590717006757\\u53f7\",\"headImg\":\"http:\\/\\/localhost\\/upload\\/20180817\\/25649aa6753f4733cc311183e521ee70.png\",\"logo\":\"http:\\/\\/localhost\\/upload\\/20180817\\/d9f1863fb35439601d029adf93df1ec0.png\"}','admin/Admin/setAdmin'),(130,'获取admin信息',1,'winljm001',1534525406,'{\"uid\":\"1\"}','admin/Admin/getAdmin'),(131,'获取admin信息',1,'winljm001',1534525440,'{\"uid\":\"1\"}','admin/Admin/getAdmin'),(132,'获取admin信息',1,'winljm001',1534525443,'{\"uid\":1}','admin/Admin/getAdmin'),(133,'获取admin信息',1,'winljm001',1534525454,'{\"uid\":1}','admin/Admin/getAdmin'),(134,'获取admin信息',1,'winljm001',1534525721,'{\"uid\":\"1\"}','admin/Admin/getAdmin'),(135,'获取admin信息',1,'winljm001',1534525776,'{\"uid\":\"1\"}','admin/Admin/getAdmin'),(136,'获取admin信息',1,'winljm001',1534525776,'{\"uid\":\"1\"}','admin/Admin/getAdmin'),(137,'获取admin信息',1,'winljm001',1534525777,'{\"uid\":\"1\"}','admin/Admin/getAdmin'),(138,'获取admin信息',1,'winljm001',1534525798,'{\"uid\":\"1\"}','admin/Admin/getAdmin'),(139,'获取admin信息',1,'winljm001',1534527392,'{\"uid\":\"1\"}','admin/Admin/getAdmin'),(140,'获取admin信息',1,'winljm001',1534527392,'{\"uid\":\"1\"}','admin/Admin/getAdmin'),(141,'获取admin信息',1,'winljm001',1534534323,'{\"uid\":1}','admin/Admin/getAdmin'),(142,'获取admin信息',1,'winljm001',1534593832,'{\"uid\":1}','admin/Admin/getAdmin'),(143,'获取admin信息',1,'winljm001',1534608230,'{\"uid\":1}','admin/Admin/getAdmin'),(144,'获取admin信息',1,'winljm001',1534608343,'{\"uid\":\"1\"}','admin/Admin/getAdmin'),(145,'获取admin信息',1,'winljm001',1534608388,'{\"uid\":\"1\"}','admin/Admin/getAdmin'),(146,'获取admin信息',1,'winljm001',1534608411,'{\"uid\":\"1\"}','admin/Admin/getAdmin'),(147,'文件上传',1,'winljm001',1534615182,'[]','admin/Index/upload'),(148,'文件上传',1,'winljm001',1534837897,'[]','admin/Index/upload'),(149,'文件上传',1,'winljm001',1534874244,'[]','admin/Index/upload'),(150,'添加文章',1,'winljm001',1534874248,'{\"title\":\"123\",\"addtime\":\"2018-08-06T16:00:00.000Z\",\"from\":\"234\",\"author\":\"winljm001\",\"abstract\":\"123\",\"sort\":\"0\",\"mainimg\":\"http:\\/\\/localhost\\/upload\\/20180822\\/0bc683e5d5fdd104f63bf63d8faff031.png\",\"content\":\"<p>124134<\\/p>\"}','admin/Article/add'),(151,'文件上传',1,'winljm001',1534874608,'[]','admin/Index/upload'),(152,'文件上传',1,'winljm001',1534874804,'[]','admin/Index/upload'),(153,'添加文章',1,'winljm001',1534875010,'{\"addtime\":\"1533571200\",\"author\":\"winljm001\",\"sort\":\"0\",\"mainimg\":\"\"}','admin/Article/add');

#
# Structure for table "blog_admin_user_data"
#

DROP TABLE IF EXISTS `blog_admin_user_data`;
CREATE TABLE `blog_admin_user_data` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `loginTimes` int(11) NOT NULL DEFAULT '0' COMMENT '账号登录次数',
  `lastLoginIp` bigint(11) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `lastLoginTime` int(11) NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `uid` varchar(11) NOT NULL DEFAULT '' COMMENT '用户ID',
  `headImg` text COMMENT '用户头像',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `technology` varchar(255) DEFAULT NULL COMMENT '技术栈',
  `reference` varchar(255) DEFAULT NULL COMMENT '备案号',
  `logo` varchar(255) DEFAULT NULL COMMENT 'logo',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='管理员数据表';

#
# Data for table "blog_admin_user_data"
#

INSERT INTO `blog_admin_user_data` VALUES (1,73,2130706433,1534874231,'1','http://localhost/upload/20180817/25649aa6753f4733cc311183e521ee70.png','winljm001@qq.com1','vue全家桶，element-ui，tp5','渝ICP备17006757号','http://localhost/upload/20180817/d9f1863fb35439601d029adf93df1ec0.png');
