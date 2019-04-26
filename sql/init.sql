CREATE TABLE `tb_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL COMMENT '��Ʒid',
  `quantity` int(11) DEFAULT NULL COMMENT '����',
  `checked` int(11) DEFAULT NULL COMMENT '�Ƿ�ѡ��,1=�ѹ�ѡ,0=δ��ѡ',
  `create_time` datetime DEFAULT NULL COMMENT '����ʱ��',
  `update_time` datetime DEFAULT NULL COMMENT '����ʱ��',
  PRIMARY KEY (`id`),
  KEY `user_id_index` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=146 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tb_category`;
CREATE TABLE `tb_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '���Id',
  `parent_id` int(11) DEFAULT NULL COMMENT '�����id��id=0ʱ˵���Ǹ��ڵ�,һ�����',
  `name` varchar(50) DEFAULT NULL COMMENT '�������',
  `status` tinyint(1) DEFAULT '1' COMMENT '���״̬1-����,2-�ѷ���',
  `sort_order` int(4) DEFAULT NULL COMMENT '������,ͬ��չʾ˳��,��ֵ�������Ȼ����',
  `create_time` datetime DEFAULT NULL COMMENT '����ʱ��',
  `update_time` datetime DEFAULT NULL COMMENT '����ʱ��',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100032 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tb_order`;
CREATE TABLE `tb_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '����id',
  `order_no` bigint(20) DEFAULT NULL COMMENT '������',
  `user_id` int(11) DEFAULT NULL COMMENT '�û�id',
  `shipping_id` int(11) DEFAULT NULL,
  `payment` decimal(20,2) DEFAULT NULL COMMENT 'ʵ�ʸ�����,��λ��Ԫ,������λС��',
  `payment_type` int(4) DEFAULT NULL COMMENT '֧������,1-����֧��',
  `postage` int(10) DEFAULT NULL COMMENT '�˷�,��λ��Ԫ',
  `status` int(10) DEFAULT NULL COMMENT '����״̬:0-��ȡ��-10-δ���20-�Ѹ��40-�ѷ�����50-���׳ɹ���60-���׹ر�',
  `payment_time` datetime DEFAULT NULL COMMENT '֧��ʱ��',
  `send_time` datetime DEFAULT NULL COMMENT '����ʱ��',
  `end_time` datetime DEFAULT NULL COMMENT '�������ʱ��',
  `close_time` datetime DEFAULT NULL COMMENT '���׹ر�ʱ��',
  `create_time` datetime DEFAULT NULL COMMENT '����ʱ��',
  `update_time` datetime DEFAULT NULL COMMENT '����ʱ��',
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_no_index` (`order_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tb_order_item`;
CREATE TABLE `tb_order_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '�����ӱ�id',
  `user_id` int(11) DEFAULT NULL,
  `order_no` bigint(20) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL COMMENT '��Ʒid',
  `product_name` varchar(100) DEFAULT NULL COMMENT '��Ʒ����',
  `product_image` varchar(500) DEFAULT NULL COMMENT '��ƷͼƬ��ַ',
  `current_unit_price` decimal(20,2) DEFAULT NULL COMMENT '���ɶ���ʱ����Ʒ���ۣ���λ��Ԫ,������λС��',
  `quantity` int(10) DEFAULT NULL COMMENT '��Ʒ����',
  `total_price` decimal(20,2) DEFAULT NULL COMMENT '��Ʒ�ܼ�,��λ��Ԫ,������λС��',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_no_index` (`order_no`) USING BTREE,
  KEY `order_no_user_id_index` (`user_id`,`order_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tb_pay_info`;
CREATE TABLE `tb_pay_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '�û�id',
  `order_no` bigint(20) DEFAULT NULL COMMENT '������',
  `pay_platform` int(10) DEFAULT NULL COMMENT '֧��ƽ̨:1-֧����,2-΢��',
  `platform_number` varchar(200) DEFAULT NULL COMMENT '֧����֧����ˮ��',
  `platform_status` varchar(20) DEFAULT NULL COMMENT '֧����֧��״̬',
  `create_time` datetime DEFAULT NULL COMMENT '����ʱ��',
  `update_time` datetime DEFAULT NULL COMMENT '����ʱ��',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tb_product`;
CREATE TABLE `tb_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '��Ʒid',
  `category_id` int(11) NOT NULL COMMENT '����id,��Ӧmmall_category�������',
  `name` varchar(100) NOT NULL COMMENT '��Ʒ����',
  `subtitle` varchar(200) DEFAULT NULL COMMENT '��Ʒ������',
  `main_image` varchar(500) DEFAULT NULL COMMENT '��Ʒ��ͼ,url��Ե�ַ',
  `sub_images` text COMMENT 'ͼƬ��ַ,json��ʽ,��չ��',
  `detail` text COMMENT '��Ʒ����',
  `price` decimal(20,2) NOT NULL COMMENT '�۸�,��λ-Ԫ������λС��',
  `stock` int(11) NOT NULL COMMENT '�������',
  `status` int(6) DEFAULT '1' COMMENT '��Ʒ״̬.1-���� 2-�¼� 3-ɾ��',
  `create_time` datetime DEFAULT NULL COMMENT '����ʱ��',
  `update_time` datetime DEFAULT NULL COMMENT '����ʱ��',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tb_shipping`;
CREATE TABLE `tb_shipping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '�û�id',
  `receiver_name` varchar(20) DEFAULT NULL COMMENT '�ջ�����',
  `receiver_phone` varchar(20) DEFAULT NULL COMMENT '�ջ��̶��绰',
  `receiver_mobile` varchar(20) DEFAULT NULL COMMENT '�ջ��ƶ��绰',
  `receiver_province` varchar(20) DEFAULT NULL COMMENT 'ʡ��',
  `receiver_city` varchar(20) DEFAULT NULL COMMENT '����',
  `receiver_district` varchar(20) DEFAULT NULL COMMENT '��/��',
  `receiver_address` varchar(200) DEFAULT NULL COMMENT '��ϸ��ַ',
  `receiver_zip` varchar(6) DEFAULT NULL COMMENT '�ʱ�',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '�û���id',
  `username` varchar(50) NOT NULL COMMENT '�û���',
  `password` varchar(50) NOT NULL COMMENT '�û����룬MD5����',
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `question` varchar(100) DEFAULT NULL COMMENT '�һ���������',
  `answer` varchar(100) DEFAULT NULL COMMENT '�һ������',
  `role` int(4) NOT NULL COMMENT '��ɫ0-����Ա,1-��ͨ�û�',
  `create_time` datetime NOT NULL COMMENT '����ʱ��',
  `update_time` datetime NOT NULL COMMENT '���һ�θ���ʱ��',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_name_unique` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;




