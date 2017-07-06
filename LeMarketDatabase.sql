DROP TABLE IF EXISTS `Picture`;
CREATE TABLE `Picture` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '图片id',
  `path` TEXT NOT NULL COMMENT '图片路径',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='图片表';

DROP TABLE IF EXISTS `Admin`;
CREATE TABLE `Admin` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '管理员id',
  `username` VARCHAR(20) NOT NULL UNIQUE COMMENT '用户名',
  `password` VARCHAR(32) NOT NULL COMMENT '密码(md5+salt)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员表';

DROP TABLE IF EXISTS `UserType`;
CREATE TABLE `UserType` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '用户类别id',
  `name` VARCHAR(10) NOT NULL UNIQUE COMMENT '类别名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户类别表';

DROP TABLE IF EXISTS `Users`;
CREATE TABLE `Users` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` VARCHAR(20) NOT NULL UNIQUE COMMENT '用户名',
  `password` VARCHAR(32) NOT NULL COMMENT '密码(md5+salt)',
  `email` VARCHAR(30) NOT NULL UNIQUE COMMENT '邮箱',
  `salt` VARCHAR(32) NOT NULL COMMENT '盐值',
  `role` INT NOT NULL COMMENT '用户角色：卖家/买家',
  `birthday` DATE COMMENT '生日',
  `gender` VARCHAR(2) COMMENT '性别：男/女',
  `description` TEXT COMMENT '个人信息',
  `viewCount` INT COMMENT '系统访问次数',
  `phoneNumber` VARCHAR(11) COMMENT '手机号',
  `identityNumber` VARCHAR(18) COMMENT '身份证号',
  `address` TEXT COMMENT '地址',
  `status` INT COMMENT '状态：0-离线，1-在线',
  `name` VARCHAR(32) COMMENT '姓名',
  PRIMARY KEY (`id`),
  FOREIGN KEY (`role`) REFERENCES UserType(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `Shop`;
CREATE TABLE `Shop` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '店铺id',
  `owner` INT NOT NULL COMMENT '店主id',
  `name` VARCHAR(20) NOT NULL COMMENT '店铺名',
  `icon` INT COMMENT '店铺图标id',
  `description` TEXT COMMENT '店铺描述',
  `phoneNumber` VARCHAR(11) COMMENT '店主手机',
  `customerService` INT COMMENT '客服id',
  `servicePhoneNumber` VARCHAR(11) COMMENT '客服电话',
  PRIMARY KEY (`id`),
  FOREIGN KEY (`owner`) REFERENCES Users(`id`),
  FOREIGN KEY (`icon`) REFERENCES Picture(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='店铺表';

DROP TABLE IF EXISTS `Category`;
CREATE TABLE `Category` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `name` VARCHAR(20) NOT NULL COMMENT '分类名称',
  `description` TEXT NOT NULL COMMENT '分类描述',
  `picture` INT NOT NULL COMMENT '分类图片',
  `parent` INT COMMENT '父分类',
  PRIMARY KEY (`id`),
  FOREIGN KEY (`picture`) REFERENCES Picture(`id`),
  FOREIGN KEY (`parent`) REFERENCES Category(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='分类表';

DROP TABLE IF EXISTS `Commodity`;
CREATE TABLE `Commodity` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `owner` INT NOT NULL COMMENT '店主id',
  `shop` INT NOT NULL COMMENT '店铺id',
  `name` VARCHAR(100) NOT NULL COMMENT '商品名称',
  `details` TEXT COMMENT '商品详情',
  `category` INT NOT NULL COMMENT '商品分类',
  `storage` INT NOT NULL COMMENT '商品库存',
  `saled` INT DEFAULT '0' COMMENT '商品销量',
  `price` FLOAT NOT NULL COMMENT '商品价格',
  `image` INT NOT NULL COMMENT '商品图片地址',
  `visitCount` INT DEFAULT '0' COMMENT '商品浏览量',
  `status` INT DEFAULT 1 COMMENT '商品状态',
  `time` DATETIME NOT NULL COMMENT '上架时间',
  PRIMARY KEY (`id`),
  FOREIGN KEY (`owner`) REFERENCES Users(`id`),
  FOREIGN KEY (`category`) REFERENCES Category(`id`),
  FOREIGN KEY (`shop`) REFERENCES Shop(`id`),
  FOREIGN KEY (`image`) REFERENCES Picture(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品表';
ALTER TABLE Commodity ADD INDEX indexCommodityOrder(saled);

DROP TABLE IF EXISTS `CommodityType`;
CREATE TABLE `CommodityType` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '商品型号id',
  `commodity` INT NOT NULL COMMENT '商品id',
  `name` VARCHAR(30) NOT NULL COMMENT '商品型号名称',
  `storage` INT DEFAULT 0 COMMENT '该型号库存',
  PRIMARY KEY (`id`),
  FOREIGN KEY (`commodity`) REFERENCES Commodity(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品型号表';

DROP TABLE IF EXISTS `Comment`;
CREATE TABLE `Comment` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '评论id',
  `commodity` INT NOT NULL COMMENT '商品id',
  `user` INT NOT NULL COMMENT '用户id' REFERENCES Users(id),
  `time` DATETIME NOT NULL COMMENT '评论时间',
  `content` TEXT NOT NULL COMMENT '评论内容',
  PRIMARY KEY (`id`),
  FOREIGN KEY (`commodity`) REFERENCES Commodity(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评论表';


DROP TABLE IF EXISTS `Information`;
CREATE TABLE `Information` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '资讯id',
  `admin` INT NOT NULL COMMENT '管理员id',
  `beginTime` DATETIME NOT NULL COMMENT '开始时间',
  `endTime` DATETIME NOT NULL COMMENT '结束时间',
  `title` VARCHAR(50) NOT NULL COMMENT '资讯标题',
  `content` TEXT NOT NULL COMMENT '资讯内容',
  `time` DATETIME NOT NULL COMMENT '资讯发布时间',
  PRIMARY KEY (`id`),
  FOREIGN KEY (`admin`) REFERENCES Admin(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资讯表';

DROP TABLE IF EXISTS `Message`;
CREATE TABLE `Message` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '消息id',
  `sender` INT  NOT NULL COMMENT '发送者id',
  `reciver` INT  NOT NULL COMMENT '接收者id',
  `content` TEXT NOT NULL COMMENT '消息内容',
  `time` DATETIME NOT NULL COMMENT '消息发送时间',
  PRIMARY KEY (`id`),
  FOREIGN KEY (`sender`) REFERENCES Users(`id`),
  FOREIGN KEY (`reciver`) REFERENCES Users(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='消息表';

DROP TABLE IF EXISTS `OrderInfo`;
CREATE TABLE `OrderInfo` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '订单信息id',
  `user` INT NOT NULL COMMENT '用户id',
  `price` FLOAT NOT NULL COMMENT '价格',
  `time` DATETIME NOT NULL COMMENT '订单提交时间',
  `status` VARCHAR(10) NOT NULL COMMENT '订单状态',
  PRIMARY KEY (`id`),
  FOREIGN KEY (`user`) REFERENCES Users(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单信息表';


DROP TABLE IF EXISTS `OrderDetails`;
CREATE TABLE `OrderDetails` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '订单详情id',
  `orderInfo` INT NOT NULL COMMENT '订单id',
  `commodity` INT NOT NULL COMMENT '商品id',
  `receive` INT COMMENT '收货信息id',
  `commodityType` INT NOT NULL COMMENT '商品型号id',
  `count` INT NOT NULL COMMENT '订购数量',
  `time` DATETIME NOT NULL COMMENT '订购时间',
  PRIMARY KEY (`id`),
  FOREIGN KEY (`orderInfo`) REFERENCES OrderInfo(`id`),
  FOREIGN KEY (`commodity`) REFERENCES Commodity(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单详情表';

DROP TABLE IF EXISTS `ReceiveInfo`;
CREATE TABLE `ReceiveInfo` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '收货信息id',
  `user` INT NOT NULL COMMENT '收货人id',
  `address` TEXT NOT NULL COMMENT '收货地址',
  `postcode` VARCHAR(10) COMMENT '邮编',
  `name` VARCHAR(20) NOT NULL COMMENT '收货人姓名',
  `phoneNumber` VARCHAR(11) NOT NULL COMMENT '收货人手机号',
  PRIMARY KEY (`id`),
  FOREIGN KEY (`user`) REFERENCES Users(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='收货信息表';

DROP TABLE IF EXISTS `Token`;
CREATE TABLE Token(
  `id` INT COMMENT 'token id',
  `token` VARCHAR(256) COMMENT 'token',
  `date_create` DATETIME COMMENT '创建时间',
  `validity` INT COMMENT '有效天数',
  FOREIGN KEY (`id`) REFERENCES Users(`id`),
  INDEX indexToken (`token`)
);

DROP TABLE IF EXISTS `Address`;
CREATE TABLE Address(
  `id` INT AUTO_INCREMENT COMMENT '地址id',
  `user` INT NOT NULL COMMENT '用户id',
  `name` VARCHAR(50) NOT NULL COMMENT '收货人姓名',
  `phoneNumber` VARCHAR(11) NOT NULL COMMENT '手机号',
  PRIMARY KEY (`id`),
  FOREIGN KEY (`user`) REFERENCES Users (`id`)
);

INSERT INTO UserType(`name`) VALUES('买家');
INSERT INTO UserType(`name`) VALUES('卖家');

INSERT INTO Picture(`path`) VALUES ('/static/images/banner/1.jpg');
INSERT INTO Category(`name`, `description`, `picture`) VALUES ('时尚女装', '女装', 1);

INSERT INTO Picture(`path`) VALUES ('/static/images/banner/2.jpg');
INSERT INTO Category(`name`, `description`, `picture`) VALUES ('潮流男装', '男装', 2);

INSERT INTO Picture(`path`) VALUES ('/static/images/banner/3.jpg');
INSERT INTO Category(`name`, `description`, `picture`) VALUES ('时尚女鞋', '女鞋', 3);

INSERT INTO Picture(`path`) VALUES ('/static/images/banner/4.jpg');
INSERT INTO Category(`name`, `description`, `picture`) VALUES ('潮流包包', '包包', 4);

INSERT INTO Picture(`path`) VALUES ('/static/images/banner/5.jpg');
INSERT INTO Category(`name`, `description`, `picture`) VALUES ('儿童世界', '童装', 5);

INSERT INTO Shop(`owner`, `name`) VALUES (1, 'TestShop');
INSERT INTO Commodity(`owner`,`category`,`shop`,`name`,`storage`,`price`,`image`,`time`) VALUES (1,1,1,'TestCommodity',100,20,1,NOW());

CREATE VIEW OrderWithAllCommodityDetail
AS
SELECT t1.id as vid,
  t1.status as vstatus,
  t1.user as vuser,
  t2.commodity as vcommodityId,
  t3.name as vname,
  t4.name as vcommodityType,
  t3.price as vprice,
  t5.address as vaddress
FROM OrderInfo t1
LEFT JOIN OrderDetails t2 ON t1.id = t2.orderInfo
LEFT JOIN Commodity t3 ON t2.commodity = t3.id
LEFT JOIN CommodityType t4 ON t2.commodityType = t4.id
LEFT JOIN Users t5 ON t1.user = t5.id;