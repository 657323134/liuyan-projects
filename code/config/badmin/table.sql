CREATE TABLE `b_admin` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `adminName` varchar(20) DEFAULT NULL COMMENT '用户名',
  `pwd` varchar(32) DEFAULT NULL COMMENT '密码',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `isEnable` int(1) DEFAULT '0' COMMENT '是否禁用（0为否，1为是）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_ADNMIN_NAME` (`adminName`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8 COMMENT='管理员表';