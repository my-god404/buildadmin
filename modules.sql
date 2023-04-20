CREATE TABLE `tp_shop_menu_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级菜单',
  `shop_id` int(11) NOT NULL COMMENT '商户ID',
  `type` enum('menu_dir','menu','button') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'menu' COMMENT '类型:menu_dir=菜单目录,menu=菜单项,button=页面按钮',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '标题',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '规则名称',
  `path` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '路由路径',
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '图标',
  `menu_type` enum('tab','link','iframe') COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '菜单类型:tab=选项卡,link=链接,iframe=Iframe',
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Url',
  `component` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '组件路径',
  `keepalive` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '缓存:0=关闭,1=开启',
  `extend` enum('none','add_rules_only','add_menu_only') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none' COMMENT '扩展属性:none=无,add_rules_only=只添加为路由,add_menu_only=只添加为菜单',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重(排序)',
  `status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '状态:0=禁用,1=启用',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `weigh` (`weigh`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='商户菜单和权限规则表';

CREATE TABLE `tp_shop` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int(11) DEFAULT '0' COMMENT '会员ID',
  `commission_ratio` double DEFAULT '0' COMMENT '佣金比例%',
  `state` tinyint(4) DEFAULT '0' COMMENT '状态 0关闭 1开启',
  `type` tinyint(4) DEFAULT '1' COMMENT '类型 0企业 1个人',
  `name` varchar(100) DEFAULT NULL COMMENT '店铺名称',
  `true_name` varchar(50) DEFAULT NULL COMMENT '联系人',
  `mobile` varchar(50) DEFAULT NULL COMMENT '联系电话',
  `logo` varchar(255) DEFAULT '/static/img/logo.png' COMMENT '店铺logo',
  `popularity` int(11) DEFAULT '0' COMMENT '人气值',
  `score` decimal(10,2) DEFAULT '5.00' COMMENT '店铺评分',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `province` varchar(20) DEFAULT NULL COMMENT '省',
  `city` varchar(20) DEFAULT NULL COMMENT '市',
  `district` varchar(20) DEFAULT NULL COMMENT '区',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='店铺列表';

CREATE TABLE `tp_shop_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `shop_id` int(11) NOT NULL COMMENT '商户管理员ID',
  `username` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '用户名',
  `nickname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '昵称',
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '头像',
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '邮箱',
  `mobile` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '手机',
  `loginfailure` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '登录失败次数',
  `lastlogintime` int(10) DEFAULT NULL COMMENT '登录时间',
  `lastloginip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '登录IP',
  `password` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '密码',
  `salt` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '密码盐',
  `motto` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '签名',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '状态:0=禁用,1=启用',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='店铺管理员表';

CREATE TABLE `tp_shop_admin_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分组',
  `shop_id` int(11) NOT NULL COMMENT '商户管理员ID',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '组名',
  `rules` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '权限规则ID',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '状态:0=禁用,1=启用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='管理分组表';

CREATE TABLE `tp_shop_admin_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '管理员ID',
  `shop_id` int(11) NOT NULL COMMENT '商户管理员ID',
  `group_id` int(10) unsigned NOT NULL COMMENT '分组ID',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='管理权限分组表';

CREATE TABLE `tp_shop_admin_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `shop_id` int(11) NOT NULL COMMENT '商户管理员ID',
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `username` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '管理员用户名',
  `url` varchar(1500) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '操作Url',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '日志标题',
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '请求参数',
  `ip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'IP',
  `useragent` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'User-Agent',
  `createtime` int(10) DEFAULT NULL COMMENT '操作时间',
  `diff_data` json DEFAULT NULL COMMENT '修改的数据',
  `before_data` json DEFAULT NULL COMMENT '修改前数据',
  `after_data` json DEFAULT NULL COMMENT '修改后数据',
  PRIMARY KEY (`id`),
  KEY `name` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=511 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='管理员日志表';




-----  商户模块

INSERT INTO `tp_shop_admin` (`id`, `shop_id`, `username`, `nickname`, `avatar`, `email`, `mobile`, `loginfailure`, `lastlogintime`, `lastloginip`, `password`, `salt`, `motto`, `createtime`, `updatetime`, `status`) VALUES (1, 1, 'admin', 'Admin', '', 'admin@buildadmin.com', '18888888888', 0, 1681898500, '127.0.0.1', '32386cd2115b65db439b5b9ae64c414d', 'pARbsGVMXBlutw3C', '', 1645876529, 1681898500, '1');
INSERT INTO `tp_shop_admin_group` (`id`, `pid`, `shop_id`, `name`, `rules`, `createtime`, `updatetime`, `status`) VALUES (1, 0, 1, '超级管理组', '*', 1645876529, 1647805864, '1');
INSERT INTO `tp_shop_admin_group_access` (`uid`, `shop_id`, `group_id`) VALUES (1, 1, 1);

INSERT INTO `tp_shop_menu_rule` VALUES ('1', '0', '1', 'menu', '控制台', 'dashboard/dashboard', 'dashboard', 'fa fa-dashboard', 'tab', '', '/src/views/backend/dashboard.vue', '1', 'none', 'remark_text', '999', '1', '1651926966', '1646889188');
INSERT INTO `tp_shop_menu_rule` VALUES ('2', '0', '1', 'menu_dir', '权限管理', 'auth', 'auth', 'fa fa-group', null, '', '', '0', 'none', '', '100', '1', '1648948034', '1645876529');
INSERT INTO `tp_shop_menu_rule` VALUES ('3', '2', '1', 'menu', '角色组管理', 'auth/group', 'auth/group', 'fa fa-group', 'tab', '', '/src/views/backend/auth/group/index.vue', '1', 'none', '', '99', '1', '1648162157', '1646927597');
INSERT INTO `tp_shop_menu_rule` VALUES ('4', '3', '1', 'button', '查看', 'auth/group/index', '', '', null, '', '', '0', 'none', '', '99', '1', '1648065864', '1647806112');
INSERT INTO `tp_shop_menu_rule` VALUES ('5', '3', '1', 'button', '添加', 'auth/group/add', '', '', null, '', '', '0', 'none', '', '99', '1', '1648065864', '1647806112');
INSERT INTO `tp_shop_menu_rule` VALUES ('6', '3', '1', 'button', '编辑', 'auth/group/edit', '', '', null, '', '', '0', 'none', '', '99', '1', '1648065864', '1647806129');
INSERT INTO `tp_shop_menu_rule` VALUES ('7', '3', '1', 'button', '删除', 'auth/group/del', '', '', null, '', '', '0', 'none', '', '99', '1', '1648065864', '1647806112');
INSERT INTO `tp_shop_menu_rule` VALUES ('8', '2', '1', 'menu', '管理员管理', 'auth/admin', 'auth/admin', 'el-icon-UserFilled', 'tab', '', '/src/views/backend/auth/admin/index.vue', '1', 'none', '', '98', '1', '1648067239', '1647549566');
INSERT INTO `tp_shop_menu_rule` VALUES ('9', '8', '1', 'button', '查看', 'auth/admin/index', '', '', null, '', '', '0', 'none', '', '98', '1', '1648065864', '1647806112');
INSERT INTO `tp_shop_menu_rule` VALUES ('10', '8', '1', 'button', '添加', 'auth/admin/add', '', '', null, '', '', '0', 'none', '', '98', '1', '1648065864', '1647806112');
INSERT INTO `tp_shop_menu_rule` VALUES ('11', '8', '1', 'button', '编辑', 'auth/admin/edit', '', '', null, '', '', '0', 'none', '', '98', '1', '1648065864', '1647806129');
INSERT INTO `tp_shop_menu_rule` VALUES ('12', '8', '1', 'button', '删除', 'auth/admin/del', '', '', null, '', '', '0', 'none', '', '98', '1', '1648065864', '1647806112');
INSERT INTO `tp_shop_menu_rule` VALUES ('13', '2', '1', 'menu', '菜单规则管理', 'auth/menu', 'auth/menu', 'el-icon-Grid', 'tab', '', '/src/views/backend/auth/menu/index.vue', '1', 'none', '', '97', '1', '1648133759', '1645876529');
INSERT INTO `tp_shop_menu_rule` VALUES ('14', '13', '1', 'button', '查看', 'auth/menu/index', '', '', null, '', '', '0', 'none', '', '97', '1', '1648065864', '1647806112');
INSERT INTO `tp_shop_menu_rule` VALUES ('15', '13', '1', 'button', '添加', 'auth/menu/add', '', '', null, '', '', '0', 'none', '', '97', '1', '1648065864', '1647806112');
INSERT INTO `tp_shop_menu_rule` VALUES ('16', '13', '1', 'button', '编辑', 'auth/menu/edit', '', '', null, '', '', '0', 'none', '', '97', '1', '1648065864', '1647806129');
INSERT INTO `tp_shop_menu_rule` VALUES ('17', '13', '1', 'button', '删除', 'auth/menu/del', '', '', null, '', '', '0', 'none', '', '97', '1', '1648065864', '1647806112');
INSERT INTO `tp_shop_menu_rule` VALUES ('18', '13', '1', 'button', '快速排序', 'auth/menu/sortable', '', '', null, '', '', '0', 'none', '', '97', '1', '1648065864', '1647806112');
INSERT INTO `tp_shop_menu_rule` VALUES ('19', '2', '1', 'menu', '管理员日志管理', 'auth/adminLog', 'auth/adminLog', 'el-icon-List', 'tab', '', '/src/views/backend/auth/adminLog/index.vue', '1', 'none', '', '96', '1', '1648067241', '1647963918');
INSERT INTO `tp_shop_menu_rule` VALUES ('20', '19', '1', 'button', '查看', 'auth/adminLog/index', '', '', null, '', '', '0', 'none', '', '96', '1', '1648065864', '1647806112');
