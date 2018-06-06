/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.5.60-log : Database - designback
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`designback` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `designback`;

/*Table structure for table `t_category` */

DROP TABLE IF EXISTS `t_category`;

CREATE TABLE `t_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `category_name` varchar(45) DEFAULT NULL COMMENT '类目名称',
  `create_date` date DEFAULT NULL COMMENT '创建时间',
  `update_date` date DEFAULT NULL COMMENT '更新时间',
  `status` varchar(45) DEFAULT NULL COMMENT '状态 NORMAL正常 UN_NORMAL非正常',
  `sort` varchar(45) DEFAULT NULL COMMENT '分类 由小到大 越小越靠前',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `t_category` */

insert  into `t_category`(`id`,`category_name`,`create_date`,`update_date`,`status`,`sort`) values (1,'动物实验研究中心','2018-03-12','2018-03-12','NORMAL',NULL),(2,'基础医学院','2018-03-12','2018-03-12','NORMAL',NULL),(3,'科研处','2018-03-12','2018-03-12','NORMAL',NULL),(4,'骨伤研究所','2018-03-12','2018-03-12','NORMAL',NULL),(5,'第三临床医学院','2018-03-12','2018-03-12','NORMAL',NULL),(6,'生物工程学院','2018-03-12','2018-03-12','NORMAL',NULL),(7,'药学院','2018-03-12','2018-03-12','NORMAL',NULL),(8,'药物研究所','2018-03-12','2018-03-12','NORMAL',NULL),(9,'生命科学学院','2018-03-12','2018-03-12','NORMAL',NULL),(10,'第一临床医学院','2018-03-12','2018-03-12','NORMAL',NULL);

/*Table structure for table `t_category_device` */

DROP TABLE IF EXISTS `t_category_device`;

CREATE TABLE `t_category_device` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `category_id` bigint(20) DEFAULT NULL COMMENT '类目id',
  `device_id` bigint(20) DEFAULT NULL COMMENT '设备id',
  `crate_date` date DEFAULT NULL COMMENT '创建时间',
  `classroom_no` varchar(100) DEFAULT NULL COMMENT '教室编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

/*Data for the table `t_category_device` */

insert  into `t_category_device`(`id`,`category_id`,`device_id`,`crate_date`,`classroom_no`) values (1,1,1,'2018-03-12','1-101'),(2,1,2,'2018-03-12','2-101'),(3,2,3,'2018-03-12','3-101'),(4,2,4,'2018-03-12','4-101'),(5,3,5,'2018-03-12','5-101'),(6,3,6,'2018-03-12','6-101'),(7,3,7,'2018-03-12','7-101'),(8,4,9,'2018-03-12','8-101'),(9,4,8,'2018-03-12','9-101'),(10,4,10,'2018-03-12','10-101'),(11,5,11,'2018-03-12','11-101'),(12,5,12,'2018-03-12','12-101'),(13,6,13,'2018-03-12','13-101'),(14,7,14,'2018-03-12','14-101'),(15,7,15,'2018-03-12','15-101'),(16,8,16,'2018-03-12','16-101'),(17,8,17,'2018-03-12','17-101'),(18,9,18,'2018-03-12','18-101'),(19,9,19,'2018-03-12','19-101'),(20,10,20,'2018-03-12','20-101'),(21,10,21,'2018-03-12','21-101'),(22,2,22,'2018-04-28','1-101'),(23,2,23,'2018-04-28','1-102'),(24,2,24,'2018-04-28','1-103'),(25,2,25,'2018-04-28','1-104'),(26,2,26,'2018-04-28','1-105'),(27,2,27,'2018-04-28','1-106'),(28,2,28,'2018-04-28','1-107'),(29,2,29,'2018-04-28','1-108'),(30,2,30,'2018-04-28','1-109'),(31,2,31,'2018-04-28','1-110'),(32,3,32,'2018-04-29','2-101'),(33,3,33,'2018-04-29','2-102'),(34,3,34,'2018-04-29','2-103'),(35,3,35,'2018-04-29','2-104'),(36,3,36,'2018-04-29','2-105'),(37,3,37,'2018-04-29','2-106'),(38,3,38,'2018-04-29','2-107'),(39,3,39,'2018-04-29','2-108'),(40,3,40,'2018-04-29','2-109'),(41,7,41,'2018-04-29','3-101'),(42,7,42,'2018-04-29','3-102'),(43,7,43,'2018-04-29','3-103'),(44,7,44,'2018-04-29','3-104'),(45,7,45,'2018-04-29','3-105'),(46,7,46,'2018-04-29','3-106'),(47,7,47,'2018-04-29','3-107'),(48,7,48,'2018-04-29','3-108'),(49,7,49,'2018-04-29','3-109'),(50,7,50,'2018-04-29','3-110');

/*Table structure for table `t_choose_class` */

DROP TABLE IF EXISTS `t_choose_class`;

CREATE TABLE `t_choose_class` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `device_id` bigint(20) DEFAULT NULL COMMENT '设备id',
  `appoint_time` date DEFAULT NULL COMMENT '预约时间',
  `book` bigint(20) DEFAULT NULL COMMENT '预订数量',
  `user_id` bigint(20) DEFAULT NULL COMMENT '老师或学生id',
  `delete_id` bigint(20) DEFAULT '0' COMMENT '表示谁删除 0同意 -1不同意  具体id-谁删除',
  `authority` varchar(45) DEFAULT NULL COMMENT '权限 0-学生 1-老师',
  `day_time` bigint(100) DEFAULT NULL COMMENT '1-1~2 2-3~4 3-5~6 4-7~8',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8;

/*Data for the table `t_choose_class` */

insert  into `t_choose_class`(`id`,`device_id`,`appoint_time`,`book`,`user_id`,`delete_id`,`authority`,`day_time`) values (21,22,'2018-05-06',15,12,0,'1',1),(22,22,'2018-05-06',2,12,0,'1',3),(23,22,'2018-05-06',23,12,0,'1',2),(24,22,'2018-05-06',22,12,0,'1',4),(25,22,'2018-05-07',22,12,0,'1',1),(26,22,'2018-05-07',34,12,0,'1',3),(27,22,'2018-05-07',11,12,0,'1',2),(28,29,'2018-05-08',11,5,0,'1',4),(29,30,'2018-05-08',42,2,0,'1',1),(30,31,'2018-05-08',14,6,0,'1',3),(31,32,'2018-05-09',15,7,0,'1',4),(32,33,'2018-05-09',16,3,0,'1',2),(33,34,'2018-05-09',16,8,0,'1',1),(34,35,'2018-05-10',17,9,0,'1',2),(35,37,'2018-05-10',19,10,0,'1',3),(36,36,'2018-05-10',21,36,0,'1',2),(37,38,'2018-05-10',11,3,0,'1',4),(38,39,'2018-05-10',12,4,0,'1',2),(39,40,'2018-05-11',23,1,0,'1',3),(40,41,'2018-05-11',21,8,0,'1',1),(41,42,'2018-05-12',15,5,0,'1',1),(42,43,'2018-05-12',16,6,0,'1',2),(43,44,'2018-05-13',17,2,0,'1',3),(44,45,'2018-05-13',18,9,0,'1',4),(45,46,'2018-05-13',19,1,0,'1',2),(46,47,'2018-05-13',21,4,0,'1',1),(47,48,'2018-05-14',20,2,0,'1',3),(48,49,'2018-05-14',13,5,0,'1',4),(49,50,'2018-05-14',15,4,0,'1',2),(50,22,'2018-05-14',11,6,0,'1',3),(51,2,'2018-05-15',16,12,0,'1',4),(52,32,'2018-05-15',12,1,0,'1',3),(53,43,'2018-05-16',14,12,0,'1',2),(54,32,'2018-05-16',12,1,0,'1',1),(55,21,'2018-05-14',15,1,0,'1',3),(56,23,'2018-05-16',14,1,0,'1',4),(57,21,'2018-05-15',15,12,0,'1',2),(58,22,'2018-05-15',15,12,0,'1',1),(59,41,'2018-05-08',11,1,0,'1',1),(60,42,'2018-05-10',10,1,0,'1',2),(61,43,'2018-05-07',4,1,0,'1',3),(62,41,'2018-05-09',2,13,0,'1',1),(63,41,'2018-05-10',3,16,0,'1',2),(64,42,'2018-05-09',2,13,0,'1',4),(65,42,'2018-05-11',4,16,0,'1',1),(66,43,'2018-05-11',2,13,0,'1',2),(67,43,'2018-05-09',1,16,0,'1',3),(68,44,'2018-05-11',1,13,0,'1',4),(69,45,'2018-05-12',3,16,0,'1',2),(70,45,'2018-05-13',2,16,0,'1',3),(71,46,'2018-05-14',2,13,0,'1',2),(72,47,'2018-05-11',1,13,0,'1',2),(73,22,'2018-05-11',1,1,0,'1',1),(74,22,'2018-05-10',1,1,0,'1',3),(75,23,'2018-05-11',2,17,0,'1',4),(76,23,'2018-05-12',2,1,0,'1',2),(77,24,'2018-05-11',1,17,0,'1',3),(78,24,'2018-05-09',1,1,0,'1',2),(79,25,'2018-05-13',1,17,0,'1',3),(80,25,'2018-05-14',1,1,0,'1',4),(81,26,'2018-05-11',1,1,0,'1',2),(82,26,'2018-05-12',1,17,0,'1',1),(83,27,'2018-05-09',1,1,0,'1',3),(84,28,'2018-05-11',1,1,0,'1',2);

/*Table structure for table `t_device` */

DROP TABLE IF EXISTS `t_device`;

CREATE TABLE `t_device` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `device_name` varchar(45) DEFAULT NULL COMMENT '商品名字',
  `description` varchar(200) DEFAULT NULL COMMENT '商品描述',
  `appointment` varchar(45) DEFAULT NULL COMMENT '是否预约 APPOINTMENT已预约 UN_APPOINTMENT未预约',
  `create_date` date DEFAULT NULL COMMENT '创建时间',
  `last_update_date` date DEFAULT NULL COMMENT '最后更新时间',
  `visit_total` int(20) DEFAULT NULL COMMENT '浏览量',
  `device_no` varchar(45) DEFAULT NULL COMMENT '商品编号',
  `main_image_url` varchar(45) DEFAULT NULL COMMENT '主图地址',
  `status` varchar(45) DEFAULT NULL COMMENT '状态 NORMAL正常 UN_NORMAL非正常',
  `rich_content` varchar(200) DEFAULT NULL COMMENT '商品描述富文本',
  `seo` varchar(45) DEFAULT NULL COMMENT '搜索关键字',
  `total` bigint(20) DEFAULT NULL COMMENT '总数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

/*Data for the table `t_device` */

insert  into `t_device`(`id`,`device_name`,`description`,`appointment`,`create_date`,`last_update_date`,`visit_total`,`device_no`,`main_image_url`,`status`,`rich_content`,`seo`,`total`) values (1,'13G02全自动生化分析仪','处理能力 最大200测试/小时（使用ISE时最大300测试/小时），同时分析项目数 最大36项目（使用ISE最大39项目），样品量 2~50μl/测试（0.1μl单位），反应时间 3、4、4、10分钟（可以按每一项目设定），反应温度 37℃±0.1℃，测试波长 340~800nm（固定12波长），测试方法 1波长或2波长时测光','UN_APPOINTMENT','2018-03-12','2018-03-12',160,'0500790S','images/pic4.jpg','NORMAL',NULL,NULL,100),(2,'13G06荧光定量PCR仪','DNA检测','UN_APPOINTMENT','2018-03-12','2018-03-12',23,'0800229S','images/pic4.jpg','NORMAL',NULL,NULL,200),(3,'15402超高效液相色谱仪','适用于分子量相对较大、沸点高、热不稳定的化合物的定性、定量分析。主要用于复杂基体样品中的目标化合物的定量分析。蛋白质组学研究、代谢组学研究常常用到。','UN_APPOINTMENT','2018-03-12','2018-03-12',409,'1100090S','images/pic4.jpg','NORMAL',NULL,NULL,300),(4,'15421激光共聚焦显微镜','测试对象：荧光标记的固定细胞、组织切片和粒径大于1微米的固态、准固态荧光材料。','UN_APPOINTMENT','2018-03-12','2018-03-12',505,'0800227S','images/pic4.jpg','NORMAL',NULL,NULL,200),(5,'15506超高效液相色谱仪','sss','UN_APPOINTMENT','2018-03-12','2018-03-12',1000,'1300415S','images/pic4.jpg','NORMAL',NULL,NULL,250),(6,'15506高效液相色谱仪','\"植物功能成分分析\"','UN_APPOINTMENT','2018-03-12','2018-03-12',22,'1200878S','images/pic4.jpg','UN_NORMAL',NULL,NULL,120),(7,'15508气质连用仪','生物和医学，质量分析','UN_APPOINTMENT','2018-03-12','2018-03-12',222,'0900507S','images/pic4.jpg','UN_NORMAL',NULL,NULL,301),(8,'15526荧光定量PCR仪','适用于临床及科研以聚合酶链式反应为特征的、以实时荧光定量检测分析DNA/RNA为目的的病原体检测及基因分析','UN_APPOINTMENT','2018-03-12','2018-03-12',346,'0900544S','images/pic4.jpg','UN_NORMAL',NULL,NULL,222),(9,'X射线衍射仪','生物和医学，结构分析','UN_APPOINTMENT','2018-03-12','2018-03-12',1133,'0900681S','images/pic4.jpg','NORMAL',NULL,NULL,222),(10,'多光谱小动物活体成像系统','多光谱荧光成像，生物学发光成像，同位素成像，X光成像同时兼容体外分析；','UN_APPOINTMENT','2018-03-12','2018-03-12',324,'1201373S','images/pic4.jpg','NORMAL',NULL,NULL,100),(11,'20419高效液相色谱仪','\"植物功能成分分析\"','UN_APPOINTMENT','2018-03-12','2018-03-12',2121,'0702680S','images/pic4.jpg','NORMAL',NULL,NULL,200),(12,'大容量落地高效冷冻离心机','核酸、蛋白、脂蛋白、亚细胞器、病毒的分离离心','UN_APPOINTMENT','2018-03-12','2018-03-12',421,'1200879S','images/pic4.jpg','NORMAL',NULL,NULL,20),(13,'22414流式细胞仪','可以快速测量、存贮、显示悬浮在液体中的分散细胞的一系列重要的生物物理、生物化学方面的特征参量。','UN_APPOINTMENT','2018-03-12','2018-03-12',444244,'1101527S','images/pic4.jpg','UN_NORMAL',NULL,NULL,300),(14,'3214超高效液相色谱仪','如需预约，请联系管理员','UN_APPOINTMENT','2018-03-12','2018-03-12',321,'	1000787S','images/pic4.jpg','UN_NORMAL',NULL,NULL,100),(15,'	3222液相色谱仪','药物分析、体内代谢物分析. 自动进样；柱子填料粒径为1.7微米；紫外双波长检测器；二元泵','UN_APPOINTMENT','2018-03-12','2018-03-12',13138,'20020615S','images/pic4.jpg','NORMAL',NULL,NULL,200),(16,'3316全自动生化分析仪','血液生化指标的检测','UN_APPOINTMENT','2018-03-12','2018-03-12',1113,'1201233S','images/pic4.jpg','NORMAL',NULL,NULL,50),(17,'3333多导生理记录仪','选用放大器及相应换能器可测量生物电，血压，呼吸，肌张力，血液流速流量，细胞电位，皮肤电阻，输出刺激。','UN_APPOINTMENT','2018-03-12','2018-03-12',2132,'0501206S','images/pic4.jpg','NORMAL',NULL,NULL,60),(18,'半制备型高效液相色谱仪','\"活性组分制备\"','UN_APPOINTMENT','2018-03-12','2018-03-12',2324,'1301094S','images/pic4.jpg','NORMAL',NULL,NULL,90),(19,'蛋白质组学实验设备','双向电泳（2DE），凝胶内差异显示电泳（2D-DIGE）','UN_APPOINTMENT','2018-03-12','2018-03-12',12,'0301287S','images/pic4.jpg','NORMAL',NULL,NULL,180),(20,'超高分辨飞行时间质谱系统','⑴ 从代谢小分子化合物、多肽、蛋白水平筛选对疾病早期诊断、预后监测和疗效评估等具有重要价值的代谢产物、小分子多肽和蛋白生物标记物群。⑵　应用高灵敏度和高准确度超高分辨质谱分析鉴定中药方剂、单味中药、中药组分和单体化合物，为进一步明确化学物质基础、生物效应和作用机理提供理论基础和实验数据。','UN_APPOINTMENT','2018-03-12','2018-03-12',2321,'1001839S','images/pic4.jpg','NORMAL',NULL,NULL,106),(21,'超高通量基因分析系统','高通量测序','UN_APPOINTMENT','2018-03-12','2018-03-12',12325,'1300155S','images/pic4.jpg','NORMAL',NULL,NULL,80),(22,'4C413分子生物学场地','学科领域：基础医学药学中医学与中药学.所属实验室：蛋白质检测分析实验室.可检测项目：垂直电泳，制冰机，摇床，水浴锅，冰箱等基础设施.主要功能：垂直电泳，制冰机，摇床，水浴锅，冰箱等基础设施服务','UN_APPOINTMENT','2018-04-29','2018-04-29',32371,'1123213','images/2/4C413分子生物学场地.jpg','NORMAL',NULL,NULL,30),(23,'417微生物实验场地','可检测项目：可进行菌种培养，质粒提取，菌种扩增，菌种培养等.主要功能：可进行菌种培养，质粒提取，菌种扩增，菌种培养等.对外开放共享规定：先预约后使用； 首次使用，请先与负责人联系； 实验完成后，请带走实验垃圾，保持实验室卫生。','UN_APPOINTMENT','2018-04-29','2018-04-29',32438,'321321','images/2/417微生物实验场地.png','NORMAL',NULL,NULL,35),(24,'垂直电泳及电转槽（1）','学科领域：基础医学中医学与中药学.所属实验室：蛋白质检测分析实验室.可检测项目：蛋白质分析检测.主要功能：蛋白质分析检测。','UN_APPOINTMENT','2018-04-29','2018-04-29',43433,'1232132','images/2/垂直电泳及电转槽（1）.png','NORMAL',NULL,NULL,50),(25,'倒置荧光显微镜 Nikon','可检测项目：明场拍照、荧光拍照。主要功能：主要用于活细胞成像，适用于肿瘤研究、干细胞研究、药物筛选、医学研究等生命科学研究领域。主要技术指标：TI-DS透射照明柱30W，TI-DH透射照明柱100W；带编码器的TI-S-ER电动载物台，六孔荧光滤色块转换器，引入噪声消除机制的滤色块视场对中，孔径光阑，ND4/ND8滤色片可选：电动六孔荧光滤色块转换器、电动激发滤光片转轮、电动阻挡滤光片转轮','UN_APPOINTMENT','2018-04-29','2018-04-29',5455,'21321321','images/2/倒置荧光显微镜.jpg','NORMAL',NULL,NULL,33),(26,'激光扫描共聚焦显微镜','主要功能：多色荧光叠加、3D重构（Z-Stack）、荧光共定位、时间序列（长时间序列）、多点扫描及拼图、光谱扫描及拆分、荧光能量共振转移（FRET）可检测项目：1、多通道荧光拍摄；2、三维重构（Z-Stack）；3、时间序列扫描；4、拼大图拍摄；5、荧光漂白（Bleaching）；6、荧光能量共振转移（FRET）','UN_APPOINTMENT','2018-04-29','2018-04-29',51,'13232','images/2/激光扫描共聚焦显微镜.png','NORMAL',NULL,NULL,55),(27,'凝胶成像仪','主要功能：对电泳凝胶图像、杂交膜等的分析研究.主要技术指标：像素 500万像素，2592*1944； A/D 10bit； 镜头 6倍变焦电动镜头； 滤镜 590nm，可选460nm，530nm，630nm，670nm多层镀膜干涉滤光镜； 白光光源 双LED反射光源，LED透射白光板，钢化玻璃表面，样品区域20*32cm； 紫外透射','UN_APPOINTMENT','2018-04-29','2018-04-29',545455,'312321','images/2/凝胶成像仪.png','NORMAL',NULL,NULL,232),(28,'普通PCR','主要功能：Veriti 96孔PCR仪可以提供6个温控模块用于PCR优化 适合进行快速和标准形式的PCR反应.主要技术指标：样品基座：0.2mL 铝质，银质，或银质镀金 功能：最灵活的研究模式 特点：标准的0.2mL模式和可更换的样品基座提供了优异的性能和耐用性，网络软件包可以同时控制多台机器 控温精确度：±0.25℃（35℃-99.9℃） 温度范围：4℃-99℃','UN_APPOINTMENT','2018-04-29','2018-04-29',45454,'321321','images/2/普通PCR.png','NORMAL',NULL,NULL,45),(29,'微生物实验室专用生物安全柜','可检测项目：微生物培养操作 主要功能：无菌操作保障','UN_APPOINTMENT','2018-04-29','2018-04-29',6435435,'312312','images/2/微生物实验室专用生物安全柜.jpg','NORMAL',NULL,NULL,565),(30,'荧光定量PCR仪','可检测项目：1.基于相对定量分析的基因表达分析及以标准曲线为基础的绝对定量分析。 2.SNP基因型定性分析。 3.疾病相关的基因表达定量研究及检测','UN_APPOINTMENT','2018-04-29','2018-04-29',23423,'3123213','images/2/荧光定量PCR仪.jpg','NORMAL',NULL,NULL,33),(31,'中压色谱','主要技术指标：中压5~20bar，一般由泵提供压力。分离过程压力恒定，柱床稳定, 重现性好中压制备，流速快, 快速制备大量纯品柱效高，不拖尾，可根据分离度过载上样','UN_APPOINTMENT','2018-04-29','2018-04-29',213213,'312321','images/2/中压色谱.jpg','NORMAL',NULL,NULL,22),(32,'超分辨率显微镜','主要运用于：1） 不同蛋白的共定位分析 2）多通道荧光检测 3）细胞结构分析 4） 动态跟踪机体的精细结构和内源性表达的荧光蛋白  5） 活细胞培养实时观察 6） 超分辨率成像','UN_APPOINTMENT','2018-04-29','2018-04-29',4343,'312321','images/3/超分辨率显微镜.png','NORMAL',NULL,NULL,321),(33,'超高分辨三合一质谱仪','1、自动进样体积范围0.1-18uL,吸样速度0-40uL/min,进样盘RT-20度到RT，可容纳6X8个样品瓶或1X384和1X96微孔板 2、梯度泵流速范围：100-1000nl/min，压力范围:0-1200Bar,灵敏度：3-5秒FWHM,使用10cm,50umID色谱柱，1.9um填料','UN_APPOINTMENT','2018-04-29','2018-04-29',4343,'312321','images/3/超高分辨率三合一质谱仪.png','NORMAL',NULL,NULL,32),(34,'超高频高分辨小动物超声影像系统','脉冲多普勒功能模块：最高可测血流速度6m/s；可以定位了解各瓣口或心血管内血流状态、性质、分布和形态。M型超声模块：可以单线型进行高速超声扫描，实现高分辨率下心脏一切切线方向上的心血管功能测量和分析；','UN_APPOINTMENT','2018-04-29','2018-04-29',433,'12312','images/1/超高频高分辨小动物超声影像系统.png','NORMAL',NULL,NULL,212),(35,'超声波破碎仪','1、通过＞400kHz的球面固态超声传感器可将波长为1mm的声波聚焦在样品上 2、可剪切出150bp-5000bp的DNA片段 3、与市面上各家二代测序仪器平台均兼容','UN_APPOINTMENT','2018-04-29','2018-04-29',544,'1321','images/3/超声波破碎仪.png','NORMAL',NULL,NULL,221),(36,'超速流式细胞分选系统','MoFlo XDP不仅具有非常灵活的分选模式选择，能确保目标细胞的纯度、产量和活性；而且更是具备了其它流式细胞仪无法比拟的优势： 1）稀有细胞的分选——干细胞、免疫细胞、血液细胞、肿瘤细胞； 2）高活性细胞的分选——有效地保持良好的细胞活性； 3）高速分选——MoFlo XDP具有高达10万细胞/秒的分析速度，可有效地节省分析和分选时间。','UN_APPOINTMENT','2018-04-29','2018-04-29',54,'3243','images/3/超速流式细胞分选系统.png','NORMAL',NULL,NULL,321),(37,'单细胞自动制备系统','利用微流控芯片一步法自动完成多个单细胞分离捕获和单细胞确认，单细胞裂解，单细胞基因研究样本和预扩增，并自动回收单细胞基因产物用于单细胞表达谱和单细胞高通量测序实验。1.、捕获细胞：一组细胞用一步加样即可迅速地分离到96个独立仓中而完成制备','UN_APPOINTMENT','2018-04-29','2018-04-29',454,'11321','images/3/单细胞自动制备系统.png','NORMAL',NULL,NULL,12),(38,'倒置激光共聚焦显微镜','活细胞培养系统包括二氧化碳及温控设备，进行活细胞培养观察、活细胞药物刺激实时观察和时间序列拍图。1、该设备可兼容组织切片、细胞爬片、共聚焦皿等样本，原则上该设备建议使用共聚焦皿。2、活细胞样本建议贴壁培养，可以更好进行聚焦观察，减少因细胞运动造成的误差。','UN_APPOINTMENT','2018-04-29','2018-04-29',435,'656563','images/3/倒置激光共聚焦显微镜.png','NORMAL',NULL,NULL,213),(39,'多功能激光成像仪','1.激光成像原理：利用激光激发荧光基团，荧光基团发出发射光，发射光通过滤光片，被检测器接收，并转换为电子信号进行成像。2.定量精准：逐点扫描模式保证样品上每个位置都接收到完全一致的激发光能量；3.灵敏度高：检测下限低至3pg；','UN_APPOINTMENT','2018-04-29','2018-04-29',5454,'31264','images/3/多功能激光成像仪.png','NORMAL',NULL,NULL,111),(40,'多功能细胞成像微孔板检测仪','(1)荧光，明场H&E和相差显微镜成像及便捷的多功能检测，可以在一套系统中同时提供强大的成像和数据定量手机功能 (2)专利的HybridTechnology多功能检测模块整合了高性能的滤光片和带宽连续可调的光栅，同时具备高灵敏度和高性能 (3)荧光检测光栅带宽从9-50nm连续可调，1nm步进，超级灵活 (4)基于激光的AlphaScreen/AlphaLISA分析 ','UN_APPOINTMENT','2018-04-29','2018-04-29',655543,'6435432','images/3/多功能细胞成像微孔板检测仪.png','NORMAL',NULL,NULL,123),(41,'超高效液相色谱( H-class-2)','可检测项目：对样品进行快速高效的色谱分离，通过紫外或蒸发光散射检测器同时对主要成分和杂质进行定性及定量。常用于药物分析和定量，食品安全及环境检测等。 对外开放共享规定：对样品进行色谱分离，通过紫外或蒸发光散射检测器同时对主要成分和杂质进行定性及定量。','UN_APPOINTMENT','2018-04-29','2018-04-29',4343563,'2143455','images/7/超高效液相色谱( H-class-2).png','NORMAL',NULL,NULL,123),(42,'高效液相色谱仪','主要功能：1.紫外检测器；2.二极管阵列检测器；3.蒸发光散射检测器。 对外开放共享规定：1.提供待测样品、待检组分的相关结构及性质等信息；2.提供待测组分的标准品； 3.提供的样品应为澄清溶液，普通样品量不少于2ml（特殊或稀少样品需量请提前联系确认）。','UN_APPOINTMENT','2018-04-29','2018-04-29',446,'87543232','images/7/高效液相色谱仪.png','NORMAL',NULL,NULL,213),(43,'高效液相色谱仪安捷伦 1260',NULL,'UN_APPOINTMENT','2018-04-29','2018-04-29',548,'321321','images/7/高效液相色谱仪 PDA FLR.png','NORMAL',NULL,NULL,332),(44,'恒温摇床','学科领域：药学生物学 所属实验室：微生物实验室 可检测项目：摇菌 主要功能：恒温摇菌 对外开放共享规定：先预约后使用','UN_APPOINTMENT','2018-04-29','2018-04-29',52343,'545432','images/7/恒温摇床.png','NORMAL',NULL,NULL,65),(45,'流化床','可检测项目：微丸包衣；一步法制丸 主要功能：微丸包衣；一步法制丸 对外开放共享规定：第一次使用，提前到平台咨询； 先培训后使用； 先预约后使用； 使用后请将需要清洗的东西清洗干净，保持实验室整洁。','UN_APPOINTMENT','2018-04-29','2018-04-29',2330,'546562','images/7/流化床.jpg','NORMAL',NULL,NULL,43),(46,'气相色谱仪（2014C）','学科领域：药学化学食品科学技术农学 所属实验室：气相色谱质谱分析实验室 可检测项目：有机物的分离，定性定量分析 主要功能：对气体物质或者在一定温度下可以转化为气体的物质进行定性和定量分析','UN_APPOINTMENT','2018-04-29','2018-04-29',346,'546582','images/7/气相色谱仪（2010plus）.png','NORMAL',NULL,NULL,87),(47,'液相-质谱联用(Qtrap 5500)','可检测项目：药物分析和定量，代谢组学，代谢鉴定，食品安全检测。 主要功能：1.分析范围广，几乎可以检测所有的化合物；2.分离能力强，即使被分析混合物在色谱上没有完全分离开，但通过MS的特征离子质量色谱图也能分别给出它们各自的色谱图来进行定性定量；3.检测限低，MS具备高灵敏度，通过选择离子检测（SIM）方式，其检测能力还可以提高一个数量级以上；4.同时具备ESI、APCI，可以分析大量化合物。','UN_APPOINTMENT','2018-04-29','2018-04-29',54,'4237652','images/7/液相-质谱联用(Qtrap 5500).png','NORMAL',NULL,NULL,34),(48,'荧光光谱仪-1','学科领域：药学中医学与中药学食品科学技术农 所属实验室：光谱实验室 可检测项目：荧光测定，进行磷光、生物发光和化学发光的测定。 主要功能：荧光痕量分析','UN_APPOINTMENT','2018-04-29','2018-04-29',324,'532765','images/7/荧光光谱仪-1.png','NORMAL',NULL,NULL,32),(49,'紫外-可见近红外光谱仪-2','所属实验室：光谱实验室 可检测项目：主要用于检测具有紫外吸收的化合物的含量 主要功能：测试波长范围： 185-1500nm， 分辨率： 0.1nm，可在紫外、可见、近红外的广阔范围进行测定','UN_APPOINTMENT','2018-04-29','2018-04-29',454346,'321674','images/7/紫外-可见近红外光谱仪-2.png','NORMAL',NULL,NULL,213),(50,'紫外引导自动纯化制备液相色谱系统','可检测项目：具紫外吸收物质的鉴定、分离、纯化、表征、筛选及测试。 主要功能：可按紫外信号的峰强度，峰宽，保留时间，斜率、峰谷到峰谷，混合模式，模拟信号等进行收集，保证馏分的纯度，能完全自动化的实现分析-制备-馏分再分析过程','UN_APPOINTMENT','2018-04-29','2018-04-29',3233,'1246767','images/7/紫外引导自动纯化制备液相色谱系统.png','NORMAL',NULL,NULL,343);

/*Table structure for table `t_lab_teacher_manager` */

DROP TABLE IF EXISTS `t_lab_teacher_manager`;

CREATE TABLE `t_lab_teacher_manager` (
  `id` bigint(100) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `account` bigint(100) DEFAULT NULL COMMENT '账号',
  `password` varchar(45) DEFAULT NULL COMMENT '密码',
  `authority` varchar(45) DEFAULT NULL COMMENT '权限 0-实验室管理员 1-老师 2-系统管理员',
  `status` varchar(45) DEFAULT NULL COMMENT '是否启用 UN_NORMAL-不启用 NORMAL-启用',
  `category_id` bigint(100) DEFAULT NULL COMMENT '学院id   0-全部',
  `name` varchar(45) DEFAULT NULL COMMENT '名字',
  `title` varchar(45) DEFAULT NULL COMMENT '职称',
  `office` varchar(45) DEFAULT NULL COMMENT '办公室',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

/*Data for the table `t_lab_teacher_manager` */

insert  into `t_lab_teacher_manager`(`id`,`account`,`password`,`authority`,`status`,`category_id`,`name`,`title`,`office`) values (1,20000,'96e79218965eb72c92a549dd5a330112','1','NORMAL',2,'李旺','教授','12-1201'),(11,10000,'96e79218965eb72c92a549dd5a330112','2','NORMAL',0,'超级管理员','超级管理员','21-201'),(12,30000,'96e79218965eb72c92a549dd5a330112','0','NORMAL',2,'李四','教授','6-101'),(13,20001,'96e79218965eb72c92a549dd5a330112','1','NORMAL',7,'药学院教师','教授','12-1201'),(15,30001,'96e79218965eb72c92a549dd5a330112','0','NORMAL',7,'张三丰','教授','6-000'),(16,20002,'96e79218965eb72c92a549dd5a330112','1','NORMAL',7,'李四','教授','6-000'),(17,21000,'96e79218965eb72c92a549dd5a330112','1','NORMAL',2,'张傲','教授','6-000');

/*Table structure for table `t_mall_img` */

DROP TABLE IF EXISTS `t_mall_img`;

CREATE TABLE `t_mall_img` (
  `device_id` bigint(20) DEFAULT NULL COMMENT '主键',
  `url` varchar(45) DEFAULT NULL COMMENT '主图地址',
  `type` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_mall_img` */

insert  into `t_mall_img`(`device_id`,`url`,`type`) values (1,'images/pic5.jpg',0),(1,'images/pic1.jpg',0),(1,'images/pic2.jpg',0),(2,'images/pic1.jpg',0),(2,'images/pic2.jpg',0),(2,'images/pic4.jpg',0),(3,'images/pic1.jpg',0),(3,'images/pic2.jpg',0),(3,'images/pic4.jpg',0),(4,'images/pic1.jpg',0),(4,'images/pic2.jpg',0),(4,'images/pic4.jpg',0),(5,'images/pic1.jpg',0),(5,'images/pic2.jpg',0),(5,'images/pic4.jpg',0),(6,'images/pic1.jpg',0),(6,'images/pic2.jpg',0),(6,'images/pic4.jpg',0),(7,'images/pic4.jpg',0),(7,'images/pic4.jpg',0),(7,'images/pic4.jpg',0),(8,'images/pic4.jpg',0),(8,'images/pic4.jpg',0),(8,'images/pic4.jpg',0),(9,'images/pic4.jpg',0),(9,'images/pic4.jpg',0),(9,'images/pic4.jpg',0),(10,'images/pic4.jpg',0),(10,'images/pic4.jpg',0),(10,'images/pic4.jpg',0),(11,'images/pic4.jpg',0),(11,'images/pic4.jpg',0),(11,'images/pic4.jpg',0),(12,'images/pic4.jpg',0),(12,'images/pic4.jpg',0),(12,'images/pic4.jpg',0),(13,'images/pic4.jpg',0),(13,'images/pic4.jpg',0),(13,'images/pic4.jpg',0),(14,'images/pic4.jpg',0),(14,'images/pic4.jpg',0),(14,'images/pic4.jpg',0),(16,'images/pic4.jpg',0),(15,'images/pic4.jpg',0),(15,'images/pic4.jpg',0),(15,'images/pic4.jpg',0),(16,'images/pic4.jpg',0),(16,'images/pic4.jpg',0),(17,'images/pic4.jpg',0),(17,'images/pic4.jpg',0),(17,'images/pic4.jpg',0),(18,'images/pic4.jpg',0),(18,'images/pic4.jpg',0),(18,'images/pic4.jpg',0),(19,'images/pic4.jpg',0),(19,'images/pic4.jpg',0),(19,'images/pic4.jpg',0),(20,'images/pic4.jpg',0),(20,'images/pic4.jpg',0),(20,'images/pic4.jpg',0),(21,'images/pic4.jpg',0),(21,'images/pic4.jpg',0),(21,'images/pic4.jpg',0),(34,'images/1/超高频高分辨小动物超声影像系统1.png',0),(22,'images/2/4C413分子生物学场地.jpg',0),(23,'images/2/417微生物实验场地.png',0),(31,'images/2/中压色谱.jpg',0),(25,'images/2/倒置荧光显微镜.jpg',0),(25,'images/2/倒置荧光显微镜 Nikon.png',0),(24,'images/2/垂直电泳及电转槽（1）.png',0),(29,'images/2/微生物实验室专用生物安全柜.jpg',0),(28,'images/2/普通PCR.png',0),(26,'images/2/激光扫描共聚焦显微镜.png',0),(30,'images/2/荧光定量PCR仪.jpg',0),(38,'images/3/倒置激光共聚焦显微镜.png',0),(37,'images/3/单细胞自动制备系统.png',0),(37,'images/3/单细胞自动制备系统1.png',NULL),(39,'images/3/多功能激光成像仪.png',NULL),(39,'images/3/多功能激光成像仪1.png',NULL),(40,'images/3/多功能细胞成像微孔板检测仪.png',NULL),(40,'images/3/多功能细胞成像微孔板检测仪1.png',NULL),(32,'images/3/超分辨率显微镜.png',NULL),(32,'images/3/超分辨率显微镜2.png',NULL),(35,'images/3/超声波破碎仪.png',NULL),(35,'images/3/超声波破碎仪1.png',NULL),(36,'images/3/超速流式细胞分选系统.png',NULL),(36,'images/3/超速流式细胞分选系统1.png',NULL),(33,'images/3/超高分辨率三合一质谱仪.png',NULL),(33,'images/3/超高分辨率三合一质谱仪1.png',NULL),(34,'images/3/超高频高分辨小动物超声影像系统.png',NULL),(34,'images/3/超高频高分辨小动物超声影像系统1.png',NULL),(44,'images/7/恒温摇床.png',NULL),(46,'images/7/气相色谱仪（2010plus）.png',NULL),(46,'images/7/气相色谱仪（2014C）.png',NULL),(45,'images/7/流化床.jpg',NULL),(47,'images/7/液相-质谱联用(Qtrap 5500).png',NULL),(49,'images/7/紫外-可见近红外光谱仪-2.png',NULL),(50,'images/7/紫外引导自动纯化制备液相色谱系统.png',NULL),(48,'images/7/荧光光谱仪-1.png',NULL),(41,'images/7/超高效液相色谱( H-class-2).png',NULL),(42,'images/7/高效液相色谱仪.png',NULL),(43,'images/7/高效液相色谱仪 PDA FLR.png',NULL),(43,'images/7/高效液相色谱仪安捷伦 1260.png',NULL);

/*Table structure for table `t_message` */

DROP TABLE IF EXISTS `t_message`;

CREATE TABLE `t_message` (
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `message_type` varchar(100) DEFAULT NULL COMMENT '消息类型，1成功  0管理员取消  2失败   4自己取消  3修改',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `isread` bigint(20) DEFAULT NULL COMMENT '是否已读',
  `orderstate_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_message` */

insert  into `t_message`(`user_id`,`message_type`,`create_time`,`isread`,`orderstate_id`) values (11,'1','2018-04-11 17:10:09',0,7),(11,'0','2018-04-12 09:56:36',0,6),(11,'1','2018-04-12 09:59:26',0,8),(11,'1','2018-04-12 11:02:59',0,9),(11,'1','2018-04-12 14:00:16',0,10),(11,'1','2018-04-12 15:54:22',0,11),(11,'1','2018-04-12 15:55:37',0,12),(11,'1','2018-04-12 15:56:18',0,13),(11,'1','2018-04-12 15:56:25',0,14),(11,'1','2018-04-12 15:57:53',0,15),(11,'1','2018-04-12 15:58:53',0,16),(11,'1','2018-04-12 16:04:02',0,17),(11,'1','2018-04-12 16:04:04',0,18),(11,'1','2018-04-12 16:04:06',0,19),(11,'4','2018-04-16 17:30:09',0,1),(11,'3','2018-04-16 17:30:20',0,1),(11,'4','2018-04-16 17:30:41',0,1),(11,'3','2018-04-16 17:30:48',0,1),(11,'3','2018-04-16 17:43:39',0,8),(11,'4','2018-04-16 17:44:02',0,8),(11,'3','2018-04-16 17:44:08',0,8),(11,'4','2018-04-16 20:11:19',0,9),(11,'3','2018-04-16 21:39:19',0,7),(11,'3','2018-04-16 21:43:11',0,7),(11,'4','2018-04-16 21:43:14',0,7),(11,'3','2018-04-16 21:47:15',0,10),(11,'3','2018-04-16 21:47:20',0,10),(11,'3','2018-04-16 21:47:23',0,10),(11,'3','2018-04-16 21:47:25',0,10),(11,'3','2018-04-16 21:47:30',0,10),(11,'3','2018-04-16 21:48:57',0,10),(11,'3','2018-04-16 21:49:52',0,10),(11,'3','2018-04-16 21:53:43',0,10),(11,'3','2018-04-16 21:53:58',0,10),(11,'3','2018-04-16 21:55:52',0,10),(11,'3','2018-04-16 22:01:22',0,5),(11,'3','2018-04-16 22:01:25',0,8),(11,'3','2018-04-16 22:01:36',0,1),(11,'3','2018-04-16 22:06:11',0,9),(11,'1','2018-04-16 22:06:58',0,20),(13,'1','2018-04-30 12:26:07',1,4);

/*Table structure for table `t_order_class` */

DROP TABLE IF EXISTS `t_order_class`;

CREATE TABLE `t_order_class` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `device_id` bigint(20) DEFAULT NULL,
  `appoint_time` date DEFAULT NULL,
  `book` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `delete_id` bigint(20) DEFAULT NULL COMMENT '0 存在  具体id 表示谁删除',
  `authority` varchar(45) DEFAULT NULL COMMENT '权限 0-实验室管理员  3-学生',
  `day_time` bigint(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

/*Data for the table `t_order_class` */

insert  into `t_order_class`(`id`,`device_id`,`appoint_time`,`book`,`user_id`,`delete_id`,`authority`,`day_time`) values (1,22,'2018-05-01',5,2,0,'3',3),(2,22,'2018-05-01',19,2,201612203101004,'3',3),(3,22,'2018-05-02',4,3,0,'0',4),(4,22,'2018-05-01',5,1,0,'0',3),(5,41,'2018-05-07',3,35,0,'0',2),(6,42,'2018-05-01',1,7,0,'3',1),(7,42,'2018-05-02',2,7,0,'3',1),(8,26,'2018-05-07',2,2,0,'3',1),(9,41,'2018-05-03',4,50,0,'0',2),(10,41,'2018-05-02',1,12,0,'0',1),(11,22,'2018-05-08',2,2,-1,'3',1),(12,22,'2018-05-07',11,2,-1,'3',4),(13,22,'2018-05-07',11,2,0,'3',4),(14,22,'2018-05-07',1,2,-1,'3',4),(15,22,'2018-05-07',1,2,0,'3',4),(16,3,'2018-05-06',2,2,-1,'3',1),(17,41,'2018-05-08',1,10,0,'3',4),(18,45,'2018-05-12',2,10,0,'3',1),(19,50,'2018-05-14',3,10,0,'3',2),(20,22,'2018-05-11',2,3,0,'3',3),(21,43,'2018-05-08',1,9,0,'3',2),(22,43,'2018-05-09',NULL,9,0,'3',1),(23,42,'2018-05-08',1,9,0,'3',3),(24,41,'2018-05-08',1,6,0,'3',2),(25,42,'2018-05-09',1,1,0,'3',2),(26,42,'2018-05-08',1,9,0,'3',1),(27,15,'2018-05-08',1,9,0,'3',1),(28,46,'2018-05-10',1,11,0,'3',1),(29,14,'2018-05-11',9,12,0,'3',4),(30,15,'2018-05-10',5,12,30001,'3',3),(31,15,'2018-05-10',10,12,30001,'3',1),(32,15,'2018-05-10',15,12,0,'3',2),(33,15,'2018-05-10',20,12,0,'3',4),(34,41,'2018-05-10',5,10,-1,'3',1);

/*Table structure for table `t_stu_class` */

DROP TABLE IF EXISTS `t_stu_class`;

CREATE TABLE `t_stu_class` (
  `choose_id` bigint(20) DEFAULT NULL,
  `stu_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_stu_class` */

insert  into `t_stu_class`(`choose_id`,`stu_id`) values (21,6),(21,1),(21,5),(21,4),(21,2),(21,7),(21,8),(21,3),(22,1),(22,2),(22,3),(22,4),(22,5),(22,6),(24,2),(23,2),(25,2);

/*Table structure for table `t_student_info` */

DROP TABLE IF EXISTS `t_student_info`;

CREATE TABLE `t_student_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(45) DEFAULT NULL COMMENT '姓名',
  `certificate_id` varchar(45) DEFAULT NULL COMMENT '学号',
  `password` varchar(45) DEFAULT NULL COMMENT '密码',
  `mobile` varchar(45) DEFAULT NULL COMMENT '手机号',
  `card_id` int(200) DEFAULT NULL COMMENT '身份证号',
  `born_date` date DEFAULT NULL COMMENT '出生日期',
  `sex` varchar(45) DEFAULT NULL COMMENT '性别 MALE男 FEMALE女',
  `age` int(20) DEFAULT NULL COMMENT '年龄',
  `email` varchar(45) DEFAULT NULL COMMENT '电子邮件',
  `address` varchar(200) DEFAULT NULL COMMENT '地址',
  `head_picture` varchar(200) DEFAULT NULL COMMENT '头像',
  `nick_name` varchar(45) DEFAULT NULL COMMENT '昵称',
  `status` varchar(45) DEFAULT NULL COMMENT '状态 NORMAL正常 UN_NORMAL非正常；DISABLE禁用',
  `create_date` date DEFAULT NULL COMMENT '创建时间',
  `theclass` varchar(30) DEFAULT NULL COMMENT '班级',
  `depart` varchar(30) DEFAULT NULL COMMENT '院系',
  `grade` varchar(30) DEFAULT NULL COMMENT '年级',
  `student_status` varchar(45) DEFAULT NULL COMMENT '账号状态 1-已注册 0-未注册',
  `category_id` bigint(100) DEFAULT NULL COMMENT '学院id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Data for the table `t_student_info` */

insert  into `t_student_info`(`id`,`name`,`certificate_id`,`password`,`mobile`,`card_id`,`born_date`,`sex`,`age`,`email`,`address`,`head_picture`,`nick_name`,`status`,`create_date`,`theclass`,`depart`,`grade`,`student_status`,`category_id`) values (1,'鲍狄','201612203101001','96e79218965eb72c92a549dd5a330112','15990157011',100000,'1993-01-29','男',22,'baodi@zcmu.edu.cn','浙江杭州',NULL,NULL,'NORMAL','2018-03-13','1班','医学技术系','2016级',NULL,7),(3,'李青云','201612203102011','96e79218965eb72c92a549dd5a330112','13750893062',100002,'1995-11-23','女',21,'liqingyun@zcmu.edu.cn','浙江杭州',NULL,NULL,'NORMAL','2018-04-29','2班','医学技术系','2016级',NULL,2),(4,'吴尊','201612203101005','96e79218965eb72c92a549dd5a330112','15990157013',100006,'2018-05-01','男',30,'wuzun@zcmu.com','浙江杭州',NULL,NULL,'NORMAL','2018-05-01','1班','科研处','2016级',NULL,3),(6,'张艺兴','201612203101006','96e79218965eb72c92a549dd5a330112','15990157014',100007,'2018-05-01','男',25,'zhangyixing@zcmu.com','浙江温州',NULL,NULL,'NORMAL','2018-05-01','1班','骨伤研究所','2016级',NULL,7),(7,'刘亦菲','201612203101007','96e79218965eb72c92a549dd5a330112','15990157015',100008,'2018-05-01','女',22,'liuyifei@zcmu.com','浙江宁波',NULL,NULL,'NORMAL','2018-05-01','2班','药学院','2015级',NULL,7),(9,'陈熙渠','201612203101002','96e79218965eb72c92a549dd5a330112','15990157016',100009,'2018-05-08','男',22,'chenxiqu@zcmu.zjtcmm.com','浙江',NULL,NULL,'NORMAL','2018-05-03','1班','药学院','2016级',NULL,7),(10,'方柯','201612203101004','3bddd5b0e71ec739ed62c37d906ef6f5','15990157013',173915,'2018-02-08','男',25,'fangke@zcmu.com','浙江衢州',NULL,NULL,'NORMAL','2018-05-01','1班','药学院','2016级',NULL,7),(11,'钥匙','201612203101011','96e79218965eb72c92a549dd5a330112','15990157022',100011,'2018-02-08','女',22,NULL,NULL,NULL,NULL,'NORMAL','2018-05-01','1班','药学院','2016级',NULL,7),(12,'Lawrence','201612203101022','96e79218965eb72c92a549dd5a330112','15990157033',100022,'2018-05-08','男',22,'Lawrence@qq.com','浙江衢州',NULL,NULL,'NORMAL','2018-05-01','1班','药学院','2016级',NULL,7),(13,'Helen','201612203101038',NULL,'15990157044',100044,'2018-05-08','男',21,'Helen@qq.com','浙江宁波',NULL,NULL,'UN_NORMAL','2018-05-01','1班','基础医学院','2016级',NULL,2),(14,'Lily','201612203101039',NULL,'15990157055',100055,'2018-05-02','男',22,'Lily@qq.com','浙江宁波',NULL,NULL,'UN_NORMAL','2018-05-01','1班','药学院','2016级',NULL,7);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
