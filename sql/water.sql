/*
 Navicat Premium Data Transfer

 Source Server         : 58_test
 Source Server Type    : MySQL
 Source Server Version : 50727
 Source Host           : 58.87.102.217:3306
 Source Schema         : water

 Target Server Type    : MySQL
 Target Server Version : 50727
 File Encoding         : 65001

 Date: 23/12/2019 16:43:29
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for biz_agentia
-- ----------------------------
DROP TABLE IF EXISTS `biz_agentia`;
CREATE TABLE `biz_agentia`  (
  `agentia_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '药剂ID',
  `agentia_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '药剂编号',
  `agentia_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '药剂名称',
  `agentia_device` bigint(20) NULL DEFAULT NULL COMMENT '所属设备',
  `agentia_total` float NULL DEFAULT NULL COMMENT '药剂总量',
  `agentia_remain` float NULL DEFAULT NULL COMMENT '药剂剩余量',
  `agentia_alert` float NULL DEFAULT NULL COMMENT '药剂告警量',
  `agentia_type` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '药剂类型',
  `agentia_maker` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '药剂厂家',
  `agentia_status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '药剂状态（0：使用；1：停用）',
  `use_time` datetime(0) NULL DEFAULT NULL COMMENT '投入使用时间',
  `last_repair_time` datetime(0) NULL DEFAULT NULL COMMENT '上次维护时间',
  `repair_time` datetime(0) NULL DEFAULT NULL COMMENT '维护时间',
  `repair_by` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '维护人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`agentia_id`) USING BTREE,
  INDEX `IDX_AGENTIA_STATUS`(`agentia_status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '药剂表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of biz_agentia
-- ----------------------------
INSERT INTO `biz_agentia` VALUES (1, '001', '酒石酸钾钠', 1, 100, 50, 20, '1', '程天科技', '0', '2019-12-14 14:42:04', '2019-12-16 16:43:59', '2019-12-31 16:44:23', NULL, NULL, NULL, '2019-12-17 16:12:51', NULL);

-- ----------------------------
-- Table structure for biz_alert
-- ----------------------------
DROP TABLE IF EXISTS `biz_alert`;
CREATE TABLE `biz_alert`  (
  `alert_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '告警id',
  `report_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '化验结果唯一ID（用于修改溯源）',
  `alert_device` bigint(20) NULL DEFAULT NULL COMMENT '告警设备',
  `alert_works` bigint(20) NULL DEFAULT NULL COMMENT '告警水厂',
  `alert_content` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '告警内容',
  `alert_type` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '告警类型',
  `alert_date` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '告警日期',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`alert_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '告警表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of biz_alert
-- ----------------------------
INSERT INTO `biz_alert` VALUES (1, 'H00120191202', 1, 1, '出水COD异常', '1', '2019-12-16', NULL, NULL, '2019-12-16 09:50:48', NULL);

-- ----------------------------
-- Table structure for biz_assay_result
-- ----------------------------
DROP TABLE IF EXISTS `biz_assay_result`;
CREATE TABLE `biz_assay_result`  (
  `result_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '化验结果ID',
  `result_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '化验结果编号',
  `report_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '化验结果唯一ID（用于修改溯源）',
  `result_device` bigint(20) NULL DEFAULT NULL COMMENT '化验设备',
  `result_works` bigint(20) NULL DEFAULT NULL COMMENT '化验水厂',
  `result_type` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '化验类型',
  `assay_date` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '送检日期',
  `begin_time` datetime(0) NULL DEFAULT NULL COMMENT '化验开始时间',
  `end_time` datetime(0) NULL DEFAULT NULL COMMENT '化验结束时间',
  `result_method` bigint(20) NULL DEFAULT NULL COMMENT '化验方法id',
  `result_parameter` bigint(20) NULL DEFAULT NULL COMMENT '化验参数id',
  `result_curve` bigint(20) NULL DEFAULT NULL COMMENT '化验曲线id',
  `result_scope` bigint(20) NULL DEFAULT NULL COMMENT '化验范围id',
  `in_COD` float(10, 2) NULL DEFAULT NULL COMMENT '入水COD数值',
  `in_TP` float(10, 2) NULL DEFAULT NULL COMMENT '入水总磷（TP）数值',
  `in_TN` float(10, 2) NULL DEFAULT NULL COMMENT '入水总氮（TN）数值',
  `in_NH3` float(10, 2) NULL DEFAULT NULL COMMENT '入水氨氮（NH3）COD数值',
  `out_COD` float(10, 2) NULL DEFAULT NULL COMMENT '出水COD数值',
  `out_TP` float(10, 2) NULL DEFAULT NULL COMMENT '出水总磷（TP）数值',
  `out_TN` float(10, 2) NULL DEFAULT NULL COMMENT '出水总氮（TN）数值',
  `out_NH3` float(10, 2) NULL DEFAULT NULL COMMENT '出水氨氮（NH3）COD数值',
  `result_status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '化验状态（0：有效；1：无效）',
  `result_alert` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '告警状态（0：无告警；1：有告警）',
  `result_date` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '化验日期',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`result_id`) USING BTREE,
  INDEX `IDX_RESULT_STATUS`(`result_status`) USING BTREE,
  INDEX `IDX_ASSAY_DATE`(`assay_date`) USING BTREE,
  INDEX `IDX_REPORT_ID`(`report_id`) USING BTREE,
  INDEX `IDX_RESULT_DEVICE`(`result_device`) USING BTREE,
  INDEX `IDX_RESULT_WORKS`(`result_works`) USING BTREE,
  INDEX `IDX_METHOD_ID`(`result_method`) USING BTREE,
  INDEX `IDX_PARAMETER_ID`(`result_parameter`) USING BTREE,
  INDEX `IDX_CURVE_ID`(`result_curve`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '化验结果表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of biz_assay_result
-- ----------------------------
INSERT INTO `biz_assay_result` VALUES (1, 'H001', 'H00120191202', 1, 1, '1', '2019-12-02', '2019-12-02 06:20:05', '2019-12-02 12:30:11', 1, 1, 1, NULL, 16.02, 41.00, 40.00, 6.00, 4.00, 21.00, 30.00, 20.00, '0', '0', NULL, '2019-12-02 12:40:06', '1', '2019-12-17 10:23:58', '1');
INSERT INTO `biz_assay_result` VALUES (2, 'H002', 'H00220191202', 1, 1, '1', '2019-12-02', '2019-12-02 07:20:05', '2019-12-02 13:30:11', 1, 1, 1, NULL, 24.00, 50.00, 46.00, 98.00, 11.00, 35.00, 21.00, 50.00, '0', '1', NULL, '2019-12-02 13:40:06', '1', '2019-12-02 13:40:06', '1');

-- ----------------------------
-- Table structure for biz_assay_result_initial
-- ----------------------------
DROP TABLE IF EXISTS `biz_assay_result_initial`;
CREATE TABLE `biz_assay_result_initial`  (
  `result_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '化验结果ID',
  `result_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '化验结果编号',
  `report_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '化验结果唯一ID（用于修改溯源）',
  `result_device` bigint(20) NULL DEFAULT NULL COMMENT '化验设备',
  `result_works` bigint(20) NULL DEFAULT NULL COMMENT '化验水厂',
  `result_type` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '化验类型',
  `assay_date` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '送检日期',
  `begin_time` datetime(0) NULL DEFAULT NULL COMMENT '化验开始时间',
  `end_time` datetime(0) NULL DEFAULT NULL COMMENT '化验结束时间',
  `result_method` bigint(20) NULL DEFAULT NULL COMMENT '化验方法id',
  `result_parameter` bigint(20) NULL DEFAULT NULL COMMENT '化验参数id',
  `result_curve` bigint(20) NULL DEFAULT NULL COMMENT '化验曲线id',
  `result_scope` bigint(20) NULL DEFAULT NULL COMMENT '化验范围id',
  `in_COD` float(10, 2) NULL DEFAULT NULL COMMENT '入水COD数值',
  `in_TP` float(10, 2) NULL DEFAULT NULL COMMENT '入水总磷（TP）数值',
  `in_TN` float(10, 2) NULL DEFAULT NULL COMMENT '入水总氮（TN）数值',
  `in_NH3` float(10, 2) NULL DEFAULT NULL COMMENT '入水氨氮（NH3）COD数值',
  `out_COD` float(10, 2) NULL DEFAULT NULL COMMENT '出水COD数值',
  `out_TP` float(10, 2) NULL DEFAULT NULL COMMENT '出水总磷（TP）数值',
  `out_TN` float(10, 2) NULL DEFAULT NULL COMMENT '出水总氮（TN）数值',
  `out_NH3` float(10, 2) NULL DEFAULT NULL COMMENT '出水氨氮（NH3）COD数值',
  `result_status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '化验状态（0：有效；1：无效）',
  `result_alert` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '告警状态（0：无告警；1：有告警）',
  `result_date` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '化验日期',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`result_id`) USING BTREE,
  INDEX `IDX_RESULT_STATUS`(`result_status`) USING BTREE,
  INDEX `IDX_ASSAY_DATE`(`assay_date`) USING BTREE,
  INDEX `IDX_REPORT_ID`(`report_id`) USING BTREE,
  INDEX `IDX_RESULT_DEVICE`(`result_device`) USING BTREE,
  INDEX `IDX_RESULT_WORKS`(`result_works`) USING BTREE,
  INDEX `IDX_METHOD_ID`(`result_method`) USING BTREE,
  INDEX `IDX_PARAMETER_ID`(`result_parameter`) USING BTREE,
  INDEX `IDX_CURVE_ID`(`result_curve`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '原始化验结果表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for biz_device
-- ----------------------------
DROP TABLE IF EXISTS `biz_device`;
CREATE TABLE `biz_device`  (
  `device_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '设备ID',
  `device_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备编号',
  `device_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备名称',
  `device_sn` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备SN',
  `device_model` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备型号',
  `device_maker` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备厂家',
  `device_works` bigint(20) NULL DEFAULT NULL COMMENT '所属水厂',
  `device_maintainer` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '维护人员',
  `device_tel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '维护人员电话',
  `device_type` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备类型',
  `device_status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备状态（0：使用；1：停用）',
  `repair_tim` datetime(0) NULL DEFAULT NULL COMMENT '维护时间',
  `repair_by` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '维护人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`device_id`) USING BTREE,
  INDEX `IDX_DEVICE_STATUS`(`device_status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '设备表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of biz_device
-- ----------------------------
INSERT INTO `biz_device` VALUES (1, '001', '化验机器人一号', 'CTTC-00A1', '220', '程天科技', 1, '于涛', '18745773203', '1', '0', '2019-12-02 16:40:57', NULL, NULL, NULL, '2019-12-16 11:51:46', NULL);

-- ----------------------------
-- Table structure for biz_device_maintain
-- ----------------------------
DROP TABLE IF EXISTS `biz_device_maintain`;
CREATE TABLE `biz_device_maintain`  (
  `maintain_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '设备维护id',
  `maintain_device` bigint(20) NULL DEFAULT NULL COMMENT '维护设备',
  `maintain_works` bigint(20) NULL DEFAULT NULL COMMENT '所在水厂',
  `maintain_city` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所在城市',
  `maintain_reason` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '维护原因',
  `maintain_result` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '维护结果',
  `maintain_date` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '维护日期',
  `maintain_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `maintain_tel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `update_by` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`maintain_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '设备维护表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of biz_device_maintain
-- ----------------------------
INSERT INTO `biz_device_maintain` VALUES (1, 1, 1, '哈尔滨', '下位机失灵', '维护成功', '2019-12-16', '于涛', '18745773203', '2019-12-16 17:51:14', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for biz_device_unit
-- ----------------------------
DROP TABLE IF EXISTS `biz_device_unit`;
CREATE TABLE `biz_device_unit`  (
  `unit_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部件ID',
  `unit_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部件编号',
  `unit_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部件名称',
  `unit_sn` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部件SN',
  `unit_model` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部件型号',
  `unit_device` bigint(20) NULL DEFAULT NULL COMMENT '所属设备',
  `unit_type` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部件类型',
  `unit_count` int(8) NULL DEFAULT NULL COMMENT '部件数量',
  `unit_maker` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部件厂家',
  `unit_status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部件状态（0：使用；1：停用）',
  `use_time` datetime(0) NULL DEFAULT NULL COMMENT '投入使用时间',
  `last_repair_time` datetime(0) NULL DEFAULT NULL COMMENT '上次维护时间',
  `repair_time` datetime(0) NULL DEFAULT NULL COMMENT '维护时间',
  `repair_by` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '维护人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`unit_id`) USING BTREE,
  INDEX `IDX_UNIT_STATUS`(`unit_status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '设备部件表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of biz_device_unit
-- ----------------------------
INSERT INTO `biz_device_unit` VALUES (1, '001', '试管', '010A', '1A', 1, '1', 10, '程天科技', '0', '2019-12-15 14:06:45', '2019-12-16 14:06:47', NULL, NULL, NULL, NULL, '2019-12-16 12:03:34', NULL);

-- ----------------------------
-- Table structure for biz_order
-- ----------------------------
DROP TABLE IF EXISTS `biz_order`;
CREATE TABLE `biz_order`  (
  `order_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '化验单据id',
  `order_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '化验单据编号',
  `report_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '化验结果唯一ID（用于修改溯源）',
  `order_device` bigint(20) NULL DEFAULT NULL COMMENT '化验设备',
  `order_works` bigint(20) NULL DEFAULT NULL COMMENT '化验水厂',
  `begin_time` datetime(0) NULL DEFAULT NULL COMMENT '化验开始时间',
  `end_time` datetime(0) NULL DEFAULT NULL COMMENT '化验结束时间',
  `order_date` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '化验日期',
  `order_maintainer` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `order_tel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系方式',
  `order_result` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '化验结果（0：合格；1：不合格）',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '化验单据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of biz_order
-- ----------------------------
INSERT INTO `biz_order` VALUES (1, 'H001', 'H00120191202', 1, 1, '2019-12-03 06:25:25', '2019-12-03 12:30:11', '2019-12-02', '于涛', '18745776666', '0', '2019-12-16 17:24:44', NULL, '2019-12-17 11:03:55', NULL);

-- ----------------------------
-- Table structure for biz_result_alter
-- ----------------------------
DROP TABLE IF EXISTS `biz_result_alter`;
CREATE TABLE `biz_result_alter`  (
  `alter_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '修改ID',
  `alter_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改编号',
  `report_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '化验结果唯一ID（用于修改溯源）',
  `alter_device` bigint(20) NULL DEFAULT NULL COMMENT '修改设备',
  `alter_works` bigint(20) NULL DEFAULT NULL COMMENT '修改水厂',
  `in_COD` float(10, 2) NULL DEFAULT NULL COMMENT '入水COD数值',
  `in_TP` float(10, 2) NULL DEFAULT NULL COMMENT '入水总磷（TP）数值',
  `in_TN` float(10, 2) NULL DEFAULT NULL COMMENT '入水总氮（TN）数值',
  `in_NH3` float(10, 2) NULL DEFAULT NULL COMMENT '入水氨氮（NH3）COD数值',
  `out_COD` float(10, 2) NULL DEFAULT NULL COMMENT '出水COD数值',
  `out_TP` float(10, 2) NULL DEFAULT NULL COMMENT '出水总磷（TP）数值',
  `out_TN` float(10, 2) NULL DEFAULT NULL COMMENT '出水总氮（TN）数值',
  `out_NH3` float(10, 2) NULL DEFAULT NULL COMMENT '出水氨氮（NH3）COD数值',
  `alter_date` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改日期',
  `alter_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`alter_id`) USING BTREE,
  INDEX `IDX_REPORT_ID`(`report_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '化验结果修改表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of biz_result_alter
-- ----------------------------
INSERT INTO `biz_result_alter` VALUES (3, 'H002', 'H00220191202', 1, 1, 24.00, 50.00, 46.00, 98.00, 11.00, 35.00, 21.00, 50.00, '2019-12-02', '2019-12-02 15:24:29', '2019-12-02 15:24:29', '1', NULL, NULL);
INSERT INTO `biz_result_alter` VALUES (8, 'H001', 'H00120191202', 1, 1, 16.02, 41.00, 40.00, 6.00, 4.00, 21.00, 30.00, 30.00, '2019-12-17', '2019-12-17 10:23:58', '2019-12-17 10:23:58', 'admin', NULL, NULL);

-- ----------------------------
-- Table structure for biz_scope
-- ----------------------------
DROP TABLE IF EXISTS `biz_scope`;
CREATE TABLE `biz_scope`  (
  `scope_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '化验范围ID',
  `report_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '化验结果唯一ID（用于修改溯源）',
  `scope_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '化验范围编号',
  `scope_device` bigint(20) NULL DEFAULT NULL COMMENT '化验范围设备',
  `in_COD_min` float(10, 2) NULL DEFAULT NULL COMMENT '入水COD最小值',
  `in_COD_max` float(10, 2) NULL DEFAULT NULL COMMENT '入水COD最大值',
  `in_TP_min` float(10, 2) NULL DEFAULT NULL COMMENT '入水总磷（TP）最小值',
  `in_TP_max` float(10, 2) NULL DEFAULT NULL COMMENT '入水总磷（TP）最大值',
  `in_TN_min` float(10, 2) NULL DEFAULT NULL COMMENT '入水总氮（TN）最小值',
  `in_NH3_min` float(10, 2) NULL DEFAULT NULL COMMENT '入水氨氮（NH3）最小值',
  `in_NH3_max` float(10, 2) NULL DEFAULT NULL COMMENT '入水氨氮（NH3）最大值',
  `in_TN_max` float(10, 2) NULL DEFAULT NULL COMMENT '入水总氮（TN）最大值',
  `out_COD_min` float(10, 2) NULL DEFAULT NULL COMMENT '出水COD最小值',
  `out_COD_max` float(10, 2) NULL DEFAULT NULL COMMENT '出水COD最大值',
  `out_TP_min` float(10, 2) NULL DEFAULT NULL COMMENT '出水总磷（TP）最小值',
  `out_TP_max` float(10, 2) NULL DEFAULT NULL COMMENT '出水总磷（TP）最大值',
  `out_TN_min` float(10, 2) NULL DEFAULT NULL COMMENT '出水总氮（TN）最小值',
  `out_NH3_min` float(10, 2) NULL DEFAULT NULL COMMENT '出水氨氮（NH3）最小值',
  `out_NH3_max` float(10, 2) NULL DEFAULT NULL COMMENT '出水氨氮（NH3）最大值',
  `out_TN_max` float(10, 2) NULL DEFAULT NULL COMMENT '出水总氮（TN）最大值',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`scope_id`) USING BTREE,
  INDEX `IDX_SCOPE_DEVICE`(`scope_device`) USING BTREE,
  INDEX `IDX_REPORT_ID`(`report_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '化验范围表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for biz_works
-- ----------------------------
DROP TABLE IF EXISTS `biz_works`;
CREATE TABLE `biz_works`  (
  `works_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '水厂ID',
  `works_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '水厂编号',
  `works_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '水厂名称',
  `works_province` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省',
  `works_city` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '市',
  `works_area` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区',
  `works_address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `works_count` int(20) NULL DEFAULT NULL COMMENT '设备数量',
  `works_type` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '水厂类型（0：集团水厂；1：区域中心；2：临时水厂）',
  `works_belong` bigint(20) NULL DEFAULT NULL COMMENT '水厂所属集团',
  `works_status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '水厂状态（0：使用；1：停用）',
  `works_maintainer` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '水厂联系人',
  `works_tel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`works_id`) USING BTREE,
  INDEX `IDX_WORKS_STATUS`(`works_status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '水厂表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of biz_works
-- ----------------------------
INSERT INTO `biz_works` VALUES (1, '001', '信义水厂', '230000', '230100', '230103', '信义水厂', 1, '0', 1, '0', '于涛', '18745776666', NULL, NULL, '2019-12-16 11:49:10', NULL);

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `blob_data` blob NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `calendar` blob NOT NULL,
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cron_expression` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `time_zone_id` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', '0/10 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', '0/20 * * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `entry_id` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fired_time` bigint(13) NOT NULL,
  `sched_time` bigint(13) NOT NULL,
  `priority` int(11) NOT NULL,
  `state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `job_class_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_durable` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_update_data` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_data` blob NULL,
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200094C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000A6D6574686F644E616D6571007E00094C000C6D6574686F64506172616D7371007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E078707400007070707400013174000E302F3130202A202A202A202A203F740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC897372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000174000672795461736B74000A72794E6F506172616D7374000074000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200094C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000A6D6574686F644E616D6571007E00094C000C6D6574686F64506172616D7371007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E078707400007070707400013174000E302F3230202A202A202A202A203F740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC897372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000274000672795461736B7400087279506172616D73740002727974000133740001317800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lock_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_checkin_time` bigint(13) NOT NULL,
  `checkin_interval` bigint(13) NOT NULL,
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RuoyiScheduler', 'VM_0_16_centos1577086759581', 1577090606934, 15000);

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `repeat_count` bigint(7) NOT NULL,
  `repeat_interval` bigint(12) NOT NULL,
  `times_triggered` bigint(10) NOT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `str_prop_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `str_prop_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `str_prop_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `int_prop_1` int(11) NULL DEFAULT NULL,
  `int_prop_2` int(11) NULL DEFAULT NULL,
  `long_prop_1` bigint(20) NULL DEFAULT NULL,
  `long_prop_2` bigint(20) NULL DEFAULT NULL,
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL,
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL,
  `bool_prop_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bool_prop_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `next_fire_time` bigint(13) NULL DEFAULT NULL,
  `prev_fire_time` bigint(13) NULL DEFAULT NULL,
  `priority` int(11) NULL DEFAULT NULL,
  `trigger_state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `start_time` bigint(13) NOT NULL,
  `end_time` bigint(13) NULL DEFAULT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `misfire_instr` smallint(2) NULL DEFAULT NULL,
  `job_data` blob NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 1577088890000, -1, 5, 'PAUSED', 'CRON', 1577088881000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 1577088900000, -1, 5, 'PAUSED', 'CRON', 1577088882000, 0, NULL, 2, '');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '初始化密码 123456');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '跃渊智能', 0, '于涛', '15888888888', 'xxx@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2019-12-17 15:25:54');
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '龙江环保', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2019-12-17 15:25:43');
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '哈尔滨临时水厂', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2019-12-17 15:25:54');
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '信义水厂', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2019-12-17 15:25:02');
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '文昌水厂', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2019-12-17 15:25:43');
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 103 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认是');
INSERT INTO `sys_dict_data` VALUES (11, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认否');
INSERT INTO `sys_dict_data` VALUES (12, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知');
INSERT INTO `sys_dict_data` VALUES (13, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '公告');
INSERT INTO `sys_dict_data` VALUES (14, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (15, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '关闭状态');
INSERT INTO `sys_dict_data` VALUES (16, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '新增操作');
INSERT INTO `sys_dict_data` VALUES (17, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '修改操作');
INSERT INTO `sys_dict_data` VALUES (18, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '删除操作');
INSERT INTO `sys_dict_data` VALUES (19, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '授权操作');
INSERT INTO `sys_dict_data` VALUES (20, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '导出操作');
INSERT INTO `sys_dict_data` VALUES (21, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '导入操作');
INSERT INTO `sys_dict_data` VALUES (22, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '强退操作');
INSERT INTO `sys_dict_data` VALUES (23, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '生成操作');
INSERT INTO `sys_dict_data` VALUES (24, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '清空操作');
INSERT INTO `sys_dict_data` VALUES (25, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (26, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES (100, 1, '集团水厂', '0', 'works_type', NULL, 'default', 'Y', '0', 'admin', '2019-12-16 10:38:31', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (101, 2, '区域中心', '1', 'works_type', NULL, 'default', 'Y', '0', 'admin', '2019-12-16 10:38:58', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (102, 3, '临时水厂', '2', 'works_type', NULL, 'default', 'Y', '0', 'admin', '2019-12-16 10:39:11', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '系统是否', 'sys_yes_no', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (6, '通知类型', 'sys_notice_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知状态', 'sys_notice_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (8, '操作类型', 'sys_oper_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (9, '系统状态', 'sys_common_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (100, '水厂类型', 'works_type', '0', 'admin', '2019-12-16 10:32:49', 'admin', '2019-12-16 10:33:01', '水厂类型列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '任务组名',
  `method_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '任务方法',
  `method_params` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '方法参数',
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, 'ryTask', '系统默认（无参）', 'ryNoParams', '', '0/10 * * * * ?', '3', '1', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_job` VALUES (2, 'ryTask', '系统默认（有参）', 'ryParams', 'ry', '0/20 * * * * ?', '3', '1', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `method_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务方法',
  `method_params` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '方法参数',
  `job_message` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 226 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-11-28 09:55:49');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-11-28 09:56:02');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-11-28 10:37:25');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-11-28 10:39:52');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-11-28 10:41:57');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-11-28 10:45:27');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-11-28 10:48:52');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-11-28 11:13:11');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-11-28 11:15:28');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-11-28 11:16:01');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-11-28 11:17:01');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-11-28 11:18:37');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-11-28 11:19:36');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-11-28 11:23:46');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-11-28 11:33:03');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-11-28 11:38:18');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-11-28 11:39:50');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-11-28 11:41:25');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-11-28 11:42:37');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-11-28 11:47:45');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-11-29 14:28:37');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-11-29 14:32:35');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-11-29 14:34:05');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-11-29 15:26:51');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-11-29 15:58:39');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-11-29 16:10:46');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-11-29 16:46:02');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-11-29 17:07:21');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-02 09:17:03');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-02 10:26:19');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-02 13:38:29');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-02 15:08:41');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-02 15:16:11');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-02 15:20:05');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-02 15:32:08');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-02 16:00:55');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-02 16:11:23');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-02 16:42:19');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-13 10:52:48');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-13 11:47:44');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-13 13:34:01');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-13 13:56:46');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-13 15:45:37');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-13 15:48:56');
INSERT INTO `sys_logininfor` VALUES (144, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-13 16:43:10');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-14 09:26:53');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-14 10:15:47');
INSERT INTO `sys_logininfor` VALUES (147, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-14 11:28:45');
INSERT INTO `sys_logininfor` VALUES (148, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-14 11:49:43');
INSERT INTO `sys_logininfor` VALUES (149, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-14 12:55:44');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-14 13:08:54');
INSERT INTO `sys_logininfor` VALUES (151, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-14 14:13:24');
INSERT INTO `sys_logininfor` VALUES (152, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-14 15:27:48');
INSERT INTO `sys_logininfor` VALUES (153, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-14 15:46:51');
INSERT INTO `sys_logininfor` VALUES (154, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-14 16:08:55');
INSERT INTO `sys_logininfor` VALUES (155, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-14 16:16:24');
INSERT INTO `sys_logininfor` VALUES (156, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-16 08:48:04');
INSERT INTO `sys_logininfor` VALUES (157, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-16 09:06:24');
INSERT INTO `sys_logininfor` VALUES (158, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-16 09:48:06');
INSERT INTO `sys_logininfor` VALUES (159, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-16 11:22:46');
INSERT INTO `sys_logininfor` VALUES (160, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-16 11:35:38');
INSERT INTO `sys_logininfor` VALUES (161, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-16 13:33:04');
INSERT INTO `sys_logininfor` VALUES (162, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-16 13:49:16');
INSERT INTO `sys_logininfor` VALUES (163, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-16 14:03:52');
INSERT INTO `sys_logininfor` VALUES (164, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-16 14:28:25');
INSERT INTO `sys_logininfor` VALUES (165, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-16 14:42:34');
INSERT INTO `sys_logininfor` VALUES (166, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-16 15:29:29');
INSERT INTO `sys_logininfor` VALUES (167, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-16 15:34:09');
INSERT INTO `sys_logininfor` VALUES (168, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-16 16:12:12');
INSERT INTO `sys_logininfor` VALUES (169, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-16 16:29:46');
INSERT INTO `sys_logininfor` VALUES (170, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-16 17:23:12');
INSERT INTO `sys_logininfor` VALUES (171, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-16 17:50:06');
INSERT INTO `sys_logininfor` VALUES (172, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-17 09:08:20');
INSERT INTO `sys_logininfor` VALUES (173, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-17 09:52:07');
INSERT INTO `sys_logininfor` VALUES (174, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-17 09:53:48');
INSERT INTO `sys_logininfor` VALUES (175, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-17 09:56:05');
INSERT INTO `sys_logininfor` VALUES (176, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-17 10:04:11');
INSERT INTO `sys_logininfor` VALUES (177, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-17 10:12:08');
INSERT INTO `sys_logininfor` VALUES (178, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-17 10:17:18');
INSERT INTO `sys_logininfor` VALUES (179, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-17 10:23:04');
INSERT INTO `sys_logininfor` VALUES (180, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-17 11:44:18');
INSERT INTO `sys_logininfor` VALUES (181, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-17 13:30:56');
INSERT INTO `sys_logininfor` VALUES (182, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-17 13:53:09');
INSERT INTO `sys_logininfor` VALUES (183, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-12-17 14:03:48');
INSERT INTO `sys_logininfor` VALUES (184, 'yutao', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-17 14:03:52');
INSERT INTO `sys_logininfor` VALUES (185, 'yutao', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-12-17 14:16:24');
INSERT INTO `sys_logininfor` VALUES (186, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-17 14:16:25');
INSERT INTO `sys_logininfor` VALUES (187, 'admin', '127.0.0.1', '内网IP', 'Internet Explorer 11', 'Windows 7', '0', '登录成功', '2019-12-17 14:18:27');
INSERT INTO `sys_logininfor` VALUES (188, 'admin', '127.0.0.1', '内网IP', 'Internet Explorer 11', 'Windows 7', '0', '退出成功', '2019-12-17 14:18:55');
INSERT INTO `sys_logininfor` VALUES (189, 'admin', '127.0.0.1', '内网IP', 'Internet Explorer 11', 'Windows 7', '0', '登录成功', '2019-12-17 14:18:56');
INSERT INTO `sys_logininfor` VALUES (190, 'admin', '127.0.0.1', '内网IP', 'Chrome 49', 'Windows 7', '0', '登录成功', '2019-12-17 14:25:54');
INSERT INTO `sys_logininfor` VALUES (191, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-12-17 14:42:02');
INSERT INTO `sys_logininfor` VALUES (192, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-17 14:43:15');
INSERT INTO `sys_logininfor` VALUES (193, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-12-17 14:43:20');
INSERT INTO `sys_logininfor` VALUES (194, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-17 14:51:06');
INSERT INTO `sys_logininfor` VALUES (195, 'admin', '10.23.99.95', '内网IP', 'Mobile Safari', 'Android Mobile', '0', '登录成功', '2019-12-17 15:07:40');
INSERT INTO `sys_logininfor` VALUES (196, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-12-17 15:11:00');
INSERT INTO `sys_logininfor` VALUES (197, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-17 15:15:04');
INSERT INTO `sys_logininfor` VALUES (198, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-17 16:01:11');
INSERT INTO `sys_logininfor` VALUES (199, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-18 08:42:44');
INSERT INTO `sys_logininfor` VALUES (200, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-18 10:36:11');
INSERT INTO `sys_logininfor` VALUES (201, 'admin', '113.0.28.155', '黑龙江 哈尔滨', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-18 12:06:51');
INSERT INTO `sys_logininfor` VALUES (202, 'admin', '113.0.28.155', 'XX XX', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-18 17:59:56');
INSERT INTO `sys_logininfor` VALUES (203, 'admin', '113.0.28.155', '黑龙江 哈尔滨', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-18 18:00:45');
INSERT INTO `sys_logininfor` VALUES (204, 'admin', '113.0.28.155', 'XX XX', 'Chrome', 'Windows 7', '0', '退出成功', '2019-12-18 18:01:16');
INSERT INTO `sys_logininfor` VALUES (205, 'admin', '113.0.28.155', '黑龙江 哈尔滨', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-19 09:03:57');
INSERT INTO `sys_logininfor` VALUES (206, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-19 09:30:34');
INSERT INTO `sys_logininfor` VALUES (207, 'admin', '219.217.246.19', '黑龙江 哈尔滨', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-21 16:09:48');
INSERT INTO `sys_logininfor` VALUES (208, 'admin', '219.217.246.243', 'XX XX', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-23 09:52:34');
INSERT INTO `sys_logininfor` VALUES (209, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-23 11:34:35');
INSERT INTO `sys_logininfor` VALUES (210, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-23 11:43:19');
INSERT INTO `sys_logininfor` VALUES (211, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-23 11:59:41');
INSERT INTO `sys_logininfor` VALUES (212, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-23 12:02:18');
INSERT INTO `sys_logininfor` VALUES (213, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-23 14:08:43');
INSERT INTO `sys_logininfor` VALUES (214, 'admin', '219.217.246.243', 'XX XX', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-23 14:35:47');
INSERT INTO `sys_logininfor` VALUES (215, 'admin', '219.217.246.243', 'XX XX', 'Chrome', 'Windows 7', '0', '退出成功', '2019-12-23 14:42:22');
INSERT INTO `sys_logininfor` VALUES (216, 'admin', '219.217.246.243', 'XX XX', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-23 14:42:24');
INSERT INTO `sys_logininfor` VALUES (217, 'admin', '219.217.246.243', '黑龙江 哈尔滨', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-23 14:44:22');
INSERT INTO `sys_logininfor` VALUES (218, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-23 15:05:51');
INSERT INTO `sys_logininfor` VALUES (219, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-23 15:09:48');
INSERT INTO `sys_logininfor` VALUES (220, 'admin', '219.217.246.243', '黑龙江 哈尔滨', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-23 15:18:54');
INSERT INTO `sys_logininfor` VALUES (221, 'admin', '219.217.246.243', 'XX XX', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-23 15:32:56');
INSERT INTO `sys_logininfor` VALUES (222, 'admin', '219.217.246.243', 'XX XX', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-23 15:33:27');
INSERT INTO `sys_logininfor` VALUES (223, 'admin', '219.217.246.243', 'XX XX', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-23 15:39:34');
INSERT INTO `sys_logininfor` VALUES (224, 'admin', '219.217.246.243', 'XX XX', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-23 15:41:27');
INSERT INTO `sys_logininfor` VALUES (225, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-23 16:17:01');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '请求地址',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2051 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, '#', 'M', '0', '', 'fa fa-gear', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 3, '#', 'M', '0', '', 'fa fa-video-camera', 'admin', '2018-03-16 11:33:00', 'admin', '2019-12-02 16:03:56', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 4, '#', 'M', '0', '', 'fa fa-bars', 'admin', '2018-03-16 11:33:00', 'admin', '2019-12-02 16:04:01', '系统工具目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, '/system/user', 'C', '0', 'system:user:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, '/system/role', 'C', '0', 'system:role:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, '/system/menu', 'C', '0', 'system:menu:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, '/system/dept', 'C', '0', 'system:dept:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '部门管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, '/system/dict', 'C', '0', 'system:dict:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 8, '/system/config', 'C', '0', 'system:config:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2019-12-16 09:50:01', '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 9, '/system/notice', 'C', '0', 'system:notice:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2019-12-16 09:50:16', '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 10, '#', 'M', '0', '', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2019-12-16 09:50:24', '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, '/monitor/online', 'C', '0', 'monitor:online:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, '/monitor/job', 'C', '0', 'monitor:job:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, '/monitor/data', 'C', '0', 'monitor:data:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 3, '/monitor/server', 'C', '0', 'monitor:server:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '表单构建', 3, 1, '/tool/build', 'C', '0', 'tool:build:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '表单构建菜单');
INSERT INTO `sys_menu` VALUES (114, '代码生成', 3, 2, '/tool/gen', 'C', '0', 'tool:gen:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '代码生成菜单');
INSERT INTO `sys_menu` VALUES (115, '系统接口', 3, 3, '/tool/swagger', 'C', '0', 'tool:swagger:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, '/monitor/operlog', 'C', '0', 'monitor:operlog:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, '/monitor/logininfor', 'C', '0', 'monitor:logininfor:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '#', 'F', '0', 'system:user:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '#', 'F', '0', 'system:user:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '#', 'F', '0', 'system:user:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '#', 'F', '0', 'system:user:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '#', 'F', '0', 'system:user:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '#', 'F', '0', 'system:user:import', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '#', 'F', '0', 'system:user:resetPwd', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '#', 'F', '0', 'system:role:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '#', 'F', '0', 'system:role:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '#', 'F', '0', 'system:role:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '#', 'F', '0', 'system:role:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '#', 'F', '0', 'system:role:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '#', 'F', '0', 'system:menu:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '#', 'F', '0', 'system:menu:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '#', 'F', '0', 'system:menu:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '#', 'F', '0', 'system:menu:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '#', 'F', '0', 'system:dept:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '#', 'F', '0', 'system:dept:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '#', 'F', '0', 'system:dept:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '#', 'F', '0', 'system:dept:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', 'F', '0', 'system:dict:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', 'F', '0', 'system:dict:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', 'F', '0', 'system:dict:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', 'F', '0', 'system:dict:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', 'F', '0', 'system:dict:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', 'F', '0', 'system:config:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', 'F', '0', 'system:config:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', 'F', '0', 'system:config:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', 'F', '0', 'system:config:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', 'F', '0', 'system:config:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', 'F', '0', 'system:notice:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', 'F', '0', 'system:notice:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', 'F', '0', 'system:notice:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', 'F', '0', 'system:notice:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', 'F', '0', 'monitor:operlog:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', 'F', '0', 'monitor:operlog:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1041, '详细信息', 500, 3, '#', 'F', '0', 'monitor:operlog:detail', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', 'F', '0', 'monitor:operlog:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', 'F', '0', 'monitor:logininfor:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', 'F', '0', 'monitor:logininfor:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', 'F', '0', 'monitor:logininfor:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', 'F', '0', 'monitor:online:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', 'F', '0', 'monitor:online:batchForceLogout', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', 'F', '0', 'monitor:online:forceLogout', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', 'F', '0', 'monitor:job:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', 'F', '0', 'monitor:job:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', 'F', '0', 'monitor:job:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', 'F', '0', 'monitor:job:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', 'F', '0', 'monitor:job:changeStatus', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1054, '任务详细', 110, 6, '#', 'F', '0', 'monitor:job:detail', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1055, '任务导出', 110, 7, '#', 'F', '0', 'monitor:job:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1056, '生成查询', 114, 1, '#', 'F', '0', 'tool:gen:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1057, '生成代码', 114, 2, '#', 'F', '0', 'tool:gen:code', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (2000, '化验信息', 2020, 5, '/system/bizAssayResult', 'C', '0', 'system:bizAssayResult:view', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2019-12-16 17:23:37', '化验结果菜单');
INSERT INTO `sys_menu` VALUES (2001, '化验结果查询', 2000, 1, '#', 'F', '0', 'system:bizAssayResult:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2002, '化验结果新增', 2000, 2, '#', 'F', '0', 'system:bizAssayResult:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2003, '化验结果修改', 2000, 3, '#', 'F', '0', 'system:bizAssayResult:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2004, '化验结果删除', 2000, 4, '#', 'F', '0', 'system:bizAssayResult:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2005, '化验修改记录', 2020, 10, '/system/bizResultAlter', 'C', '0', 'system:bizResultAlter:view', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2019-12-02 16:04:21', '化验结果修改菜单');
INSERT INTO `sys_menu` VALUES (2006, '化验结果修改查询', 2005, 1, '#', 'F', '0', 'system:bizResultAlter:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2007, '化验结果修改新增', 2005, 2, '#', 'F', '0', 'system:bizResultAlter:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2008, '化验结果修改修改', 2005, 3, '#', 'F', '0', 'system:bizResultAlter:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2009, '化验结果修改删除', 2005, 4, '#', 'F', '0', 'system:bizResultAlter:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2010, '设备信息', 2020, 20, '/system/bizDevice', 'C', '0', 'system:bizDevice:view', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2019-12-02 16:50:07', '设备菜单');
INSERT INTO `sys_menu` VALUES (2011, '设备查询', 2010, 1, '#', 'F', '0', 'system:bizDevice:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2012, '设备新增', 2010, 2, '#', 'F', '0', 'system:bizDevice:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2013, '设备修改', 2010, 3, '#', 'F', '0', 'system:bizDevice:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2014, '设备删除', 2010, 4, '#', 'F', '0', 'system:bizDevice:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2015, '水厂信息', 2020, 30, '/system/bizWorks', 'C', '0', 'system:bizWorks:view', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2019-12-02 16:50:26', '水厂菜单');
INSERT INTO `sys_menu` VALUES (2016, '水厂查询', 2015, 1, '#', 'F', '0', 'system:bizWorks:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2017, '水厂新增', 2015, 2, '#', 'F', '0', 'system:bizWorks:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2018, '水厂修改', 2015, 3, '#', 'F', '0', 'system:bizWorks:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2019, '水厂删除', 2015, 4, '#', 'F', '0', 'system:bizWorks:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2020, '基础信息', 0, 2, '#', 'M', '0', '', 'fa fa-bars', 'admin', '2019-12-02 16:03:06', 'admin', '2019-12-02 16:03:50', '');
INSERT INTO `sys_menu` VALUES (2021, '设备部件信息', 2020, 21, '/system/bizDeviceUnit', 'C', '0', 'system:bizDeviceUnit:view', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2019-12-02 16:50:16', '设备部件菜单');
INSERT INTO `sys_menu` VALUES (2022, '设备部件查询', 2021, 1, '#', 'F', '0', 'system:bizDeviceUnit:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2023, '设备部件新增', 2021, 2, '#', 'F', '0', 'system:bizDeviceUnit:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2024, '设备部件修改', 2021, 3, '#', 'F', '0', 'system:bizDeviceUnit:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2025, '设备部件删除', 2021, 4, '#', 'F', '0', 'system:bizDeviceUnit:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2026, '药剂信息', 2020, 40, '/system/bizAgentia', 'C', '0', 'system:bizAgentia:view', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2019-12-02 16:50:35', '药剂菜单');
INSERT INTO `sys_menu` VALUES (2027, '药剂查询', 2026, 1, '#', 'F', '0', 'system:bizAgentia:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2028, '药剂新增', 2026, 2, '#', 'F', '0', 'system:bizAgentia:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2029, '药剂修改', 2026, 3, '#', 'F', '0', 'system:bizAgentia:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2030, '药剂删除', 2026, 4, '#', 'F', '0', 'system:bizAgentia:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2031, '告警信息', 2020, 50, '/system/bizAlert', 'C', '0', 'system:bizAlert:view', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2019-12-16 09:48:54', '告警菜单');
INSERT INTO `sys_menu` VALUES (2032, '告警查询', 2031, 1, '#', 'F', '0', 'system:bizAlert:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2033, '告警新增', 2031, 2, '#', 'F', '0', 'system:bizAlert:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2034, '告警修改', 2031, 3, '#', 'F', '0', 'system:bizAlert:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2035, '告警删除', 2031, 4, '#', 'F', '0', 'system:bizAlert:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2036, '地区管理', 1, 7, '/system/region', 'C', '0', 'system:region:view', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2019-12-16 09:49:42', '地区（省市区）菜单');
INSERT INTO `sys_menu` VALUES (2037, '地区（省市区）查询', 2036, 1, '#', 'F', '0', 'system:region:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2038, '地区（省市区）新增', 2036, 2, '#', 'F', '0', 'system:region:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2039, '地区（省市区）修改', 2036, 3, '#', 'F', '0', 'system:region:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2040, '地区（省市区）删除', 2036, 4, '#', 'F', '0', 'system:region:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2041, '化验单据', 2020, 1, '/system/bizOrder', 'C', '0', 'system:bizOrder:view', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2019-12-16 17:23:50', '化验单据菜单');
INSERT INTO `sys_menu` VALUES (2042, '化验单据查询', 2041, 1, '#', 'F', '0', 'system:bizOrder:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2043, '化验单据新增', 2041, 2, '#', 'F', '0', 'system:bizOrder:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2044, '化验单据修改', 2041, 3, '#', 'F', '0', 'system:bizOrder:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2045, '化验单据删除', 2041, 4, '#', 'F', '0', 'system:bizOrder:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2046, '设备维护', 2020, 60, '/system/bizDeviceMaintain', 'C', '0', 'system:bizDeviceMaintain:view', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2019-12-16 17:50:28', '设备维护菜单');
INSERT INTO `sys_menu` VALUES (2047, '设备维护查询', 2046, 1, '#', 'F', '0', 'system:bizDeviceMaintain:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2048, '设备维护新增', 2046, 2, '#', 'F', '0', 'system:bizDeviceMaintain:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2049, '设备维护修改', 2046, 3, '#', 'F', '0', 'system:bizDeviceMaintain:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2050, '设备维护删除', 2046, 4, '#', 'F', '0', 'system:bizDeviceMaintain:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', '新版本内容', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', '维护内容', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `operator_type` int(1) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `status` int(1) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 256 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.genCode()', 1, 'admin', '研发部门', '/tool/gen/genCode/biz_assay_result', '127.0.0.1', '内网IP', '{ }', 0, NULL, '2019-11-29 16:04:24');
INSERT INTO `sys_oper_log` VALUES (101, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"2000\" ],\r\n  \"parentId\" : [ \"1\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"化验结果\" ],\r\n  \"url\" : [ \"/system/bizAssayResult\" ],\r\n  \"perms\" : [ \"system:bizAssayResult:view\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"#\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', 0, NULL, '2019-11-29 16:11:39');
INSERT INTO `sys_oper_log` VALUES (102, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.genCode()', 1, 'admin', '研发部门', '/tool/gen/genCode/biz_assay_result', '127.0.0.1', '内网IP', '{ }', 0, NULL, '2019-11-29 17:05:48');
INSERT INTO `sys_oper_log` VALUES (103, '化验结果', 1, 'com.ruoyi.web.controller.system.BizAssayResultController.addSave()', 1, 'admin', '研发部门', '/system/bizAssayResult/add', '127.0.0.1', '内网IP', '{\r\n  \"resultNo\" : [ \"H001\" ],\r\n  \"reportId\" : [ \"H00120191202\" ],\r\n  \"resultDevice\" : [ \"1\" ],\r\n  \"resultWorks\" : [ \"1\" ],\r\n  \"resultType\" : [ \"1\" ],\r\n  \"assayDate\" : [ \"2019-12-02 06:15:05\" ],\r\n  \"beginTime\" : [ \"2019-12-02 06:20:05\" ],\r\n  \"endTime\" : [ \"2019-12-02 12:30:11\" ],\r\n  \"methodId\" : [ \"1\" ],\r\n  \"parameterId\" : [ \"1\" ],\r\n  \"curveId\" : [ \"1\" ],\r\n  \"inCod\" : [ \"12\" ],\r\n  \"inTp\" : [ \"40\" ],\r\n  \"inTn\" : [ \"43\" ],\r\n  \"inNh3\" : [ \"96\" ],\r\n  \"outCod\" : [ \"4\" ],\r\n  \"outTp\" : [ \"21\" ],\r\n  \"outTn\" : [ \"30\" ],\r\n  \"outNh3\" : [ \"65\" ],\r\n  \"resultStatus\" : [ \"0\" ],\r\n  \"resultAlert\" : [ \"0\" ],\r\n  \"createTime\" : [ \"2019-12-02 12:40:06\" ],\r\n  \"createBy\" : [ \"1\" ],\r\n  \"updateTime\" : [ \"2019-12-02 12:40:06\" ],\r\n  \"updateBy\" : [ \"1\" ]\r\n}', 0, NULL, '2019-12-02 09:43:38');
INSERT INTO `sys_oper_log` VALUES (104, '化验结果', 2, 'com.ruoyi.web.controller.system.BizAssayResultController.editSave()', 1, 'admin', '研发部门', '/system/bizAssayResult/edit', '127.0.0.1', '内网IP', '{\r\n  \"resultId\" : [ \"1\" ],\r\n  \"resultNo\" : [ \"H001\" ],\r\n  \"reportId\" : [ \"H00120191202\" ],\r\n  \"resultDevice\" : [ \"1\" ],\r\n  \"resultWorks\" : [ \"1\" ],\r\n  \"resultType\" : [ \"1\" ],\r\n  \"assayDate\" : [ \"2019-12-02\" ],\r\n  \"beginTime\" : [ \"Mon Dec 02 06:20:05 CST 2019\" ],\r\n  \"endTime\" : [ \"Mon Dec 02 12:30:11 CST 2019\" ],\r\n  \"methodId\" : [ \"1\" ],\r\n  \"parameterId\" : [ \"1\" ],\r\n  \"curveId\" : [ \"1\" ],\r\n  \"inCod\" : [ \"12.0\" ],\r\n  \"inTp\" : [ \"40.0\" ],\r\n  \"inTn\" : [ \"43.0\" ],\r\n  \"inNh3\" : [ \"96.0\" ],\r\n  \"outCod\" : [ \"4.0\" ],\r\n  \"outTp\" : [ \"21.0\" ],\r\n  \"outTn\" : [ \"30.0\" ],\r\n  \"outNh3\" : [ \"65.0\" ],\r\n  \"resultStatus\" : [ \"0\" ],\r\n  \"resultAlert\" : [ \"0\" ],\r\n  \"createTime\" : [ \"Mon Dec 02 12:40:06 CST 2019\" ],\r\n  \"createBy\" : [ \"1\" ],\r\n  \"updateTime\" : [ \"Mon Dec 02 12:40:06 CST 2019\" ],\r\n  \"updateBy\" : [ \"1\" ]\r\n}', 0, NULL, '2019-12-02 09:51:56');
INSERT INTO `sys_oper_log` VALUES (105, '化验结果', 2, 'com.ruoyi.web.controller.system.BizAssayResultController.editSave()', 1, 'admin', '研发部门', '/system/bizAssayResult/edit', '127.0.0.1', '内网IP', '{\r\n  \"resultId\" : [ \"1\" ],\r\n  \"inCod\" : [ \"15.0\" ],\r\n  \"inTp\" : [ \"40.0\" ],\r\n  \"inTn\" : [ \"43.0\" ],\r\n  \"inNh3\" : [ \"96.0\" ],\r\n  \"outCod\" : [ \"4.0\" ],\r\n  \"outTp\" : [ \"21.0\" ],\r\n  \"outTn\" : [ \"30.0\" ],\r\n  \"outNh3\" : [ \"65.0\" ]\r\n}', 0, NULL, '2019-12-02 14:41:50');
INSERT INTO `sys_oper_log` VALUES (106, '化验结果', 2, 'com.ruoyi.web.controller.system.BizAssayResultController.editSave()', 1, 'admin', '研发部门', '/system/bizAssayResult/edit', '127.0.0.1', '内网IP', '{\r\n  \"resultId\" : [ \"1\" ],\r\n  \"inCod\" : [ \"15.00001\" ],\r\n  \"inTp\" : [ \"40.0\" ],\r\n  \"inTn\" : [ \"43.0\" ],\r\n  \"inNh3\" : [ \"96.0\" ],\r\n  \"outCod\" : [ \"4.0\" ],\r\n  \"outTp\" : [ \"21.0\" ],\r\n  \"outTn\" : [ \"30.0\" ],\r\n  \"outNh3\" : [ \"65.0\" ]\r\n}', 0, NULL, '2019-12-02 14:42:08');
INSERT INTO `sys_oper_log` VALUES (107, '化验结果', 2, 'com.ruoyi.web.controller.system.BizAssayResultController.editSave()', 1, 'admin', '研发部门', '/system/bizAssayResult/edit', '127.0.0.1', '内网IP', '{\r\n  \"resultId\" : [ \"1\" ],\r\n  \"inCod\" : [ \"15.02\" ],\r\n  \"inTp\" : [ \"40.0\" ],\r\n  \"inTn\" : [ \"43.0\" ],\r\n  \"inNh3\" : [ \"96.0\" ],\r\n  \"outCod\" : [ \"4.0\" ],\r\n  \"outTp\" : [ \"21.0\" ],\r\n  \"outTn\" : [ \"30.0\" ],\r\n  \"outNh3\" : [ \"65.0\" ]\r\n}', 0, NULL, '2019-12-02 14:45:55');
INSERT INTO `sys_oper_log` VALUES (108, '化验结果', 2, 'com.ruoyi.web.controller.system.BizAssayResultController.editSave()', 1, 'admin', '研发部门', '/system/bizAssayResult/edit', '127.0.0.1', '内网IP', '{\r\n  \"resultId\" : [ \"1\" ],\r\n  \"inCod\" : [ \"15.02222\" ],\r\n  \"inTp\" : [ \"40.0\" ],\r\n  \"inTn\" : [ \"43.0\" ],\r\n  \"inNh3\" : [ \"96.0\" ],\r\n  \"outCod\" : [ \"4.0\" ],\r\n  \"outTp\" : [ \"21.0\" ],\r\n  \"outTn\" : [ \"30.0\" ],\r\n  \"outNh3\" : [ \"65.0\" ]\r\n}', 0, NULL, '2019-12-02 14:46:05');
INSERT INTO `sys_oper_log` VALUES (109, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.genCode()', 1, 'admin', '研发部门', '/tool/gen/genCode/biz_result_alter', '127.0.0.1', '内网IP', '{ }', 0, NULL, '2019-12-02 14:55:34');
INSERT INTO `sys_oper_log` VALUES (110, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"2005\" ],\r\n  \"parentId\" : [ \"1\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"化验修改记录\" ],\r\n  \"url\" : [ \"/system/bizResultAlter\" ],\r\n  \"perms\" : [ \"system:bizResultAlter:view\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"#\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', 0, NULL, '2019-12-02 15:09:08');
INSERT INTO `sys_oper_log` VALUES (111, '化验结果', 2, 'com.ruoyi.web.controller.system.BizAssayResultController.editSave()', 1, 'admin', '研发部门', '/system/bizAssayResult/edit', '127.0.0.1', '内网IP', '{\r\n  \"resultId\" : [ \"1\" ],\r\n  \"reportId\" : [ \"H00120191202\" ],\r\n  \"inCod\" : [ \"16.02\" ],\r\n  \"inTp\" : [ \"40.0\" ],\r\n  \"inTn\" : [ \"43.0\" ],\r\n  \"inNh3\" : [ \"96.0\" ],\r\n  \"outCod\" : [ \"4.0\" ],\r\n  \"outTp\" : [ \"21.0\" ],\r\n  \"outTn\" : [ \"30.0\" ],\r\n  \"outNh3\" : [ \"65.0\" ]\r\n}', 0, NULL, '2019-12-02 15:16:56');
INSERT INTO `sys_oper_log` VALUES (112, '化验结果', 2, 'com.ruoyi.web.controller.system.BizAssayResultController.editSave()', 1, 'admin', '研发部门', '/system/bizAssayResult/edit', '127.0.0.1', '内网IP', '{\r\n  \"resultId\" : [ \"2\" ],\r\n  \"reportId\" : [ \"H00220191202\" ],\r\n  \"inCod\" : [ \"22.0\" ],\r\n  \"inTp\" : [ \"50.0\" ],\r\n  \"inTn\" : [ \"46.0\" ],\r\n  \"inNh3\" : [ \"98.0\" ],\r\n  \"outCod\" : [ \"11.0\" ],\r\n  \"outTp\" : [ \"35.0\" ],\r\n  \"outTn\" : [ \"21.0\" ],\r\n  \"outNh3\" : [ \"50.0\" ]\r\n}', 0, NULL, '2019-12-02 15:20:16');
INSERT INTO `sys_oper_log` VALUES (113, '化验结果', 2, 'com.ruoyi.web.controller.system.BizAssayResultController.editSave()', 1, 'admin', '研发部门', '/system/bizAssayResult/edit', '127.0.0.1', '内网IP', '{\r\n  \"resultId\" : [ \"2\" ],\r\n  \"reportId\" : [ \"H00220191202\" ],\r\n  \"resultNo\" : [ \"H002\" ],\r\n  \"inCod\" : [ \"24.0\" ],\r\n  \"inTp\" : [ \"50.0\" ],\r\n  \"inTn\" : [ \"46.0\" ],\r\n  \"inNh3\" : [ \"98.0\" ],\r\n  \"outCod\" : [ \"11.0\" ],\r\n  \"outTp\" : [ \"35.0\" ],\r\n  \"outTn\" : [ \"21.0\" ],\r\n  \"outNh3\" : [ \"50.0\" ]\r\n}', 0, NULL, '2019-12-02 15:23:33');
INSERT INTO `sys_oper_log` VALUES (114, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.genCode()', 1, 'admin', '研发部门', '/tool/gen/genCode/biz_device', '127.0.0.1', '内网IP', '{ }', 0, NULL, '2019-12-02 15:28:44');
INSERT INTO `sys_oper_log` VALUES (115, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.genCode()', 1, 'admin', '研发部门', '/tool/gen/genCode/biz_works', '127.0.0.1', '内网IP', '{ }', 0, NULL, '2019-12-02 15:32:49');
INSERT INTO `sys_oper_log` VALUES (116, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"0\" ],\r\n  \"menuType\" : [ \"M\" ],\r\n  \"menuName\" : [ \"基础信息\" ],\r\n  \"url\" : [ \"\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"2\" ],\r\n  \"icon\" : [ \"fa fa-bars\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', 0, NULL, '2019-12-02 16:03:06');
INSERT INTO `sys_oper_log` VALUES (117, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"2020\" ],\r\n  \"parentId\" : [ \"0\" ],\r\n  \"menuType\" : [ \"M\" ],\r\n  \"menuName\" : [ \"基础信息\" ],\r\n  \"url\" : [ \"#\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"3\" ],\r\n  \"icon\" : [ \"fa fa-bars\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', 0, NULL, '2019-12-02 16:03:11');
INSERT INTO `sys_oper_log` VALUES (118, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"2020\" ],\r\n  \"parentId\" : [ \"0\" ],\r\n  \"menuType\" : [ \"M\" ],\r\n  \"menuName\" : [ \"基础信息\" ],\r\n  \"url\" : [ \"#\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"4\" ],\r\n  \"icon\" : [ \"fa fa-bars\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', 0, NULL, '2019-12-02 16:03:16');
INSERT INTO `sys_oper_log` VALUES (119, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"2000\" ],\r\n  \"parentId\" : [ \"2020\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"化验结果\" ],\r\n  \"url\" : [ \"/system/bizAssayResult\" ],\r\n  \"perms\" : [ \"system:bizAssayResult:view\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"#\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', 0, NULL, '2019-12-02 16:03:41');
INSERT INTO `sys_oper_log` VALUES (120, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"2020\" ],\r\n  \"parentId\" : [ \"0\" ],\r\n  \"menuType\" : [ \"M\" ],\r\n  \"menuName\" : [ \"基础信息\" ],\r\n  \"url\" : [ \"#\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"2\" ],\r\n  \"icon\" : [ \"fa fa-bars\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', 0, NULL, '2019-12-02 16:03:50');
INSERT INTO `sys_oper_log` VALUES (121, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"2\" ],\r\n  \"parentId\" : [ \"0\" ],\r\n  \"menuType\" : [ \"M\" ],\r\n  \"menuName\" : [ \"系统监控\" ],\r\n  \"url\" : [ \"#\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"3\" ],\r\n  \"icon\" : [ \"fa fa-video-camera\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', 0, NULL, '2019-12-02 16:03:56');
INSERT INTO `sys_oper_log` VALUES (122, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"3\" ],\r\n  \"parentId\" : [ \"0\" ],\r\n  \"menuType\" : [ \"M\" ],\r\n  \"menuName\" : [ \"系统工具\" ],\r\n  \"url\" : [ \"#\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"4\" ],\r\n  \"icon\" : [ \"fa fa-bars\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', 0, NULL, '2019-12-02 16:04:01');
INSERT INTO `sys_oper_log` VALUES (123, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"2005\" ],\r\n  \"parentId\" : [ \"2020\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"化验修改记录\" ],\r\n  \"url\" : [ \"/system/bizResultAlter\" ],\r\n  \"perms\" : [ \"system:bizResultAlter:view\" ],\r\n  \"orderNum\" : [ \"10\" ],\r\n  \"icon\" : [ \"#\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', 0, NULL, '2019-12-02 16:04:21');
INSERT INTO `sys_oper_log` VALUES (124, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"2010\" ],\r\n  \"parentId\" : [ \"2020\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"设备管理\" ],\r\n  \"url\" : [ \"/system/bizDevice\" ],\r\n  \"perms\" : [ \"system:bizDevice:view\" ],\r\n  \"orderNum\" : [ \"20\" ],\r\n  \"icon\" : [ \"#\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', 0, NULL, '2019-12-02 16:04:40');
INSERT INTO `sys_oper_log` VALUES (125, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"2015\" ],\r\n  \"parentId\" : [ \"2020\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"水厂管理\" ],\r\n  \"url\" : [ \"/system/bizWorks\" ],\r\n  \"perms\" : [ \"system:bizWorks:view\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"#\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', 0, NULL, '2019-12-02 16:04:56');
INSERT INTO `sys_oper_log` VALUES (126, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"2015\" ],\r\n  \"parentId\" : [ \"2020\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"水厂管理\" ],\r\n  \"url\" : [ \"/system/bizWorks\" ],\r\n  \"perms\" : [ \"system:bizWorks:view\" ],\r\n  \"orderNum\" : [ \"30\" ],\r\n  \"icon\" : [ \"#\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', 0, NULL, '2019-12-02 16:05:19');
INSERT INTO `sys_oper_log` VALUES (127, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.genCode()', 1, 'admin', '研发部门', '/tool/gen/genCode/biz_device_unit', '127.0.0.1', '内网IP', '{ }', 0, NULL, '2019-12-02 16:05:40');
INSERT INTO `sys_oper_log` VALUES (128, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"2021\" ],\r\n  \"parentId\" : [ \"2020\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"设备部件\" ],\r\n  \"url\" : [ \"/system/bizDeviceUnit\" ],\r\n  \"perms\" : [ \"system:bizDeviceUnit:view\" ],\r\n  \"orderNum\" : [ \"21\" ],\r\n  \"icon\" : [ \"#\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', 0, NULL, '2019-12-02 16:11:46');
INSERT INTO `sys_oper_log` VALUES (129, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.genCode()', 1, 'admin', '研发部门', '/tool/gen/genCode/biz_agentia', '127.0.0.1', '内网IP', '{ }', 0, NULL, '2019-12-02 16:28:25');
INSERT INTO `sys_oper_log` VALUES (130, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"2026\" ],\r\n  \"parentId\" : [ \"2020\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"药剂管理\" ],\r\n  \"url\" : [ \"/system/bizAgentia\" ],\r\n  \"perms\" : [ \"system:bizAgentia:view\" ],\r\n  \"orderNum\" : [ \"40\" ],\r\n  \"icon\" : [ \"#\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', 0, NULL, '2019-12-02 16:42:50');
INSERT INTO `sys_oper_log` VALUES (131, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"2010\" ],\r\n  \"parentId\" : [ \"2020\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"设备信息\" ],\r\n  \"url\" : [ \"/system/bizDevice\" ],\r\n  \"perms\" : [ \"system:bizDevice:view\" ],\r\n  \"orderNum\" : [ \"20\" ],\r\n  \"icon\" : [ \"#\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', 0, NULL, '2019-12-02 16:50:07');
INSERT INTO `sys_oper_log` VALUES (132, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"2021\" ],\r\n  \"parentId\" : [ \"2020\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"设备部件信息\" ],\r\n  \"url\" : [ \"/system/bizDeviceUnit\" ],\r\n  \"perms\" : [ \"system:bizDeviceUnit:view\" ],\r\n  \"orderNum\" : [ \"21\" ],\r\n  \"icon\" : [ \"#\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', 0, NULL, '2019-12-02 16:50:16');
INSERT INTO `sys_oper_log` VALUES (133, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"2015\" ],\r\n  \"parentId\" : [ \"2020\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"水厂信息\" ],\r\n  \"url\" : [ \"/system/bizWorks\" ],\r\n  \"perms\" : [ \"system:bizWorks:view\" ],\r\n  \"orderNum\" : [ \"30\" ],\r\n  \"icon\" : [ \"#\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', 0, NULL, '2019-12-02 16:50:26');
INSERT INTO `sys_oper_log` VALUES (134, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"2026\" ],\r\n  \"parentId\" : [ \"2020\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"药剂信息\" ],\r\n  \"url\" : [ \"/system/bizAgentia\" ],\r\n  \"perms\" : [ \"system:bizAgentia:view\" ],\r\n  \"orderNum\" : [ \"40\" ],\r\n  \"icon\" : [ \"#\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', 0, NULL, '2019-12-02 16:50:36');
INSERT INTO `sys_oper_log` VALUES (135, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"2000\" ],\r\n  \"parentId\" : [ \"2020\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"化验信息\" ],\r\n  \"url\" : [ \"/system/bizAssayResult\" ],\r\n  \"perms\" : [ \"system:bizAssayResult:view\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"#\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', 0, NULL, '2019-12-02 16:51:15');
INSERT INTO `sys_oper_log` VALUES (136, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateAvatar()', 1, 'admin', '研发部门', '/system/user/profile/updateAvatar', '127.0.0.1', '内网IP', '{ }', 0, NULL, '2019-12-02 17:00:48');
INSERT INTO `sys_oper_log` VALUES (137, '化验结果', 2, 'com.ruoyi.web.controller.system.BizAssayResultController.editSave()', 1, 'admin', '研发部门', '/system/bizAssayResult/edit', '127.0.0.1', '内网IP', '{\r\n  \"resultId\" : [ \"1\" ],\r\n  \"reportId\" : [ \"H00120191202\" ],\r\n  \"resultNo\" : [ \"H001\" ],\r\n  \"inCod\" : [ \"16.02\" ],\r\n  \"inTp\" : [ \"41.0\" ],\r\n  \"inTn\" : [ \"40.0\" ],\r\n  \"inNh3\" : [ \"6.0\" ],\r\n  \"outCod\" : [ \"4.0\" ],\r\n  \"outTp\" : [ \"21.0\" ],\r\n  \"outTn\" : [ \"30.0\" ],\r\n  \"outNh3\" : [ \"65.0\" ]\r\n}', 0, NULL, '2019-12-13 11:00:05');
INSERT INTO `sys_oper_log` VALUES (138, '设备', 1, 'com.ruoyi.web.controller.system.BizDeviceController.addSave()', 1, 'admin', '研发部门', '/system/bizDevice/add', '127.0.0.1', '内网IP', '{\r\n  \"deviceNo\" : [ \"001\" ],\r\n  \"deviceName\" : [ \"化验机器人一号\" ],\r\n  \"deviceSn\" : [ \"CTTC-00A1\" ],\r\n  \"deviceModel\" : [ \"220\" ],\r\n  \"deviceMaker\" : [ \"程天科技\" ],\r\n  \"deviceWorks\" : [ \"1\" ],\r\n  \"deviceMaintainer\" : [ \"\" ],\r\n  \"deviceTel\" : [ \"\" ],\r\n  \"deviceType\" : [ \"1\" ],\r\n  \"deviceStatus\" : [ \"0\" ],\r\n  \"repairTim\" : [ \"\" ],\r\n  \"repairBy\" : [ \"\" ],\r\n  \"createTime\" : [ \"\" ],\r\n  \"createBy\" : [ \"\" ],\r\n  \"updateTime\" : [ \"\" ],\r\n  \"updateBy\" : [ \"\" ]\r\n}', 0, NULL, '2019-12-13 14:20:43');
INSERT INTO `sys_oper_log` VALUES (139, '设备', 2, 'com.ruoyi.web.controller.system.BizDeviceController.editSave()', 1, 'admin', '研发部门', '/system/bizDevice/edit', '127.0.0.1', '内网IP', '{\r\n  \"deviceId\" : [ \"1\" ],\r\n  \"deviceNo\" : [ \"001\" ],\r\n  \"deviceName\" : [ \"化验机器人一号\" ],\r\n  \"deviceSn\" : [ \"CTTC-00A1\" ],\r\n  \"deviceModel\" : [ \"220\" ],\r\n  \"deviceMaker\" : [ \"程天科技\" ],\r\n  \"deviceWorks\" : [ \"1\" ],\r\n  \"deviceMaintainer\" : [ \"于涛\" ],\r\n  \"deviceTel\" : [ \"18745773203\" ],\r\n  \"deviceType\" : [ \"1\" ],\r\n  \"deviceStatus\" : [ \"0\" ],\r\n  \"repairTim\" : [ \"\" ],\r\n  \"repairBy\" : [ \"\" ],\r\n  \"createTime\" : [ \"\" ],\r\n  \"createBy\" : [ \"\" ],\r\n  \"updateTime\" : [ \"\" ],\r\n  \"updateBy\" : [ \"\" ]\r\n}', 0, NULL, '2019-12-13 14:40:43');
INSERT INTO `sys_oper_log` VALUES (140, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.genCode()', 1, 'admin', '研发部门', '/tool/gen/genCode/biz_works', '127.0.0.1', '内网IP', '{ }', 0, NULL, '2019-12-14 09:27:06');
INSERT INTO `sys_oper_log` VALUES (141, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.genCode()', 1, 'admin', '研发部门', '/tool/gen/genCode/biz_assay_result', '127.0.0.1', '内网IP', '{ }', 0, NULL, '2019-12-14 11:35:15');
INSERT INTO `sys_oper_log` VALUES (142, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.genCode()', 1, 'admin', '研发部门', '/tool/gen/genCode/biz_alert', '127.0.0.1', '内网IP', '{ }', 0, NULL, '2019-12-14 11:36:24');
INSERT INTO `sys_oper_log` VALUES (143, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.genCode()', 1, 'admin', '研发部门', '/tool/gen/genCode/biz_result_alter', '127.0.0.1', '内网IP', '{ }', 0, NULL, '2019-12-14 11:36:46');
INSERT INTO `sys_oper_log` VALUES (144, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.genCode()', 1, 'admin', '研发部门', '/tool/gen/genCode/biz_works', '127.0.0.1', '内网IP', '{ }', 0, NULL, '2019-12-14 11:37:01');
INSERT INTO `sys_oper_log` VALUES (145, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.genCode()', 1, 'admin', '研发部门', '/tool/gen/genCode/biz_agentia', '127.0.0.1', '内网IP', '{ }', 0, NULL, '2019-12-14 11:37:20');
INSERT INTO `sys_oper_log` VALUES (146, '水厂', 1, 'com.ruoyi.web.controller.system.BizWorksController.addSave()', 1, 'admin', '研发部门', '/system/bizWorks/add', '127.0.0.1', '内网IP', '{\r\n  \"worksNo\" : [ \"001\" ],\r\n  \"worksName\" : [ \"信义水厂\" ],\r\n  \"worksProvince\" : [ \"230000\" ],\r\n  \"worksCity\" : [ \"230100\" ],\r\n  \"worksArea\" : [ \"230103\" ],\r\n  \"worksAddress\" : [ \"信义水厂\" ],\r\n  \"worksCount\" : [ \"1\" ],\r\n  \"worksType\" : [ \"0\" ],\r\n  \"worksBelong\" : [ \"1\" ],\r\n  \"worksStatus\" : [ \"0\" ],\r\n  \"worksMaintainer\" : [ \"\" ],\r\n  \"worksTel\" : [ \"\" ],\r\n  \"createTime\" : [ \"\" ],\r\n  \"createBy\" : [ \"\" ],\r\n  \"updateTime\" : [ \"\" ],\r\n  \"updateBy\" : [ \"\" ]\r\n}', 0, NULL, '2019-12-14 12:23:35');
INSERT INTO `sys_oper_log` VALUES (147, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.genCode()', 1, 'admin', '研发部门', '/tool/gen/genCode/sys_region', '127.0.0.1', '内网IP', '{ }', 0, NULL, '2019-12-14 12:49:07');
INSERT INTO `sys_oper_log` VALUES (148, '药剂', 1, 'com.ruoyi.web.controller.system.BizAgentiaController.addSave()', 1, 'admin', '研发部门', '/system/bizAgentia/add', '127.0.0.1', '内网IP', '{\r\n  \"agentiaNo\" : [ \"001\" ],\r\n  \"agentiaName\" : [ \"化验cod\" ],\r\n  \"agentiaDevice\" : [ \"1\" ],\r\n  \"agentiaTotal\" : [ \"100\" ],\r\n  \"agentiaRemain\" : [ \"50\" ],\r\n  \"agentiaAlert\" : [ \"20\" ],\r\n  \"agentiaType\" : [ \"1\" ],\r\n  \"agentiaMaker\" : [ \"程天科技\" ],\r\n  \"agentiaStatus\" : [ \"0\" ],\r\n  \"useTime\" : [ \"\" ],\r\n  \"lastRepairTime\" : [ \"\" ],\r\n  \"repairTime\" : [ \"\" ],\r\n  \"repairBy\" : [ \"\" ],\r\n  \"createTime\" : [ \"\" ],\r\n  \"createBy\" : [ \"\" ],\r\n  \"updateTime\" : [ \"\" ],\r\n  \"updateBy\" : [ \"\" ]\r\n}', 0, NULL, '2019-12-14 14:39:07');
INSERT INTO `sys_oper_log` VALUES (149, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.genCode()', 1, 'admin', '研发部门', '/tool/gen/genCode/sys_region', '127.0.0.1', '内网IP', '{ }', 0, NULL, '2019-12-14 15:23:08');
INSERT INTO `sys_oper_log` VALUES (150, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.genCode()', 1, 'admin', '研发部门', '/tool/gen/genCode/biz_error', '127.0.0.1', '内网IP', '{ }', 0, NULL, '2019-12-14 15:48:37');
INSERT INTO `sys_oper_log` VALUES (151, '告警', 1, 'com.ruoyi.web.controller.system.BizAlertController.addSave()', 1, 'admin', '研发部门', '/system/bizAlert/add', '127.0.0.1', '内网IP', '{\r\n  \"reportId\" : [ \"H00120191202\" ],\r\n  \"alertDevice\" : [ \"1\" ],\r\n  \"alertWorks\" : [ \"1\" ],\r\n  \"alertContent\" : [ \"出水COD异常\" ],\r\n  \"alertType\" : [ \"1\" ],\r\n  \"alertDate\" : [ \"\" ],\r\n  \"createTime\" : [ \"\" ]\r\n}', 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'alert_id\' doesn\'t have a default value\r\n### The error may involve com.ruoyi.system.mapper.BizAlertMapper.insertBizAlert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into biz_alert    ( report_id,    alert_device,    alert_works,    alert_content,    alert_type )           values ( ?,    ?,    ?,    ?,    ? )\r\n### Cause: java.sql.SQLException: Field \'alert_id\' doesn\'t have a default value\n; Field \'alert_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'alert_id\' doesn\'t have a default value', '2019-12-14 16:09:57');
INSERT INTO `sys_oper_log` VALUES (152, '告警', 1, 'com.ruoyi.web.controller.system.BizAlertController.addSave()', 1, 'admin', '研发部门', '/system/bizAlert/add', '127.0.0.1', '内网IP', '{\r\n  \"reportId\" : [ \"H00120191202\" ],\r\n  \"alertDevice\" : [ \"1\" ],\r\n  \"alertWorks\" : [ \"1\" ],\r\n  \"alertContent\" : [ \"出水COD异常\" ],\r\n  \"alertType\" : [ \"1\" ],\r\n  \"alertDate\" : [ \"\" ],\r\n  \"createTime\" : [ \"\" ]\r\n}', 0, NULL, '2019-12-14 16:11:25');
INSERT INTO `sys_oper_log` VALUES (153, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.genCode()', 1, 'admin', '研发部门', '/tool/gen/genCode/biz_device_unit', '127.0.0.1', '内网IP', '{ }', 0, NULL, '2019-12-14 16:14:28');
INSERT INTO `sys_oper_log` VALUES (154, '设备部件', 1, 'com.ruoyi.web.controller.system.BizDeviceUnitController.addSave()', 1, 'admin', '研发部门', '/system/bizDeviceUnit/add', '127.0.0.1', '内网IP', '{\r\n  \"unitNo\" : [ \"001\" ],\r\n  \"unitName\" : [ \"试管\" ],\r\n  \"unitSn\" : [ \"010A\" ],\r\n  \"unitModel\" : [ \"1A\" ],\r\n  \"unitDevice\" : [ \"1\" ],\r\n  \"unitType\" : [ \"1\" ],\r\n  \"unitCount\" : [ \"10\" ],\r\n  \"unitMaker\" : [ \"程天科技\" ],\r\n  \"unitStatus\" : [ \"0\" ],\r\n  \"useTime\" : [ \"\" ],\r\n  \"lastRepairTime\" : [ \"\" ],\r\n  \"repairTime\" : [ \"\" ],\r\n  \"repairBy\" : [ \"\" ]\r\n}', 0, NULL, '2019-12-14 16:17:47');
INSERT INTO `sys_oper_log` VALUES (155, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.genCode()', 1, 'admin', '研发部门', '/tool/gen/genCode/biz_result_alter', '127.0.0.1', '内网IP', '{ }', 0, NULL, '2019-12-16 09:06:53');
INSERT INTO `sys_oper_log` VALUES (156, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"2031\" ],\r\n  \"parentId\" : [ \"2020\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"告警信息\" ],\r\n  \"url\" : [ \"/system/bizAlert\" ],\r\n  \"perms\" : [ \"system:bizAlert:view\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"#\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', 0, NULL, '2019-12-16 09:48:30');
INSERT INTO `sys_oper_log` VALUES (157, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"2031\" ],\r\n  \"parentId\" : [ \"2020\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"告警信息\" ],\r\n  \"url\" : [ \"/system/bizAlert\" ],\r\n  \"perms\" : [ \"system:bizAlert:view\" ],\r\n  \"orderNum\" : [ \"50\" ],\r\n  \"icon\" : [ \"#\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', 0, NULL, '2019-12-16 09:48:54');
INSERT INTO `sys_oper_log` VALUES (158, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"2036\" ],\r\n  \"parentId\" : [ \"1\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"地区管理\" ],\r\n  \"url\" : [ \"/system/region\" ],\r\n  \"perms\" : [ \"system:region:view\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"#\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', 0, NULL, '2019-12-16 09:49:22');
INSERT INTO `sys_oper_log` VALUES (159, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"2036\" ],\r\n  \"parentId\" : [ \"1\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"地区管理\" ],\r\n  \"url\" : [ \"/system/region\" ],\r\n  \"perms\" : [ \"system:region:view\" ],\r\n  \"orderNum\" : [ \"7\" ],\r\n  \"icon\" : [ \"#\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', 0, NULL, '2019-12-16 09:49:42');
INSERT INTO `sys_oper_log` VALUES (160, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"106\" ],\r\n  \"parentId\" : [ \"1\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"参数设置\" ],\r\n  \"url\" : [ \"/system/config\" ],\r\n  \"perms\" : [ \"system:config:view\" ],\r\n  \"orderNum\" : [ \"8\" ],\r\n  \"icon\" : [ \"#\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', 0, NULL, '2019-12-16 09:50:02');
INSERT INTO `sys_oper_log` VALUES (161, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"107\" ],\r\n  \"parentId\" : [ \"1\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"通知公告\" ],\r\n  \"url\" : [ \"/system/notice\" ],\r\n  \"perms\" : [ \"system:notice:view\" ],\r\n  \"orderNum\" : [ \"9\" ],\r\n  \"icon\" : [ \"#\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', 0, NULL, '2019-12-16 09:50:16');
INSERT INTO `sys_oper_log` VALUES (162, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"108\" ],\r\n  \"parentId\" : [ \"1\" ],\r\n  \"menuType\" : [ \"M\" ],\r\n  \"menuName\" : [ \"日志管理\" ],\r\n  \"url\" : [ \"#\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"10\" ],\r\n  \"icon\" : [ \"#\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', 0, NULL, '2019-12-16 09:50:24');
INSERT INTO `sys_oper_log` VALUES (163, '告警', 2, 'com.ruoyi.web.controller.system.BizAlertController.editSave()', 1, 'admin', '研发部门', '/system/bizAlert/edit', '127.0.0.1', '内网IP', '{\r\n  \"alertId\" : [ \"1\" ],\r\n  \"reportId\" : [ \"H00120191202\" ],\r\n  \"alertDevice\" : [ \"1\" ],\r\n  \"alertWorks\" : [ \"1\" ],\r\n  \"alertContent\" : [ \"出水COD异常\" ],\r\n  \"alertType\" : [ \"1\" ],\r\n  \"alertDate\" : [ \"2019-12-16\" ]\r\n}', 0, NULL, '2019-12-16 09:50:48');
INSERT INTO `sys_oper_log` VALUES (164, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.addSave()', 1, 'admin', '研发部门', '/system/dict/add', '127.0.0.1', '内网IP', '{\r\n  \"dictName\" : [ \"水厂类型\" ],\r\n  \"dictType\" : [ \"works_type\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ]\r\n}', 0, NULL, '2019-12-16 10:32:50');
INSERT INTO `sys_oper_log` VALUES (165, '字典类型', 2, 'com.ruoyi.web.controller.system.SysDictTypeController.editSave()', 1, 'admin', '研发部门', '/system/dict/edit', '127.0.0.1', '内网IP', '{\r\n  \"dictId\" : [ \"100\" ],\r\n  \"dictName\" : [ \"水厂类型\" ],\r\n  \"dictType\" : [ \"works_type\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"水厂类型列表\" ]\r\n}', 0, NULL, '2019-12-16 10:33:01');
INSERT INTO `sys_oper_log` VALUES (166, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\r\n  \"dictLabel\" : [ \"集团水厂\" ],\r\n  \"dictValue\" : [ \"0\" ],\r\n  \"dictType\" : [ \"works_type\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"1\" ],\r\n  \"listClass\" : [ \"default\" ],\r\n  \"isDefault\" : [ \"Y\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ]\r\n}', 0, NULL, '2019-12-16 10:38:31');
INSERT INTO `sys_oper_log` VALUES (167, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\r\n  \"dictLabel\" : [ \"区域中心\" ],\r\n  \"dictValue\" : [ \"1\" ],\r\n  \"dictType\" : [ \"works_type\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"2\" ],\r\n  \"listClass\" : [ \"default\" ],\r\n  \"isDefault\" : [ \"Y\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ]\r\n}', 0, NULL, '2019-12-16 10:38:58');
INSERT INTO `sys_oper_log` VALUES (168, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\r\n  \"dictLabel\" : [ \"临时水厂\" ],\r\n  \"dictValue\" : [ \"2\" ],\r\n  \"dictType\" : [ \"works_type\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"3\" ],\r\n  \"listClass\" : [ \"default\" ],\r\n  \"isDefault\" : [ \"Y\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ]\r\n}', 0, NULL, '2019-12-16 10:39:11');
INSERT INTO `sys_oper_log` VALUES (169, '水厂', 2, 'com.ruoyi.web.controller.system.BizWorksController.editSave()', 1, 'admin', '研发部门', '/system/bizWorks/edit', '127.0.0.1', '内网IP', '{\r\n  \"worksId\" : [ \"1\" ],\r\n  \"worksNo\" : [ \"001\" ],\r\n  \"worksName\" : [ \"信义水厂\" ],\r\n  \"worksProvince\" : [ \"230000\" ],\r\n  \"worksCity\" : [ \"230100\" ],\r\n  \"worksArea\" : [ \"230103\" ],\r\n  \"worksAddress\" : [ \"信义水厂\" ],\r\n  \"worksCount\" : [ \"1\" ],\r\n  \"worksType\" : [ \"0\" ],\r\n  \"worksBelong\" : [ \"1\" ],\r\n  \"worksMaintainer\" : [ \"\" ],\r\n  \"worksTel\" : [ \"\" ]\r\n}', 0, NULL, '2019-12-16 10:58:26');
INSERT INTO `sys_oper_log` VALUES (170, '水厂', 2, 'com.ruoyi.web.controller.system.BizWorksController.editSave()', 1, 'admin', '研发部门', '/system/bizWorks/edit', '127.0.0.1', '内网IP', '{\r\n  \"worksId\" : [ \"1\" ],\r\n  \"worksNo\" : [ \"001\" ],\r\n  \"worksName\" : [ \"信义水厂\" ],\r\n  \"worksProvince\" : [ \"230000\" ],\r\n  \"worksCity\" : [ \"230100\" ],\r\n  \"worksArea\" : [ \"230103\" ],\r\n  \"worksAddress\" : [ \"信义水厂\" ],\r\n  \"worksCount\" : [ \"1\" ],\r\n  \"worksType\" : [ \"0\" ],\r\n  \"worksBelong\" : [ \"1\" ],\r\n  \"worksMaintainer\" : [ \"\" ],\r\n  \"worksTel\" : [ \"\" ]\r\n}', 0, NULL, '2019-12-16 10:58:35');
INSERT INTO `sys_oper_log` VALUES (171, '水厂', 2, 'com.ruoyi.web.controller.system.BizWorksController.editSave()', 1, 'admin', '研发部门', '/system/bizWorks/edit', '127.0.0.1', '内网IP', '{ }', 0, NULL, '2019-12-16 11:00:00');
INSERT INTO `sys_oper_log` VALUES (172, '水厂', 2, 'com.ruoyi.web.controller.system.BizWorksController.editSave()', 1, 'admin', '研发部门', '/system/bizWorks/edit', '127.0.0.1', '内网IP', '{\r\n  \"worksId\" : [ \"1\" ],\r\n  \"worksNo\" : [ \"001\" ],\r\n  \"worksName\" : [ \"信义水厂\" ],\r\n  \"worksProvince\" : [ \"230000\" ],\r\n  \"worksCity\" : [ \"230100\" ],\r\n  \"worksArea\" : [ \"230103\" ],\r\n  \"worksAddress\" : [ \"信义水厂\" ],\r\n  \"worksCount\" : [ \"1\" ],\r\n  \"worksType\" : [ \"0\" ],\r\n  \"worksBelong\" : [ \"1\" ],\r\n  \"worksMaintainer\" : [ \"\" ],\r\n  \"worksTel\" : [ \"\" ],\r\n  \"worksStatus\" : [ \"1\" ]\r\n}', 0, NULL, '2019-12-16 11:00:51');
INSERT INTO `sys_oper_log` VALUES (173, '水厂', 2, 'com.ruoyi.web.controller.system.BizWorksController.editSave()', 1, 'admin', '研发部门', '/system/bizWorks/edit', '127.0.0.1', '内网IP', '{\r\n  \"worksId\" : [ \"1\" ],\r\n  \"worksNo\" : [ \"001\" ],\r\n  \"worksName\" : [ \"信义水厂\" ],\r\n  \"worksProvince\" : [ \"230000\" ],\r\n  \"worksCity\" : [ \"230100\" ],\r\n  \"worksArea\" : [ \"230103\" ],\r\n  \"worksAddress\" : [ \"信义水厂\" ],\r\n  \"worksCount\" : [ \"1\" ],\r\n  \"worksType\" : [ \"0\" ],\r\n  \"worksBelong\" : [ \"1\" ],\r\n  \"worksMaintainer\" : [ \"\" ],\r\n  \"worksTel\" : [ \"\" ],\r\n  \"worksStatus\" : [ \"1\" ]\r\n}', 0, NULL, '2019-12-16 11:00:56');
INSERT INTO `sys_oper_log` VALUES (174, '水厂', 2, 'com.ruoyi.web.controller.system.BizWorksController.editSave()', 1, 'admin', '研发部门', '/system/bizWorks/edit', '127.0.0.1', '内网IP', '{\r\n  \"worksId\" : [ \"1\" ],\r\n  \"worksNo\" : [ \"001\" ],\r\n  \"worksName\" : [ \"信义水厂\" ],\r\n  \"worksProvince\" : [ \"230000\" ],\r\n  \"worksCity\" : [ \"230100\" ],\r\n  \"worksArea\" : [ \"230103\" ],\r\n  \"worksAddress\" : [ \"信义水厂\" ],\r\n  \"worksCount\" : [ \"1\" ],\r\n  \"worksType\" : [ \"0\" ],\r\n  \"worksBelong\" : [ \"1\" ],\r\n  \"worksMaintainer\" : [ \"\" ],\r\n  \"worksTel\" : [ \"\" ],\r\n  \"worksStatus\" : [ \"0\" ]\r\n}', 0, NULL, '2019-12-16 11:00:59');
INSERT INTO `sys_oper_log` VALUES (175, '水厂', 2, 'com.ruoyi.web.controller.system.BizWorksController.editSave()', 1, 'admin', '研发部门', '/system/bizWorks/edit', '127.0.0.1', '内网IP', '{\r\n  \"worksId\" : [ \"1\" ],\r\n  \"worksNo\" : [ \"001\" ],\r\n  \"worksName\" : [ \"信义水厂\" ],\r\n  \"worksProvince\" : [ \"230000\" ],\r\n  \"worksCity\" : [ \"230100\" ],\r\n  \"worksArea\" : [ \"230103\" ],\r\n  \"worksAddress\" : [ \"信义水厂\" ],\r\n  \"worksCount\" : [ \"1\" ],\r\n  \"worksType\" : [ \"0\" ],\r\n  \"worksBelong\" : [ \"1\" ],\r\n  \"worksMaintainer\" : [ \"\" ],\r\n  \"worksTel\" : [ \"\" ],\r\n  \"worksStatus\" : [ \"1\" ]\r\n}', 0, NULL, '2019-12-16 11:01:57');
INSERT INTO `sys_oper_log` VALUES (176, '水厂', 2, 'com.ruoyi.web.controller.system.BizWorksController.editSave()', 1, 'admin', '研发部门', '/system/bizWorks/edit', '127.0.0.1', '内网IP', '{\r\n  \"worksId\" : [ \"1\" ],\r\n  \"worksNo\" : [ \"001\" ],\r\n  \"worksName\" : [ \"信义水厂\" ],\r\n  \"worksProvince\" : [ \"230000\" ],\r\n  \"worksCity\" : [ \"230100\" ],\r\n  \"worksArea\" : [ \"230103\" ],\r\n  \"worksAddress\" : [ \"信义水厂\" ],\r\n  \"worksCount\" : [ \"1\" ],\r\n  \"worksType\" : [ \"0\" ],\r\n  \"worksBelong\" : [ \"1\" ],\r\n  \"worksMaintainer\" : [ \"\" ],\r\n  \"worksTel\" : [ \"\" ],\r\n  \"worksStatus\" : [ \"0\" ]\r\n}', 0, NULL, '2019-12-16 11:02:00');
INSERT INTO `sys_oper_log` VALUES (177, '水厂', 2, 'com.ruoyi.web.controller.system.BizWorksController.editSave()', 1, 'admin', NULL, '/system/bizWorks/edit', '127.0.0.1', '内网IP', '{\r\n  \"worksId\" : [ \"1\" ],\r\n  \"worksNo\" : [ \"001\" ],\r\n  \"worksName\" : [ \"信义水厂\" ],\r\n  \"worksProvince\" : [ \"230000\" ],\r\n  \"worksCity\" : [ \"230100\" ],\r\n  \"worksArea\" : [ \"230103\" ],\r\n  \"worksAddress\" : [ \"信义水厂\" ],\r\n  \"worksCount\" : [ \"1\" ],\r\n  \"worksType\" : [ \"0\" ],\r\n  \"worksBelong\" : [ \"1\" ],\r\n  \"worksMaintainer\" : [ \"\" ],\r\n  \"worksTel\" : [ \"\" ],\r\n  \"worksStatus\" : [ \"0\" ]\r\n}', 0, NULL, '2019-12-16 11:34:26');
INSERT INTO `sys_oper_log` VALUES (178, '设备', 2, 'com.ruoyi.web.controller.system.BizDeviceController.editSave()', 1, 'admin', '研发部门', '/system/bizDevice/edit', '127.0.0.1', '内网IP', '{\r\n  \"deviceId\" : [ \"1\" ],\r\n  \"deviceNo\" : [ \"001\" ],\r\n  \"deviceName\" : [ \"化验机器人一号\" ],\r\n  \"deviceSn\" : [ \"CTTC-00A1\" ],\r\n  \"deviceModel\" : [ \"220\" ],\r\n  \"deviceMaker\" : [ \"程天科技\" ],\r\n  \"deviceWorks\" : [ \"1\" ],\r\n  \"deviceMaintainer\" : [ \"于涛\" ],\r\n  \"deviceTel\" : [ \"18745773203\" ],\r\n  \"deviceType\" : [ \"1\" ],\r\n  \"repairTim\" : [ \"\" ],\r\n  \"repairBy\" : [ \"\" ]\r\n}', 0, NULL, '2019-12-16 11:36:26');
INSERT INTO `sys_oper_log` VALUES (179, '设备', 2, 'com.ruoyi.web.controller.system.BizDeviceController.editSave()', 1, 'admin', '研发部门', '/system/bizDevice/edit', '127.0.0.1', '内网IP', '{\r\n  \"deviceId\" : [ \"1\" ],\r\n  \"deviceNo\" : [ \"001\" ],\r\n  \"deviceName\" : [ \"化验机器人一号\" ],\r\n  \"deviceSn\" : [ \"CTTC-00A1\" ],\r\n  \"deviceModel\" : [ \"220\" ],\r\n  \"deviceMaker\" : [ \"程天科技\" ],\r\n  \"deviceWorks\" : [ \"1\" ],\r\n  \"deviceMaintainer\" : [ \"于涛\" ],\r\n  \"deviceTel\" : [ \"18745773203\" ],\r\n  \"deviceType\" : [ \"1\" ],\r\n  \"repairTim\" : [ \"\" ],\r\n  \"repairBy\" : [ \"\" ]\r\n}', 0, NULL, '2019-12-16 11:36:30');
INSERT INTO `sys_oper_log` VALUES (180, '水厂', 2, 'com.ruoyi.web.controller.system.BizWorksController.editSave()', 1, 'admin', '研发部门', '/system/bizWorks/edit', '127.0.0.1', '内网IP', '{\r\n  \"worksId\" : [ \"1\" ],\r\n  \"worksNo\" : [ \"001\" ],\r\n  \"worksName\" : [ \"信义水厂\" ],\r\n  \"worksProvince\" : [ \"230000\" ],\r\n  \"worksCity\" : [ \"230100\" ],\r\n  \"worksArea\" : [ \"230103\" ],\r\n  \"worksAddress\" : [ \"信义水厂\" ],\r\n  \"worksCount\" : [ \"1\" ],\r\n  \"worksType\" : [ \"0\" ],\r\n  \"worksBelong\" : [ \"1\" ],\r\n  \"worksMaintainer\" : [ \"\" ],\r\n  \"worksTel\" : [ \"\" ],\r\n  \"worksStatus\" : [ \"0\" ]\r\n}', 0, NULL, '2019-12-16 11:37:47');
INSERT INTO `sys_oper_log` VALUES (181, '水厂', 2, 'com.ruoyi.web.controller.system.BizWorksController.editSave()', 1, 'admin', '研发部门', '/system/bizWorks/edit', '127.0.0.1', '内网IP', '{\r\n  \"worksId\" : [ \"1\" ],\r\n  \"worksNo\" : [ \"001\" ],\r\n  \"worksName\" : [ \"信义水厂\" ],\r\n  \"worksProvince\" : [ \"230000\" ],\r\n  \"worksCity\" : [ \"230100\" ],\r\n  \"worksArea\" : [ \"230103\" ],\r\n  \"worksAddress\" : [ \"信义水厂\" ],\r\n  \"worksCount\" : [ \"1\" ],\r\n  \"worksType\" : [ \"0\" ],\r\n  \"worksBelong\" : [ \"1\" ],\r\n  \"worksMaintainer\" : [ \"\" ],\r\n  \"worksTel\" : [ \"\" ],\r\n  \"worksStatus\" : [ \"0\" ]\r\n}', 0, NULL, '2019-12-16 11:40:27');
INSERT INTO `sys_oper_log` VALUES (182, '设备', 2, 'com.ruoyi.web.controller.system.BizDeviceController.editSave()', 1, 'admin', '研发部门', '/system/bizDevice/edit', '127.0.0.1', '内网IP', '{\r\n  \"deviceId\" : [ \"1\" ],\r\n  \"deviceNo\" : [ \"001\" ],\r\n  \"deviceName\" : [ \"化验机器人一号\" ],\r\n  \"deviceSn\" : [ \"CTTC-00A1\" ],\r\n  \"deviceModel\" : [ \"220\" ],\r\n  \"deviceMaker\" : [ \"程天科技\" ],\r\n  \"deviceWorks\" : [ \"1\" ],\r\n  \"deviceMaintainer\" : [ \"于涛\" ],\r\n  \"deviceTel\" : [ \"18745773203\" ],\r\n  \"deviceType\" : [ \"1\" ],\r\n  \"deviceStatus\" : [ \"0\" ],\r\n  \"repairTim\" : [ \"\" ],\r\n  \"repairBy\" : [ \"\" ]\r\n}', 0, NULL, '2019-12-16 11:45:30');
INSERT INTO `sys_oper_log` VALUES (183, '水厂', 2, 'com.ruoyi.web.controller.system.BizWorksController.editSave()', 1, 'admin', '研发部门', '/system/bizWorks/edit', '127.0.0.1', '内网IP', '{\r\n  \"worksId\" : [ \"1\" ],\r\n  \"worksNo\" : [ \"001\" ],\r\n  \"worksName\" : [ \"信义水厂\" ],\r\n  \"worksProvince\" : [ \"230000\" ],\r\n  \"worksCity\" : [ \"230100\" ],\r\n  \"worksArea\" : [ \"230103\" ],\r\n  \"worksAddress\" : [ \"信义水厂\" ],\r\n  \"worksCount\" : [ \"1\" ],\r\n  \"worksType\" : [ \"0\" ],\r\n  \"worksBelong\" : [ \"1\" ],\r\n  \"worksMaintainer\" : [ \"\" ],\r\n  \"worksTel\" : [ \"\" ],\r\n  \"worksStatus\" : [ \"0\" ]\r\n}', 0, NULL, '2019-12-16 11:48:16');
INSERT INTO `sys_oper_log` VALUES (184, '水厂', 2, 'com.ruoyi.web.controller.system.BizWorksController.editSave()', 1, 'admin', '研发部门', '/system/bizWorks/edit', '127.0.0.1', '内网IP', '{\r\n  \"worksId\" : [ \"1\" ],\r\n  \"worksNo\" : [ \"001\" ],\r\n  \"worksName\" : [ \"信义水厂\" ],\r\n  \"worksProvince\" : [ \"230000\" ],\r\n  \"worksCity\" : [ \"230100\" ],\r\n  \"worksArea\" : [ \"230103\" ],\r\n  \"worksAddress\" : [ \"信义水厂\" ],\r\n  \"worksCount\" : [ \"1\" ],\r\n  \"worksType\" : [ \"0\" ],\r\n  \"worksBelong\" : [ \"1\" ],\r\n  \"worksMaintainer\" : [ \"\" ],\r\n  \"worksTel\" : [ \"\" ],\r\n  \"worksStatus\" : [ \"0\" ]\r\n}', 0, NULL, '2019-12-16 11:49:10');
INSERT INTO `sys_oper_log` VALUES (185, '设备', 2, 'com.ruoyi.web.controller.system.BizDeviceController.editSave()', 1, 'admin', '研发部门', '/system/bizDevice/edit', '127.0.0.1', '内网IP', '{\r\n  \"deviceId\" : [ \"1\" ],\r\n  \"deviceNo\" : [ \"001\" ],\r\n  \"deviceName\" : [ \"化验机器人一号\" ],\r\n  \"deviceSn\" : [ \"CTTC-00A1\" ],\r\n  \"deviceModel\" : [ \"220\" ],\r\n  \"deviceMaker\" : [ \"程天科技\" ],\r\n  \"deviceWorks\" : [ \"1\" ],\r\n  \"deviceMaintainer\" : [ \"于涛\" ],\r\n  \"deviceTel\" : [ \"18745773203\" ],\r\n  \"deviceType\" : [ \"1\" ],\r\n  \"deviceStatus\" : [ \"0\" ]\r\n}', 0, NULL, '2019-12-16 11:51:37');
INSERT INTO `sys_oper_log` VALUES (186, '设备', 2, 'com.ruoyi.web.controller.system.BizDeviceController.editSave()', 1, 'admin', '研发部门', '/system/bizDevice/edit', '127.0.0.1', '内网IP', '{\r\n  \"deviceId\" : [ \"1\" ],\r\n  \"deviceNo\" : [ \"001\" ],\r\n  \"deviceName\" : [ \"化验机器人一号\" ],\r\n  \"deviceSn\" : [ \"CTTC-00A1\" ],\r\n  \"deviceModel\" : [ \"220\" ],\r\n  \"deviceMaker\" : [ \"程天科技\" ],\r\n  \"deviceWorks\" : [ \"1\" ],\r\n  \"deviceMaintainer\" : [ \"于涛\" ],\r\n  \"deviceTel\" : [ \"18745773203\" ],\r\n  \"deviceType\" : [ \"1\" ],\r\n  \"deviceStatus\" : [ \"1\" ]\r\n}', 0, NULL, '2019-12-16 11:51:42');
INSERT INTO `sys_oper_log` VALUES (187, '设备', 2, 'com.ruoyi.web.controller.system.BizDeviceController.editSave()', 1, 'admin', '研发部门', '/system/bizDevice/edit', '127.0.0.1', '内网IP', '{\r\n  \"deviceId\" : [ \"1\" ],\r\n  \"deviceNo\" : [ \"001\" ],\r\n  \"deviceName\" : [ \"化验机器人一号\" ],\r\n  \"deviceSn\" : [ \"CTTC-00A1\" ],\r\n  \"deviceModel\" : [ \"220\" ],\r\n  \"deviceMaker\" : [ \"程天科技\" ],\r\n  \"deviceWorks\" : [ \"1\" ],\r\n  \"deviceMaintainer\" : [ \"于涛\" ],\r\n  \"deviceTel\" : [ \"18745773203\" ],\r\n  \"deviceType\" : [ \"1\" ],\r\n  \"deviceStatus\" : [ \"0\" ]\r\n}', 0, NULL, '2019-12-16 11:51:46');
INSERT INTO `sys_oper_log` VALUES (188, '设备', 1, 'com.ruoyi.web.controller.system.BizDeviceController.addSave()', 1, 'admin', '研发部门', '/system/bizDevice/add', '127.0.0.1', '内网IP', '{\r\n  \"deviceNo\" : [ \"\" ],\r\n  \"deviceName\" : [ \"\" ],\r\n  \"deviceSn\" : [ \"\" ],\r\n  \"deviceModel\" : [ \"\" ],\r\n  \"deviceMaker\" : [ \"\" ],\r\n  \"deviceWorks\" : [ \"\" ],\r\n  \"deviceMaintainer\" : [ \"\" ],\r\n  \"deviceTel\" : [ \"\" ],\r\n  \"deviceType\" : [ \"\" ],\r\n  \"repairTim\" : [ \"\" ],\r\n  \"repairBy\" : [ \"\" ],\r\n  \"deviceStatus\" : [ \"0\" ]\r\n}', 0, NULL, '2019-12-16 11:51:58');
INSERT INTO `sys_oper_log` VALUES (189, '设备部件', 2, 'com.ruoyi.web.controller.system.BizDeviceUnitController.editSave()', 1, 'admin', '研发部门', '/system/bizDeviceUnit/edit', '127.0.0.1', '内网IP', '{\r\n  \"unitId\" : [ \"1\" ],\r\n  \"unitNo\" : [ \"001\" ],\r\n  \"unitName\" : [ \"试管\" ],\r\n  \"unitSn\" : [ \"010A\" ],\r\n  \"unitModel\" : [ \"1A\" ],\r\n  \"unitDevice\" : [ \"1\" ],\r\n  \"unitType\" : [ \"1\" ],\r\n  \"unitCount\" : [ \"10\" ],\r\n  \"unitMaker\" : [ \"程天科技\" ],\r\n  \"useTime\" : [ \"\" ],\r\n  \"lastRepairTime\" : [ \"\" ],\r\n  \"repairTime\" : [ \"\" ],\r\n  \"repairBy\" : [ \"\" ],\r\n  \"unitStatus\" : [ \"1\" ]\r\n}', 0, NULL, '2019-12-16 12:03:31');
INSERT INTO `sys_oper_log` VALUES (190, '设备部件', 2, 'com.ruoyi.web.controller.system.BizDeviceUnitController.editSave()', 1, 'admin', '研发部门', '/system/bizDeviceUnit/edit', '127.0.0.1', '内网IP', '{\r\n  \"unitId\" : [ \"1\" ],\r\n  \"unitNo\" : [ \"001\" ],\r\n  \"unitName\" : [ \"试管\" ],\r\n  \"unitSn\" : [ \"010A\" ],\r\n  \"unitModel\" : [ \"1A\" ],\r\n  \"unitDevice\" : [ \"1\" ],\r\n  \"unitType\" : [ \"1\" ],\r\n  \"unitCount\" : [ \"10\" ],\r\n  \"unitMaker\" : [ \"程天科技\" ],\r\n  \"useTime\" : [ \"\" ],\r\n  \"lastRepairTime\" : [ \"\" ],\r\n  \"repairTime\" : [ \"\" ],\r\n  \"repairBy\" : [ \"\" ],\r\n  \"unitStatus\" : [ \"0\" ]\r\n}', 0, NULL, '2019-12-16 12:03:34');
INSERT INTO `sys_oper_log` VALUES (191, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.genCode()', 1, 'admin', '研发部门', '/tool/gen/genCode/biz_result_alter', '127.0.0.1', '内网IP', '{ }', 0, NULL, '2019-12-16 14:12:23');
INSERT INTO `sys_oper_log` VALUES (192, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateAvatar()', 1, 'admin', '研发部门', '/system/user/profile/updateAvatar', '127.0.0.1', '内网IP', '{ }', 0, NULL, '2019-12-16 15:30:56');
INSERT INTO `sys_oper_log` VALUES (193, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateAvatar()', 1, 'admin', '研发部门', '/system/user/profile/updateAvatar', '127.0.0.1', '内网IP', '{ }', 0, NULL, '2019-12-16 15:31:33');
INSERT INTO `sys_oper_log` VALUES (194, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateAvatar()', 1, 'admin', '研发部门', '/system/user/profile/updateAvatar', '127.0.0.1', '内网IP', '{ }', 0, NULL, '2019-12-16 15:34:30');
INSERT INTO `sys_oper_log` VALUES (195, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.genCode()', 1, 'admin', '研发部门', '/tool/gen/genCode/biz_order', '127.0.0.1', '内网IP', '{ }', 0, NULL, '2019-12-16 17:11:37');
INSERT INTO `sys_oper_log` VALUES (196, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"2000\" ],\r\n  \"parentId\" : [ \"2020\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"化验信息\" ],\r\n  \"url\" : [ \"/system/bizAssayResult\" ],\r\n  \"perms\" : [ \"system:bizAssayResult:view\" ],\r\n  \"orderNum\" : [ \"5\" ],\r\n  \"icon\" : [ \"#\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', 0, NULL, '2019-12-16 17:23:37');
INSERT INTO `sys_oper_log` VALUES (197, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"2041\" ],\r\n  \"parentId\" : [ \"2020\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"化验单据\" ],\r\n  \"url\" : [ \"/system/bizOrder\" ],\r\n  \"perms\" : [ \"system:bizOrder:view\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"#\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', 0, NULL, '2019-12-16 17:23:50');
INSERT INTO `sys_oper_log` VALUES (198, '化验单据', 1, 'com.ruoyi.web.controller.system.BizOrderController.addSave()', 1, 'admin', '研发部门', '/system/bizOrder/add', '127.0.0.1', '内网IP', '{\r\n  \"orderNo\" : [ \"H001\" ],\r\n  \"reportId\" : [ \"H00120191202\" ],\r\n  \"orderDevice\" : [ \"1\" ],\r\n  \"orderWorks\" : [ \"1\" ],\r\n  \"beginTime\" : [ \"2019-12-02 06:20:05\" ],\r\n  \"endTime\" : [ \"2019-12-02 12:30:11\" ],\r\n  \"orderDate\" : [ \"2019-12-02\" ],\r\n  \"orderMaintainer\" : [ \"于涛\" ],\r\n  \"orderTel\" : [ \"18745773203\" ],\r\n  \"orderResult\" : [ \"0\" ],\r\n  \"createTime\" : [ \"\" ],\r\n  \"createBy\" : [ \"\" ],\r\n  \"updateTime\" : [ \"\" ],\r\n  \"updateBy\" : [ \"\" ]\r\n}', 0, NULL, '2019-12-16 17:24:44');
INSERT INTO `sys_oper_log` VALUES (199, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.genCode()', 1, 'admin', '研发部门', '/tool/gen/genCode/biz_device_maintain', '127.0.0.1', '内网IP', '{ }', 0, NULL, '2019-12-16 17:41:18');
INSERT INTO `sys_oper_log` VALUES (200, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"2046\" ],\r\n  \"parentId\" : [ \"2020\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"设备维护\" ],\r\n  \"url\" : [ \"/system/bizDeviceMaintain\" ],\r\n  \"perms\" : [ \"system:bizDeviceMaintain:view\" ],\r\n  \"orderNum\" : [ \"60\" ],\r\n  \"icon\" : [ \"#\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', 0, NULL, '2019-12-16 17:50:28');
INSERT INTO `sys_oper_log` VALUES (201, '设备维护', 1, 'com.ruoyi.web.controller.system.BizDeviceMaintainController.addSave()', 1, 'admin', '研发部门', '/system/bizDeviceMaintain/add', '127.0.0.1', '内网IP', '{\r\n  \"maintainDevice\" : [ \"1\" ],\r\n  \"maintainWorks\" : [ \"1\" ],\r\n  \"maintainCity\" : [ \"哈尔滨\" ],\r\n  \"maintainReason\" : [ \"下位机失灵\" ],\r\n  \"maintainResult\" : [ \"维护成功\" ],\r\n  \"maintainDate\" : [ \"2019-12-16\" ],\r\n  \"maintainUser\" : [ \"于涛\" ],\r\n  \"maintainTel\" : [ \"18745773203\" ],\r\n  \"createTime\" : [ \"\" ],\r\n  \"createBy\" : [ \"\" ],\r\n  \"updateTime\" : [ \"\" ],\r\n  \"updateBy\" : [ \"\" ]\r\n}', 0, NULL, '2019-12-16 17:51:14');
INSERT INTO `sys_oper_log` VALUES (202, '化验单据', 2, 'com.ruoyi.web.controller.system.BizOrderController.editSave()', 1, 'admin', '研发部门', '/system/bizOrder/edit', '127.0.0.1', '内网IP', '{\r\n  \"orderId\" : [ \"1\" ],\r\n  \"orderNo\" : [ \"H001\" ],\r\n  \"reportId\" : [ \"H00120191202\" ],\r\n  \"orderDevice\" : [ \"1\" ],\r\n  \"orderWorks\" : [ \"1\" ],\r\n  \"beginTime\" : [ \"2019-12-01 11:25:25\" ],\r\n  \"endTime\" : [ \"Mon Dec 02 12:30:11 CST 2019\" ],\r\n  \"orderDate\" : [ \"2019-12-02\" ],\r\n  \"orderMaintainer\" : [ \"于涛\" ],\r\n  \"orderTel\" : [ \"18745773203\" ],\r\n  \"orderResult\" : [ \"0\" ]\r\n}', 0, NULL, '2019-12-17 09:32:59');
INSERT INTO `sys_oper_log` VALUES (203, '化验单据', 2, 'com.ruoyi.web.controller.system.BizOrderController.editSave()', 1, 'admin', '研发部门', '/system/bizOrder/edit', '127.0.0.1', '内网IP', '{\r\n  \"orderId\" : [ \"1\" ],\r\n  \"orderNo\" : [ \"H001\" ],\r\n  \"reportId\" : [ \"H00120191202\" ],\r\n  \"orderDevice\" : [ \"1\" ],\r\n  \"orderWorks\" : [ \"1\" ],\r\n  \"beginTime\" : [ \"Mon Dec 02 06:30:11 CST 2019\" ],\r\n  \"endTime\" : [ \"Mon Dec 02 12:30:11 CST 2019\" ],\r\n  \"orderDate\" : [ \"2019-12-02\" ],\r\n  \"orderMaintainer\" : [ \"于涛\" ],\r\n  \"orderTel\" : [ \"18745773203\" ],\r\n  \"orderResult\" : [ \"0\" ]\r\n}', 0, NULL, '2019-12-17 09:33:14');
INSERT INTO `sys_oper_log` VALUES (204, '化验单据', 2, 'com.ruoyi.web.controller.system.BizOrderController.editSave()', 1, 'admin', '研发部门', '/system/bizOrder/edit', '127.0.0.1', '内网IP', '{\r\n  \"orderId\" : [ \"1\" ],\r\n  \"orderNo\" : [ \"H001\" ],\r\n  \"reportId\" : [ \"H00120191202\" ],\r\n  \"orderDevice\" : [ \"1\" ],\r\n  \"orderWorks\" : [ \"1\" ],\r\n  \"beginTime\" : [ \"2019-12-01 11:25:25\" ],\r\n  \"endTime\" : [ \"Mon Dec 02 12:30:11 CST 2019\" ],\r\n  \"orderDate\" : [ \"2019-12-02\" ],\r\n  \"orderMaintainer\" : [ \"于涛\" ],\r\n  \"orderTel\" : [ \"18745773203\" ],\r\n  \"orderResult\" : [ \"0\" ]\r\n}', 0, NULL, '2019-12-17 10:04:26');
INSERT INTO `sys_oper_log` VALUES (205, '化验单据', 2, 'com.ruoyi.web.controller.system.BizOrderController.editSave()', 1, 'admin', '研发部门', '/system/bizOrder/edit', '127.0.0.1', '内网IP', '{\r\n  \"orderId\" : [ \"1\" ],\r\n  \"orderNo\" : [ \"H001\" ],\r\n  \"reportId\" : [ \"H00120191202\" ],\r\n  \"orderDevice\" : [ \"1\" ],\r\n  \"orderWorks\" : [ \"1\" ],\r\n  \"beginTime\" : [ \"2019-12-03 11:25:25\" ],\r\n  \"endTime\" : [ \"Mon Dec 02 12:30:11 CST 2019\" ],\r\n  \"orderDate\" : [ \"2019-12-02\" ],\r\n  \"orderMaintainer\" : [ \"于涛\" ],\r\n  \"orderTel\" : [ \"18745773203\" ],\r\n  \"orderResult\" : [ \"0\" ]\r\n}', 0, NULL, '2019-12-17 10:04:33');
INSERT INTO `sys_oper_log` VALUES (206, '化验单据', 2, 'com.ruoyi.web.controller.system.BizOrderController.editSave()', 1, 'admin', '研发部门', '/system/bizOrder/edit', '127.0.0.1', '内网IP', '{\r\n  \"orderId\" : [ \"1\" ],\r\n  \"orderNo\" : [ \"H001\" ],\r\n  \"reportId\" : [ \"H00120191202\" ],\r\n  \"orderDevice\" : [ \"1\" ],\r\n  \"orderWorks\" : [ \"1\" ],\r\n  \"beginTime\" : [ \"2019-12-02 06:25:25\" ],\r\n  \"endTime\" : [ \"Mon Dec 02 12:30:11 CST 2019\" ],\r\n  \"orderDate\" : [ \"2019-12-02\" ],\r\n  \"orderMaintainer\" : [ \"于涛\" ],\r\n  \"orderTel\" : [ \"18745773203\" ],\r\n  \"orderResult\" : [ \"0\" ]\r\n}', 0, NULL, '2019-12-17 10:04:49');
INSERT INTO `sys_oper_log` VALUES (207, '化验结果', 2, 'com.ruoyi.web.controller.system.BizAssayResultController.editSave()', 1, 'admin', '研发部门', '/system/bizAssayResult/edit', '127.0.0.1', '内网IP', '{\r\n  \"resultId\" : [ \"1\" ],\r\n  \"reportId\" : [ \"H00120191202\" ],\r\n  \"resultNo\" : [ \"H001\" ],\r\n  \"inCod\" : [ \"16.02\" ],\r\n  \"inTp\" : [ \"41.0\" ],\r\n  \"inTn\" : [ \"40.0\" ],\r\n  \"inNh3\" : [ \"6.0\" ],\r\n  \"outCod\" : [ \"4.0\" ],\r\n  \"outTp\" : [ \"21.0\" ],\r\n  \"outTn\" : [ \"30.0\" ],\r\n  \"outNh3\" : [ \"100.0\" ]\r\n}', 0, NULL, '2019-12-17 10:12:26');
INSERT INTO `sys_oper_log` VALUES (208, '化验结果', 2, 'com.ruoyi.web.controller.system.BizAssayResultController.editSave()', 1, 'admin', '研发部门', '/system/bizAssayResult/edit', '127.0.0.1', '内网IP', '{\r\n  \"resultId\" : [ \"1\" ],\r\n  \"reportId\" : [ \"H00120191202\" ],\r\n  \"resultNo\" : [ \"H001\" ],\r\n  \"inCod\" : [ \"16.02\" ],\r\n  \"inTp\" : [ \"41.0\" ],\r\n  \"inTn\" : [ \"40.0\" ],\r\n  \"inNh3\" : [ \"6.0\" ],\r\n  \"outCod\" : [ \"4.0\" ],\r\n  \"outTp\" : [ \"21.0\" ],\r\n  \"outTn\" : [ \"30.0\" ],\r\n  \"outNh3\" : [ \"40.0\" ]\r\n}', 0, NULL, '2019-12-17 10:17:34');
INSERT INTO `sys_oper_log` VALUES (209, '化验结果', 2, 'com.ruoyi.web.controller.system.BizAssayResultController.editSave()', 1, 'admin', '研发部门', '/system/bizAssayResult/edit', '127.0.0.1', '内网IP', '{\r\n  \"resultId\" : [ \"1\" ],\r\n  \"reportId\" : [ \"H00120191202\" ],\r\n  \"resultNo\" : [ \"H001\" ],\r\n  \"inCod\" : [ \"16.02\" ],\r\n  \"inTp\" : [ \"41.0\" ],\r\n  \"inTn\" : [ \"40.0\" ],\r\n  \"inNh3\" : [ \"6.0\" ],\r\n  \"outCod\" : [ \"4.0\" ],\r\n  \"outTp\" : [ \"21.0\" ],\r\n  \"outTn\" : [ \"30.0\" ],\r\n  \"outNh3\" : [ \"30.0\" ]\r\n}', 0, NULL, '2019-12-17 10:23:14');
INSERT INTO `sys_oper_log` VALUES (210, '化验结果', 2, 'com.ruoyi.web.controller.system.BizAssayResultController.editSave()', 1, 'admin', '研发部门', '/system/bizAssayResult/edit', '127.0.0.1', '内网IP', '{\r\n  \"resultId\" : [ \"1\" ],\r\n  \"reportId\" : [ \"H00120191202\" ],\r\n  \"resultNo\" : [ \"H001\" ],\r\n  \"inCod\" : [ \"16.02\" ],\r\n  \"inTp\" : [ \"41.0\" ],\r\n  \"inTn\" : [ \"40.0\" ],\r\n  \"inNh3\" : [ \"6.0\" ],\r\n  \"outCod\" : [ \"4.0\" ],\r\n  \"outTp\" : [ \"21.0\" ],\r\n  \"outTn\" : [ \"30.0\" ],\r\n  \"outNh3\" : [ \"20.0\" ]\r\n}', 0, NULL, '2019-12-17 10:23:58');
INSERT INTO `sys_oper_log` VALUES (211, '化验单据', 2, 'com.ruoyi.web.controller.system.BizOrderController.editSave()', 1, 'admin', '研发部门', '/system/bizOrder/edit', '127.0.0.1', '内网IP', '{\r\n  \"orderId\" : [ \"1\" ],\r\n  \"orderNo\" : [ \"H001\" ],\r\n  \"reportId\" : [ \"H00120191202\" ],\r\n  \"orderDevice\" : [ \"1\" ],\r\n  \"orderWorks\" : [ \"1\" ],\r\n  \"beginTime\" : [ \"2019-12-03 06:25:25\" ],\r\n  \"endTime\" : [ \"2019-12-03 12:30:11\" ],\r\n  \"orderDate\" : [ \"2019-12-02\" ],\r\n  \"orderMaintainer\" : [ \"于涛\" ],\r\n  \"orderTel\" : [ \"18745773203\" ],\r\n  \"orderResult\" : [ \"0\" ]\r\n}', 0, NULL, '2019-12-17 11:02:58');
INSERT INTO `sys_oper_log` VALUES (212, '化验单据', 2, 'com.ruoyi.web.controller.system.BizOrderController.editSave()', 1, 'admin', '研发部门', '/system/bizOrder/edit', '127.0.0.1', '内网IP', '{\r\n  \"orderId\" : [ \"1\" ],\r\n  \"orderNo\" : [ \"H001\" ],\r\n  \"reportId\" : [ \"H00120191202\" ],\r\n  \"orderDevice\" : [ \"\" ],\r\n  \"orderWorks\" : [ \"1\" ],\r\n  \"beginTime\" : [ \"2019-12-03 06:25:25\" ],\r\n  \"endTime\" : [ \"2019-12-03 12:30:11\" ],\r\n  \"orderDate\" : [ \"2019-12-02\" ],\r\n  \"orderMaintainer\" : [ \"于涛\" ],\r\n  \"orderTel\" : [ \"18745773203\" ],\r\n  \"orderResult\" : [ \"0\" ]\r\n}', 0, NULL, '2019-12-17 11:03:55');
INSERT INTO `sys_oper_log` VALUES (213, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 1, 'admin', '研发部门', '/system/menu/remove/104', '127.0.0.1', '内网IP', '{ }', 0, NULL, '2019-12-17 13:53:22');
INSERT INTO `sys_oper_log` VALUES (214, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 1, 'admin', '研发部门', '/system/menu/remove/1020', '127.0.0.1', '内网IP', '{ }', 0, NULL, '2019-12-17 13:53:28');
INSERT INTO `sys_oper_log` VALUES (215, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 1, 'admin', '研发部门', '/system/menu/remove/1024', '127.0.0.1', '内网IP', '{ }', 0, NULL, '2019-12-17 13:53:37');
INSERT INTO `sys_oper_log` VALUES (216, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 1, 'admin', '研发部门', '/system/menu/remove/104', '127.0.0.1', '内网IP', '{ }', 0, NULL, '2019-12-17 13:53:47');
INSERT INTO `sys_oper_log` VALUES (217, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 1, 'admin', '研发部门', '/system/menu/remove/1023', '127.0.0.1', '内网IP', '{ }', 0, NULL, '2019-12-17 13:54:03');
INSERT INTO `sys_oper_log` VALUES (218, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.editSave()', 1, 'admin', '研发部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\r\n  \"userId\" : [ \"2\" ],\r\n  \"deptId\" : [ \"105\" ],\r\n  \"userName\" : [ \"于涛\" ],\r\n  \"dept.deptName\" : [ \"测试部门\" ],\r\n  \"phonenumber\" : [ \"15666666666\" ],\r\n  \"email\" : [ \"ry@qq.com\" ],\r\n  \"loginName\" : [ \"yutao\" ],\r\n  \"sex\" : [ \"1\" ],\r\n  \"role\" : [ \"2\" ],\r\n  \"remark\" : [ \"测试员\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"roleIds\" : [ \"2\" ]\r\n}', 0, NULL, '2019-12-17 13:54:32');
INSERT INTO `sys_oper_log` VALUES (219, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\r\n  \"roleId\" : [ \"2\" ],\r\n  \"roleName\" : [ \"普通角色\" ],\r\n  \"roleKey\" : [ \"common\" ],\r\n  \"roleSort\" : [ \"2\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"普通角色\" ],\r\n  \"menuIds\" : [ \"1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,1055,111,112,3,113,114,1056,1057,115\" ]\r\n}', 0, NULL, '2019-12-17 13:55:24');
INSERT INTO `sys_oper_log` VALUES (220, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 1, 'admin', '研发部门', '/system/menu/remove/1023', '127.0.0.1', '内网IP', '{ }', 0, NULL, '2019-12-17 13:55:35');
INSERT INTO `sys_oper_log` VALUES (221, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 1, 'admin', '研发部门', '/system/menu/remove/1024', '127.0.0.1', '内网IP', '{ }', 0, NULL, '2019-12-17 13:55:42');
INSERT INTO `sys_oper_log` VALUES (222, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 1, 'admin', '研发部门', '/system/menu/remove/1022', '127.0.0.1', '内网IP', '{ }', 0, NULL, '2019-12-17 13:55:47');
INSERT INTO `sys_oper_log` VALUES (223, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 1, 'admin', '研发部门', '/system/menu/remove/1021', '127.0.0.1', '内网IP', '{ }', 0, NULL, '2019-12-17 13:55:52');
INSERT INTO `sys_oper_log` VALUES (224, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 1, 'admin', '研发部门', '/system/menu/remove/1020', '127.0.0.1', '内网IP', '{ }', 0, NULL, '2019-12-17 13:55:57');
INSERT INTO `sys_oper_log` VALUES (225, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 1, 'admin', '研发部门', '/system/menu/remove/104', '127.0.0.1', '内网IP', '{ }', 0, NULL, '2019-12-17 13:56:02');
INSERT INTO `sys_oper_log` VALUES (226, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.editSave()', 1, 'admin', '研发部门', '/system/dept/edit', '127.0.0.1', '内网IP', '{\r\n  \"deptId\" : [ \"100\" ],\r\n  \"parentId\" : [ \"0\" ],\r\n  \"parentName\" : [ \"无\" ],\r\n  \"deptName\" : [ \"程天科技\" ],\r\n  \"orderNum\" : [ \"0\" ],\r\n  \"leader\" : [ \"于涛\" ],\r\n  \"phone\" : [ \"15888888888\" ],\r\n  \"email\" : [ \"xxx@qq.com\" ],\r\n  \"status\" : [ \"0\" ]\r\n}', 0, NULL, '2019-12-17 13:56:37');
INSERT INTO `sys_oper_log` VALUES (227, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 1, 'yutao', '测试部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\r\n  \"roleId\" : [ \"2\" ],\r\n  \"roleName\" : [ \"普通角色\" ],\r\n  \"roleKey\" : [ \"common\" ],\r\n  \"roleSort\" : [ \"2\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"普通角色\" ],\r\n  \"menuIds\" : [ \"1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,1042,501,1043,1044,1045,2020,2041,2042,2043,2044,2045,2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2021,2022,2023,2024,2025,2015,2016,2017,2018,2019,2026,2027,2028,2029,2030,2031,2032,2033,2034,2035,2046,2047,2048,2049,2050,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,1055,111,112,3,113,114,1056,1057,115\" ]\r\n}', 0, NULL, '2019-12-17 14:04:16');
INSERT INTO `sys_oper_log` VALUES (228, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 1, 'yutao', '测试部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\r\n  \"roleId\" : [ \"2\" ],\r\n  \"roleName\" : [ \"普通角色\" ],\r\n  \"roleKey\" : [ \"common\" ],\r\n  \"roleSort\" : [ \"2\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"普通角色\" ],\r\n  \"menuIds\" : [ \"1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,1042,501,1043,1044,1045,2020,2041,2042,2043,2044,2045,2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2021,2022,2023,2024,2025,2015,2016,2017,2018,2019,2026,2027,2028,2029,2030,2031,2032,2033,2034,2035,2046,2047,2048,2049,2050\" ]\r\n}', 0, NULL, '2019-12-17 14:04:32');
INSERT INTO `sys_oper_log` VALUES (229, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 1, 'yutao', '测试部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\r\n  \"roleId\" : [ \"2\" ],\r\n  \"roleName\" : [ \"普通角色\" ],\r\n  \"roleKey\" : [ \"common\" ],\r\n  \"roleSort\" : [ \"2\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"普通角色\" ],\r\n  \"menuIds\" : [ \"1,100,1000,1001,1002,1003,1004,1005,1006,105,1025,1026,1027,1028,1029,2020,2041,2042,2043,2044,2045,2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2021,2022,2023,2024,2025,2015,2016,2017,2018,2019,2026,2027,2028,2029,2030,2031,2032,2033,2034,2035,2046,2047,2048,2049,2050\" ]\r\n}', 0, NULL, '2019-12-17 14:04:52');
INSERT INTO `sys_oper_log` VALUES (230, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\r\n  \"roleId\" : [ \"2\" ],\r\n  \"roleName\" : [ \"普通角色\" ],\r\n  \"roleKey\" : [ \"common\" ],\r\n  \"roleSort\" : [ \"2\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"普通角色\" ],\r\n  \"menuIds\" : [ \"1,100,1000,1001,1002,1003,1004,1005,1006,105,1025,1026,1027,1028,1029,2020,2041,2042,2043,2044,2045,2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2021,2022,2023,2024,2025,2015,2016,2017,2018,2019,2026,2027,2028,2029,2030,2031,2032,2033,2034,2035,2046,2047,2048,2049,2050\" ]\r\n}', 0, NULL, '2019-12-17 14:16:38');
INSERT INTO `sys_oper_log` VALUES (231, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\r\n  \"roleId\" : [ \"2\" ],\r\n  \"roleName\" : [ \"普通角色\" ],\r\n  \"roleKey\" : [ \"common\" ],\r\n  \"roleSort\" : [ \"2\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"普通角色\" ],\r\n  \"menuIds\" : [ \"1,100,1000,1001,1002,1003,1004,1005,1006,105,1025,1026,1027,1028,1029,2020,2041,2042,2043,2044,2045,2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2021,2022,2023,2024,2025,2015,2016,2017,2018,2019,2026,2027,2028,2029,2030,2031,2032,2033,2034,2035,2046,2047,2048,2049,2050\" ]\r\n}', 0, NULL, '2019-12-17 14:16:56');
INSERT INTO `sys_oper_log` VALUES (232, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 1, 'admin', '研发部门', '/system/dept/remove/108', '127.0.0.1', '内网IP', '{ }', 0, NULL, '2019-12-17 15:23:09');
INSERT INTO `sys_oper_log` VALUES (233, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 1, 'admin', '研发部门', '/system/dept/remove/109', '127.0.0.1', '内网IP', '{ }', 0, NULL, '2019-12-17 15:23:12');
INSERT INTO `sys_oper_log` VALUES (234, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.editSave()', 1, 'admin', '研发部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\r\n  \"userId\" : [ \"2\" ],\r\n  \"deptId\" : [ \"102\" ],\r\n  \"userName\" : [ \"于涛\" ],\r\n  \"dept.deptName\" : [ \"长沙分公司\" ],\r\n  \"phonenumber\" : [ \"15666666666\" ],\r\n  \"email\" : [ \"ry@qq.com\" ],\r\n  \"loginName\" : [ \"yutao\" ],\r\n  \"sex\" : [ \"1\" ],\r\n  \"role\" : [ \"2\" ],\r\n  \"remark\" : [ \"测试员\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"roleIds\" : [ \"2\" ]\r\n}', 0, NULL, '2019-12-17 15:23:23');
INSERT INTO `sys_oper_log` VALUES (235, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.editSave()', 1, 'admin', '研发部门', '/system/dept/edit', '127.0.0.1', '内网IP', '{\r\n  \"deptId\" : [ \"100\" ],\r\n  \"parentId\" : [ \"0\" ],\r\n  \"parentName\" : [ \"无\" ],\r\n  \"deptName\" : [ \"跃渊智能\" ],\r\n  \"orderNum\" : [ \"0\" ],\r\n  \"leader\" : [ \"于涛\" ],\r\n  \"phone\" : [ \"15888888888\" ],\r\n  \"email\" : [ \"xxx@qq.com\" ],\r\n  \"status\" : [ \"0\" ]\r\n}', 0, NULL, '2019-12-17 15:24:17');
INSERT INTO `sys_oper_log` VALUES (236, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.editSave()', 1, 'admin', '研发部门', '/system/dept/edit', '127.0.0.1', '内网IP', '{\r\n  \"deptId\" : [ \"101\" ],\r\n  \"parentId\" : [ \"100\" ],\r\n  \"parentName\" : [ \"跃渊智能\" ],\r\n  \"deptName\" : [ \"龙江环保\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"leader\" : [ \"若依\" ],\r\n  \"phone\" : [ \"15888888888\" ],\r\n  \"email\" : [ \"ry@qq.com\" ],\r\n  \"status\" : [ \"0\" ]\r\n}', 0, NULL, '2019-12-17 15:24:35');
INSERT INTO `sys_oper_log` VALUES (237, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 1, 'admin', '研发部门', '/system/dept/remove/106', '127.0.0.1', '内网IP', '{ }', 0, NULL, '2019-12-17 15:24:39');
INSERT INTO `sys_oper_log` VALUES (238, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 1, 'admin', '研发部门', '/system/dept/remove/107', '127.0.0.1', '内网IP', '{ }', 0, NULL, '2019-12-17 15:24:42');
INSERT INTO `sys_oper_log` VALUES (239, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.editSave()', 1, 'admin', '研发部门', '/system/dept/edit', '127.0.0.1', '内网IP', '{\r\n  \"deptId\" : [ \"103\" ],\r\n  \"parentId\" : [ \"101\" ],\r\n  \"parentName\" : [ \"龙江环保\" ],\r\n  \"deptName\" : [ \"信义水厂\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"leader\" : [ \"若依\" ],\r\n  \"phone\" : [ \"15888888888\" ],\r\n  \"email\" : [ \"ry@qq.com\" ],\r\n  \"status\" : [ \"0\" ]\r\n}', 0, NULL, '2019-12-17 15:25:02');
INSERT INTO `sys_oper_log` VALUES (240, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 1, 'admin', '研发部门', '/system/dept/remove/104', '127.0.0.1', '内网IP', '{ }', 0, NULL, '2019-12-17 15:25:05');
INSERT INTO `sys_oper_log` VALUES (241, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.editSave()', 1, 'admin', '研发部门', '/system/dept/edit', '127.0.0.1', '内网IP', '{\r\n  \"deptId\" : [ \"105\" ],\r\n  \"parentId\" : [ \"101\" ],\r\n  \"parentName\" : [ \"龙江环保\" ],\r\n  \"deptName\" : [ \"文昌水厂\" ],\r\n  \"orderNum\" : [ \"3\" ],\r\n  \"leader\" : [ \"若依\" ],\r\n  \"phone\" : [ \"15888888888\" ],\r\n  \"email\" : [ \"ry@qq.com\" ],\r\n  \"status\" : [ \"0\" ]\r\n}', 0, NULL, '2019-12-17 15:25:43');
INSERT INTO `sys_oper_log` VALUES (242, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.editSave()', 1, 'admin', '研发部门', '/system/dept/edit', '127.0.0.1', '内网IP', '{\r\n  \"deptId\" : [ \"102\" ],\r\n  \"parentId\" : [ \"100\" ],\r\n  \"parentName\" : [ \"跃渊智能\" ],\r\n  \"deptName\" : [ \"哈尔滨临时水厂\" ],\r\n  \"orderNum\" : [ \"2\" ],\r\n  \"leader\" : [ \"若依\" ],\r\n  \"phone\" : [ \"15888888888\" ],\r\n  \"email\" : [ \"ry@qq.com\" ],\r\n  \"status\" : [ \"0\" ]\r\n}', 0, NULL, '2019-12-17 15:25:54');
INSERT INTO `sys_oper_log` VALUES (243, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 1, 'admin', '信义水厂', '/system/role/edit', '127.0.0.1', '内网IP', '{\r\n  \"roleId\" : [ \"1\" ],\r\n  \"roleName\" : [ \"集团管理人员\" ],\r\n  \"roleKey\" : [ \"admin\" ],\r\n  \"roleSort\" : [ \"1\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"管理员\" ],\r\n  \"menuIds\" : [ \"\" ]\r\n}', 0, NULL, '2019-12-17 16:11:23');
INSERT INTO `sys_oper_log` VALUES (244, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 1, 'admin', '信义水厂', '/system/role/edit', '127.0.0.1', '内网IP', '{\r\n  \"roleId\" : [ \"2\" ],\r\n  \"roleName\" : [ \"系统管理人员\" ],\r\n  \"roleKey\" : [ \"common\" ],\r\n  \"roleSort\" : [ \"2\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"普通角色\" ],\r\n  \"menuIds\" : [ \"1,100,1000,1001,1002,1003,1004,1005,1006,105,1025,1026,1027,1028,1029,2020,2041,2042,2043,2044,2045,2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2021,2022,2023,2024,2025,2015,2016,2017,2018,2019,2026,2027,2028,2029,2030,2031,2032,2033,2034,2035,2046,2047,2048,2049,2050\" ]\r\n}', 0, NULL, '2019-12-17 16:11:31');
INSERT INTO `sys_oper_log` VALUES (245, '药剂', 2, 'com.ruoyi.web.controller.system.BizAgentiaController.editSave()', 1, 'admin', '信义水厂', '/system/bizAgentia/edit', '127.0.0.1', '内网IP', '{\r\n  \"agentiaId\" : [ \"1\" ],\r\n  \"agentiaNo\" : [ \"001\" ],\r\n  \"agentiaName\" : [ \"酒石酸钾钠\" ],\r\n  \"agentiaDevice\" : [ \"1\" ],\r\n  \"agentiaTotal\" : [ \"100.0\" ],\r\n  \"agentiaRemain\" : [ \"50.0\" ],\r\n  \"agentiaAlert\" : [ \"20.0\" ],\r\n  \"agentiaType\" : [ \"1\" ],\r\n  \"agentiaMaker\" : [ \"程天科技\" ],\r\n  \"agentiaStatus\" : [ \"0\" ],\r\n  \"useTime\" : [ \"2019-12-14 14:42:04\" ],\r\n  \"lastRepairTime\" : [ \"\" ],\r\n  \"repairTime\" : [ \"\" ],\r\n  \"repairBy\" : [ \"\" ]\r\n}', 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Incorrect datetime value: \'\' for column \'last_repair_time\' at row 1\r\n### The error may involve com.ruoyi.system.mapper.BizAgentiaMapper.updateBizAgentia-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update biz_agentia          SET agentia_no = ?,             agentia_name = ?,             agentia_device = ?,             agentia_total = ?,             agentia_remain = ?,             agentia_alert = ?,             agentia_type = ?,             agentia_maker = ?,             agentia_status = ?,             use_time = ?,             last_repair_time = ?,             repair_time = ?,                                       update_time = sysdate()          where agentia_id = ?\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Incorrect datetime value: \'\' for column \'last_repair_time\' at row 1\n; Data truncation: Incorrect datetime value: \'\' for column \'last_repair_time\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Incorrect datetime value: \'\' for column \'last_repair_time\' at row 1', '2019-12-17 16:12:05');
INSERT INTO `sys_oper_log` VALUES (246, '药剂', 2, 'com.ruoyi.web.controller.system.BizAgentiaController.editSave()', 1, 'admin', '信义水厂', '/system/bizAgentia/edit', '127.0.0.1', '内网IP', '{\r\n  \"agentiaId\" : [ \"1\" ],\r\n  \"agentiaNo\" : [ \"001\" ],\r\n  \"agentiaName\" : [ \"酒石酸钾钠\" ],\r\n  \"agentiaDevice\" : [ \"1\" ],\r\n  \"agentiaTotal\" : [ \"100.0\" ],\r\n  \"agentiaRemain\" : [ \"50.0\" ],\r\n  \"agentiaAlert\" : [ \"20.0\" ],\r\n  \"agentiaType\" : [ \"1\" ],\r\n  \"agentiaMaker\" : [ \"程天科技\" ],\r\n  \"agentiaStatus\" : [ \"0\" ]\r\n}', 0, NULL, '2019-12-17 16:12:52');
INSERT INTO `sys_oper_log` VALUES (247, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateAvatar()', 1, 'admin', '信义水厂', '/water/system/user/profile/updateAvatar', '113.0.28.155', '黑龙江 哈尔滨', '{ }', 0, NULL, '2019-12-18 18:00:37');
INSERT INTO `sys_oper_log` VALUES (248, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateAvatar()', 1, 'admin', '信义水厂', '/water/system/user/profile/updateAvatar', '219.217.246.243', 'XX XX', '{ }', 0, NULL, '2019-12-23 14:42:14');
INSERT INTO `sys_oper_log` VALUES (249, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateAvatar()', 1, 'admin', '信义水厂', '/water/system/user/profile/updateAvatar', '219.217.246.243', 'XX XX', '{ }', 0, NULL, '2019-12-23 14:42:43');
INSERT INTO `sys_oper_log` VALUES (250, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateAvatar()', 1, 'admin', '信义水厂', '/system/user/profile/updateAvatar', '127.0.0.1', '内网IP', '{ }', 0, NULL, '2019-12-23 15:06:12');
INSERT INTO `sys_oper_log` VALUES (251, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateAvatar()', 1, 'admin', '信义水厂', '/system/user/profile/updateAvatar', '127.0.0.1', '内网IP', '{ }', 0, NULL, '2019-12-23 15:07:43');
INSERT INTO `sys_oper_log` VALUES (252, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateAvatar()', 1, 'admin', '信义水厂', '/system/user/profile/updateAvatar', '127.0.0.1', '内网IP', '{ }', 0, NULL, '2019-12-23 15:10:02');
INSERT INTO `sys_oper_log` VALUES (253, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateAvatar()', 1, 'admin', '信义水厂', '/water/system/user/profile/updateAvatar', '219.217.246.243', 'XX XX', '{ }', 0, NULL, '2019-12-23 15:19:10');
INSERT INTO `sys_oper_log` VALUES (254, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateAvatar()', 1, 'admin', '信义水厂', '/water/system/user/profile/updateAvatar', '219.217.246.243', 'XX XX', '{ }', 0, NULL, '2019-12-23 15:33:08');
INSERT INTO `sys_oper_log` VALUES (255, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateAvatar()', 1, 'admin', '信义水厂', '/water/system/user/profile/updateAvatar', '219.217.246.243', 'XX XX', '{ }', 0, NULL, '2019-12-23 15:40:29');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');

-- ----------------------------
-- Table structure for sys_region
-- ----------------------------
DROP TABLE IF EXISTS `sys_region`;
CREATE TABLE `sys_region`  (
  `region_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `region_cod` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '地区代码',
  `region_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '地区名称',
  `parent_id` bigint(20) NOT NULL COMMENT '父级地区',
  `region_level` int(11) NULL DEFAULT NULL COMMENT '地区等级',
  `region_sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `name_en` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '英文名称',
  `region_nation` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'CN' COMMENT '国家',
  PRIMARY KEY (`region_id`) USING BTREE,
  UNIQUE INDEX `IDX_REGION_CODE`(`region_cod`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5001 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '地区（省市区）表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_region
-- ----------------------------
INSERT INTO `sys_region` VALUES (1, '100000', '中国', 0, 0, 0, 'Zhong Guo', 'CN');
INSERT INTO `sys_region` VALUES (2, '110000', '北京市', 1, 1, 0, 'Beijing Shi', 'CN');
INSERT INTO `sys_region` VALUES (3, '120000', '天津市', 1, 1, 0, 'Tianjin Shi', 'CN');
INSERT INTO `sys_region` VALUES (4, '130000', '河北', 1, 1, 0, 'Hebei Sheng', 'CN');
INSERT INTO `sys_region` VALUES (5, '140000', '山西', 1, 1, 0, 'Shanxi Sheng ', 'CN');
INSERT INTO `sys_region` VALUES (6, '150000', '内蒙古自治区', 1, 1, 0, 'Nei Mongol Zizhiqu', 'CN');
INSERT INTO `sys_region` VALUES (7, '210000', '辽宁', 1, 1, 0, 'Liaoning Sheng', 'CN');
INSERT INTO `sys_region` VALUES (8, '220000', '吉林', 1, 1, 0, 'Jilin Sheng', 'CN');
INSERT INTO `sys_region` VALUES (9, '230000', '黑龙江', 1, 1, 0, 'Heilongjiang Sheng', 'CN');
INSERT INTO `sys_region` VALUES (10, '310000', '上海市', 1, 1, 0, 'Shanghai Shi', 'CN');
INSERT INTO `sys_region` VALUES (11, '320000', '江苏', 1, 1, 0, 'Jiangsu Sheng', 'CN');
INSERT INTO `sys_region` VALUES (12, '330000', '浙江', 1, 1, 0, 'Zhejiang Sheng', 'CN');
INSERT INTO `sys_region` VALUES (13, '340000', '安徽', 1, 1, 0, 'Anhui Sheng', 'CN');
INSERT INTO `sys_region` VALUES (14, '350000', '福建', 1, 1, 0, 'Fujian Sheng ', 'CN');
INSERT INTO `sys_region` VALUES (15, '360000', '江西', 1, 1, 0, 'Jiangxi Sheng', 'CN');
INSERT INTO `sys_region` VALUES (16, '370000', '山东', 1, 1, 0, 'Shandong Sheng ', 'CN');
INSERT INTO `sys_region` VALUES (17, '410000', '河南', 1, 1, 0, 'Henan Sheng', 'CN');
INSERT INTO `sys_region` VALUES (18, '420000', '湖北', 1, 1, 0, 'Hubei Sheng', 'CN');
INSERT INTO `sys_region` VALUES (19, '430000', '湖南', 1, 1, 0, 'Hunan Sheng', 'CN');
INSERT INTO `sys_region` VALUES (20, '440000', '广东', 1, 1, 0, 'Guangdong Sheng', 'CN');
INSERT INTO `sys_region` VALUES (21, '450000', '广西壮族自治区', 1, 1, 0, 'Guangxi Zhuangzu Zizhiqu', 'CN');
INSERT INTO `sys_region` VALUES (22, '460000', '海南', 1, 1, 0, 'Hainan Sheng', 'CN');
INSERT INTO `sys_region` VALUES (23, '500000', '重庆市', 1, 1, 0, 'Chongqing Shi', 'CN');
INSERT INTO `sys_region` VALUES (24, '510000', '四川', 1, 1, 0, 'Sichuan Sheng', 'CN');
INSERT INTO `sys_region` VALUES (25, '520000', '贵州', 1, 1, 0, 'Guizhou Sheng', 'CN');
INSERT INTO `sys_region` VALUES (26, '530000', '云南', 1, 1, 0, 'Yunnan Sheng', 'CN');
INSERT INTO `sys_region` VALUES (27, '540000', '西藏自治区', 1, 1, 0, 'Xizang Zizhiqu', 'CN');
INSERT INTO `sys_region` VALUES (28, '610000', '陕西', 1, 1, 0, 'Shanxi Sheng ', 'CN');
INSERT INTO `sys_region` VALUES (29, '620000', '甘肃', 1, 1, 0, 'Gansu Sheng', 'CN');
INSERT INTO `sys_region` VALUES (30, '630000', '青海', 1, 1, 0, 'Qinghai Sheng', 'CN');
INSERT INTO `sys_region` VALUES (31, '640000', '宁夏回族自治区', 1, 1, 0, 'Ningxia Huizu Zizhiqu', 'CN');
INSERT INTO `sys_region` VALUES (32, '650000', '新疆维吾尔自治区', 1, 1, 0, 'Xinjiang Uygur Zizhiqu', 'CN');
INSERT INTO `sys_region` VALUES (33, '110100', '北京市', 2, 2, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (34, '110200', '县', 2, 2, 0, 'Xian', 'CN');
INSERT INTO `sys_region` VALUES (35, '120100', '天津市', 3, 2, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (36, '120200', '县', 3, 2, 0, 'Xian', 'CN');
INSERT INTO `sys_region` VALUES (37, '130100', '石家庄市', 4, 2, 0, 'Shijiazhuang Shi', 'CN');
INSERT INTO `sys_region` VALUES (38, '130200', '唐山市', 4, 2, 0, 'Tangshan Shi', 'CN');
INSERT INTO `sys_region` VALUES (39, '130300', '秦皇岛市', 4, 2, 0, 'Qinhuangdao Shi', 'CN');
INSERT INTO `sys_region` VALUES (40, '130400', '邯郸市', 4, 2, 0, 'Handan Shi', 'CN');
INSERT INTO `sys_region` VALUES (41, '130500', '邢台市', 4, 2, 0, 'Xingtai Shi', 'CN');
INSERT INTO `sys_region` VALUES (42, '130600', '保定市', 4, 2, 0, 'Baoding Shi', 'CN');
INSERT INTO `sys_region` VALUES (43, '130700', '张家口市', 4, 2, 0, 'Zhangjiakou Shi ', 'CN');
INSERT INTO `sys_region` VALUES (44, '130800', '承德市', 4, 2, 0, 'Chengde Shi', 'CN');
INSERT INTO `sys_region` VALUES (45, '130900', '沧州市', 4, 2, 0, 'Cangzhou Shi', 'CN');
INSERT INTO `sys_region` VALUES (46, '131000', '廊坊市', 4, 2, 0, 'Langfang Shi', 'CN');
INSERT INTO `sys_region` VALUES (47, '131100', '衡水市', 4, 2, 0, 'Hengshui Shi ', 'CN');
INSERT INTO `sys_region` VALUES (48, '140100', '太原市', 5, 2, 0, 'Taiyuan Shi', 'CN');
INSERT INTO `sys_region` VALUES (49, '140200', '大同市', 5, 2, 0, 'Datong Shi ', 'CN');
INSERT INTO `sys_region` VALUES (50, '140300', '阳泉市', 5, 2, 0, 'Yangquan Shi', 'CN');
INSERT INTO `sys_region` VALUES (51, '140400', '长治市', 5, 2, 0, 'Changzhi Shi', 'CN');
INSERT INTO `sys_region` VALUES (52, '140500', '晋城市', 5, 2, 0, 'Jincheng Shi ', 'CN');
INSERT INTO `sys_region` VALUES (53, '140600', '朔州市', 5, 2, 0, 'Shuozhou Shi ', 'CN');
INSERT INTO `sys_region` VALUES (54, '140700', '晋中市', 5, 2, 0, 'Jinzhong Shi', 'CN');
INSERT INTO `sys_region` VALUES (55, '140800', '运城市', 5, 2, 0, 'Yuncheng Shi', 'CN');
INSERT INTO `sys_region` VALUES (56, '140900', '忻州市', 5, 2, 0, 'Xinzhou Shi', 'CN');
INSERT INTO `sys_region` VALUES (57, '141000', '临汾市', 5, 2, 0, 'Linfen Shi', 'CN');
INSERT INTO `sys_region` VALUES (58, '141100', '吕梁市', 5, 2, 0, 'Lvliang Shi', 'CN');
INSERT INTO `sys_region` VALUES (59, '150100', '呼和浩特市', 6, 2, 0, 'Hohhot Shi', 'CN');
INSERT INTO `sys_region` VALUES (60, '150200', '包头市', 6, 2, 0, 'Baotou Shi ', 'CN');
INSERT INTO `sys_region` VALUES (61, '150300', '乌海市', 6, 2, 0, 'Wuhai Shi', 'CN');
INSERT INTO `sys_region` VALUES (62, '150400', '赤峰市', 6, 2, 0, 'Chifeng (Ulanhad)Shi', 'CN');
INSERT INTO `sys_region` VALUES (63, '150500', '通辽市', 6, 2, 0, 'Tongliao Shi', 'CN');
INSERT INTO `sys_region` VALUES (64, '150600', '鄂尔多斯市', 6, 2, 0, 'Eerduosi Shi', 'CN');
INSERT INTO `sys_region` VALUES (65, '150700', '呼伦贝尔市', 6, 2, 0, 'Hulunbeier Shi ', 'CN');
INSERT INTO `sys_region` VALUES (66, '150800', '巴彦淖尔市', 6, 2, 0, 'Bayannaoer Shi', 'CN');
INSERT INTO `sys_region` VALUES (67, '150900', '乌兰察布市', 6, 2, 0, 'Wulanchabu Shi', 'CN');
INSERT INTO `sys_region` VALUES (68, '152200', '兴安盟', 6, 2, 0, 'Hinggan Meng', 'CN');
INSERT INTO `sys_region` VALUES (69, '152500', '锡林郭勒盟', 6, 2, 0, 'Xilin Gol Meng', 'CN');
INSERT INTO `sys_region` VALUES (70, '152900', '阿拉善盟', 6, 2, 0, 'Alxa Meng', 'CN');
INSERT INTO `sys_region` VALUES (71, '210100', '沈阳市', 7, 2, 0, 'Shenyang Shi', 'CN');
INSERT INTO `sys_region` VALUES (72, '210200', '大连市', 7, 2, 0, 'Dalian Shi', 'CN');
INSERT INTO `sys_region` VALUES (73, '210300', '鞍山市', 7, 2, 0, 'AnShan Shi', 'CN');
INSERT INTO `sys_region` VALUES (74, '210400', '抚顺市', 7, 2, 0, 'Fushun Shi', 'CN');
INSERT INTO `sys_region` VALUES (75, '210500', '本溪市', 7, 2, 0, 'Benxi Shi', 'CN');
INSERT INTO `sys_region` VALUES (76, '210600', '丹东市', 7, 2, 0, 'Dandong Shi', 'CN');
INSERT INTO `sys_region` VALUES (77, '210700', '锦州市', 7, 2, 0, 'Jinzhou Shi', 'CN');
INSERT INTO `sys_region` VALUES (78, '210800', '营口市', 7, 2, 0, 'Yingkou Shi', 'CN');
INSERT INTO `sys_region` VALUES (79, '210900', '阜新市', 7, 2, 0, 'Fuxin Shi', 'CN');
INSERT INTO `sys_region` VALUES (80, '211000', '辽阳市', 7, 2, 0, 'Liaoyang Shi', 'CN');
INSERT INTO `sys_region` VALUES (81, '211100', '盘锦市', 7, 2, 0, 'Panjin Shi', 'CN');
INSERT INTO `sys_region` VALUES (82, '211200', '铁岭市', 7, 2, 0, 'Tieling Shi', 'CN');
INSERT INTO `sys_region` VALUES (83, '211300', '朝阳市', 7, 2, 0, 'Chaoyang Shi', 'CN');
INSERT INTO `sys_region` VALUES (84, '211400', '葫芦岛市', 7, 2, 0, 'Huludao Shi', 'CN');
INSERT INTO `sys_region` VALUES (85, '220100', '长春市', 8, 2, 0, 'Changchun Shi ', 'CN');
INSERT INTO `sys_region` VALUES (86, '220200', '吉林市', 8, 2, 0, 'Jilin Shi ', 'CN');
INSERT INTO `sys_region` VALUES (87, '220300', '四平市', 8, 2, 0, 'Siping Shi', 'CN');
INSERT INTO `sys_region` VALUES (88, '220400', '辽源市', 8, 2, 0, 'Liaoyuan Shi', 'CN');
INSERT INTO `sys_region` VALUES (89, '220500', '通化市', 8, 2, 0, 'Tonghua Shi', 'CN');
INSERT INTO `sys_region` VALUES (90, '220600', '白山市', 8, 2, 0, 'Baishan Shi', 'CN');
INSERT INTO `sys_region` VALUES (91, '220700', '松原市', 8, 2, 0, 'Songyuan Shi', 'CN');
INSERT INTO `sys_region` VALUES (92, '220800', '白城市', 8, 2, 0, 'Baicheng Shi', 'CN');
INSERT INTO `sys_region` VALUES (93, '222400', '延边朝鲜族自治州', 8, 2, 0, 'Yanbian Chosenzu Zizhizhou', 'CN');
INSERT INTO `sys_region` VALUES (94, '230100', '哈尔滨市', 9, 2, 0, 'Harbin Shi', 'CN');
INSERT INTO `sys_region` VALUES (95, '230200', '齐齐哈尔市', 9, 2, 0, 'Qiqihar Shi', 'CN');
INSERT INTO `sys_region` VALUES (96, '230300', '鸡西市', 9, 2, 0, 'Jixi Shi', 'CN');
INSERT INTO `sys_region` VALUES (97, '230400', '鹤岗市', 9, 2, 0, 'Hegang Shi', 'CN');
INSERT INTO `sys_region` VALUES (98, '230500', '双鸭山市', 9, 2, 0, 'Shuangyashan Shi', 'CN');
INSERT INTO `sys_region` VALUES (99, '230600', '大庆市', 9, 2, 0, 'Daqing Shi', 'CN');
INSERT INTO `sys_region` VALUES (100, '230700', '伊春市', 9, 2, 0, 'Yichun Shi', 'CN');
INSERT INTO `sys_region` VALUES (101, '230800', '佳木斯市', 9, 2, 0, 'Jiamusi Shi', 'CN');
INSERT INTO `sys_region` VALUES (102, '230900', '七台河市', 9, 2, 0, 'Qitaihe Shi', 'CN');
INSERT INTO `sys_region` VALUES (103, '231000', '牡丹江市', 9, 2, 0, 'Mudanjiang Shi', 'CN');
INSERT INTO `sys_region` VALUES (104, '231100', '黑河市', 9, 2, 0, 'Heihe Shi', 'CN');
INSERT INTO `sys_region` VALUES (105, '231200', '绥化市', 9, 2, 0, 'Suihua Shi', 'CN');
INSERT INTO `sys_region` VALUES (106, '232700', '大兴安岭地区', 9, 2, 0, 'Da Hinggan Ling Diqu', 'CN');
INSERT INTO `sys_region` VALUES (107, '310100', '上海市', 10, 2, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (108, '310200', '县', 10, 2, 0, 'Xian', 'CN');
INSERT INTO `sys_region` VALUES (109, '320100', '南京市', 11, 2, 0, 'Nanjing Shi', 'CN');
INSERT INTO `sys_region` VALUES (110, '320200', '无锡市', 11, 2, 0, 'Wuxi Shi', 'CN');
INSERT INTO `sys_region` VALUES (111, '320300', '徐州市', 11, 2, 0, 'Xuzhou Shi', 'CN');
INSERT INTO `sys_region` VALUES (112, '320400', '常州市', 11, 2, 0, 'Changzhou Shi', 'CN');
INSERT INTO `sys_region` VALUES (113, '320500', '苏州市', 11, 2, 0, 'Suzhou Shi', 'CN');
INSERT INTO `sys_region` VALUES (114, '320600', '南通市', 11, 2, 0, 'Nantong Shi', 'CN');
INSERT INTO `sys_region` VALUES (115, '320700', '连云港市', 11, 2, 0, 'Lianyungang Shi', 'CN');
INSERT INTO `sys_region` VALUES (116, '320800', '淮安市', 11, 2, 0, 'Huai,an Xian', 'CN');
INSERT INTO `sys_region` VALUES (117, '320900', '盐城市', 11, 2, 0, 'Yancheng Shi', 'CN');
INSERT INTO `sys_region` VALUES (118, '321000', '扬州市', 11, 2, 0, 'Yangzhou Shi', 'CN');
INSERT INTO `sys_region` VALUES (119, '321100', '镇江市', 11, 2, 0, 'Zhenjiang Shi', 'CN');
INSERT INTO `sys_region` VALUES (120, '321200', '泰州市', 11, 2, 0, 'Taizhou Shi', 'CN');
INSERT INTO `sys_region` VALUES (121, '321300', '宿迁市', 11, 2, 0, 'Suqian Shi', 'CN');
INSERT INTO `sys_region` VALUES (122, '330100', '杭州市', 12, 2, 0, 'Hangzhou Shi', 'CN');
INSERT INTO `sys_region` VALUES (123, '330200', '宁波市', 12, 2, 0, 'Ningbo Shi', 'CN');
INSERT INTO `sys_region` VALUES (124, '330300', '温州市', 12, 2, 0, 'Wenzhou Shi', 'CN');
INSERT INTO `sys_region` VALUES (125, '330400', '嘉兴市', 12, 2, 0, 'Jiaxing Shi', 'CN');
INSERT INTO `sys_region` VALUES (126, '330500', '湖州市', 12, 2, 0, 'Huzhou Shi ', 'CN');
INSERT INTO `sys_region` VALUES (127, '330600', '绍兴市', 12, 2, 0, 'Shaoxing Shi', 'CN');
INSERT INTO `sys_region` VALUES (128, '330700', '金华市', 12, 2, 0, 'Jinhua Shi', 'CN');
INSERT INTO `sys_region` VALUES (129, '330800', '衢州市', 12, 2, 0, 'Quzhou Shi', 'CN');
INSERT INTO `sys_region` VALUES (130, '330900', '舟山市', 12, 2, 0, 'Zhoushan Shi', 'CN');
INSERT INTO `sys_region` VALUES (131, '331000', '台州市', 12, 2, 0, 'Taizhou Shi', 'CN');
INSERT INTO `sys_region` VALUES (132, '331100', '丽水市', 12, 2, 0, 'Lishui Shi', 'CN');
INSERT INTO `sys_region` VALUES (133, '340100', '合肥市', 13, 2, 0, 'Hefei Shi', 'CN');
INSERT INTO `sys_region` VALUES (134, '340200', '芜湖市', 13, 2, 0, 'Wuhu Shi', 'CN');
INSERT INTO `sys_region` VALUES (135, '340300', '蚌埠市', 13, 2, 0, 'Bengbu Shi', 'CN');
INSERT INTO `sys_region` VALUES (136, '340400', '淮南市', 13, 2, 0, 'Huainan Shi', 'CN');
INSERT INTO `sys_region` VALUES (137, '340500', '马鞍山市', 13, 2, 0, 'Ma,anshan Shi', 'CN');
INSERT INTO `sys_region` VALUES (138, '340600', '淮北市', 13, 2, 0, 'Huaibei Shi', 'CN');
INSERT INTO `sys_region` VALUES (139, '340700', '铜陵市', 13, 2, 0, 'Tongling Shi', 'CN');
INSERT INTO `sys_region` VALUES (140, '340800', '安庆市', 13, 2, 0, 'Anqing Shi', 'CN');
INSERT INTO `sys_region` VALUES (141, '341000', '黄山市', 13, 2, 0, 'Huangshan Shi', 'CN');
INSERT INTO `sys_region` VALUES (142, '341100', '滁州市', 13, 2, 0, 'Chuzhou Shi', 'CN');
INSERT INTO `sys_region` VALUES (143, '341200', '阜阳市', 13, 2, 0, 'Fuyang Shi', 'CN');
INSERT INTO `sys_region` VALUES (144, '341300', '宿州市', 13, 2, 0, 'Suzhou Shi', 'CN');
INSERT INTO `sys_region` VALUES (145, '341400', '巢湖市', 13, 2, 0, 'Chaohu Shi', 'CN');
INSERT INTO `sys_region` VALUES (146, '341500', '六安市', 13, 2, 0, 'Liu,an Shi', 'CN');
INSERT INTO `sys_region` VALUES (147, '341600', '亳州市', 13, 2, 0, 'Bozhou Shi', 'CN');
INSERT INTO `sys_region` VALUES (148, '341700', '池州市', 13, 2, 0, 'Chizhou Shi', 'CN');
INSERT INTO `sys_region` VALUES (149, '341800', '宣城市', 13, 2, 0, 'Xuancheng Shi', 'CN');
INSERT INTO `sys_region` VALUES (150, '350100', '福州市', 14, 2, 0, 'Fuzhou Shi', 'CN');
INSERT INTO `sys_region` VALUES (151, '350200', '厦门市', 14, 2, 0, 'Xiamen Shi', 'CN');
INSERT INTO `sys_region` VALUES (152, '350300', '莆田市', 14, 2, 0, 'Putian Shi', 'CN');
INSERT INTO `sys_region` VALUES (153, '350400', '三明市', 14, 2, 0, 'Sanming Shi', 'CN');
INSERT INTO `sys_region` VALUES (154, '350500', '泉州市', 14, 2, 0, 'Quanzhou Shi', 'CN');
INSERT INTO `sys_region` VALUES (155, '350600', '漳州市', 14, 2, 0, 'Zhangzhou Shi', 'CN');
INSERT INTO `sys_region` VALUES (156, '350700', '南平市', 14, 2, 0, 'Nanping Shi', 'CN');
INSERT INTO `sys_region` VALUES (157, '350800', '龙岩市', 14, 2, 0, 'Longyan Shi', 'CN');
INSERT INTO `sys_region` VALUES (158, '350900', '宁德市', 14, 2, 0, 'Ningde Shi', 'CN');
INSERT INTO `sys_region` VALUES (159, '360100', '南昌市', 15, 2, 0, 'Nanchang Shi', 'CN');
INSERT INTO `sys_region` VALUES (160, '360200', '景德镇市', 15, 2, 0, 'Jingdezhen Shi', 'CN');
INSERT INTO `sys_region` VALUES (161, '360300', '萍乡市', 15, 2, 0, 'Pingxiang Shi', 'CN');
INSERT INTO `sys_region` VALUES (162, '360400', '九江市', 15, 2, 0, 'Jiujiang Shi', 'CN');
INSERT INTO `sys_region` VALUES (163, '360500', '新余市', 15, 2, 0, 'Xinyu Shi', 'CN');
INSERT INTO `sys_region` VALUES (164, '360600', '鹰潭市', 15, 2, 0, 'Yingtan Shi', 'CN');
INSERT INTO `sys_region` VALUES (165, '360700', '赣州市', 15, 2, 0, 'Ganzhou Shi', 'CN');
INSERT INTO `sys_region` VALUES (166, '360800', '吉安市', 15, 2, 0, 'Ji,an Shi', 'CN');
INSERT INTO `sys_region` VALUES (167, '360900', '宜春市', 15, 2, 0, 'Yichun Shi', 'CN');
INSERT INTO `sys_region` VALUES (168, '361000', '抚州市', 15, 2, 0, 'Wuzhou Shi', 'CN');
INSERT INTO `sys_region` VALUES (169, '361100', '上饶市', 15, 2, 0, 'Shangrao Shi', 'CN');
INSERT INTO `sys_region` VALUES (170, '370100', '济南市', 16, 2, 0, 'Jinan Shi', 'CN');
INSERT INTO `sys_region` VALUES (171, '370200', '青岛市', 16, 2, 0, 'Qingdao Shi', 'CN');
INSERT INTO `sys_region` VALUES (172, '370300', '淄博市', 16, 2, 0, 'Zibo Shi', 'CN');
INSERT INTO `sys_region` VALUES (173, '370400', '枣庄市', 16, 2, 0, 'Zaozhuang Shi', 'CN');
INSERT INTO `sys_region` VALUES (174, '370500', '东营市', 16, 2, 0, 'Dongying Shi', 'CN');
INSERT INTO `sys_region` VALUES (175, '370600', '烟台市', 16, 2, 0, 'Yantai Shi', 'CN');
INSERT INTO `sys_region` VALUES (176, '370700', '潍坊市', 16, 2, 0, 'Weifang Shi', 'CN');
INSERT INTO `sys_region` VALUES (177, '370800', '济宁市', 16, 2, 0, 'Jining Shi', 'CN');
INSERT INTO `sys_region` VALUES (178, '370900', '泰安市', 16, 2, 0, 'Tai,an Shi', 'CN');
INSERT INTO `sys_region` VALUES (179, '371000', '威海市', 16, 2, 0, 'Weihai Shi', 'CN');
INSERT INTO `sys_region` VALUES (180, '371100', '日照市', 16, 2, 0, 'Rizhao Shi', 'CN');
INSERT INTO `sys_region` VALUES (181, '371200', '莱芜市', 16, 2, 0, 'Laiwu Shi', 'CN');
INSERT INTO `sys_region` VALUES (182, '371300', '临沂市', 16, 2, 0, 'Linyi Shi', 'CN');
INSERT INTO `sys_region` VALUES (183, '371400', '德州市', 16, 2, 0, 'Dezhou Shi', 'CN');
INSERT INTO `sys_region` VALUES (184, '371500', '聊城市', 16, 2, 0, 'Liaocheng Shi', 'CN');
INSERT INTO `sys_region` VALUES (185, '371600', '滨州市', 16, 2, 0, 'Binzhou Shi', 'CN');
INSERT INTO `sys_region` VALUES (186, '371700', '菏泽市', 16, 2, 0, 'Heze Shi', 'CN');
INSERT INTO `sys_region` VALUES (187, '410100', '郑州市', 17, 2, 0, 'Zhengzhou Shi', 'CN');
INSERT INTO `sys_region` VALUES (188, '410200', '开封市', 17, 2, 0, 'Kaifeng Shi', 'CN');
INSERT INTO `sys_region` VALUES (189, '410300', '洛阳市', 17, 2, 0, 'Luoyang Shi', 'CN');
INSERT INTO `sys_region` VALUES (190, '410400', '平顶山市', 17, 2, 0, 'Pingdingshan Shi', 'CN');
INSERT INTO `sys_region` VALUES (191, '410500', '安阳市', 17, 2, 0, 'Anyang Shi', 'CN');
INSERT INTO `sys_region` VALUES (192, '410600', '鹤壁市', 17, 2, 0, 'Hebi Shi', 'CN');
INSERT INTO `sys_region` VALUES (193, '410700', '新乡市', 17, 2, 0, 'Xinxiang Shi', 'CN');
INSERT INTO `sys_region` VALUES (194, '410800', '焦作市', 17, 2, 0, 'Jiaozuo Shi', 'CN');
INSERT INTO `sys_region` VALUES (195, '410900', '濮阳市', 17, 2, 0, 'Puyang Shi', 'CN');
INSERT INTO `sys_region` VALUES (196, '411000', '许昌市', 17, 2, 0, 'Xuchang Shi', 'CN');
INSERT INTO `sys_region` VALUES (197, '411100', '漯河市', 17, 2, 0, 'Luohe Shi', 'CN');
INSERT INTO `sys_region` VALUES (198, '411200', '三门峡市', 17, 2, 0, 'Sanmenxia Shi', 'CN');
INSERT INTO `sys_region` VALUES (199, '411300', '南阳市', 17, 2, 0, 'Nanyang Shi', 'CN');
INSERT INTO `sys_region` VALUES (200, '411400', '商丘市', 17, 2, 0, 'Shangqiu Shi', 'CN');
INSERT INTO `sys_region` VALUES (201, '411500', '信阳市', 17, 2, 0, 'Xinyang Shi', 'CN');
INSERT INTO `sys_region` VALUES (202, '411600', '周口市', 17, 2, 0, 'Zhoukou Shi', 'CN');
INSERT INTO `sys_region` VALUES (203, '411700', '驻马店市', 17, 2, 0, 'Zhumadian Shi', 'CN');
INSERT INTO `sys_region` VALUES (204, '420100', '武汉市', 18, 2, 0, 'Wuhan Shi', 'CN');
INSERT INTO `sys_region` VALUES (205, '420200', '黄石市', 18, 2, 0, 'Huangshi Shi', 'CN');
INSERT INTO `sys_region` VALUES (206, '420300', '十堰市', 18, 2, 0, 'Shiyan Shi', 'CN');
INSERT INTO `sys_region` VALUES (207, '420500', '宜昌市', 18, 2, 0, 'Yichang Shi', 'CN');
INSERT INTO `sys_region` VALUES (208, '420600', '襄樊市', 18, 2, 0, 'Xiangfan Shi', 'CN');
INSERT INTO `sys_region` VALUES (209, '420700', '鄂州市', 18, 2, 0, 'Ezhou Shi', 'CN');
INSERT INTO `sys_region` VALUES (210, '420800', '荆门市', 18, 2, 0, 'Jingmen Shi', 'CN');
INSERT INTO `sys_region` VALUES (211, '420900', '孝感市', 18, 2, 0, 'Xiaogan Shi', 'CN');
INSERT INTO `sys_region` VALUES (212, '421000', '荆州市', 18, 2, 0, 'Jingzhou Shi', 'CN');
INSERT INTO `sys_region` VALUES (213, '421100', '黄冈市', 18, 2, 0, 'Huanggang Shi', 'CN');
INSERT INTO `sys_region` VALUES (214, '421200', '咸宁市', 18, 2, 0, 'Xianning Xian', 'CN');
INSERT INTO `sys_region` VALUES (215, '421300', '随州市', 18, 2, 0, 'Suizhou Shi', 'CN');
INSERT INTO `sys_region` VALUES (216, '422800', '恩施土家族苗族自治州', 18, 2, 0, 'Enshi Tujiazu Miaozu Zizhizhou', 'CN');
INSERT INTO `sys_region` VALUES (217, '429000', '省直辖县级行政区划', 18, 2, 0, 'shengzhixiaxianjixingzhengquhua', 'CN');
INSERT INTO `sys_region` VALUES (218, '430100', '长沙市', 19, 2, 0, 'Changsha Shi', 'CN');
INSERT INTO `sys_region` VALUES (219, '430200', '株洲市', 19, 2, 0, 'Zhuzhou Shi', 'CN');
INSERT INTO `sys_region` VALUES (220, '430300', '湘潭市', 19, 2, 0, 'Xiangtan Shi', 'CN');
INSERT INTO `sys_region` VALUES (221, '430400', '衡阳市', 19, 2, 0, 'Hengyang Shi', 'CN');
INSERT INTO `sys_region` VALUES (222, '430500', '邵阳市', 19, 2, 0, 'Shaoyang Shi', 'CN');
INSERT INTO `sys_region` VALUES (223, '430600', '岳阳市', 19, 2, 0, 'Yueyang Shi', 'CN');
INSERT INTO `sys_region` VALUES (224, '430700', '常德市', 19, 2, 0, 'Changde Shi', 'CN');
INSERT INTO `sys_region` VALUES (225, '430800', '张家界市', 19, 2, 0, 'Zhangjiajie Shi', 'CN');
INSERT INTO `sys_region` VALUES (226, '430900', '益阳市', 19, 2, 0, 'Yiyang Shi', 'CN');
INSERT INTO `sys_region` VALUES (227, '431000', '郴州市', 19, 2, 0, 'Chenzhou Shi', 'CN');
INSERT INTO `sys_region` VALUES (228, '431100', '永州市', 19, 2, 0, 'Yongzhou Shi', 'CN');
INSERT INTO `sys_region` VALUES (229, '431200', '怀化市', 19, 2, 0, 'Huaihua Shi', 'CN');
INSERT INTO `sys_region` VALUES (230, '431300', '娄底市', 19, 2, 0, 'Loudi Shi', 'CN');
INSERT INTO `sys_region` VALUES (231, '433100', '湘西土家族苗族自治州', 19, 2, 0, 'Xiangxi Tujiazu Miaozu Zizhizhou ', 'CN');
INSERT INTO `sys_region` VALUES (232, '440100', '广州市', 20, 2, 0, 'Guangzhou Shi', 'CN');
INSERT INTO `sys_region` VALUES (233, '440200', '韶关市', 20, 2, 0, 'Shaoguan Shi', 'CN');
INSERT INTO `sys_region` VALUES (234, '440300', '深圳市', 20, 2, 0, 'Shenzhen Shi', 'CN');
INSERT INTO `sys_region` VALUES (235, '440400', '珠海市', 20, 2, 0, 'Zhuhai Shi', 'CN');
INSERT INTO `sys_region` VALUES (236, '440500', '汕头市', 20, 2, 0, 'Shantou Shi', 'CN');
INSERT INTO `sys_region` VALUES (237, '440600', '佛山市', 20, 2, 0, 'Foshan Shi', 'CN');
INSERT INTO `sys_region` VALUES (238, '440700', '江门市', 20, 2, 0, 'Jiangmen Shi', 'CN');
INSERT INTO `sys_region` VALUES (239, '440800', '湛江市', 20, 2, 0, 'Zhanjiang Shi', 'CN');
INSERT INTO `sys_region` VALUES (240, '440900', '茂名市', 20, 2, 0, 'Maoming Shi', 'CN');
INSERT INTO `sys_region` VALUES (241, '441200', '肇庆市', 20, 2, 0, 'Zhaoqing Shi', 'CN');
INSERT INTO `sys_region` VALUES (242, '441300', '惠州市', 20, 2, 0, 'Huizhou Shi', 'CN');
INSERT INTO `sys_region` VALUES (243, '441400', '梅州市', 20, 2, 0, 'Meizhou Shi', 'CN');
INSERT INTO `sys_region` VALUES (244, '441500', '汕尾市', 20, 2, 0, 'Shanwei Shi', 'CN');
INSERT INTO `sys_region` VALUES (245, '441600', '河源市', 20, 2, 0, 'Heyuan Shi', 'CN');
INSERT INTO `sys_region` VALUES (246, '441700', '阳江市', 20, 2, 0, 'Yangjiang Shi', 'CN');
INSERT INTO `sys_region` VALUES (247, '441800', '清远市', 20, 2, 0, 'Qingyuan Shi', 'CN');
INSERT INTO `sys_region` VALUES (248, '441900', '东莞市', 20, 2, 0, 'Dongguan Shi', 'CN');
INSERT INTO `sys_region` VALUES (249, '442000', '中山市', 20, 2, 0, 'Zhongshan Shi', 'CN');
INSERT INTO `sys_region` VALUES (250, '445100', '潮州市', 20, 2, 0, 'Chaozhou Shi', 'CN');
INSERT INTO `sys_region` VALUES (251, '445200', '揭阳市', 20, 2, 0, 'Jieyang Shi', 'CN');
INSERT INTO `sys_region` VALUES (252, '445300', '云浮市', 20, 2, 0, 'Yunfu Shi', 'CN');
INSERT INTO `sys_region` VALUES (253, '450100', '南宁市', 21, 2, 0, 'Nanning Shi', 'CN');
INSERT INTO `sys_region` VALUES (254, '450200', '柳州市', 21, 2, 0, 'Liuzhou Shi', 'CN');
INSERT INTO `sys_region` VALUES (255, '450300', '桂林市', 21, 2, 0, 'Guilin Shi', 'CN');
INSERT INTO `sys_region` VALUES (256, '450400', '梧州市', 21, 2, 0, 'Wuzhou Shi', 'CN');
INSERT INTO `sys_region` VALUES (257, '450500', '北海市', 21, 2, 0, 'Beihai Shi', 'CN');
INSERT INTO `sys_region` VALUES (258, '450600', '防城港市', 21, 2, 0, 'Fangchenggang Shi', 'CN');
INSERT INTO `sys_region` VALUES (259, '450700', '钦州市', 21, 2, 0, 'Qinzhou Shi', 'CN');
INSERT INTO `sys_region` VALUES (260, '450800', '贵港市', 21, 2, 0, 'Guigang Shi', 'CN');
INSERT INTO `sys_region` VALUES (261, '450900', '玉林市', 21, 2, 0, 'Yulin Shi', 'CN');
INSERT INTO `sys_region` VALUES (262, '451000', '百色市', 21, 2, 0, 'Baise Shi', 'CN');
INSERT INTO `sys_region` VALUES (263, '451100', '贺州市', 21, 2, 0, 'Hezhou Shi', 'CN');
INSERT INTO `sys_region` VALUES (264, '451200', '河池市', 21, 2, 0, 'Hechi Shi', 'CN');
INSERT INTO `sys_region` VALUES (265, '451300', '来宾市', 21, 2, 0, 'Laibin Shi', 'CN');
INSERT INTO `sys_region` VALUES (266, '451400', '崇左市', 21, 2, 0, 'Chongzuo Shi', 'CN');
INSERT INTO `sys_region` VALUES (267, '460100', '海口市', 22, 2, 0, 'Haikou Shi', 'CN');
INSERT INTO `sys_region` VALUES (268, '460200', '三亚市', 22, 2, 0, 'Sanya Shi', 'CN');
INSERT INTO `sys_region` VALUES (269, '469000', '省直辖县级行政区划', 22, 2, 0, 'shengzhixiaxianjixingzhengquhua', 'CN');
INSERT INTO `sys_region` VALUES (270, '500100', '重庆市', 23, 2, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (271, '500200', '县', 23, 2, 0, 'Xian', 'CN');
INSERT INTO `sys_region` VALUES (273, '510100', '成都市', 24, 2, 0, 'Chengdu Shi', 'CN');
INSERT INTO `sys_region` VALUES (274, '510300', '自贡市', 24, 2, 0, 'Zigong Shi', 'CN');
INSERT INTO `sys_region` VALUES (275, '510400', '攀枝花市', 24, 2, 0, 'Panzhihua Shi', 'CN');
INSERT INTO `sys_region` VALUES (276, '510500', '泸州市', 24, 2, 0, 'Luzhou Shi', 'CN');
INSERT INTO `sys_region` VALUES (277, '510600', '德阳市', 24, 2, 0, 'Deyang Shi', 'CN');
INSERT INTO `sys_region` VALUES (278, '510700', '绵阳市', 24, 2, 0, 'Mianyang Shi', 'CN');
INSERT INTO `sys_region` VALUES (279, '510800', '广元市', 24, 2, 0, 'Guangyuan Shi', 'CN');
INSERT INTO `sys_region` VALUES (280, '510900', '遂宁市', 24, 2, 0, 'Suining Shi', 'CN');
INSERT INTO `sys_region` VALUES (281, '511000', '内江市', 24, 2, 0, 'Neijiang Shi', 'CN');
INSERT INTO `sys_region` VALUES (282, '511100', '乐山市', 24, 2, 0, 'Leshan Shi', 'CN');
INSERT INTO `sys_region` VALUES (283, '511300', '南充市', 24, 2, 0, 'Nanchong Shi', 'CN');
INSERT INTO `sys_region` VALUES (284, '511400', '眉山市', 24, 2, 0, 'Meishan Shi', 'CN');
INSERT INTO `sys_region` VALUES (285, '511500', '宜宾市', 24, 2, 0, 'Yibin Shi', 'CN');
INSERT INTO `sys_region` VALUES (286, '511600', '广安市', 24, 2, 0, 'Guang,an Shi', 'CN');
INSERT INTO `sys_region` VALUES (287, '511700', '达州市', 24, 2, 0, 'Dazhou Shi', 'CN');
INSERT INTO `sys_region` VALUES (288, '511800', '雅安市', 24, 2, 0, 'Ya,an Shi', 'CN');
INSERT INTO `sys_region` VALUES (289, '511900', '巴中市', 24, 2, 0, 'Bazhong Shi', 'CN');
INSERT INTO `sys_region` VALUES (290, '512000', '资阳市', 24, 2, 0, 'Ziyang Shi', 'CN');
INSERT INTO `sys_region` VALUES (291, '513200', '阿坝藏族羌族自治州', 24, 2, 0, 'Aba(Ngawa) Zangzu Qiangzu Zizhizhou', 'CN');
INSERT INTO `sys_region` VALUES (292, '513300', '甘孜藏族自治州', 24, 2, 0, 'Garze Zangzu Zizhizhou', 'CN');
INSERT INTO `sys_region` VALUES (293, '513400', '凉山彝族自治州', 24, 2, 0, 'Liangshan Yizu Zizhizhou', 'CN');
INSERT INTO `sys_region` VALUES (294, '520100', '贵阳市', 25, 2, 0, 'Guiyang Shi', 'CN');
INSERT INTO `sys_region` VALUES (295, '520200', '六盘水市', 25, 2, 0, 'Liupanshui Shi', 'CN');
INSERT INTO `sys_region` VALUES (296, '520300', '遵义市', 25, 2, 0, 'Zunyi Shi', 'CN');
INSERT INTO `sys_region` VALUES (297, '520400', '安顺市', 25, 2, 0, 'Anshun Xian', 'CN');
INSERT INTO `sys_region` VALUES (298, '522200', '铜仁地区', 25, 2, 0, 'Tongren Diqu', 'CN');
INSERT INTO `sys_region` VALUES (299, '522300', '黔西南布依族苗族自治州', 25, 2, 0, 'Qianxinan Buyeizu Zizhizhou', 'CN');
INSERT INTO `sys_region` VALUES (300, '522400', '毕节地区', 25, 2, 0, 'Bijie Diqu', 'CN');
INSERT INTO `sys_region` VALUES (301, '522600', '黔东南苗族侗族自治州', 25, 2, 0, 'Qiandongnan Miaozu Dongzu Zizhizhou', 'CN');
INSERT INTO `sys_region` VALUES (302, '522700', '黔南布依族苗族自治州', 25, 2, 0, 'Qiannan Buyeizu Miaozu Zizhizhou', 'CN');
INSERT INTO `sys_region` VALUES (303, '530100', '昆明市', 26, 2, 0, 'Kunming Shi', 'CN');
INSERT INTO `sys_region` VALUES (304, '530300', '曲靖市', 26, 2, 0, 'Qujing Shi', 'CN');
INSERT INTO `sys_region` VALUES (305, '530400', '玉溪市', 26, 2, 0, 'Yuxi Shi', 'CN');
INSERT INTO `sys_region` VALUES (306, '530500', '保山市', 26, 2, 0, 'Baoshan Shi', 'CN');
INSERT INTO `sys_region` VALUES (307, '530600', '昭通市', 26, 2, 0, 'Zhaotong Shi', 'CN');
INSERT INTO `sys_region` VALUES (308, '530700', '丽江市', 26, 2, 0, 'Lijiang Shi', 'CN');
INSERT INTO `sys_region` VALUES (309, '530800', '普洱市', 26, 2, 0, 'Simao Shi', 'CN');
INSERT INTO `sys_region` VALUES (310, '530900', '临沧市', 26, 2, 0, 'Lincang Shi', 'CN');
INSERT INTO `sys_region` VALUES (311, '532300', '楚雄彝族自治州', 26, 2, 0, 'Chuxiong Yizu Zizhizhou', 'CN');
INSERT INTO `sys_region` VALUES (312, '532500', '红河哈尼族彝族自治州', 26, 2, 0, 'Honghe Hanizu Yizu Zizhizhou', 'CN');
INSERT INTO `sys_region` VALUES (313, '532600', '文山壮族苗族自治州', 26, 2, 0, 'Wenshan Zhuangzu Miaozu Zizhizhou', 'CN');
INSERT INTO `sys_region` VALUES (314, '532800', '西双版纳傣族自治州', 26, 2, 0, 'Xishuangbanna Daizu Zizhizhou', 'CN');
INSERT INTO `sys_region` VALUES (315, '532900', '大理白族自治州', 26, 2, 0, 'Dali Baizu Zizhizhou', 'CN');
INSERT INTO `sys_region` VALUES (316, '533100', '德宏傣族景颇族自治州', 26, 2, 0, 'Dehong Daizu Jingpozu Zizhizhou', 'CN');
INSERT INTO `sys_region` VALUES (317, '533300', '怒江傈僳族自治州', 26, 2, 0, 'Nujiang Lisuzu Zizhizhou', 'CN');
INSERT INTO `sys_region` VALUES (318, '533400', '迪庆藏族自治州', 26, 2, 0, 'Deqen Zangzu Zizhizhou', 'CN');
INSERT INTO `sys_region` VALUES (319, '540100', '拉萨市', 27, 2, 0, 'Lhasa Shi', 'CN');
INSERT INTO `sys_region` VALUES (320, '542100', '昌都地区', 27, 2, 0, 'Qamdo Diqu', 'CN');
INSERT INTO `sys_region` VALUES (321, '542200', '山南地区', 27, 2, 0, 'Shannan Diqu', 'CN');
INSERT INTO `sys_region` VALUES (322, '542300', '日喀则地区', 27, 2, 0, 'Xigaze Diqu', 'CN');
INSERT INTO `sys_region` VALUES (323, '542400', '那曲地区', 27, 2, 0, 'Nagqu Diqu', 'CN');
INSERT INTO `sys_region` VALUES (324, '542500', '阿里地区', 27, 2, 0, 'Ngari Diqu', 'CN');
INSERT INTO `sys_region` VALUES (325, '542600', '林芝地区', 27, 2, 0, 'Nyingchi Diqu', 'CN');
INSERT INTO `sys_region` VALUES (326, '610100', '西安市', 28, 2, 0, 'Xi,an Shi', 'CN');
INSERT INTO `sys_region` VALUES (327, '610200', '铜川市', 28, 2, 0, 'Tongchuan Shi', 'CN');
INSERT INTO `sys_region` VALUES (328, '610300', '宝鸡市', 28, 2, 0, 'Baoji Shi', 'CN');
INSERT INTO `sys_region` VALUES (329, '610400', '咸阳市', 28, 2, 0, 'Xianyang Shi', 'CN');
INSERT INTO `sys_region` VALUES (330, '610500', '渭南市', 28, 2, 0, 'Weinan Shi', 'CN');
INSERT INTO `sys_region` VALUES (331, '610600', '延安市', 28, 2, 0, 'Yan,an Shi', 'CN');
INSERT INTO `sys_region` VALUES (332, '610700', '汉中市', 28, 2, 0, 'Hanzhong Shi', 'CN');
INSERT INTO `sys_region` VALUES (333, '610800', '榆林市', 28, 2, 0, 'Yulin Shi', 'CN');
INSERT INTO `sys_region` VALUES (334, '610900', '安康市', 28, 2, 0, 'Ankang Shi', 'CN');
INSERT INTO `sys_region` VALUES (335, '611000', '商洛市', 28, 2, 0, 'Shangluo Shi', 'CN');
INSERT INTO `sys_region` VALUES (336, '620100', '兰州市', 29, 2, 0, 'Lanzhou Shi', 'CN');
INSERT INTO `sys_region` VALUES (337, '620200', '嘉峪关市', 29, 2, 0, 'Jiayuguan Shi', 'CN');
INSERT INTO `sys_region` VALUES (338, '620300', '金昌市', 29, 2, 0, 'Jinchang Shi', 'CN');
INSERT INTO `sys_region` VALUES (339, '620400', '白银市', 29, 2, 0, 'Baiyin Shi', 'CN');
INSERT INTO `sys_region` VALUES (340, '620500', '天水市', 29, 2, 0, 'Tianshui Shi', 'CN');
INSERT INTO `sys_region` VALUES (341, '620600', '武威市', 29, 2, 0, 'Wuwei Shi', 'CN');
INSERT INTO `sys_region` VALUES (342, '620700', '张掖市', 29, 2, 0, 'Zhangye Shi', 'CN');
INSERT INTO `sys_region` VALUES (343, '620800', '平凉市', 29, 2, 0, 'Pingliang Shi', 'CN');
INSERT INTO `sys_region` VALUES (344, '620900', '酒泉市', 29, 2, 0, 'Jiuquan Shi', 'CN');
INSERT INTO `sys_region` VALUES (345, '621000', '庆阳市', 29, 2, 0, 'Qingyang Shi', 'CN');
INSERT INTO `sys_region` VALUES (346, '621100', '定西市', 29, 2, 0, 'Dingxi Shi', 'CN');
INSERT INTO `sys_region` VALUES (347, '621200', '陇南市', 29, 2, 0, 'Longnan Shi', 'CN');
INSERT INTO `sys_region` VALUES (348, '622900', '临夏回族自治州', 29, 2, 0, 'Linxia Huizu Zizhizhou ', 'CN');
INSERT INTO `sys_region` VALUES (349, '623000', '甘南藏族自治州', 29, 2, 0, 'Gannan Zangzu Zizhizhou', 'CN');
INSERT INTO `sys_region` VALUES (350, '630100', '西宁市', 30, 2, 0, 'Xining Shi', 'CN');
INSERT INTO `sys_region` VALUES (351, '632100', '海东地区', 30, 2, 0, 'Haidong Diqu', 'CN');
INSERT INTO `sys_region` VALUES (352, '632200', '海北藏族自治州', 30, 2, 0, 'Haibei Zangzu Zizhizhou', 'CN');
INSERT INTO `sys_region` VALUES (353, '632300', '黄南藏族自治州', 30, 2, 0, 'Huangnan Zangzu Zizhizhou', 'CN');
INSERT INTO `sys_region` VALUES (354, '632500', '海南藏族自治州', 30, 2, 0, 'Hainan Zangzu Zizhizhou', 'CN');
INSERT INTO `sys_region` VALUES (355, '632600', '果洛藏族自治州', 30, 2, 0, 'Golog Zangzu Zizhizhou', 'CN');
INSERT INTO `sys_region` VALUES (356, '632700', '玉树藏族自治州', 30, 2, 0, 'Yushu Zangzu Zizhizhou', 'CN');
INSERT INTO `sys_region` VALUES (357, '632800', '海西蒙古族藏族自治州', 30, 2, 0, 'Haixi Mongolzu Zangzu Zizhizhou', 'CN');
INSERT INTO `sys_region` VALUES (358, '640100', '银川市', 31, 2, 0, 'Yinchuan Shi', 'CN');
INSERT INTO `sys_region` VALUES (359, '640200', '石嘴山市', 31, 2, 0, 'Shizuishan Shi', 'CN');
INSERT INTO `sys_region` VALUES (360, '640300', '吴忠市', 31, 2, 0, 'Wuzhong Shi', 'CN');
INSERT INTO `sys_region` VALUES (361, '640400', '固原市', 31, 2, 0, 'Guyuan Shi', 'CN');
INSERT INTO `sys_region` VALUES (362, '640500', '中卫市', 31, 2, 0, 'Zhongwei Shi', 'CN');
INSERT INTO `sys_region` VALUES (363, '650100', '乌鲁木齐市', 32, 2, 0, 'Urumqi Shi', 'CN');
INSERT INTO `sys_region` VALUES (364, '650200', '克拉玛依市', 32, 2, 0, 'Karamay Shi', 'CN');
INSERT INTO `sys_region` VALUES (365, '652100', '吐鲁番地区', 32, 2, 0, 'Turpan Diqu', 'CN');
INSERT INTO `sys_region` VALUES (366, '652200', '哈密地区', 32, 2, 0, 'Hami(kumul) Diqu', 'CN');
INSERT INTO `sys_region` VALUES (367, '652300', '昌吉回族自治州', 32, 2, 0, 'Changji Huizu Zizhizhou', 'CN');
INSERT INTO `sys_region` VALUES (368, '652700', '博尔塔拉蒙古自治州', 32, 2, 0, 'Bortala Monglo Zizhizhou', 'CN');
INSERT INTO `sys_region` VALUES (369, '652800', '巴音郭楞蒙古自治州', 32, 2, 0, 'bayinguolengmengguzizhizhou', 'CN');
INSERT INTO `sys_region` VALUES (370, '652900', '阿克苏地区', 32, 2, 0, 'Aksu Diqu', 'CN');
INSERT INTO `sys_region` VALUES (371, '653000', '克孜勒苏柯尔克孜自治州', 32, 2, 0, 'Kizilsu Kirgiz Zizhizhou', 'CN');
INSERT INTO `sys_region` VALUES (372, '653100', '喀什地区', 32, 2, 0, 'Kashi(Kaxgar) Diqu', 'CN');
INSERT INTO `sys_region` VALUES (373, '653200', '和田地区', 32, 2, 0, 'Hotan Diqu', 'CN');
INSERT INTO `sys_region` VALUES (374, '654000', '伊犁哈萨克自治州', 32, 2, 0, 'Ili Kazak Zizhizhou', 'CN');
INSERT INTO `sys_region` VALUES (375, '654200', '塔城地区', 32, 2, 0, 'Tacheng(Qoqek) Diqu', 'CN');
INSERT INTO `sys_region` VALUES (376, '654300', '阿勒泰地区', 32, 2, 0, 'Altay Diqu', 'CN');
INSERT INTO `sys_region` VALUES (377, '659000', '自治区直辖县级行政区划', 32, 2, 0, 'zizhiquzhixiaxianjixingzhengquhua', 'CN');
INSERT INTO `sys_region` VALUES (378, '110101', '东城区', 33, 3, 0, 'Dongcheng Qu', 'CN');
INSERT INTO `sys_region` VALUES (379, '110102', '西城区', 33, 3, 0, 'Xicheng Qu', 'CN');
INSERT INTO `sys_region` VALUES (382, '110105', '朝阳区', 33, 3, 0, 'Chaoyang Qu', 'CN');
INSERT INTO `sys_region` VALUES (383, '110106', '丰台区', 33, 3, 0, 'Fengtai Qu', 'CN');
INSERT INTO `sys_region` VALUES (384, '110107', '石景山区', 33, 3, 0, 'Shijingshan Qu', 'CN');
INSERT INTO `sys_region` VALUES (385, '110108', '海淀区', 33, 3, 0, 'Haidian Qu', 'CN');
INSERT INTO `sys_region` VALUES (386, '110109', '门头沟区', 33, 3, 0, 'Mentougou Qu', 'CN');
INSERT INTO `sys_region` VALUES (387, '110111', '房山区', 33, 3, 0, 'Fangshan Qu', 'CN');
INSERT INTO `sys_region` VALUES (388, '110112', '通州区', 33, 3, 0, 'Tongzhou Qu', 'CN');
INSERT INTO `sys_region` VALUES (389, '110113', '顺义区', 33, 3, 0, 'Shunyi Qu', 'CN');
INSERT INTO `sys_region` VALUES (390, '110114', '昌平区', 33, 3, 0, 'Changping Qu', 'CN');
INSERT INTO `sys_region` VALUES (391, '110115', '大兴区', 33, 3, 0, 'Daxing Qu', 'CN');
INSERT INTO `sys_region` VALUES (392, '110116', '怀柔区', 33, 3, 0, 'Huairou Qu', 'CN');
INSERT INTO `sys_region` VALUES (393, '110117', '平谷区', 33, 3, 0, 'Pinggu Qu', 'CN');
INSERT INTO `sys_region` VALUES (394, '110228', '密云县', 34, 3, 0, 'Miyun Xian ', 'CN');
INSERT INTO `sys_region` VALUES (395, '110229', '延庆县', 34, 3, 0, 'Yanqing Xian', 'CN');
INSERT INTO `sys_region` VALUES (396, '120101', '和平区', 35, 3, 0, 'Heping Qu', 'CN');
INSERT INTO `sys_region` VALUES (397, '120102', '河东区', 35, 3, 0, 'Hedong Qu', 'CN');
INSERT INTO `sys_region` VALUES (398, '120103', '河西区', 35, 3, 0, 'Hexi Qu', 'CN');
INSERT INTO `sys_region` VALUES (399, '120104', '南开区', 35, 3, 0, 'Nankai Qu', 'CN');
INSERT INTO `sys_region` VALUES (400, '120105', '河北区', 35, 3, 0, 'Hebei Qu', 'CN');
INSERT INTO `sys_region` VALUES (401, '120106', '红桥区', 35, 3, 0, 'Hongqiao Qu', 'CN');
INSERT INTO `sys_region` VALUES (404, '120116', '滨海新区', 35, 3, 0, 'Dagang Qu', 'CN');
INSERT INTO `sys_region` VALUES (405, '120110', '东丽区', 35, 3, 0, 'Dongli Qu', 'CN');
INSERT INTO `sys_region` VALUES (406, '120111', '西青区', 35, 3, 0, 'Xiqing Qu', 'CN');
INSERT INTO `sys_region` VALUES (407, '120112', '津南区', 35, 3, 0, 'Jinnan Qu', 'CN');
INSERT INTO `sys_region` VALUES (408, '120113', '北辰区', 35, 3, 0, 'Beichen Qu', 'CN');
INSERT INTO `sys_region` VALUES (409, '120114', '武清区', 35, 3, 0, 'Wuqing Qu', 'CN');
INSERT INTO `sys_region` VALUES (410, '120115', '宝坻区', 35, 3, 0, 'Baodi Qu', 'CN');
INSERT INTO `sys_region` VALUES (411, '120221', '宁河县', 36, 3, 0, 'Ninghe Xian', 'CN');
INSERT INTO `sys_region` VALUES (412, '120223', '静海县', 36, 3, 0, 'Jinghai Xian', 'CN');
INSERT INTO `sys_region` VALUES (413, '120225', '蓟县', 36, 3, 0, 'Ji Xian', 'CN');
INSERT INTO `sys_region` VALUES (414, '130101', '市辖区', 37, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (415, '130102', '长安区', 37, 3, 0, 'Chang,an Qu', 'CN');
INSERT INTO `sys_region` VALUES (416, '130103', '桥东区', 37, 3, 0, 'Qiaodong Qu', 'CN');
INSERT INTO `sys_region` VALUES (417, '130104', '桥西区', 37, 3, 0, 'Qiaoxi Qu', 'CN');
INSERT INTO `sys_region` VALUES (418, '130105', '新华区', 37, 3, 0, 'Xinhua Qu', 'CN');
INSERT INTO `sys_region` VALUES (419, '130107', '井陉矿区', 37, 3, 0, 'Jingxing Kuangqu', 'CN');
INSERT INTO `sys_region` VALUES (420, '130108', '裕华区', 37, 3, 0, 'Yuhua Qu', 'CN');
INSERT INTO `sys_region` VALUES (421, '130121', '井陉县', 37, 3, 0, 'Jingxing Xian', 'CN');
INSERT INTO `sys_region` VALUES (422, '130123', '正定县', 37, 3, 0, 'Zhengding Xian', 'CN');
INSERT INTO `sys_region` VALUES (423, '130124', '栾城县', 37, 3, 0, 'Luancheng Xian', 'CN');
INSERT INTO `sys_region` VALUES (424, '130125', '行唐县', 37, 3, 0, 'Xingtang Xian', 'CN');
INSERT INTO `sys_region` VALUES (425, '130126', '灵寿县', 37, 3, 0, 'Lingshou Xian ', 'CN');
INSERT INTO `sys_region` VALUES (426, '130127', '高邑县', 37, 3, 0, 'Gaoyi Xian', 'CN');
INSERT INTO `sys_region` VALUES (427, '130128', '深泽县', 37, 3, 0, 'Shenze Xian', 'CN');
INSERT INTO `sys_region` VALUES (428, '130129', '赞皇县', 37, 3, 0, 'Zanhuang Xian', 'CN');
INSERT INTO `sys_region` VALUES (429, '130130', '无极县', 37, 3, 0, 'Wuji Xian', 'CN');
INSERT INTO `sys_region` VALUES (430, '130131', '平山县', 37, 3, 0, 'Pingshan Xian', 'CN');
INSERT INTO `sys_region` VALUES (431, '130132', '元氏县', 37, 3, 0, 'Yuanshi Xian', 'CN');
INSERT INTO `sys_region` VALUES (432, '130133', '赵县', 37, 3, 0, 'Zhao Xian', 'CN');
INSERT INTO `sys_region` VALUES (433, '130181', '辛集市', 37, 3, 0, 'Xinji Shi', 'CN');
INSERT INTO `sys_region` VALUES (434, '130182', '藁城市', 37, 3, 0, 'Gaocheng Shi', 'CN');
INSERT INTO `sys_region` VALUES (435, '130183', '晋州市', 37, 3, 0, 'Jinzhou Shi', 'CN');
INSERT INTO `sys_region` VALUES (436, '130184', '新乐市', 37, 3, 0, 'Xinle Shi', 'CN');
INSERT INTO `sys_region` VALUES (437, '130185', '鹿泉市', 37, 3, 0, 'Luquan Shi', 'CN');
INSERT INTO `sys_region` VALUES (438, '130201', '市辖区', 38, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (439, '130202', '路南区', 38, 3, 0, 'Lunan Qu', 'CN');
INSERT INTO `sys_region` VALUES (440, '130203', '路北区', 38, 3, 0, 'Lubei Qu', 'CN');
INSERT INTO `sys_region` VALUES (441, '130204', '古冶区', 38, 3, 0, 'Guye Qu', 'CN');
INSERT INTO `sys_region` VALUES (442, '130205', '开平区', 38, 3, 0, 'Kaiping Qu', 'CN');
INSERT INTO `sys_region` VALUES (443, '130207', '丰南区', 38, 3, 0, 'Fengnan Qu', 'CN');
INSERT INTO `sys_region` VALUES (444, '130208', '丰润区', 38, 3, 0, 'Fengrun Qu', 'CN');
INSERT INTO `sys_region` VALUES (445, '130223', '滦县', 38, 3, 0, 'Luan Xian', 'CN');
INSERT INTO `sys_region` VALUES (446, '130224', '滦南县', 38, 3, 0, 'Luannan Xian', 'CN');
INSERT INTO `sys_region` VALUES (447, '130225', '乐亭县', 38, 3, 0, 'Leting Xian', 'CN');
INSERT INTO `sys_region` VALUES (448, '130227', '迁西县', 38, 3, 0, 'Qianxi Xian', 'CN');
INSERT INTO `sys_region` VALUES (449, '130229', '玉田县', 38, 3, 0, 'Yutian Xian', 'CN');
INSERT INTO `sys_region` VALUES (450, '130230', '唐海县', 38, 3, 0, 'Tanghai Xian ', 'CN');
INSERT INTO `sys_region` VALUES (451, '130281', '遵化市', 38, 3, 0, 'Zunhua Shi', 'CN');
INSERT INTO `sys_region` VALUES (452, '130283', '迁安市', 38, 3, 0, 'Qian,an Shi', 'CN');
INSERT INTO `sys_region` VALUES (453, '130301', '市辖区', 39, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (454, '130302', '海港区', 39, 3, 0, 'Haigang Qu', 'CN');
INSERT INTO `sys_region` VALUES (455, '130303', '山海关区', 39, 3, 0, 'Shanhaiguan Qu', 'CN');
INSERT INTO `sys_region` VALUES (456, '130304', '北戴河区', 39, 3, 0, 'Beidaihe Qu', 'CN');
INSERT INTO `sys_region` VALUES (457, '130321', '青龙满族自治县', 39, 3, 0, 'Qinglong Manzu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (458, '130322', '昌黎县', 39, 3, 0, 'Changli Xian', 'CN');
INSERT INTO `sys_region` VALUES (459, '130323', '抚宁县', 39, 3, 0, 'Funing Xian ', 'CN');
INSERT INTO `sys_region` VALUES (460, '130324', '卢龙县', 39, 3, 0, 'Lulong Xian', 'CN');
INSERT INTO `sys_region` VALUES (461, '130401', '市辖区', 40, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (462, '130402', '邯山区', 40, 3, 0, 'Hanshan Qu', 'CN');
INSERT INTO `sys_region` VALUES (463, '130403', '丛台区', 40, 3, 0, 'Congtai Qu', 'CN');
INSERT INTO `sys_region` VALUES (464, '130404', '复兴区', 40, 3, 0, 'Fuxing Qu', 'CN');
INSERT INTO `sys_region` VALUES (465, '130406', '峰峰矿区', 40, 3, 0, 'Fengfeng Kuangqu', 'CN');
INSERT INTO `sys_region` VALUES (466, '130421', '邯郸县', 40, 3, 0, 'Handan Xian ', 'CN');
INSERT INTO `sys_region` VALUES (467, '130423', '临漳县', 40, 3, 0, 'Linzhang Xian ', 'CN');
INSERT INTO `sys_region` VALUES (468, '130424', '成安县', 40, 3, 0, 'Cheng,an Xian', 'CN');
INSERT INTO `sys_region` VALUES (469, '130425', '大名县', 40, 3, 0, 'Daming Xian', 'CN');
INSERT INTO `sys_region` VALUES (470, '130426', '涉县', 40, 3, 0, 'She Xian', 'CN');
INSERT INTO `sys_region` VALUES (471, '130427', '磁县', 40, 3, 0, 'Ci Xian', 'CN');
INSERT INTO `sys_region` VALUES (472, '130428', '肥乡县', 40, 3, 0, 'Feixiang Xian', 'CN');
INSERT INTO `sys_region` VALUES (473, '130429', '永年县', 40, 3, 0, 'Yongnian Xian', 'CN');
INSERT INTO `sys_region` VALUES (474, '130430', '邱县', 40, 3, 0, 'Qiu Xian', 'CN');
INSERT INTO `sys_region` VALUES (475, '130431', '鸡泽县', 40, 3, 0, 'Jize Xian', 'CN');
INSERT INTO `sys_region` VALUES (476, '130432', '广平县', 40, 3, 0, 'Guangping Xian ', 'CN');
INSERT INTO `sys_region` VALUES (477, '130433', '馆陶县', 40, 3, 0, 'Guantao Xian', 'CN');
INSERT INTO `sys_region` VALUES (478, '130434', '魏县', 40, 3, 0, 'Wei Xian ', 'CN');
INSERT INTO `sys_region` VALUES (479, '130435', '曲周县', 40, 3, 0, 'Quzhou Xian ', 'CN');
INSERT INTO `sys_region` VALUES (480, '130481', '武安市', 40, 3, 0, 'Wu,an Shi', 'CN');
INSERT INTO `sys_region` VALUES (481, '130501', '市辖区', 41, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (482, '130502', '桥东区', 41, 3, 0, 'Qiaodong Qu', 'CN');
INSERT INTO `sys_region` VALUES (483, '130503', '桥西区', 41, 3, 0, 'Qiaoxi Qu', 'CN');
INSERT INTO `sys_region` VALUES (484, '130521', '邢台县', 41, 3, 0, 'Xingtai Xian', 'CN');
INSERT INTO `sys_region` VALUES (485, '130522', '临城县', 41, 3, 0, 'Lincheng Xian ', 'CN');
INSERT INTO `sys_region` VALUES (486, '130523', '内丘县', 41, 3, 0, 'Neiqiu Xian ', 'CN');
INSERT INTO `sys_region` VALUES (487, '130524', '柏乡县', 41, 3, 0, 'Baixiang Xian', 'CN');
INSERT INTO `sys_region` VALUES (488, '130525', '隆尧县', 41, 3, 0, 'Longyao Xian', 'CN');
INSERT INTO `sys_region` VALUES (489, '130526', '任县', 41, 3, 0, 'Ren Xian', 'CN');
INSERT INTO `sys_region` VALUES (490, '130527', '南和县', 41, 3, 0, 'Nanhe Xian', 'CN');
INSERT INTO `sys_region` VALUES (491, '130528', '宁晋县', 41, 3, 0, 'Ningjin Xian', 'CN');
INSERT INTO `sys_region` VALUES (492, '130529', '巨鹿县', 41, 3, 0, 'Julu Xian', 'CN');
INSERT INTO `sys_region` VALUES (493, '130530', '新河县', 41, 3, 0, 'Xinhe Xian ', 'CN');
INSERT INTO `sys_region` VALUES (494, '130531', '广宗县', 41, 3, 0, 'Guangzong Xian ', 'CN');
INSERT INTO `sys_region` VALUES (495, '130532', '平乡县', 41, 3, 0, 'Pingxiang Xian', 'CN');
INSERT INTO `sys_region` VALUES (496, '130533', '威县', 41, 3, 0, 'Wei Xian ', 'CN');
INSERT INTO `sys_region` VALUES (497, '130534', '清河县', 41, 3, 0, 'Qinghe Xian', 'CN');
INSERT INTO `sys_region` VALUES (498, '130535', '临西县', 41, 3, 0, 'Linxi Xian', 'CN');
INSERT INTO `sys_region` VALUES (499, '130581', '南宫市', 41, 3, 0, 'Nangong Shi', 'CN');
INSERT INTO `sys_region` VALUES (500, '130582', '沙河市', 41, 3, 0, 'Shahe Shi', 'CN');
INSERT INTO `sys_region` VALUES (501, '130601', '市辖区', 42, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (502, '130605', '新市区', 42, 3, 0, 'Xinshi Qu', 'CN');
INSERT INTO `sys_region` VALUES (503, '130603', '北市区', 42, 3, 0, 'Beishi Qu', 'CN');
INSERT INTO `sys_region` VALUES (504, '130604', '南市区', 42, 3, 0, 'Nanshi Qu', 'CN');
INSERT INTO `sys_region` VALUES (505, '130621', '满城县', 42, 3, 0, 'Mancheng Xian ', 'CN');
INSERT INTO `sys_region` VALUES (506, '130622', '清苑县', 42, 3, 0, 'Qingyuan Xian', 'CN');
INSERT INTO `sys_region` VALUES (507, '130623', '涞水县', 42, 3, 0, 'Laishui Xian', 'CN');
INSERT INTO `sys_region` VALUES (508, '130624', '阜平县', 42, 3, 0, 'Fuping Xian ', 'CN');
INSERT INTO `sys_region` VALUES (509, '130625', '徐水县', 42, 3, 0, 'Xushui Xian ', 'CN');
INSERT INTO `sys_region` VALUES (510, '130626', '定兴县', 42, 3, 0, 'Dingxing Xian ', 'CN');
INSERT INTO `sys_region` VALUES (511, '130627', '唐县', 42, 3, 0, 'Tang Xian ', 'CN');
INSERT INTO `sys_region` VALUES (512, '130628', '高阳县', 42, 3, 0, 'Gaoyang Xian ', 'CN');
INSERT INTO `sys_region` VALUES (513, '130629', '容城县', 42, 3, 0, 'Rongcheng Xian ', 'CN');
INSERT INTO `sys_region` VALUES (514, '130630', '涞源县', 42, 3, 0, 'Laiyuan Xian ', 'CN');
INSERT INTO `sys_region` VALUES (515, '130631', '望都县', 42, 3, 0, 'Wangdu Xian ', 'CN');
INSERT INTO `sys_region` VALUES (516, '130632', '安新县', 42, 3, 0, 'Anxin Xian ', 'CN');
INSERT INTO `sys_region` VALUES (517, '130633', '易县', 42, 3, 0, 'Yi Xian', 'CN');
INSERT INTO `sys_region` VALUES (518, '130634', '曲阳县', 42, 3, 0, 'Quyang Xian ', 'CN');
INSERT INTO `sys_region` VALUES (519, '130635', '蠡县', 42, 3, 0, 'Li Xian', 'CN');
INSERT INTO `sys_region` VALUES (520, '130636', '顺平县', 42, 3, 0, 'Shunping Xian ', 'CN');
INSERT INTO `sys_region` VALUES (521, '130637', '博野县', 42, 3, 0, 'Boye Xian ', 'CN');
INSERT INTO `sys_region` VALUES (522, '130638', '雄县', 42, 3, 0, 'Xiong Xian', 'CN');
INSERT INTO `sys_region` VALUES (523, '130681', '涿州市', 42, 3, 0, 'Zhuozhou Shi', 'CN');
INSERT INTO `sys_region` VALUES (524, '130682', '定州市', 42, 3, 0, 'Dingzhou Shi ', 'CN');
INSERT INTO `sys_region` VALUES (525, '130683', '安国市', 42, 3, 0, 'Anguo Shi ', 'CN');
INSERT INTO `sys_region` VALUES (526, '130684', '高碑店市', 42, 3, 0, 'Gaobeidian Shi', 'CN');
INSERT INTO `sys_region` VALUES (527, '130701', '市辖区', 43, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (528, '130702', '桥东区', 43, 3, 0, 'Qiaodong Qu', 'CN');
INSERT INTO `sys_region` VALUES (529, '130703', '桥西区', 43, 3, 0, 'Qiaoxi Qu', 'CN');
INSERT INTO `sys_region` VALUES (530, '130705', '宣化区', 43, 3, 0, 'Xuanhua Qu', 'CN');
INSERT INTO `sys_region` VALUES (531, '130706', '下花园区', 43, 3, 0, 'Xiahuayuan Qu ', 'CN');
INSERT INTO `sys_region` VALUES (532, '130721', '宣化县', 43, 3, 0, 'Xuanhua Xian ', 'CN');
INSERT INTO `sys_region` VALUES (533, '130722', '张北县', 43, 3, 0, 'Zhangbei Xian ', 'CN');
INSERT INTO `sys_region` VALUES (534, '130723', '康保县', 43, 3, 0, 'Kangbao Xian', 'CN');
INSERT INTO `sys_region` VALUES (535, '130724', '沽源县', 43, 3, 0, 'Guyuan Xian', 'CN');
INSERT INTO `sys_region` VALUES (536, '130725', '尚义县', 43, 3, 0, 'Shangyi Xian', 'CN');
INSERT INTO `sys_region` VALUES (537, '130726', '蔚县', 43, 3, 0, 'Yu Xian', 'CN');
INSERT INTO `sys_region` VALUES (538, '130727', '阳原县', 43, 3, 0, 'Yangyuan Xian', 'CN');
INSERT INTO `sys_region` VALUES (539, '130728', '怀安县', 43, 3, 0, 'Huai,an Xian', 'CN');
INSERT INTO `sys_region` VALUES (540, '130729', '万全县', 43, 3, 0, 'Wanquan Xian ', 'CN');
INSERT INTO `sys_region` VALUES (541, '130730', '怀来县', 43, 3, 0, 'Huailai Xian', 'CN');
INSERT INTO `sys_region` VALUES (542, '130731', '涿鹿县', 43, 3, 0, 'Zhuolu Xian ', 'CN');
INSERT INTO `sys_region` VALUES (543, '130732', '赤城县', 43, 3, 0, 'Chicheng Xian', 'CN');
INSERT INTO `sys_region` VALUES (544, '130733', '崇礼县', 43, 3, 0, 'Chongli Xian', 'CN');
INSERT INTO `sys_region` VALUES (545, '130801', '市辖区', 44, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (546, '130802', '双桥区', 44, 3, 0, 'Shuangqiao Qu ', 'CN');
INSERT INTO `sys_region` VALUES (547, '130803', '双滦区', 44, 3, 0, 'Shuangluan Qu', 'CN');
INSERT INTO `sys_region` VALUES (548, '130804', '鹰手营子矿区', 44, 3, 0, 'Yingshouyingzi Kuangqu', 'CN');
INSERT INTO `sys_region` VALUES (549, '130821', '承德县', 44, 3, 0, 'Chengde Xian', 'CN');
INSERT INTO `sys_region` VALUES (550, '130822', '兴隆县', 44, 3, 0, 'Xinglong Xian', 'CN');
INSERT INTO `sys_region` VALUES (551, '130823', '平泉县', 44, 3, 0, 'Pingquan Xian', 'CN');
INSERT INTO `sys_region` VALUES (552, '130824', '滦平县', 44, 3, 0, 'Luanping Xian ', 'CN');
INSERT INTO `sys_region` VALUES (553, '130825', '隆化县', 44, 3, 0, 'Longhua Xian', 'CN');
INSERT INTO `sys_region` VALUES (554, '130826', '丰宁满族自治县', 44, 3, 0, 'Fengning Manzu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (555, '130827', '宽城满族自治县', 44, 3, 0, 'Kuancheng Manzu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (556, '130828', '围场满族蒙古族自治县', 44, 3, 0, 'Weichang Manzu Menggolzu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (557, '130901', '市辖区', 45, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (558, '130902', '新华区', 45, 3, 0, 'Xinhua Qu', 'CN');
INSERT INTO `sys_region` VALUES (559, '130903', '运河区', 45, 3, 0, 'Yunhe Qu', 'CN');
INSERT INTO `sys_region` VALUES (560, '130921', '沧县', 45, 3, 0, 'Cang Xian', 'CN');
INSERT INTO `sys_region` VALUES (561, '130922', '青县', 45, 3, 0, 'Qing Xian', 'CN');
INSERT INTO `sys_region` VALUES (562, '130923', '东光县', 45, 3, 0, 'Dongguang Xian ', 'CN');
INSERT INTO `sys_region` VALUES (563, '130924', '海兴县', 45, 3, 0, 'Haixing Xian', 'CN');
INSERT INTO `sys_region` VALUES (564, '130925', '盐山县', 45, 3, 0, 'Yanshan Xian', 'CN');
INSERT INTO `sys_region` VALUES (565, '130926', '肃宁县', 45, 3, 0, 'Suning Xian ', 'CN');
INSERT INTO `sys_region` VALUES (566, '130927', '南皮县', 45, 3, 0, 'Nanpi Xian', 'CN');
INSERT INTO `sys_region` VALUES (567, '130928', '吴桥县', 45, 3, 0, 'Wuqiao Xian ', 'CN');
INSERT INTO `sys_region` VALUES (568, '130929', '献县', 45, 3, 0, 'Xian Xian ', 'CN');
INSERT INTO `sys_region` VALUES (569, '130930', '孟村回族自治县', 45, 3, 0, 'Mengcun Huizu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (570, '130981', '泊头市', 45, 3, 0, 'Botou Shi ', 'CN');
INSERT INTO `sys_region` VALUES (571, '130982', '任丘市', 45, 3, 0, 'Renqiu Shi', 'CN');
INSERT INTO `sys_region` VALUES (572, '130983', '黄骅市', 45, 3, 0, 'Huanghua Shi', 'CN');
INSERT INTO `sys_region` VALUES (573, '130984', '河间市', 45, 3, 0, 'Hejian Shi', 'CN');
INSERT INTO `sys_region` VALUES (574, '131001', '市辖区', 46, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (575, '131002', '安次区', 46, 3, 0, 'Anci Qu', 'CN');
INSERT INTO `sys_region` VALUES (576, '131003', '广阳区', 46, 3, 0, 'Guangyang Qu', 'CN');
INSERT INTO `sys_region` VALUES (577, '131022', '固安县', 46, 3, 0, 'Gu,an Xian', 'CN');
INSERT INTO `sys_region` VALUES (578, '131023', '永清县', 46, 3, 0, 'Yongqing Xian ', 'CN');
INSERT INTO `sys_region` VALUES (579, '131024', '香河县', 46, 3, 0, 'Xianghe Xian', 'CN');
INSERT INTO `sys_region` VALUES (580, '131025', '大城县', 46, 3, 0, 'Dacheng Xian', 'CN');
INSERT INTO `sys_region` VALUES (581, '131026', '文安县', 46, 3, 0, 'Wen,an Xian', 'CN');
INSERT INTO `sys_region` VALUES (582, '131028', '大厂回族自治县', 46, 3, 0, 'Dachang Huizu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (583, '131081', '霸州市', 46, 3, 0, 'Bazhou Shi', 'CN');
INSERT INTO `sys_region` VALUES (584, '131082', '三河市', 46, 3, 0, 'Sanhe Shi', 'CN');
INSERT INTO `sys_region` VALUES (585, '131101', '市辖区', 47, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (586, '131102', '桃城区', 47, 3, 0, 'Taocheng Qu', 'CN');
INSERT INTO `sys_region` VALUES (587, '131121', '枣强县', 47, 3, 0, 'Zaoqiang Xian ', 'CN');
INSERT INTO `sys_region` VALUES (588, '131122', '武邑县', 47, 3, 0, 'Wuyi Xian', 'CN');
INSERT INTO `sys_region` VALUES (589, '131123', '武强县', 47, 3, 0, 'Wuqiang Xian ', 'CN');
INSERT INTO `sys_region` VALUES (590, '131124', '饶阳县', 47, 3, 0, 'Raoyang Xian', 'CN');
INSERT INTO `sys_region` VALUES (591, '131125', '安平县', 47, 3, 0, 'Anping Xian', 'CN');
INSERT INTO `sys_region` VALUES (592, '131126', '故城县', 47, 3, 0, 'Gucheng Xian', 'CN');
INSERT INTO `sys_region` VALUES (593, '131127', '景县', 47, 3, 0, 'Jing Xian ', 'CN');
INSERT INTO `sys_region` VALUES (594, '131128', '阜城县', 47, 3, 0, 'Fucheng Xian ', 'CN');
INSERT INTO `sys_region` VALUES (595, '131181', '冀州市', 47, 3, 0, 'Jizhou Shi ', 'CN');
INSERT INTO `sys_region` VALUES (596, '131182', '深州市', 47, 3, 0, 'Shenzhou Shi', 'CN');
INSERT INTO `sys_region` VALUES (597, '140101', '市辖区', 48, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (598, '140105', '小店区', 48, 3, 0, 'Xiaodian Qu', 'CN');
INSERT INTO `sys_region` VALUES (599, '140106', '迎泽区', 48, 3, 0, 'Yingze Qu', 'CN');
INSERT INTO `sys_region` VALUES (600, '140107', '杏花岭区', 48, 3, 0, 'Xinghualing Qu', 'CN');
INSERT INTO `sys_region` VALUES (601, '140108', '尖草坪区', 48, 3, 0, 'Jiancaoping Qu', 'CN');
INSERT INTO `sys_region` VALUES (602, '140109', '万柏林区', 48, 3, 0, 'Wanbailin Qu', 'CN');
INSERT INTO `sys_region` VALUES (603, '140110', '晋源区', 48, 3, 0, 'Jinyuan Qu', 'CN');
INSERT INTO `sys_region` VALUES (604, '140121', '清徐县', 48, 3, 0, 'Qingxu Xian ', 'CN');
INSERT INTO `sys_region` VALUES (605, '140122', '阳曲县', 48, 3, 0, 'Yangqu Xian ', 'CN');
INSERT INTO `sys_region` VALUES (606, '140123', '娄烦县', 48, 3, 0, 'Loufan Xian', 'CN');
INSERT INTO `sys_region` VALUES (607, '140181', '古交市', 48, 3, 0, 'Gujiao Shi', 'CN');
INSERT INTO `sys_region` VALUES (608, '140201', '市辖区', 49, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (609, '140202', '城区', 49, 3, 0, 'Chengqu', 'CN');
INSERT INTO `sys_region` VALUES (610, '140203', '矿区', 49, 3, 0, 'Kuangqu', 'CN');
INSERT INTO `sys_region` VALUES (611, '140211', '南郊区', 49, 3, 0, 'Nanjiao Qu', 'CN');
INSERT INTO `sys_region` VALUES (612, '140212', '新荣区', 49, 3, 0, 'Xinrong Qu', 'CN');
INSERT INTO `sys_region` VALUES (613, '140221', '阳高县', 49, 3, 0, 'Yanggao Xian ', 'CN');
INSERT INTO `sys_region` VALUES (614, '140222', '天镇县', 49, 3, 0, 'Tianzhen Xian ', 'CN');
INSERT INTO `sys_region` VALUES (615, '140223', '广灵县', 49, 3, 0, 'Guangling Xian ', 'CN');
INSERT INTO `sys_region` VALUES (616, '140224', '灵丘县', 49, 3, 0, 'Lingqiu Xian ', 'CN');
INSERT INTO `sys_region` VALUES (617, '140225', '浑源县', 49, 3, 0, 'Hunyuan Xian', 'CN');
INSERT INTO `sys_region` VALUES (618, '140226', '左云县', 49, 3, 0, 'Zuoyun Xian', 'CN');
INSERT INTO `sys_region` VALUES (619, '140227', '大同县', 49, 3, 0, 'Datong Xian ', 'CN');
INSERT INTO `sys_region` VALUES (620, '140301', '市辖区', 50, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (621, '140302', '城区', 50, 3, 0, 'Chengqu', 'CN');
INSERT INTO `sys_region` VALUES (622, '140303', '矿区', 50, 3, 0, 'Kuangqu', 'CN');
INSERT INTO `sys_region` VALUES (623, '140311', '郊区', 50, 3, 0, 'Jiaoqu', 'CN');
INSERT INTO `sys_region` VALUES (624, '140321', '平定县', 50, 3, 0, 'Pingding Xian', 'CN');
INSERT INTO `sys_region` VALUES (625, '140322', '盂县', 50, 3, 0, 'Yu Xian', 'CN');
INSERT INTO `sys_region` VALUES (626, '140401', '市辖区', 51, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (627, '140402', '城区', 51, 3, 0, 'Chengqu ', 'CN');
INSERT INTO `sys_region` VALUES (628, '140411', '郊区', 51, 3, 0, 'Jiaoqu', 'CN');
INSERT INTO `sys_region` VALUES (629, '140421', '长治县', 51, 3, 0, 'Changzhi Xian', 'CN');
INSERT INTO `sys_region` VALUES (630, '140423', '襄垣县', 51, 3, 0, 'Xiangyuan Xian', 'CN');
INSERT INTO `sys_region` VALUES (631, '140424', '屯留县', 51, 3, 0, 'Tunliu Xian', 'CN');
INSERT INTO `sys_region` VALUES (632, '140425', '平顺县', 51, 3, 0, 'Pingshun Xian', 'CN');
INSERT INTO `sys_region` VALUES (633, '140426', '黎城县', 51, 3, 0, 'Licheng Xian', 'CN');
INSERT INTO `sys_region` VALUES (634, '140427', '壶关县', 51, 3, 0, 'Huguan Xian', 'CN');
INSERT INTO `sys_region` VALUES (635, '140428', '长子县', 51, 3, 0, 'Zhangzi Xian ', 'CN');
INSERT INTO `sys_region` VALUES (636, '140429', '武乡县', 51, 3, 0, 'Wuxiang Xian', 'CN');
INSERT INTO `sys_region` VALUES (637, '140430', '沁县', 51, 3, 0, 'Qin Xian', 'CN');
INSERT INTO `sys_region` VALUES (638, '140431', '沁源县', 51, 3, 0, 'Qinyuan Xian ', 'CN');
INSERT INTO `sys_region` VALUES (639, '140481', '潞城市', 51, 3, 0, 'Lucheng Shi', 'CN');
INSERT INTO `sys_region` VALUES (640, '140501', '市辖区', 52, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (641, '140502', '城区', 52, 3, 0, 'Chengqu ', 'CN');
INSERT INTO `sys_region` VALUES (642, '140521', '沁水县', 52, 3, 0, 'Qinshui Xian', 'CN');
INSERT INTO `sys_region` VALUES (643, '140522', '阳城县', 52, 3, 0, 'Yangcheng Xian ', 'CN');
INSERT INTO `sys_region` VALUES (644, '140524', '陵川县', 52, 3, 0, 'Lingchuan Xian', 'CN');
INSERT INTO `sys_region` VALUES (645, '140525', '泽州县', 52, 3, 0, 'Zezhou Xian', 'CN');
INSERT INTO `sys_region` VALUES (646, '140581', '高平市', 52, 3, 0, 'Gaoping Shi ', 'CN');
INSERT INTO `sys_region` VALUES (647, '140601', '市辖区', 53, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (648, '140602', '朔城区', 53, 3, 0, 'Shuocheng Qu', 'CN');
INSERT INTO `sys_region` VALUES (649, '140603', '平鲁区', 53, 3, 0, 'Pinglu Qu', 'CN');
INSERT INTO `sys_region` VALUES (650, '140621', '山阴县', 53, 3, 0, 'Shanyin Xian', 'CN');
INSERT INTO `sys_region` VALUES (651, '140622', '应县', 53, 3, 0, 'Ying Xian', 'CN');
INSERT INTO `sys_region` VALUES (652, '140623', '右玉县', 53, 3, 0, 'Youyu Xian ', 'CN');
INSERT INTO `sys_region` VALUES (653, '140624', '怀仁县', 53, 3, 0, 'Huairen Xian', 'CN');
INSERT INTO `sys_region` VALUES (654, '140701', '市辖区', 54, 3, 0, '1', 'CN');
INSERT INTO `sys_region` VALUES (655, '140702', '榆次区', 54, 3, 0, 'Yuci Qu', 'CN');
INSERT INTO `sys_region` VALUES (656, '140721', '榆社县', 54, 3, 0, 'Yushe Xian', 'CN');
INSERT INTO `sys_region` VALUES (657, '140722', '左权县', 54, 3, 0, 'Zuoquan Xian', 'CN');
INSERT INTO `sys_region` VALUES (658, '140723', '和顺县', 54, 3, 0, 'Heshun Xian', 'CN');
INSERT INTO `sys_region` VALUES (659, '140724', '昔阳县', 54, 3, 0, 'Xiyang Xian', 'CN');
INSERT INTO `sys_region` VALUES (660, '140725', '寿阳县', 54, 3, 0, 'Shouyang Xian', 'CN');
INSERT INTO `sys_region` VALUES (661, '140726', '太谷县', 54, 3, 0, 'Taigu Xian', 'CN');
INSERT INTO `sys_region` VALUES (662, '140727', '祁县', 54, 3, 0, 'Qi Xian', 'CN');
INSERT INTO `sys_region` VALUES (663, '140728', '平遥县', 54, 3, 0, 'Pingyao Xian', 'CN');
INSERT INTO `sys_region` VALUES (664, '140729', '灵石县', 54, 3, 0, 'Lingshi Xian', 'CN');
INSERT INTO `sys_region` VALUES (665, '140781', '介休市', 54, 3, 0, 'Jiexiu Shi', 'CN');
INSERT INTO `sys_region` VALUES (666, '140801', '市辖区', 55, 3, 0, '1', 'CN');
INSERT INTO `sys_region` VALUES (667, '140802', '盐湖区', 55, 3, 0, 'Yanhu Qu', 'CN');
INSERT INTO `sys_region` VALUES (668, '140821', '临猗县', 55, 3, 0, 'Linyi Xian', 'CN');
INSERT INTO `sys_region` VALUES (669, '140822', '万荣县', 55, 3, 0, 'Wanrong Xian', 'CN');
INSERT INTO `sys_region` VALUES (670, '140823', '闻喜县', 55, 3, 0, 'Wenxi Xian', 'CN');
INSERT INTO `sys_region` VALUES (671, '140824', '稷山县', 55, 3, 0, 'Jishan Xian', 'CN');
INSERT INTO `sys_region` VALUES (672, '140825', '新绛县', 55, 3, 0, 'Xinjiang Xian', 'CN');
INSERT INTO `sys_region` VALUES (673, '140826', '绛县', 55, 3, 0, 'Jiang Xian', 'CN');
INSERT INTO `sys_region` VALUES (674, '140827', '垣曲县', 55, 3, 0, 'Yuanqu Xian', 'CN');
INSERT INTO `sys_region` VALUES (675, '140828', '夏县', 55, 3, 0, 'Xia Xian ', 'CN');
INSERT INTO `sys_region` VALUES (676, '140829', '平陆县', 55, 3, 0, 'Pinglu Xian', 'CN');
INSERT INTO `sys_region` VALUES (677, '140830', '芮城县', 55, 3, 0, 'Ruicheng Xian', 'CN');
INSERT INTO `sys_region` VALUES (678, '140881', '永济市', 55, 3, 0, 'Yongji Shi ', 'CN');
INSERT INTO `sys_region` VALUES (679, '140882', '河津市', 55, 3, 0, 'Hejin Shi', 'CN');
INSERT INTO `sys_region` VALUES (680, '140901', '市辖区', 56, 3, 0, '1', 'CN');
INSERT INTO `sys_region` VALUES (681, '140902', '忻府区', 56, 3, 0, 'Xinfu Qu', 'CN');
INSERT INTO `sys_region` VALUES (682, '140921', '定襄县', 56, 3, 0, 'Dingxiang Xian', 'CN');
INSERT INTO `sys_region` VALUES (683, '140922', '五台县', 56, 3, 0, 'Wutai Xian', 'CN');
INSERT INTO `sys_region` VALUES (684, '140923', '代县', 56, 3, 0, 'Dai Xian', 'CN');
INSERT INTO `sys_region` VALUES (685, '140924', '繁峙县', 56, 3, 0, 'Fanshi Xian', 'CN');
INSERT INTO `sys_region` VALUES (686, '140925', '宁武县', 56, 3, 0, 'Ningwu Xian', 'CN');
INSERT INTO `sys_region` VALUES (687, '140926', '静乐县', 56, 3, 0, 'Jingle Xian', 'CN');
INSERT INTO `sys_region` VALUES (688, '140927', '神池县', 56, 3, 0, 'Shenchi Xian', 'CN');
INSERT INTO `sys_region` VALUES (689, '140928', '五寨县', 56, 3, 0, 'Wuzhai Xian', 'CN');
INSERT INTO `sys_region` VALUES (690, '140929', '岢岚县', 56, 3, 0, 'Kelan Xian', 'CN');
INSERT INTO `sys_region` VALUES (691, '140930', '河曲县', 56, 3, 0, 'Hequ Xian ', 'CN');
INSERT INTO `sys_region` VALUES (692, '140931', '保德县', 56, 3, 0, 'Baode Xian', 'CN');
INSERT INTO `sys_region` VALUES (693, '140932', '偏关县', 56, 3, 0, 'Pianguan Xian', 'CN');
INSERT INTO `sys_region` VALUES (694, '140981', '原平市', 56, 3, 0, 'Yuanping Shi', 'CN');
INSERT INTO `sys_region` VALUES (695, '141001', '市辖区', 57, 3, 0, '1', 'CN');
INSERT INTO `sys_region` VALUES (696, '141002', '尧都区', 57, 3, 0, 'Yaodu Qu', 'CN');
INSERT INTO `sys_region` VALUES (697, '141021', '曲沃县', 57, 3, 0, 'Quwo Xian ', 'CN');
INSERT INTO `sys_region` VALUES (698, '141022', '翼城县', 57, 3, 0, 'Yicheng Xian', 'CN');
INSERT INTO `sys_region` VALUES (699, '141023', '襄汾县', 57, 3, 0, 'Xiangfen Xian', 'CN');
INSERT INTO `sys_region` VALUES (700, '141024', '洪洞县', 57, 3, 0, 'Hongtong Xian', 'CN');
INSERT INTO `sys_region` VALUES (701, '141025', '古县', 57, 3, 0, 'Gu Xian', 'CN');
INSERT INTO `sys_region` VALUES (702, '141026', '安泽县', 57, 3, 0, 'Anze Xian', 'CN');
INSERT INTO `sys_region` VALUES (703, '141027', '浮山县', 57, 3, 0, 'Fushan Xian ', 'CN');
INSERT INTO `sys_region` VALUES (704, '141028', '吉县', 57, 3, 0, 'Ji Xian', 'CN');
INSERT INTO `sys_region` VALUES (705, '141029', '乡宁县', 57, 3, 0, 'Xiangning Xian', 'CN');
INSERT INTO `sys_region` VALUES (706, '141030', '大宁县', 57, 3, 0, 'Daning Xian', 'CN');
INSERT INTO `sys_region` VALUES (707, '141031', '隰县', 57, 3, 0, 'Xi Xian', 'CN');
INSERT INTO `sys_region` VALUES (708, '141032', '永和县', 57, 3, 0, 'Yonghe Xian', 'CN');
INSERT INTO `sys_region` VALUES (709, '141033', '蒲县', 57, 3, 0, 'Pu Xian', 'CN');
INSERT INTO `sys_region` VALUES (710, '141034', '汾西县', 57, 3, 0, 'Fenxi Xian', 'CN');
INSERT INTO `sys_region` VALUES (711, '141081', '侯马市', 57, 3, 0, 'Houma Shi ', 'CN');
INSERT INTO `sys_region` VALUES (712, '141082', '霍州市', 57, 3, 0, 'Huozhou Shi ', 'CN');
INSERT INTO `sys_region` VALUES (713, '141101', '市辖区', 58, 3, 0, '1', 'CN');
INSERT INTO `sys_region` VALUES (714, '141102', '离石区', 58, 3, 0, 'Lishi Qu', 'CN');
INSERT INTO `sys_region` VALUES (715, '141121', '文水县', 58, 3, 0, 'Wenshui Xian', 'CN');
INSERT INTO `sys_region` VALUES (716, '141122', '交城县', 58, 3, 0, 'Jiaocheng Xian', 'CN');
INSERT INTO `sys_region` VALUES (717, '141123', '兴县', 58, 3, 0, 'Xing Xian', 'CN');
INSERT INTO `sys_region` VALUES (718, '141124', '临县', 58, 3, 0, 'Lin Xian ', 'CN');
INSERT INTO `sys_region` VALUES (719, '141125', '柳林县', 58, 3, 0, 'Liulin Xian', 'CN');
INSERT INTO `sys_region` VALUES (720, '141126', '石楼县', 58, 3, 0, 'Shilou Xian', 'CN');
INSERT INTO `sys_region` VALUES (721, '141127', '岚县', 58, 3, 0, 'Lan Xian', 'CN');
INSERT INTO `sys_region` VALUES (722, '141128', '方山县', 58, 3, 0, 'Fangshan Xian', 'CN');
INSERT INTO `sys_region` VALUES (723, '141129', '中阳县', 58, 3, 0, 'Zhongyang Xian', 'CN');
INSERT INTO `sys_region` VALUES (724, '141130', '交口县', 58, 3, 0, 'Jiaokou Xian', 'CN');
INSERT INTO `sys_region` VALUES (725, '141181', '孝义市', 58, 3, 0, 'Xiaoyi Shi', 'CN');
INSERT INTO `sys_region` VALUES (726, '141182', '汾阳市', 58, 3, 0, 'Fenyang Shi', 'CN');
INSERT INTO `sys_region` VALUES (727, '150101', '市辖区', 59, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (728, '150102', '新城区', 59, 3, 0, 'Xincheng Qu', 'CN');
INSERT INTO `sys_region` VALUES (729, '150103', '回民区', 59, 3, 0, 'Huimin Qu', 'CN');
INSERT INTO `sys_region` VALUES (730, '150104', '玉泉区', 59, 3, 0, 'Yuquan Qu', 'CN');
INSERT INTO `sys_region` VALUES (731, '150105', '赛罕区', 59, 3, 0, 'Saihan Qu', 'CN');
INSERT INTO `sys_region` VALUES (732, '150121', '土默特左旗', 59, 3, 0, 'Tumd Zuoqi', 'CN');
INSERT INTO `sys_region` VALUES (733, '150122', '托克托县', 59, 3, 0, 'Togtoh Xian', 'CN');
INSERT INTO `sys_region` VALUES (734, '150123', '和林格尔县', 59, 3, 0, 'Horinger Xian', 'CN');
INSERT INTO `sys_region` VALUES (735, '150124', '清水河县', 59, 3, 0, 'Qingshuihe Xian', 'CN');
INSERT INTO `sys_region` VALUES (736, '150125', '武川县', 59, 3, 0, 'Wuchuan Xian', 'CN');
INSERT INTO `sys_region` VALUES (737, '150201', '市辖区', 60, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (738, '150202', '东河区', 60, 3, 0, 'Donghe Qu', 'CN');
INSERT INTO `sys_region` VALUES (739, '150203', '昆都仑区', 60, 3, 0, 'Kundulun Qu', 'CN');
INSERT INTO `sys_region` VALUES (740, '150204', '青山区', 60, 3, 0, 'Qingshan Qu', 'CN');
INSERT INTO `sys_region` VALUES (741, '150205', '石拐区', 60, 3, 0, 'Shiguai Qu', 'CN');
INSERT INTO `sys_region` VALUES (742, '150206', '白云鄂博矿区', 60, 3, 0, 'Baiyun Kuangqu', 'CN');
INSERT INTO `sys_region` VALUES (743, '150207', '九原区', 60, 3, 0, 'Jiuyuan Qu', 'CN');
INSERT INTO `sys_region` VALUES (744, '150221', '土默特右旗', 60, 3, 0, 'Tumd Youqi', 'CN');
INSERT INTO `sys_region` VALUES (745, '150222', '固阳县', 60, 3, 0, 'Guyang Xian', 'CN');
INSERT INTO `sys_region` VALUES (746, '150223', '达尔罕茂明安联合旗', 60, 3, 0, 'Darhan Muminggan Lianheqi', 'CN');
INSERT INTO `sys_region` VALUES (747, '150301', '市辖区', 61, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (748, '150302', '海勃湾区', 61, 3, 0, 'Haibowan Qu', 'CN');
INSERT INTO `sys_region` VALUES (749, '150303', '海南区', 61, 3, 0, 'Hainan Qu', 'CN');
INSERT INTO `sys_region` VALUES (750, '150304', '乌达区', 61, 3, 0, 'Ud Qu', 'CN');
INSERT INTO `sys_region` VALUES (751, '150401', '市辖区', 62, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (752, '150402', '红山区', 62, 3, 0, 'Hongshan Qu', 'CN');
INSERT INTO `sys_region` VALUES (753, '150403', '元宝山区', 62, 3, 0, 'Yuanbaoshan Qu', 'CN');
INSERT INTO `sys_region` VALUES (754, '150404', '松山区', 62, 3, 0, 'Songshan Qu', 'CN');
INSERT INTO `sys_region` VALUES (755, '150421', '阿鲁科尔沁旗', 62, 3, 0, 'Ar Horqin Qi', 'CN');
INSERT INTO `sys_region` VALUES (756, '150422', '巴林左旗', 62, 3, 0, 'Bairin Zuoqi', 'CN');
INSERT INTO `sys_region` VALUES (757, '150423', '巴林右旗', 62, 3, 0, 'Bairin Youqi', 'CN');
INSERT INTO `sys_region` VALUES (758, '150424', '林西县', 62, 3, 0, 'Linxi Xian', 'CN');
INSERT INTO `sys_region` VALUES (759, '150425', '克什克腾旗', 62, 3, 0, 'Hexigten Qi', 'CN');
INSERT INTO `sys_region` VALUES (760, '150426', '翁牛特旗', 62, 3, 0, 'Ongniud Qi', 'CN');
INSERT INTO `sys_region` VALUES (761, '150428', '喀喇沁旗', 62, 3, 0, 'Harqin Qi', 'CN');
INSERT INTO `sys_region` VALUES (762, '150429', '宁城县', 62, 3, 0, 'Ningcheng Xian', 'CN');
INSERT INTO `sys_region` VALUES (763, '150430', '敖汉旗', 62, 3, 0, 'Aohan Qi', 'CN');
INSERT INTO `sys_region` VALUES (764, '150501', '市辖区', 63, 3, 0, '1', 'CN');
INSERT INTO `sys_region` VALUES (765, '150502', '科尔沁区', 63, 3, 0, 'Keermi Qu', 'CN');
INSERT INTO `sys_region` VALUES (766, '150521', '科尔沁左翼中旗', 63, 3, 0, 'Horqin Zuoyi Zhongqi', 'CN');
INSERT INTO `sys_region` VALUES (767, '150522', '科尔沁左翼后旗', 63, 3, 0, 'Horqin Zuoyi Houqi', 'CN');
INSERT INTO `sys_region` VALUES (768, '150523', '开鲁县', 63, 3, 0, 'Kailu Xian', 'CN');
INSERT INTO `sys_region` VALUES (769, '150524', '库伦旗', 63, 3, 0, 'Hure Qi', 'CN');
INSERT INTO `sys_region` VALUES (770, '150525', '奈曼旗', 63, 3, 0, 'Naiman Qi', 'CN');
INSERT INTO `sys_region` VALUES (771, '150526', '扎鲁特旗', 63, 3, 0, 'Jarud Qi', 'CN');
INSERT INTO `sys_region` VALUES (772, '150581', '霍林郭勒市', 63, 3, 0, 'Holingol Shi', 'CN');
INSERT INTO `sys_region` VALUES (773, '150602', '东胜区', 64, 3, 0, 'Dongsheng Qu', 'CN');
INSERT INTO `sys_region` VALUES (774, '150621', '达拉特旗', 64, 3, 0, 'Dalad Qi', 'CN');
INSERT INTO `sys_region` VALUES (775, '150622', '准格尔旗', 64, 3, 0, 'Jungar Qi', 'CN');
INSERT INTO `sys_region` VALUES (776, '150623', '鄂托克前旗', 64, 3, 0, 'Otog Qianqi', 'CN');
INSERT INTO `sys_region` VALUES (777, '150624', '鄂托克旗', 64, 3, 0, 'Otog Qi', 'CN');
INSERT INTO `sys_region` VALUES (778, '150625', '杭锦旗', 64, 3, 0, 'Hanggin Qi', 'CN');
INSERT INTO `sys_region` VALUES (779, '150626', '乌审旗', 64, 3, 0, 'Uxin Qi', 'CN');
INSERT INTO `sys_region` VALUES (780, '150627', '伊金霍洛旗', 64, 3, 0, 'Ejin Horo Qi', 'CN');
INSERT INTO `sys_region` VALUES (781, '150701', '市辖区', 65, 3, 0, '1', 'CN');
INSERT INTO `sys_region` VALUES (782, '150702', '海拉尔区', 65, 3, 0, 'Hailaer Qu', 'CN');
INSERT INTO `sys_region` VALUES (783, '150721', '阿荣旗', 65, 3, 0, 'Arun Qi', 'CN');
INSERT INTO `sys_region` VALUES (784, '150722', '莫力达瓦达斡尔族自治旗', 65, 3, 0, 'Morin Dawa Daurzu Zizhiqi', 'CN');
INSERT INTO `sys_region` VALUES (785, '150723', '鄂伦春自治旗', 65, 3, 0, 'Oroqen Zizhiqi', 'CN');
INSERT INTO `sys_region` VALUES (786, '150724', '鄂温克族自治旗', 65, 3, 0, 'Ewenkizu Zizhiqi', 'CN');
INSERT INTO `sys_region` VALUES (787, '150725', '陈巴尔虎旗', 65, 3, 0, 'Chen Barag Qi', 'CN');
INSERT INTO `sys_region` VALUES (788, '150726', '新巴尔虎左旗', 65, 3, 0, 'Xin Barag Zuoqi', 'CN');
INSERT INTO `sys_region` VALUES (789, '150727', '新巴尔虎右旗', 65, 3, 0, 'Xin Barag Youqi', 'CN');
INSERT INTO `sys_region` VALUES (790, '150781', '满洲里市', 65, 3, 0, 'Manzhouli Shi', 'CN');
INSERT INTO `sys_region` VALUES (791, '150782', '牙克石市', 65, 3, 0, 'Yakeshi Shi', 'CN');
INSERT INTO `sys_region` VALUES (792, '150783', '扎兰屯市', 65, 3, 0, 'Zalantun Shi', 'CN');
INSERT INTO `sys_region` VALUES (793, '150784', '额尔古纳市', 65, 3, 0, 'Ergun Shi', 'CN');
INSERT INTO `sys_region` VALUES (794, '150785', '根河市', 65, 3, 0, 'Genhe Shi', 'CN');
INSERT INTO `sys_region` VALUES (795, '150801', '市辖区', 66, 3, 0, '1', 'CN');
INSERT INTO `sys_region` VALUES (796, '150802', '临河区', 66, 3, 0, 'Linhe Qu', 'CN');
INSERT INTO `sys_region` VALUES (797, '150821', '五原县', 66, 3, 0, 'Wuyuan Xian', 'CN');
INSERT INTO `sys_region` VALUES (798, '150822', '磴口县', 66, 3, 0, 'Dengkou Xian', 'CN');
INSERT INTO `sys_region` VALUES (799, '150823', '乌拉特前旗', 66, 3, 0, 'Urad Qianqi', 'CN');
INSERT INTO `sys_region` VALUES (800, '150824', '乌拉特中旗', 66, 3, 0, 'Urad Zhongqi', 'CN');
INSERT INTO `sys_region` VALUES (801, '150825', '乌拉特后旗', 66, 3, 0, 'Urad Houqi', 'CN');
INSERT INTO `sys_region` VALUES (802, '150826', '杭锦后旗', 66, 3, 0, 'Hanggin Houqi', 'CN');
INSERT INTO `sys_region` VALUES (803, '150901', '市辖区', 67, 3, 0, '1', 'CN');
INSERT INTO `sys_region` VALUES (804, '150902', '集宁区', 67, 3, 0, 'Jining Qu', 'CN');
INSERT INTO `sys_region` VALUES (805, '150921', '卓资县', 67, 3, 0, 'Zhuozi Xian', 'CN');
INSERT INTO `sys_region` VALUES (806, '150922', '化德县', 67, 3, 0, 'Huade Xian', 'CN');
INSERT INTO `sys_region` VALUES (807, '150923', '商都县', 67, 3, 0, 'Shangdu Xian', 'CN');
INSERT INTO `sys_region` VALUES (808, '150924', '兴和县', 67, 3, 0, 'Xinghe Xian', 'CN');
INSERT INTO `sys_region` VALUES (809, '150925', '凉城县', 67, 3, 0, 'Liangcheng Xian', 'CN');
INSERT INTO `sys_region` VALUES (810, '150926', '察哈尔右翼前旗', 67, 3, 0, 'Qahar Youyi Qianqi', 'CN');
INSERT INTO `sys_region` VALUES (811, '150927', '察哈尔右翼中旗', 67, 3, 0, 'Qahar Youyi Zhongqi', 'CN');
INSERT INTO `sys_region` VALUES (812, '150928', '察哈尔右翼后旗', 67, 3, 0, 'Qahar Youyi Houqi', 'CN');
INSERT INTO `sys_region` VALUES (813, '150929', '四子王旗', 67, 3, 0, 'Dorbod Qi', 'CN');
INSERT INTO `sys_region` VALUES (814, '150981', '丰镇市', 67, 3, 0, 'Fengzhen Shi', 'CN');
INSERT INTO `sys_region` VALUES (815, '152201', '乌兰浩特市', 68, 3, 0, 'Ulan Hot Shi', 'CN');
INSERT INTO `sys_region` VALUES (816, '152202', '阿尔山市', 68, 3, 0, 'Arxan Shi', 'CN');
INSERT INTO `sys_region` VALUES (817, '152221', '科尔沁右翼前旗', 68, 3, 0, 'Horqin Youyi Qianqi', 'CN');
INSERT INTO `sys_region` VALUES (818, '152222', '科尔沁右翼中旗', 68, 3, 0, 'Horqin Youyi Zhongqi', 'CN');
INSERT INTO `sys_region` VALUES (819, '152223', '扎赉特旗', 68, 3, 0, 'Jalaid Qi', 'CN');
INSERT INTO `sys_region` VALUES (820, '152224', '突泉县', 68, 3, 0, 'Tuquan Xian', 'CN');
INSERT INTO `sys_region` VALUES (821, '152501', '二连浩特市', 69, 3, 0, 'Erenhot Shi', 'CN');
INSERT INTO `sys_region` VALUES (822, '152502', '锡林浩特市', 69, 3, 0, 'Xilinhot Shi', 'CN');
INSERT INTO `sys_region` VALUES (823, '152522', '阿巴嘎旗', 69, 3, 0, 'Abag Qi', 'CN');
INSERT INTO `sys_region` VALUES (824, '152523', '苏尼特左旗', 69, 3, 0, 'Sonid Zuoqi', 'CN');
INSERT INTO `sys_region` VALUES (825, '152524', '苏尼特右旗', 69, 3, 0, 'Sonid Youqi', 'CN');
INSERT INTO `sys_region` VALUES (826, '152525', '东乌珠穆沁旗', 69, 3, 0, 'Dong Ujimqin Qi', 'CN');
INSERT INTO `sys_region` VALUES (827, '152526', '西乌珠穆沁旗', 69, 3, 0, 'Xi Ujimqin Qi', 'CN');
INSERT INTO `sys_region` VALUES (828, '152527', '太仆寺旗', 69, 3, 0, 'Taibus Qi', 'CN');
INSERT INTO `sys_region` VALUES (829, '152528', '镶黄旗', 69, 3, 0, 'Xianghuang(Hobot Xar) Qi', 'CN');
INSERT INTO `sys_region` VALUES (830, '152529', '正镶白旗', 69, 3, 0, 'Zhengxiangbai(Xulun Hobot Qagan)Qi', 'CN');
INSERT INTO `sys_region` VALUES (831, '152530', '正蓝旗', 69, 3, 0, 'Zhenglan(Xulun Hoh)Qi', 'CN');
INSERT INTO `sys_region` VALUES (832, '152531', '多伦县', 69, 3, 0, 'Duolun (Dolonnur)Xian', 'CN');
INSERT INTO `sys_region` VALUES (833, '152921', '阿拉善左旗', 70, 3, 0, 'Alxa Zuoqi', 'CN');
INSERT INTO `sys_region` VALUES (834, '152922', '阿拉善右旗', 70, 3, 0, 'Alxa Youqi', 'CN');
INSERT INTO `sys_region` VALUES (835, '152923', '额济纳旗', 70, 3, 0, 'Ejin Qi', 'CN');
INSERT INTO `sys_region` VALUES (836, '210101', '市辖区', 71, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (837, '210102', '和平区', 71, 3, 0, 'Heping Qu', 'CN');
INSERT INTO `sys_region` VALUES (838, '210103', '沈河区', 71, 3, 0, 'Shenhe Qu ', 'CN');
INSERT INTO `sys_region` VALUES (839, '210104', '大东区', 71, 3, 0, 'Dadong Qu ', 'CN');
INSERT INTO `sys_region` VALUES (840, '210105', '皇姑区', 71, 3, 0, 'Huanggu Qu', 'CN');
INSERT INTO `sys_region` VALUES (841, '210106', '铁西区', 71, 3, 0, 'Tiexi Qu', 'CN');
INSERT INTO `sys_region` VALUES (842, '210111', '苏家屯区', 71, 3, 0, 'Sujiatun Qu', 'CN');
INSERT INTO `sys_region` VALUES (843, '210112', '东陵区', 71, 3, 0, 'Dongling Qu ', 'CN');
INSERT INTO `sys_region` VALUES (844, '210113', '沈北新区', 71, 3, 0, 'Xinchengzi Qu', 'CN');
INSERT INTO `sys_region` VALUES (845, '210114', '于洪区', 71, 3, 0, 'Yuhong Qu ', 'CN');
INSERT INTO `sys_region` VALUES (846, '210122', '辽中县', 71, 3, 0, 'Liaozhong Xian', 'CN');
INSERT INTO `sys_region` VALUES (847, '210123', '康平县', 71, 3, 0, 'Kangping Xian', 'CN');
INSERT INTO `sys_region` VALUES (848, '210124', '法库县', 71, 3, 0, 'Faku Xian', 'CN');
INSERT INTO `sys_region` VALUES (849, '210181', '新民市', 71, 3, 0, 'Xinmin Shi', 'CN');
INSERT INTO `sys_region` VALUES (850, '210201', '市辖区', 72, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (851, '210202', '中山区', 72, 3, 0, 'Zhongshan Qu', 'CN');
INSERT INTO `sys_region` VALUES (852, '210203', '西岗区', 72, 3, 0, 'Xigang Qu', 'CN');
INSERT INTO `sys_region` VALUES (853, '210204', '沙河口区', 72, 3, 0, 'Shahekou Qu', 'CN');
INSERT INTO `sys_region` VALUES (854, '210211', '甘井子区', 72, 3, 0, 'Ganjingzi Qu', 'CN');
INSERT INTO `sys_region` VALUES (855, '210212', '旅顺口区', 72, 3, 0, 'Lvshunkou Qu ', 'CN');
INSERT INTO `sys_region` VALUES (856, '210213', '金州区', 72, 3, 0, 'Jinzhou Qu', 'CN');
INSERT INTO `sys_region` VALUES (857, '210224', '长海县', 72, 3, 0, 'Changhai Xian', 'CN');
INSERT INTO `sys_region` VALUES (858, '210281', '瓦房店市', 72, 3, 0, 'Wafangdian Shi', 'CN');
INSERT INTO `sys_region` VALUES (859, '210282', '普兰店市', 72, 3, 0, 'Pulandian Shi', 'CN');
INSERT INTO `sys_region` VALUES (860, '210283', '庄河市', 72, 3, 0, 'Zhuanghe Shi', 'CN');
INSERT INTO `sys_region` VALUES (861, '210301', '市辖区', 73, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (862, '210302', '铁东区', 73, 3, 0, 'Tiedong Qu ', 'CN');
INSERT INTO `sys_region` VALUES (863, '210303', '铁西区', 73, 3, 0, 'Tiexi Qu', 'CN');
INSERT INTO `sys_region` VALUES (864, '210304', '立山区', 73, 3, 0, 'Lishan Qu', 'CN');
INSERT INTO `sys_region` VALUES (865, '210311', '千山区', 73, 3, 0, 'Qianshan Qu ', 'CN');
INSERT INTO `sys_region` VALUES (866, '210321', '台安县', 73, 3, 0, 'Tai,an Xian', 'CN');
INSERT INTO `sys_region` VALUES (867, '210323', '岫岩满族自治县', 73, 3, 0, 'Xiuyan Manzu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (868, '210381', '海城市', 73, 3, 0, 'Haicheng Shi', 'CN');
INSERT INTO `sys_region` VALUES (869, '210401', '市辖区', 74, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (870, '210402', '新抚区', 74, 3, 0, 'Xinfu Qu', 'CN');
INSERT INTO `sys_region` VALUES (871, '210403', '东洲区', 74, 3, 0, 'Dongzhou Qu', 'CN');
INSERT INTO `sys_region` VALUES (872, '210404', '望花区', 74, 3, 0, 'Wanghua Qu', 'CN');
INSERT INTO `sys_region` VALUES (873, '210411', '顺城区', 74, 3, 0, 'Shuncheng Qu', 'CN');
INSERT INTO `sys_region` VALUES (874, '210421', '抚顺县', 74, 3, 0, 'Fushun Xian', 'CN');
INSERT INTO `sys_region` VALUES (875, '210422', '新宾满族自治县', 74, 3, 0, 'Xinbinmanzuzizhi Xian', 'CN');
INSERT INTO `sys_region` VALUES (876, '210423', '清原满族自治县', 74, 3, 0, 'Qingyuanmanzuzizhi Xian', 'CN');
INSERT INTO `sys_region` VALUES (877, '210501', '市辖区', 75, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (878, '210502', '平山区', 75, 3, 0, 'Pingshan Qu', 'CN');
INSERT INTO `sys_region` VALUES (879, '210503', '溪湖区', 75, 3, 0, 'Xihu Qu ', 'CN');
INSERT INTO `sys_region` VALUES (880, '210504', '明山区', 75, 3, 0, 'Mingshan Qu', 'CN');
INSERT INTO `sys_region` VALUES (881, '210505', '南芬区', 75, 3, 0, 'Nanfen Qu', 'CN');
INSERT INTO `sys_region` VALUES (882, '210521', '本溪满族自治县', 75, 3, 0, 'Benxi Manzu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (883, '210522', '桓仁满族自治县', 75, 3, 0, 'Huanren Manzu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (884, '210601', '市辖区', 76, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (885, '210602', '元宝区', 76, 3, 0, 'Yuanbao Qu', 'CN');
INSERT INTO `sys_region` VALUES (886, '210603', '振兴区', 76, 3, 0, 'Zhenxing Qu ', 'CN');
INSERT INTO `sys_region` VALUES (887, '210604', '振安区', 76, 3, 0, 'Zhen,an Qu', 'CN');
INSERT INTO `sys_region` VALUES (888, '210624', '宽甸满族自治县', 76, 3, 0, 'Kuandian Manzu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (889, '210681', '东港市', 76, 3, 0, 'Donggang Shi', 'CN');
INSERT INTO `sys_region` VALUES (890, '210682', '凤城市', 76, 3, 0, 'Fengcheng Shi', 'CN');
INSERT INTO `sys_region` VALUES (891, '210701', '市辖区', 77, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (892, '210702', '古塔区', 77, 3, 0, 'Guta Qu', 'CN');
INSERT INTO `sys_region` VALUES (893, '210703', '凌河区', 77, 3, 0, 'Linghe Qu', 'CN');
INSERT INTO `sys_region` VALUES (894, '210711', '太和区', 77, 3, 0, 'Taihe Qu', 'CN');
INSERT INTO `sys_region` VALUES (895, '210726', '黑山县', 77, 3, 0, 'Heishan Xian', 'CN');
INSERT INTO `sys_region` VALUES (896, '210727', '义县', 77, 3, 0, 'Yi Xian', 'CN');
INSERT INTO `sys_region` VALUES (897, '210781', '凌海市', 77, 3, 0, 'Linghai Shi ', 'CN');
INSERT INTO `sys_region` VALUES (898, '210782', '北镇市', 77, 3, 0, 'Beining Shi', 'CN');
INSERT INTO `sys_region` VALUES (899, '210801', '市辖区', 78, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (900, '210802', '站前区', 78, 3, 0, 'Zhanqian Qu', 'CN');
INSERT INTO `sys_region` VALUES (901, '210803', '西市区', 78, 3, 0, 'Xishi Qu', 'CN');
INSERT INTO `sys_region` VALUES (902, '210804', '鲅鱼圈区', 78, 3, 0, 'Bayuquan Qu', 'CN');
INSERT INTO `sys_region` VALUES (903, '210811', '老边区', 78, 3, 0, 'Laobian Qu', 'CN');
INSERT INTO `sys_region` VALUES (904, '210881', '盖州市', 78, 3, 0, 'Gaizhou Shi', 'CN');
INSERT INTO `sys_region` VALUES (905, '210882', '大石桥市', 78, 3, 0, 'Dashiqiao Shi', 'CN');
INSERT INTO `sys_region` VALUES (906, '210901', '市辖区', 79, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (907, '210902', '海州区', 79, 3, 0, 'Haizhou Qu', 'CN');
INSERT INTO `sys_region` VALUES (908, '210903', '新邱区', 79, 3, 0, 'Xinqiu Qu', 'CN');
INSERT INTO `sys_region` VALUES (909, '210904', '太平区', 79, 3, 0, 'Taiping Qu', 'CN');
INSERT INTO `sys_region` VALUES (910, '210905', '清河门区', 79, 3, 0, 'Qinghemen Qu', 'CN');
INSERT INTO `sys_region` VALUES (911, '210911', '细河区', 79, 3, 0, 'Xihe Qu', 'CN');
INSERT INTO `sys_region` VALUES (912, '210921', '阜新蒙古族自治县', 79, 3, 0, 'Fuxin Mongolzu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (913, '210922', '彰武县', 79, 3, 0, 'Zhangwu Xian', 'CN');
INSERT INTO `sys_region` VALUES (914, '211001', '市辖区', 80, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (915, '211002', '白塔区', 80, 3, 0, 'Baita Qu', 'CN');
INSERT INTO `sys_region` VALUES (916, '211003', '文圣区', 80, 3, 0, 'Wensheng Qu', 'CN');
INSERT INTO `sys_region` VALUES (917, '211004', '宏伟区', 80, 3, 0, 'Hongwei Qu', 'CN');
INSERT INTO `sys_region` VALUES (918, '211005', '弓长岭区', 80, 3, 0, 'Gongchangling Qu', 'CN');
INSERT INTO `sys_region` VALUES (919, '211011', '太子河区', 80, 3, 0, 'Taizihe Qu', 'CN');
INSERT INTO `sys_region` VALUES (920, '211021', '辽阳县', 80, 3, 0, 'Liaoyang Xian', 'CN');
INSERT INTO `sys_region` VALUES (921, '211081', '灯塔市', 80, 3, 0, 'Dengta Shi', 'CN');
INSERT INTO `sys_region` VALUES (922, '211101', '市辖区', 81, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (923, '211102', '双台子区', 81, 3, 0, 'Shuangtaizi Qu', 'CN');
INSERT INTO `sys_region` VALUES (924, '211103', '兴隆台区', 81, 3, 0, 'Xinglongtai Qu', 'CN');
INSERT INTO `sys_region` VALUES (925, '211121', '大洼县', 81, 3, 0, 'Dawa Xian', 'CN');
INSERT INTO `sys_region` VALUES (926, '211122', '盘山县', 81, 3, 0, 'Panshan Xian', 'CN');
INSERT INTO `sys_region` VALUES (927, '211201', '市辖区', 82, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (928, '211202', '银州区', 82, 3, 0, 'Yinzhou Qu', 'CN');
INSERT INTO `sys_region` VALUES (929, '211204', '清河区', 82, 3, 0, 'Qinghe Qu', 'CN');
INSERT INTO `sys_region` VALUES (930, '211221', '铁岭县', 82, 3, 0, 'Tieling Xian', 'CN');
INSERT INTO `sys_region` VALUES (931, '211223', '西丰县', 82, 3, 0, 'Xifeng Xian', 'CN');
INSERT INTO `sys_region` VALUES (932, '211224', '昌图县', 82, 3, 0, 'Changtu Xian', 'CN');
INSERT INTO `sys_region` VALUES (933, '211281', '调兵山市', 82, 3, 0, 'Diaobingshan Shi', 'CN');
INSERT INTO `sys_region` VALUES (934, '211282', '开原市', 82, 3, 0, 'Kaiyuan Shi', 'CN');
INSERT INTO `sys_region` VALUES (935, '211301', '市辖区', 83, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (936, '211302', '双塔区', 83, 3, 0, 'Shuangta Qu', 'CN');
INSERT INTO `sys_region` VALUES (937, '211303', '龙城区', 83, 3, 0, 'Longcheng Qu', 'CN');
INSERT INTO `sys_region` VALUES (938, '211321', '朝阳县', 83, 3, 0, 'Chaoyang Xian', 'CN');
INSERT INTO `sys_region` VALUES (939, '211322', '建平县', 83, 3, 0, 'Jianping Xian', 'CN');
INSERT INTO `sys_region` VALUES (940, '211324', '喀喇沁左翼蒙古族自治县', 83, 3, 0, 'Harqin Zuoyi Mongolzu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (941, '211381', '北票市', 83, 3, 0, 'Beipiao Shi', 'CN');
INSERT INTO `sys_region` VALUES (942, '211382', '凌源市', 83, 3, 0, 'Lingyuan Shi', 'CN');
INSERT INTO `sys_region` VALUES (943, '211401', '市辖区', 84, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (944, '211402', '连山区', 84, 3, 0, 'Lianshan Qu', 'CN');
INSERT INTO `sys_region` VALUES (945, '211403', '龙港区', 84, 3, 0, 'Longgang Qu', 'CN');
INSERT INTO `sys_region` VALUES (946, '211404', '南票区', 84, 3, 0, 'Nanpiao Qu', 'CN');
INSERT INTO `sys_region` VALUES (947, '211421', '绥中县', 84, 3, 0, 'Suizhong Xian', 'CN');
INSERT INTO `sys_region` VALUES (948, '211422', '建昌县', 84, 3, 0, 'Jianchang Xian', 'CN');
INSERT INTO `sys_region` VALUES (949, '211481', '兴城市', 84, 3, 0, 'Xingcheng Shi', 'CN');
INSERT INTO `sys_region` VALUES (950, '220101', '市辖区', 85, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (951, '220102', '南关区', 85, 3, 0, 'Nanguan Qu', 'CN');
INSERT INTO `sys_region` VALUES (952, '220103', '宽城区', 85, 3, 0, 'Kuancheng Qu', 'CN');
INSERT INTO `sys_region` VALUES (953, '220104', '朝阳区', 85, 3, 0, 'Chaoyang Qu ', 'CN');
INSERT INTO `sys_region` VALUES (954, '220105', '二道区', 85, 3, 0, 'Erdao Qu', 'CN');
INSERT INTO `sys_region` VALUES (955, '220106', '绿园区', 85, 3, 0, 'Lvyuan Qu', 'CN');
INSERT INTO `sys_region` VALUES (956, '220112', '双阳区', 85, 3, 0, 'Shuangyang Qu', 'CN');
INSERT INTO `sys_region` VALUES (957, '220122', '农安县', 85, 3, 0, 'Nong,an Xian ', 'CN');
INSERT INTO `sys_region` VALUES (958, '220181', '九台市', 85, 3, 0, 'Jiutai Shi', 'CN');
INSERT INTO `sys_region` VALUES (959, '220182', '榆树市', 85, 3, 0, 'Yushu Shi', 'CN');
INSERT INTO `sys_region` VALUES (960, '220183', '德惠市', 85, 3, 0, 'Dehui Shi', 'CN');
INSERT INTO `sys_region` VALUES (961, '220201', '市辖区', 86, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (962, '220202', '昌邑区', 86, 3, 0, 'Changyi Qu', 'CN');
INSERT INTO `sys_region` VALUES (963, '220203', '龙潭区', 86, 3, 0, 'Longtan Qu', 'CN');
INSERT INTO `sys_region` VALUES (964, '220204', '船营区', 86, 3, 0, 'Chuanying Qu', 'CN');
INSERT INTO `sys_region` VALUES (965, '220211', '丰满区', 86, 3, 0, 'Fengman Qu', 'CN');
INSERT INTO `sys_region` VALUES (966, '220221', '永吉县', 86, 3, 0, 'Yongji Xian', 'CN');
INSERT INTO `sys_region` VALUES (967, '220281', '蛟河市', 86, 3, 0, 'Jiaohe Shi', 'CN');
INSERT INTO `sys_region` VALUES (968, '220282', '桦甸市', 86, 3, 0, 'Huadian Shi', 'CN');
INSERT INTO `sys_region` VALUES (969, '220283', '舒兰市', 86, 3, 0, 'Shulan Shi', 'CN');
INSERT INTO `sys_region` VALUES (970, '220284', '磐石市', 86, 3, 0, 'Panshi Shi', 'CN');
INSERT INTO `sys_region` VALUES (971, '220301', '市辖区', 87, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (972, '220302', '铁西区', 87, 3, 0, 'Tiexi Qu', 'CN');
INSERT INTO `sys_region` VALUES (973, '220303', '铁东区', 87, 3, 0, 'Tiedong Qu ', 'CN');
INSERT INTO `sys_region` VALUES (974, '220322', '梨树县', 87, 3, 0, 'Lishu Xian', 'CN');
INSERT INTO `sys_region` VALUES (975, '220323', '伊通满族自治县', 87, 3, 0, 'Yitong Manzu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (976, '220381', '公主岭市', 87, 3, 0, 'Gongzhuling Shi', 'CN');
INSERT INTO `sys_region` VALUES (977, '220382', '双辽市', 87, 3, 0, 'Shuangliao Shi', 'CN');
INSERT INTO `sys_region` VALUES (978, '220401', '市辖区', 88, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (979, '220402', '龙山区', 88, 3, 0, 'Longshan Qu', 'CN');
INSERT INTO `sys_region` VALUES (980, '220403', '西安区', 88, 3, 0, 'Xi,an Qu', 'CN');
INSERT INTO `sys_region` VALUES (981, '220421', '东丰县', 88, 3, 0, 'Dongfeng Xian', 'CN');
INSERT INTO `sys_region` VALUES (982, '220422', '东辽县', 88, 3, 0, 'Dongliao Xian ', 'CN');
INSERT INTO `sys_region` VALUES (983, '220501', '市辖区', 89, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (984, '220502', '东昌区', 89, 3, 0, 'Dongchang Qu', 'CN');
INSERT INTO `sys_region` VALUES (985, '220503', '二道江区', 89, 3, 0, 'Erdaojiang Qu', 'CN');
INSERT INTO `sys_region` VALUES (986, '220521', '通化县', 89, 3, 0, 'Tonghua Xian ', 'CN');
INSERT INTO `sys_region` VALUES (987, '220523', '辉南县', 89, 3, 0, 'Huinan Xian ', 'CN');
INSERT INTO `sys_region` VALUES (988, '220524', '柳河县', 89, 3, 0, 'Liuhe Xian ', 'CN');
INSERT INTO `sys_region` VALUES (989, '220581', '梅河口市', 89, 3, 0, 'Meihekou Shi', 'CN');
INSERT INTO `sys_region` VALUES (990, '220582', '集安市', 89, 3, 0, 'Ji,an Shi', 'CN');
INSERT INTO `sys_region` VALUES (991, '220601', '市辖区', 90, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (992, '220602', '八道江区', 90, 3, 0, 'Badaojiang Qu', 'CN');
INSERT INTO `sys_region` VALUES (993, '220621', '抚松县', 90, 3, 0, 'Fusong Xian', 'CN');
INSERT INTO `sys_region` VALUES (994, '220622', '靖宇县', 90, 3, 0, 'Jingyu Xian', 'CN');
INSERT INTO `sys_region` VALUES (995, '220623', '长白朝鲜族自治县', 90, 3, 0, 'Changbaichaoxianzuzizhi Xian', 'CN');
INSERT INTO `sys_region` VALUES (996, '220605', '江源区', 90, 3, 0, 'Jiangyuan Xian', 'CN');
INSERT INTO `sys_region` VALUES (997, '220681', '临江市', 90, 3, 0, 'Linjiang Shi', 'CN');
INSERT INTO `sys_region` VALUES (998, '220701', '市辖区', 91, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (999, '220702', '宁江区', 91, 3, 0, 'Ningjiang Qu', 'CN');
INSERT INTO `sys_region` VALUES (1000, '220721', '前郭尔罗斯蒙古族自治县', 91, 3, 0, 'Qian Gorlos Mongolzu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (1001, '220722', '长岭县', 91, 3, 0, 'Changling Xian', 'CN');
INSERT INTO `sys_region` VALUES (1002, '220723', '乾安县', 91, 3, 0, 'Qian,an Xian', 'CN');
INSERT INTO `sys_region` VALUES (1003, '220724', '扶余县', 91, 3, 0, 'Fuyu Xian', 'CN');
INSERT INTO `sys_region` VALUES (1004, '220801', '市辖区', 92, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (1005, '220802', '洮北区', 92, 3, 0, 'Taobei Qu', 'CN');
INSERT INTO `sys_region` VALUES (1006, '220821', '镇赉县', 92, 3, 0, 'Zhenlai Xian', 'CN');
INSERT INTO `sys_region` VALUES (1007, '220822', '通榆县', 92, 3, 0, 'Tongyu Xian', 'CN');
INSERT INTO `sys_region` VALUES (1008, '220881', '洮南市', 92, 3, 0, 'Taonan Shi', 'CN');
INSERT INTO `sys_region` VALUES (1009, '220882', '大安市', 92, 3, 0, 'Da,an Shi', 'CN');
INSERT INTO `sys_region` VALUES (1010, '222401', '延吉市', 93, 3, 0, 'Yanji Shi', 'CN');
INSERT INTO `sys_region` VALUES (1011, '222402', '图们市', 93, 3, 0, 'Tumen Shi', 'CN');
INSERT INTO `sys_region` VALUES (1012, '222403', '敦化市', 93, 3, 0, 'Dunhua Shi', 'CN');
INSERT INTO `sys_region` VALUES (1013, '222404', '珲春市', 93, 3, 0, 'Hunchun Shi', 'CN');
INSERT INTO `sys_region` VALUES (1014, '222405', '龙井市', 93, 3, 0, 'Longjing Shi', 'CN');
INSERT INTO `sys_region` VALUES (1015, '222406', '和龙市', 93, 3, 0, 'Helong Shi', 'CN');
INSERT INTO `sys_region` VALUES (1016, '222424', '汪清县', 93, 3, 0, 'Wangqing Xian', 'CN');
INSERT INTO `sys_region` VALUES (1017, '222426', '安图县', 93, 3, 0, 'Antu Xian', 'CN');
INSERT INTO `sys_region` VALUES (1018, '230101', '市辖区', 94, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (1019, '230102', '道里区', 94, 3, 0, 'Daoli Qu', 'CN');
INSERT INTO `sys_region` VALUES (1020, '230103', '南岗区', 94, 3, 0, 'Nangang Qu', 'CN');
INSERT INTO `sys_region` VALUES (1021, '230104', '道外区', 94, 3, 0, 'Daowai Qu', 'CN');
INSERT INTO `sys_region` VALUES (1022, '230110', '香坊区', 94, 3, 0, 'Xiangfang Qu', 'CN');
INSERT INTO `sys_region` VALUES (1024, '230108', '平房区', 94, 3, 0, 'Pingfang Qu', 'CN');
INSERT INTO `sys_region` VALUES (1025, '230109', '松北区', 94, 3, 0, 'Songbei Qu', 'CN');
INSERT INTO `sys_region` VALUES (1026, '230111', '呼兰区', 94, 3, 0, 'Hulan Qu', 'CN');
INSERT INTO `sys_region` VALUES (1027, '230123', '依兰县', 94, 3, 0, 'Yilan Xian', 'CN');
INSERT INTO `sys_region` VALUES (1028, '230124', '方正县', 94, 3, 0, 'Fangzheng Xian', 'CN');
INSERT INTO `sys_region` VALUES (1029, '230125', '宾县', 94, 3, 0, 'Bin Xian', 'CN');
INSERT INTO `sys_region` VALUES (1030, '230126', '巴彦县', 94, 3, 0, 'Bayan Xian', 'CN');
INSERT INTO `sys_region` VALUES (1031, '230127', '木兰县', 94, 3, 0, 'Mulan Xian ', 'CN');
INSERT INTO `sys_region` VALUES (1032, '230128', '通河县', 94, 3, 0, 'Tonghe Xian', 'CN');
INSERT INTO `sys_region` VALUES (1033, '230129', '延寿县', 94, 3, 0, 'Yanshou Xian', 'CN');
INSERT INTO `sys_region` VALUES (1034, '230112', '阿城区', 94, 3, 0, 'Acheng Shi', 'CN');
INSERT INTO `sys_region` VALUES (1035, '230182', '双城市', 94, 3, 0, 'Shuangcheng Shi', 'CN');
INSERT INTO `sys_region` VALUES (1036, '230183', '尚志市', 94, 3, 0, 'Shangzhi Shi', 'CN');
INSERT INTO `sys_region` VALUES (1037, '230184', '五常市', 94, 3, 0, 'Wuchang Shi', 'CN');
INSERT INTO `sys_region` VALUES (1038, '230201', '市辖区', 95, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (1039, '230202', '龙沙区', 95, 3, 0, 'Longsha Qu', 'CN');
INSERT INTO `sys_region` VALUES (1040, '230203', '建华区', 95, 3, 0, 'Jianhua Qu', 'CN');
INSERT INTO `sys_region` VALUES (1041, '230204', '铁锋区', 95, 3, 0, 'Tiefeng Qu', 'CN');
INSERT INTO `sys_region` VALUES (1042, '230205', '昂昂溪区', 95, 3, 0, 'Ang,angxi Qu', 'CN');
INSERT INTO `sys_region` VALUES (1043, '230206', '富拉尔基区', 95, 3, 0, 'Hulan Ergi Qu', 'CN');
INSERT INTO `sys_region` VALUES (1044, '230207', '碾子山区', 95, 3, 0, 'Nianzishan Qu', 'CN');
INSERT INTO `sys_region` VALUES (1045, '230208', '梅里斯达斡尔族区', 95, 3, 0, 'Meilisidawoerzu Qu', 'CN');
INSERT INTO `sys_region` VALUES (1046, '230221', '龙江县', 95, 3, 0, 'Longjiang Xian', 'CN');
INSERT INTO `sys_region` VALUES (1047, '230223', '依安县', 95, 3, 0, 'Yi,an Xian', 'CN');
INSERT INTO `sys_region` VALUES (1048, '230224', '泰来县', 95, 3, 0, 'Tailai Xian', 'CN');
INSERT INTO `sys_region` VALUES (1049, '230225', '甘南县', 95, 3, 0, 'Gannan Xian', 'CN');
INSERT INTO `sys_region` VALUES (1050, '230227', '富裕县', 95, 3, 0, 'Fuyu Xian', 'CN');
INSERT INTO `sys_region` VALUES (1051, '230229', '克山县', 95, 3, 0, 'Keshan Xian', 'CN');
INSERT INTO `sys_region` VALUES (1052, '230230', '克东县', 95, 3, 0, 'Kedong Xian', 'CN');
INSERT INTO `sys_region` VALUES (1053, '230231', '拜泉县', 95, 3, 0, 'Baiquan Xian', 'CN');
INSERT INTO `sys_region` VALUES (1054, '230281', '讷河市', 95, 3, 0, 'Nehe Shi', 'CN');
INSERT INTO `sys_region` VALUES (1055, '230301', '市辖区', 96, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (1056, '230302', '鸡冠区', 96, 3, 0, 'Jiguan Qu', 'CN');
INSERT INTO `sys_region` VALUES (1057, '230303', '恒山区', 96, 3, 0, 'Hengshan Qu', 'CN');
INSERT INTO `sys_region` VALUES (1058, '230304', '滴道区', 96, 3, 0, 'Didao Qu', 'CN');
INSERT INTO `sys_region` VALUES (1059, '230305', '梨树区', 96, 3, 0, 'Lishu Qu', 'CN');
INSERT INTO `sys_region` VALUES (1060, '230306', '城子河区', 96, 3, 0, 'Chengzihe Qu', 'CN');
INSERT INTO `sys_region` VALUES (1061, '230307', '麻山区', 96, 3, 0, 'Mashan Qu', 'CN');
INSERT INTO `sys_region` VALUES (1062, '230321', '鸡东县', 96, 3, 0, 'Jidong Xian', 'CN');
INSERT INTO `sys_region` VALUES (1063, '230381', '虎林市', 96, 3, 0, 'Hulin Shi', 'CN');
INSERT INTO `sys_region` VALUES (1064, '230382', '密山市', 96, 3, 0, 'Mishan Shi', 'CN');
INSERT INTO `sys_region` VALUES (1065, '230401', '市辖区', 97, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (1066, '230402', '向阳区', 97, 3, 0, 'Xiangyang  Qu ', 'CN');
INSERT INTO `sys_region` VALUES (1067, '230403', '工农区', 97, 3, 0, 'Gongnong Qu', 'CN');
INSERT INTO `sys_region` VALUES (1068, '230404', '南山区', 97, 3, 0, 'Nanshan Qu', 'CN');
INSERT INTO `sys_region` VALUES (1069, '230405', '兴安区', 97, 3, 0, 'Xing,an Qu', 'CN');
INSERT INTO `sys_region` VALUES (1070, '230406', '东山区', 97, 3, 0, 'Dongshan Qu', 'CN');
INSERT INTO `sys_region` VALUES (1071, '230407', '兴山区', 97, 3, 0, 'Xingshan Qu', 'CN');
INSERT INTO `sys_region` VALUES (1072, '230421', '萝北县', 97, 3, 0, 'Luobei Xian', 'CN');
INSERT INTO `sys_region` VALUES (1073, '230422', '绥滨县', 97, 3, 0, 'Suibin Xian', 'CN');
INSERT INTO `sys_region` VALUES (1074, '230501', '市辖区', 98, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (1075, '230502', '尖山区', 98, 3, 0, 'Jianshan Qu', 'CN');
INSERT INTO `sys_region` VALUES (1076, '230503', '岭东区', 98, 3, 0, 'Lingdong Qu', 'CN');
INSERT INTO `sys_region` VALUES (1077, '230505', '四方台区', 98, 3, 0, 'Sifangtai Qu', 'CN');
INSERT INTO `sys_region` VALUES (1078, '230506', '宝山区', 98, 3, 0, 'Baoshan Qu', 'CN');
INSERT INTO `sys_region` VALUES (1079, '230521', '集贤县', 98, 3, 0, 'Jixian Xian', 'CN');
INSERT INTO `sys_region` VALUES (1080, '230522', '友谊县', 98, 3, 0, 'Youyi Xian', 'CN');
INSERT INTO `sys_region` VALUES (1081, '230523', '宝清县', 98, 3, 0, 'Baoqing Xian', 'CN');
INSERT INTO `sys_region` VALUES (1082, '230524', '饶河县', 98, 3, 0, 'Raohe Xian ', 'CN');
INSERT INTO `sys_region` VALUES (1083, '230601', '市辖区', 99, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (1084, '230602', '萨尔图区', 99, 3, 0, 'Sairt Qu', 'CN');
INSERT INTO `sys_region` VALUES (1085, '230603', '龙凤区', 99, 3, 0, 'Longfeng Qu', 'CN');
INSERT INTO `sys_region` VALUES (1086, '230604', '让胡路区', 99, 3, 0, 'Ranghulu Qu', 'CN');
INSERT INTO `sys_region` VALUES (1087, '230605', '红岗区', 99, 3, 0, 'Honggang Qu', 'CN');
INSERT INTO `sys_region` VALUES (1088, '230606', '大同区', 99, 3, 0, 'Datong Qu', 'CN');
INSERT INTO `sys_region` VALUES (1089, '230621', '肇州县', 99, 3, 0, 'Zhaozhou Xian', 'CN');
INSERT INTO `sys_region` VALUES (1090, '230622', '肇源县', 99, 3, 0, 'Zhaoyuan Xian', 'CN');
INSERT INTO `sys_region` VALUES (1091, '230623', '林甸县', 99, 3, 0, 'Lindian Xian ', 'CN');
INSERT INTO `sys_region` VALUES (1092, '230624', '杜尔伯特蒙古族自治县', 99, 3, 0, 'Dorbod Mongolzu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (1093, '230701', '市辖区', 100, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (1094, '230702', '伊春区', 100, 3, 0, 'Yichun Qu', 'CN');
INSERT INTO `sys_region` VALUES (1095, '230703', '南岔区', 100, 3, 0, 'Nancha Qu', 'CN');
INSERT INTO `sys_region` VALUES (1096, '230704', '友好区', 100, 3, 0, 'Youhao Qu', 'CN');
INSERT INTO `sys_region` VALUES (1097, '230705', '西林区', 100, 3, 0, 'Xilin Qu', 'CN');
INSERT INTO `sys_region` VALUES (1098, '230706', '翠峦区', 100, 3, 0, 'Cuiluan Qu', 'CN');
INSERT INTO `sys_region` VALUES (1099, '230707', '新青区', 100, 3, 0, 'Xinqing Qu', 'CN');
INSERT INTO `sys_region` VALUES (1100, '230708', '美溪区', 100, 3, 0, 'Meixi Qu', 'CN');
INSERT INTO `sys_region` VALUES (1101, '230709', '金山屯区', 100, 3, 0, 'Jinshantun Qu', 'CN');
INSERT INTO `sys_region` VALUES (1102, '230710', '五营区', 100, 3, 0, 'Wuying Qu', 'CN');
INSERT INTO `sys_region` VALUES (1103, '230711', '乌马河区', 100, 3, 0, 'Wumahe Qu', 'CN');
INSERT INTO `sys_region` VALUES (1104, '230712', '汤旺河区', 100, 3, 0, 'Tangwanghe Qu', 'CN');
INSERT INTO `sys_region` VALUES (1105, '230713', '带岭区', 100, 3, 0, 'Dailing Qu', 'CN');
INSERT INTO `sys_region` VALUES (1106, '230714', '乌伊岭区', 100, 3, 0, 'Wuyiling Qu', 'CN');
INSERT INTO `sys_region` VALUES (1107, '230715', '红星区', 100, 3, 0, 'Hongxing Qu', 'CN');
INSERT INTO `sys_region` VALUES (1108, '230716', '上甘岭区', 100, 3, 0, 'Shangganling Qu', 'CN');
INSERT INTO `sys_region` VALUES (1109, '230722', '嘉荫县', 100, 3, 0, 'Jiayin Xian', 'CN');
INSERT INTO `sys_region` VALUES (1110, '230781', '铁力市', 100, 3, 0, 'Tieli Shi', 'CN');
INSERT INTO `sys_region` VALUES (1111, '230801', '市辖区', 101, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (1113, '230803', '向阳区', 101, 3, 0, 'Xiangyang  Qu ', 'CN');
INSERT INTO `sys_region` VALUES (1114, '230804', '前进区', 101, 3, 0, 'Qianjin Qu', 'CN');
INSERT INTO `sys_region` VALUES (1115, '230805', '东风区', 101, 3, 0, 'Dongfeng Qu', 'CN');
INSERT INTO `sys_region` VALUES (1116, '230811', '郊区', 101, 3, 0, 'Jiaoqu', 'CN');
INSERT INTO `sys_region` VALUES (1117, '230822', '桦南县', 101, 3, 0, 'Huanan Xian', 'CN');
INSERT INTO `sys_region` VALUES (1118, '230826', '桦川县', 101, 3, 0, 'Huachuan Xian', 'CN');
INSERT INTO `sys_region` VALUES (1119, '230828', '汤原县', 101, 3, 0, 'Tangyuan Xian', 'CN');
INSERT INTO `sys_region` VALUES (1120, '230833', '抚远县', 101, 3, 0, 'Fuyuan Xian', 'CN');
INSERT INTO `sys_region` VALUES (1121, '230881', '同江市', 101, 3, 0, 'Tongjiang Shi', 'CN');
INSERT INTO `sys_region` VALUES (1122, '230882', '富锦市', 101, 3, 0, 'Fujin Shi', 'CN');
INSERT INTO `sys_region` VALUES (1123, '230901', '市辖区', 102, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (1124, '230902', '新兴区', 102, 3, 0, 'Xinxing Qu', 'CN');
INSERT INTO `sys_region` VALUES (1125, '230903', '桃山区', 102, 3, 0, 'Taoshan Qu', 'CN');
INSERT INTO `sys_region` VALUES (1126, '230904', '茄子河区', 102, 3, 0, 'Qiezihe Qu', 'CN');
INSERT INTO `sys_region` VALUES (1127, '230921', '勃利县', 102, 3, 0, 'Boli Xian', 'CN');
INSERT INTO `sys_region` VALUES (1128, '231001', '市辖区', 103, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (1129, '231002', '东安区', 103, 3, 0, 'Dong,an Qu', 'CN');
INSERT INTO `sys_region` VALUES (1130, '231003', '阳明区', 103, 3, 0, 'Yangming Qu', 'CN');
INSERT INTO `sys_region` VALUES (1131, '231004', '爱民区', 103, 3, 0, 'Aimin Qu', 'CN');
INSERT INTO `sys_region` VALUES (1132, '231005', '西安区', 103, 3, 0, 'Xi,an Qu', 'CN');
INSERT INTO `sys_region` VALUES (1133, '231024', '东宁县', 103, 3, 0, 'Dongning Xian', 'CN');
INSERT INTO `sys_region` VALUES (1134, '231025', '林口县', 103, 3, 0, 'Linkou Xian', 'CN');
INSERT INTO `sys_region` VALUES (1135, '231081', '绥芬河市', 103, 3, 0, 'Suifenhe Shi', 'CN');
INSERT INTO `sys_region` VALUES (1136, '231083', '海林市', 103, 3, 0, 'Hailin Shi', 'CN');
INSERT INTO `sys_region` VALUES (1137, '231084', '宁安市', 103, 3, 0, 'Ning,an Shi', 'CN');
INSERT INTO `sys_region` VALUES (1138, '231085', '穆棱市', 103, 3, 0, 'Muling Shi', 'CN');
INSERT INTO `sys_region` VALUES (1139, '231101', '市辖区', 104, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (1140, '231102', '爱辉区', 104, 3, 0, 'Aihui Qu', 'CN');
INSERT INTO `sys_region` VALUES (1141, '231121', '嫩江县', 104, 3, 0, 'Nenjiang Xian', 'CN');
INSERT INTO `sys_region` VALUES (1142, '231123', '逊克县', 104, 3, 0, 'Xunke Xian', 'CN');
INSERT INTO `sys_region` VALUES (1143, '231124', '孙吴县', 104, 3, 0, 'Sunwu Xian', 'CN');
INSERT INTO `sys_region` VALUES (1144, '231181', '北安市', 104, 3, 0, 'Bei,an Shi', 'CN');
INSERT INTO `sys_region` VALUES (1145, '231182', '五大连池市', 104, 3, 0, 'Wudalianchi Shi', 'CN');
INSERT INTO `sys_region` VALUES (1146, '231201', '市辖区', 105, 3, 0, '1', 'CN');
INSERT INTO `sys_region` VALUES (1147, '231202', '北林区', 105, 3, 0, 'Beilin Qu', 'CN');
INSERT INTO `sys_region` VALUES (1148, '231221', '望奎县', 105, 3, 0, 'Wangkui Xian', 'CN');
INSERT INTO `sys_region` VALUES (1149, '231222', '兰西县', 105, 3, 0, 'Lanxi Xian', 'CN');
INSERT INTO `sys_region` VALUES (1150, '231223', '青冈县', 105, 3, 0, 'Qinggang Xian', 'CN');
INSERT INTO `sys_region` VALUES (1151, '231224', '庆安县', 105, 3, 0, 'Qing,an Xian', 'CN');
INSERT INTO `sys_region` VALUES (1152, '231225', '明水县', 105, 3, 0, 'Mingshui Xian', 'CN');
INSERT INTO `sys_region` VALUES (1153, '231226', '绥棱县', 105, 3, 0, 'Suileng Xian', 'CN');
INSERT INTO `sys_region` VALUES (1154, '231281', '安达市', 105, 3, 0, 'Anda Shi', 'CN');
INSERT INTO `sys_region` VALUES (1155, '231282', '肇东市', 105, 3, 0, 'Zhaodong Shi', 'CN');
INSERT INTO `sys_region` VALUES (1156, '231283', '海伦市', 105, 3, 0, 'Hailun Shi', 'CN');
INSERT INTO `sys_region` VALUES (1157, '232721', '呼玛县', 106, 3, 0, 'Huma Xian', 'CN');
INSERT INTO `sys_region` VALUES (1158, '232722', '塔河县', 106, 3, 0, 'Tahe Xian', 'CN');
INSERT INTO `sys_region` VALUES (1159, '232723', '漠河县', 106, 3, 0, 'Mohe Xian', 'CN');
INSERT INTO `sys_region` VALUES (1160, '310101', '黄浦区', 107, 3, 0, 'Huangpu Qu', 'CN');
INSERT INTO `sys_region` VALUES (1161, '310103', '卢湾区', 107, 3, 0, 'Luwan Qu', 'CN');
INSERT INTO `sys_region` VALUES (1162, '310104', '徐汇区', 107, 3, 0, 'Xuhui Qu', 'CN');
INSERT INTO `sys_region` VALUES (1163, '310105', '长宁区', 107, 3, 0, 'Changning Qu', 'CN');
INSERT INTO `sys_region` VALUES (1164, '310106', '静安区', 107, 3, 0, 'Jing,an Qu', 'CN');
INSERT INTO `sys_region` VALUES (1165, '310107', '普陀区', 107, 3, 0, 'Putuo Qu', 'CN');
INSERT INTO `sys_region` VALUES (1166, '310108', '闸北区', 107, 3, 0, 'Zhabei Qu', 'CN');
INSERT INTO `sys_region` VALUES (1167, '310109', '虹口区', 107, 3, 0, 'Hongkou Qu', 'CN');
INSERT INTO `sys_region` VALUES (1168, '310110', '杨浦区', 107, 3, 0, 'Yangpu Qu', 'CN');
INSERT INTO `sys_region` VALUES (1169, '310112', '闵行区', 107, 3, 0, 'Minhang Qu', 'CN');
INSERT INTO `sys_region` VALUES (1170, '310113', '宝山区', 107, 3, 0, 'Baoshan Qu', 'CN');
INSERT INTO `sys_region` VALUES (1171, '310114', '嘉定区', 107, 3, 0, 'Jiading Qu', 'CN');
INSERT INTO `sys_region` VALUES (1172, '310115', '浦东新区', 107, 3, 0, 'Pudong Xinqu', 'CN');
INSERT INTO `sys_region` VALUES (1173, '310116', '金山区', 107, 3, 0, 'Jinshan Qu', 'CN');
INSERT INTO `sys_region` VALUES (1174, '310117', '松江区', 107, 3, 0, 'Songjiang Qu', 'CN');
INSERT INTO `sys_region` VALUES (1175, '310118', '青浦区', 107, 3, 0, 'Qingpu  Qu', 'CN');
INSERT INTO `sys_region` VALUES (1177, '310120', '奉贤区', 107, 3, 0, 'Fengxian Qu', 'CN');
INSERT INTO `sys_region` VALUES (1178, '310230', '崇明县', 108, 3, 0, 'Chongming Xian', 'CN');
INSERT INTO `sys_region` VALUES (1179, '320101', '市辖区', 109, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (1180, '320102', '玄武区', 109, 3, 0, 'Xuanwu Qu', 'CN');
INSERT INTO `sys_region` VALUES (1181, '320103', '白下区', 109, 3, 0, 'Baixia Qu', 'CN');
INSERT INTO `sys_region` VALUES (1182, '320104', '秦淮区', 109, 3, 0, 'Qinhuai Qu', 'CN');
INSERT INTO `sys_region` VALUES (1183, '320105', '建邺区', 109, 3, 0, 'Jianye Qu', 'CN');
INSERT INTO `sys_region` VALUES (1184, '320106', '鼓楼区', 109, 3, 0, 'Gulou Qu', 'CN');
INSERT INTO `sys_region` VALUES (1185, '320107', '下关区', 109, 3, 0, 'Xiaguan Qu', 'CN');
INSERT INTO `sys_region` VALUES (1186, '320111', '浦口区', 109, 3, 0, 'Pukou Qu', 'CN');
INSERT INTO `sys_region` VALUES (1187, '320113', '栖霞区', 109, 3, 0, 'Qixia Qu', 'CN');
INSERT INTO `sys_region` VALUES (1188, '320114', '雨花台区', 109, 3, 0, 'Yuhuatai Qu', 'CN');
INSERT INTO `sys_region` VALUES (1189, '320115', '江宁区', 109, 3, 0, 'Jiangning Qu', 'CN');
INSERT INTO `sys_region` VALUES (1190, '320116', '六合区', 109, 3, 0, 'Liuhe Qu', 'CN');
INSERT INTO `sys_region` VALUES (1191, '320124', '溧水县', 109, 3, 0, 'Lishui Xian', 'CN');
INSERT INTO `sys_region` VALUES (1192, '320125', '高淳县', 109, 3, 0, 'Gaochun Xian', 'CN');
INSERT INTO `sys_region` VALUES (1193, '320201', '市辖区', 110, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (1194, '320202', '崇安区', 110, 3, 0, 'Chong,an Qu', 'CN');
INSERT INTO `sys_region` VALUES (1195, '320203', '南长区', 110, 3, 0, 'Nanchang Qu', 'CN');
INSERT INTO `sys_region` VALUES (1196, '320204', '北塘区', 110, 3, 0, 'Beitang Qu', 'CN');
INSERT INTO `sys_region` VALUES (1197, '320205', '锡山区', 110, 3, 0, 'Xishan Qu', 'CN');
INSERT INTO `sys_region` VALUES (1198, '320206', '惠山区', 110, 3, 0, 'Huishan Qu', 'CN');
INSERT INTO `sys_region` VALUES (1199, '320211', '滨湖区', 110, 3, 0, 'Binhu Qu', 'CN');
INSERT INTO `sys_region` VALUES (1200, '320281', '江阴市', 110, 3, 0, 'Jiangyin Shi', 'CN');
INSERT INTO `sys_region` VALUES (1201, '320282', '宜兴市', 110, 3, 0, 'Yixing Shi', 'CN');
INSERT INTO `sys_region` VALUES (1202, '320301', '市辖区', 111, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (1203, '320302', '鼓楼区', 111, 3, 0, 'Gulou Qu', 'CN');
INSERT INTO `sys_region` VALUES (1204, '320303', '云龙区', 111, 3, 0, 'Yunlong Qu', 'CN');
INSERT INTO `sys_region` VALUES (1206, '320305', '贾汪区', 111, 3, 0, 'Jiawang Qu', 'CN');
INSERT INTO `sys_region` VALUES (1207, '320311', '泉山区', 111, 3, 0, 'Quanshan Qu', 'CN');
INSERT INTO `sys_region` VALUES (1208, '320321', '丰县', 111, 3, 0, 'Feng Xian', 'CN');
INSERT INTO `sys_region` VALUES (1209, '320322', '沛县', 111, 3, 0, 'Pei Xian', 'CN');
INSERT INTO `sys_region` VALUES (1210, '320312', '铜山区', 111, 3, 0, 'Tongshan Xian', 'CN');
INSERT INTO `sys_region` VALUES (1211, '320324', '睢宁县', 111, 3, 0, 'Suining Xian', 'CN');
INSERT INTO `sys_region` VALUES (1212, '320381', '新沂市', 111, 3, 0, 'Xinyi Shi', 'CN');
INSERT INTO `sys_region` VALUES (1213, '320382', '邳州市', 111, 3, 0, 'Pizhou Shi', 'CN');
INSERT INTO `sys_region` VALUES (1214, '320401', '市辖区', 112, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (1215, '320402', '天宁区', 112, 3, 0, 'Tianning Qu', 'CN');
INSERT INTO `sys_region` VALUES (1216, '320404', '钟楼区', 112, 3, 0, 'Zhonglou Qu', 'CN');
INSERT INTO `sys_region` VALUES (1217, '320405', '戚墅堰区', 112, 3, 0, 'Qishuyan Qu', 'CN');
INSERT INTO `sys_region` VALUES (1218, '320411', '新北区', 112, 3, 0, 'Xinbei Qu', 'CN');
INSERT INTO `sys_region` VALUES (1219, '320412', '武进区', 112, 3, 0, 'Wujin Qu', 'CN');
INSERT INTO `sys_region` VALUES (1220, '320481', '溧阳市', 112, 3, 0, 'Liyang Shi', 'CN');
INSERT INTO `sys_region` VALUES (1221, '320482', '金坛市', 112, 3, 0, 'Jintan Shi', 'CN');
INSERT INTO `sys_region` VALUES (1222, '320501', '市辖区', 113, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (1223, '320502', '沧浪区', 113, 3, 0, 'Canglang Qu', 'CN');
INSERT INTO `sys_region` VALUES (1224, '320503', '平江区', 113, 3, 0, 'Pingjiang Qu', 'CN');
INSERT INTO `sys_region` VALUES (1225, '320504', '金阊区', 113, 3, 0, 'Jinchang Qu', 'CN');
INSERT INTO `sys_region` VALUES (1226, '320505', '虎丘区', 113, 3, 0, 'Huqiu Qu', 'CN');
INSERT INTO `sys_region` VALUES (1227, '320506', '吴中区', 113, 3, 0, 'Wuzhong Qu', 'CN');
INSERT INTO `sys_region` VALUES (1228, '320507', '相城区', 113, 3, 0, 'Xiangcheng Qu', 'CN');
INSERT INTO `sys_region` VALUES (1229, '320581', '常熟市', 113, 3, 0, 'Changshu Shi', 'CN');
INSERT INTO `sys_region` VALUES (1230, '320582', '张家港市', 113, 3, 0, 'Zhangjiagang Shi ', 'CN');
INSERT INTO `sys_region` VALUES (1231, '320583', '昆山市', 113, 3, 0, 'Kunshan Shi', 'CN');
INSERT INTO `sys_region` VALUES (1232, '320584', '吴江市', 113, 3, 0, 'Wujiang Shi', 'CN');
INSERT INTO `sys_region` VALUES (1233, '320585', '太仓市', 113, 3, 0, 'Taicang Shi', 'CN');
INSERT INTO `sys_region` VALUES (1234, '320601', '市辖区', 114, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (1235, '320602', '崇川区', 114, 3, 0, 'Chongchuan Qu', 'CN');
INSERT INTO `sys_region` VALUES (1236, '320611', '港闸区', 114, 3, 0, 'Gangzha Qu', 'CN');
INSERT INTO `sys_region` VALUES (1237, '320621', '海安县', 114, 3, 0, 'Hai,an Xian', 'CN');
INSERT INTO `sys_region` VALUES (1238, '320623', '如东县', 114, 3, 0, 'Rudong Xian', 'CN');
INSERT INTO `sys_region` VALUES (1239, '320681', '启东市', 114, 3, 0, 'Qidong Shi', 'CN');
INSERT INTO `sys_region` VALUES (1240, '320682', '如皋市', 114, 3, 0, 'Rugao Shi', 'CN');
INSERT INTO `sys_region` VALUES (1241, '320612', '通州区', 114, 3, 0, 'Tongzhou Shi', 'CN');
INSERT INTO `sys_region` VALUES (1242, '320684', '海门市', 114, 3, 0, 'Haimen Shi', 'CN');
INSERT INTO `sys_region` VALUES (1243, '320701', '市辖区', 115, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (1244, '320703', '连云区', 115, 3, 0, 'Lianyun Qu', 'CN');
INSERT INTO `sys_region` VALUES (1245, '320705', '新浦区', 115, 3, 0, 'Xinpu Qu', 'CN');
INSERT INTO `sys_region` VALUES (1246, '320706', '海州区', 115, 3, 0, 'Haizhou Qu', 'CN');
INSERT INTO `sys_region` VALUES (1247, '320721', '赣榆县', 115, 3, 0, 'Ganyu Xian', 'CN');
INSERT INTO `sys_region` VALUES (1248, '320722', '东海县', 115, 3, 0, 'Donghai Xian', 'CN');
INSERT INTO `sys_region` VALUES (1249, '320723', '灌云县', 115, 3, 0, 'Guanyun Xian', 'CN');
INSERT INTO `sys_region` VALUES (1250, '320724', '灌南县', 115, 3, 0, 'Guannan Xian', 'CN');
INSERT INTO `sys_region` VALUES (1251, '320801', '市辖区', 116, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (1252, '320802', '清河区', 116, 3, 0, 'Qinghe Qu', 'CN');
INSERT INTO `sys_region` VALUES (1253, '320803', '楚州区', 116, 3, 0, 'Chuzhou Qu', 'CN');
INSERT INTO `sys_region` VALUES (1254, '320804', '淮阴区', 116, 3, 0, 'Huaiyin Qu', 'CN');
INSERT INTO `sys_region` VALUES (1255, '320811', '清浦区', 116, 3, 0, 'Qingpu Qu', 'CN');
INSERT INTO `sys_region` VALUES (1256, '320826', '涟水县', 116, 3, 0, 'Lianshui Xian', 'CN');
INSERT INTO `sys_region` VALUES (1257, '320829', '洪泽县', 116, 3, 0, 'Hongze Xian', 'CN');
INSERT INTO `sys_region` VALUES (1258, '320830', '盱眙县', 116, 3, 0, 'Xuyi Xian', 'CN');
INSERT INTO `sys_region` VALUES (1259, '320831', '金湖县', 116, 3, 0, 'Jinhu Xian', 'CN');
INSERT INTO `sys_region` VALUES (1260, '320901', '市辖区', 117, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (1261, '320902', '亭湖区', 117, 3, 0, 'Tinghu Qu', 'CN');
INSERT INTO `sys_region` VALUES (1262, '320903', '盐都区', 117, 3, 0, 'Yandu Qu', 'CN');
INSERT INTO `sys_region` VALUES (1263, '320921', '响水县', 117, 3, 0, 'Xiangshui Xian', 'CN');
INSERT INTO `sys_region` VALUES (1264, '320922', '滨海县', 117, 3, 0, 'Binhai Xian', 'CN');
INSERT INTO `sys_region` VALUES (1265, '320923', '阜宁县', 117, 3, 0, 'Funing Xian', 'CN');
INSERT INTO `sys_region` VALUES (1266, '320924', '射阳县', 117, 3, 0, 'Sheyang Xian', 'CN');
INSERT INTO `sys_region` VALUES (1267, '320925', '建湖县', 117, 3, 0, 'Jianhu Xian', 'CN');
INSERT INTO `sys_region` VALUES (1268, '320981', '东台市', 117, 3, 0, 'Dongtai Shi', 'CN');
INSERT INTO `sys_region` VALUES (1269, '320982', '大丰市', 117, 3, 0, 'Dafeng Shi', 'CN');
INSERT INTO `sys_region` VALUES (1270, '321001', '市辖区', 118, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (1271, '321002', '广陵区', 118, 3, 0, 'Guangling Qu', 'CN');
INSERT INTO `sys_region` VALUES (1272, '321003', '邗江区', 118, 3, 0, 'Hanjiang Qu', 'CN');
INSERT INTO `sys_region` VALUES (1273, '321011', '维扬区', 118, 3, 0, 'Weiyang Qu', 'CN');
INSERT INTO `sys_region` VALUES (1274, '321023', '宝应县', 118, 3, 0, 'Baoying Xian ', 'CN');
INSERT INTO `sys_region` VALUES (1275, '321081', '仪征市', 118, 3, 0, 'Yizheng Shi', 'CN');
INSERT INTO `sys_region` VALUES (1276, '321084', '高邮市', 118, 3, 0, 'Gaoyou Shi', 'CN');
INSERT INTO `sys_region` VALUES (1277, '321088', '江都市', 118, 3, 0, 'Jiangdu Shi', 'CN');
INSERT INTO `sys_region` VALUES (1278, '321101', '市辖区', 119, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (1279, '321102', '京口区', 119, 3, 0, 'Jingkou Qu', 'CN');
INSERT INTO `sys_region` VALUES (1280, '321111', '润州区', 119, 3, 0, 'Runzhou Qu', 'CN');
INSERT INTO `sys_region` VALUES (1281, '321112', '丹徒区', 119, 3, 0, 'Dantu Qu', 'CN');
INSERT INTO `sys_region` VALUES (1282, '321181', '丹阳市', 119, 3, 0, 'Danyang Xian', 'CN');
INSERT INTO `sys_region` VALUES (1283, '321182', '扬中市', 119, 3, 0, 'Yangzhong Shi', 'CN');
INSERT INTO `sys_region` VALUES (1284, '321183', '句容市', 119, 3, 0, 'Jurong Shi', 'CN');
INSERT INTO `sys_region` VALUES (1285, '321201', '市辖区', 120, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (1286, '321202', '海陵区', 120, 3, 0, 'Hailing Qu', 'CN');
INSERT INTO `sys_region` VALUES (1287, '321203', '高港区', 120, 3, 0, 'Gaogang Qu', 'CN');
INSERT INTO `sys_region` VALUES (1288, '321281', '兴化市', 120, 3, 0, 'Xinghua Shi', 'CN');
INSERT INTO `sys_region` VALUES (1289, '321282', '靖江市', 120, 3, 0, 'Jingjiang Shi', 'CN');
INSERT INTO `sys_region` VALUES (1290, '321283', '泰兴市', 120, 3, 0, 'Taixing Shi', 'CN');
INSERT INTO `sys_region` VALUES (1291, '321284', '姜堰市', 120, 3, 0, 'Jiangyan Shi', 'CN');
INSERT INTO `sys_region` VALUES (1292, '321301', '市辖区', 121, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (1293, '321302', '宿城区', 121, 3, 0, 'Sucheng Qu', 'CN');
INSERT INTO `sys_region` VALUES (1294, '321311', '宿豫区', 121, 3, 0, 'Suyu Qu', 'CN');
INSERT INTO `sys_region` VALUES (1295, '321322', '沭阳县', 121, 3, 0, 'Shuyang Xian', 'CN');
INSERT INTO `sys_region` VALUES (1296, '321323', '泗阳县', 121, 3, 0, 'Siyang Xian ', 'CN');
INSERT INTO `sys_region` VALUES (1297, '321324', '泗洪县', 121, 3, 0, 'Sihong Xian', 'CN');
INSERT INTO `sys_region` VALUES (1298, '330101', '市辖区', 122, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (1299, '330102', '上城区', 122, 3, 0, 'Shangcheng Qu', 'CN');
INSERT INTO `sys_region` VALUES (1300, '330103', '下城区', 122, 3, 0, 'Xiacheng Qu', 'CN');
INSERT INTO `sys_region` VALUES (1301, '330104', '江干区', 122, 3, 0, 'Jianggan Qu', 'CN');
INSERT INTO `sys_region` VALUES (1302, '330105', '拱墅区', 122, 3, 0, 'Gongshu Qu', 'CN');
INSERT INTO `sys_region` VALUES (1303, '330106', '西湖区', 122, 3, 0, 'Xihu Qu ', 'CN');
INSERT INTO `sys_region` VALUES (1304, '330108', '滨江区', 122, 3, 0, 'Binjiang Qu', 'CN');
INSERT INTO `sys_region` VALUES (1305, '330109', '萧山区', 122, 3, 0, 'Xiaoshan Qu', 'CN');
INSERT INTO `sys_region` VALUES (1306, '330110', '余杭区', 122, 3, 0, 'Yuhang Qu', 'CN');
INSERT INTO `sys_region` VALUES (1307, '330122', '桐庐县', 122, 3, 0, 'Tonglu Xian', 'CN');
INSERT INTO `sys_region` VALUES (1308, '330127', '淳安县', 122, 3, 0, 'Chun,an Xian', 'CN');
INSERT INTO `sys_region` VALUES (1309, '330182', '建德市', 122, 3, 0, 'Jiande Shi', 'CN');
INSERT INTO `sys_region` VALUES (1310, '330183', '富阳市', 122, 3, 0, 'Fuyang Shi', 'CN');
INSERT INTO `sys_region` VALUES (1311, '330185', '临安市', 122, 3, 0, 'Lin,an Shi', 'CN');
INSERT INTO `sys_region` VALUES (1312, '330201', '市辖区', 123, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (1313, '330203', '海曙区', 123, 3, 0, 'Haishu Qu', 'CN');
INSERT INTO `sys_region` VALUES (1314, '330204', '江东区', 123, 3, 0, 'Jiangdong Qu', 'CN');
INSERT INTO `sys_region` VALUES (1315, '330205', '江北区', 123, 3, 0, 'Jiangbei Qu', 'CN');
INSERT INTO `sys_region` VALUES (1316, '330206', '北仑区', 123, 3, 0, 'Beilun Qu', 'CN');
INSERT INTO `sys_region` VALUES (1317, '330211', '镇海区', 123, 3, 0, 'Zhenhai Qu', 'CN');
INSERT INTO `sys_region` VALUES (1318, '330212', '鄞州区', 123, 3, 0, 'Yinzhou Qu', 'CN');
INSERT INTO `sys_region` VALUES (1319, '330225', '象山县', 123, 3, 0, 'Xiangshan Xian', 'CN');
INSERT INTO `sys_region` VALUES (1320, '330226', '宁海县', 123, 3, 0, 'Ninghai Xian', 'CN');
INSERT INTO `sys_region` VALUES (1321, '330281', '余姚市', 123, 3, 0, 'Yuyao Shi', 'CN');
INSERT INTO `sys_region` VALUES (1322, '330282', '慈溪市', 123, 3, 0, 'Cixi Shi', 'CN');
INSERT INTO `sys_region` VALUES (1323, '330283', '奉化市', 123, 3, 0, 'Fenghua Shi', 'CN');
INSERT INTO `sys_region` VALUES (1324, '330301', '市辖区', 124, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (1325, '330302', '鹿城区', 124, 3, 0, 'Lucheng Qu', 'CN');
INSERT INTO `sys_region` VALUES (1326, '330303', '龙湾区', 124, 3, 0, 'Longwan Qu', 'CN');
INSERT INTO `sys_region` VALUES (1327, '330304', '瓯海区', 124, 3, 0, 'Ouhai Qu', 'CN');
INSERT INTO `sys_region` VALUES (1328, '330322', '洞头县', 124, 3, 0, 'Dongtou Xian', 'CN');
INSERT INTO `sys_region` VALUES (1329, '330324', '永嘉县', 124, 3, 0, 'Yongjia Xian', 'CN');
INSERT INTO `sys_region` VALUES (1330, '330326', '平阳县', 124, 3, 0, 'Pingyang Xian', 'CN');
INSERT INTO `sys_region` VALUES (1331, '330327', '苍南县', 124, 3, 0, 'Cangnan Xian', 'CN');
INSERT INTO `sys_region` VALUES (1332, '330328', '文成县', 124, 3, 0, 'Wencheng Xian', 'CN');
INSERT INTO `sys_region` VALUES (1333, '330329', '泰顺县', 124, 3, 0, 'Taishun Xian', 'CN');
INSERT INTO `sys_region` VALUES (1334, '330381', '瑞安市', 124, 3, 0, 'Rui,an Xian', 'CN');
INSERT INTO `sys_region` VALUES (1335, '330382', '乐清市', 124, 3, 0, 'Yueqing Shi', 'CN');
INSERT INTO `sys_region` VALUES (1336, '330401', '市辖区', 125, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (1338, '330411', '秀洲区', 125, 3, 0, 'Xiuzhou Qu', 'CN');
INSERT INTO `sys_region` VALUES (1339, '330421', '嘉善县', 125, 3, 0, 'Jiashan Xian', 'CN');
INSERT INTO `sys_region` VALUES (1340, '330424', '海盐县', 125, 3, 0, 'Haiyan Xian', 'CN');
INSERT INTO `sys_region` VALUES (1341, '330481', '海宁市', 125, 3, 0, 'Haining Shi', 'CN');
INSERT INTO `sys_region` VALUES (1342, '330482', '平湖市', 125, 3, 0, 'Pinghu Shi', 'CN');
INSERT INTO `sys_region` VALUES (1343, '330483', '桐乡市', 125, 3, 0, 'Tongxiang Shi', 'CN');
INSERT INTO `sys_region` VALUES (1344, '330501', '市辖区', 126, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (1345, '330502', '吴兴区', 126, 3, 0, 'Wuxing Qu', 'CN');
INSERT INTO `sys_region` VALUES (1346, '330503', '南浔区', 126, 3, 0, 'Nanxun Qu', 'CN');
INSERT INTO `sys_region` VALUES (1347, '330521', '德清县', 126, 3, 0, 'Deqing Xian', 'CN');
INSERT INTO `sys_region` VALUES (1348, '330522', '长兴县', 126, 3, 0, 'Changxing Xian', 'CN');
INSERT INTO `sys_region` VALUES (1349, '330523', '安吉县', 126, 3, 0, 'Anji Xian', 'CN');
INSERT INTO `sys_region` VALUES (1350, '330601', '市辖区', 127, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (1351, '330602', '越城区', 127, 3, 0, 'Yuecheng Qu', 'CN');
INSERT INTO `sys_region` VALUES (1352, '330621', '绍兴县', 127, 3, 0, 'Shaoxing Xian', 'CN');
INSERT INTO `sys_region` VALUES (1353, '330624', '新昌县', 127, 3, 0, 'Xinchang Xian', 'CN');
INSERT INTO `sys_region` VALUES (1354, '330681', '诸暨市', 127, 3, 0, 'Zhuji Shi', 'CN');
INSERT INTO `sys_region` VALUES (1355, '330682', '上虞市', 127, 3, 0, 'Shangyu Shi', 'CN');
INSERT INTO `sys_region` VALUES (1356, '330683', '嵊州市', 127, 3, 0, 'Shengzhou Shi', 'CN');
INSERT INTO `sys_region` VALUES (1357, '330701', '市辖区', 128, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (1358, '330702', '婺城区', 128, 3, 0, 'Wucheng Qu', 'CN');
INSERT INTO `sys_region` VALUES (1359, '330703', '金东区', 128, 3, 0, 'Jindong Qu', 'CN');
INSERT INTO `sys_region` VALUES (1360, '330723', '武义县', 128, 3, 0, 'Wuyi Xian', 'CN');
INSERT INTO `sys_region` VALUES (1361, '330726', '浦江县', 128, 3, 0, 'Pujiang Xian ', 'CN');
INSERT INTO `sys_region` VALUES (1362, '330727', '磐安县', 128, 3, 0, 'Pan,an Xian', 'CN');
INSERT INTO `sys_region` VALUES (1363, '330781', '兰溪市', 128, 3, 0, 'Lanxi Shi', 'CN');
INSERT INTO `sys_region` VALUES (1364, '330782', '义乌市', 128, 3, 0, 'Yiwu Shi', 'CN');
INSERT INTO `sys_region` VALUES (1365, '330783', '东阳市', 128, 3, 0, 'Dongyang Shi', 'CN');
INSERT INTO `sys_region` VALUES (1366, '330784', '永康市', 128, 3, 0, 'Yongkang Shi', 'CN');
INSERT INTO `sys_region` VALUES (1367, '330801', '市辖区', 129, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (1368, '330802', '柯城区', 129, 3, 0, 'Kecheng Qu', 'CN');
INSERT INTO `sys_region` VALUES (1369, '330803', '衢江区', 129, 3, 0, 'Qujiang Qu', 'CN');
INSERT INTO `sys_region` VALUES (1370, '330822', '常山县', 129, 3, 0, 'Changshan Xian', 'CN');
INSERT INTO `sys_region` VALUES (1371, '330824', '开化县', 129, 3, 0, 'Kaihua Xian', 'CN');
INSERT INTO `sys_region` VALUES (1372, '330825', '龙游县', 129, 3, 0, 'Longyou Xian ', 'CN');
INSERT INTO `sys_region` VALUES (1373, '330881', '江山市', 129, 3, 0, 'Jiangshan Shi', 'CN');
INSERT INTO `sys_region` VALUES (1374, '330901', '市辖区', 130, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (1375, '330902', '定海区', 130, 3, 0, 'Dinghai Qu', 'CN');
INSERT INTO `sys_region` VALUES (1376, '330903', '普陀区', 130, 3, 0, 'Putuo Qu', 'CN');
INSERT INTO `sys_region` VALUES (1377, '330921', '岱山县', 130, 3, 0, 'Daishan Xian', 'CN');
INSERT INTO `sys_region` VALUES (1378, '330922', '嵊泗县', 130, 3, 0, 'Shengsi Xian', 'CN');
INSERT INTO `sys_region` VALUES (1379, '331001', '市辖区', 131, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (1380, '331002', '椒江区', 131, 3, 0, 'Jiaojiang Qu', 'CN');
INSERT INTO `sys_region` VALUES (1381, '331003', '黄岩区', 131, 3, 0, 'Huangyan Qu', 'CN');
INSERT INTO `sys_region` VALUES (1382, '331004', '路桥区', 131, 3, 0, 'Luqiao Qu', 'CN');
INSERT INTO `sys_region` VALUES (1383, '331021', '玉环县', 131, 3, 0, 'Yuhuan Xian', 'CN');
INSERT INTO `sys_region` VALUES (1384, '331022', '三门县', 131, 3, 0, 'Sanmen Xian', 'CN');
INSERT INTO `sys_region` VALUES (1385, '331023', '天台县', 131, 3, 0, 'Tiantai Xian', 'CN');
INSERT INTO `sys_region` VALUES (1386, '331024', '仙居县', 131, 3, 0, 'Xianju Xian', 'CN');
INSERT INTO `sys_region` VALUES (1387, '331081', '温岭市', 131, 3, 0, 'Wenling Shi', 'CN');
INSERT INTO `sys_region` VALUES (1388, '331082', '临海市', 131, 3, 0, 'Linhai Shi', 'CN');
INSERT INTO `sys_region` VALUES (1389, '331101', '市辖区', 132, 3, 0, '1', 'CN');
INSERT INTO `sys_region` VALUES (1390, '331102', '莲都区', 132, 3, 0, 'Liandu Qu', 'CN');
INSERT INTO `sys_region` VALUES (1391, '331121', '青田县', 132, 3, 0, 'Qingtian Xian', 'CN');
INSERT INTO `sys_region` VALUES (1392, '331122', '缙云县', 132, 3, 0, 'Jinyun Xian', 'CN');
INSERT INTO `sys_region` VALUES (1393, '331123', '遂昌县', 132, 3, 0, 'Suichang Xian', 'CN');
INSERT INTO `sys_region` VALUES (1394, '331124', '松阳县', 132, 3, 0, 'Songyang Xian', 'CN');
INSERT INTO `sys_region` VALUES (1395, '331125', '云和县', 132, 3, 0, 'Yunhe Xian', 'CN');
INSERT INTO `sys_region` VALUES (1396, '331126', '庆元县', 132, 3, 0, 'Qingyuan Xian', 'CN');
INSERT INTO `sys_region` VALUES (1397, '331127', '景宁畲族自治县', 132, 3, 0, 'Jingning Shezu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (1398, '331181', '龙泉市', 132, 3, 0, 'Longquan Shi', 'CN');
INSERT INTO `sys_region` VALUES (1399, '340101', '市辖区', 133, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (1400, '340102', '瑶海区', 133, 3, 0, 'Yaohai Qu', 'CN');
INSERT INTO `sys_region` VALUES (1401, '340103', '庐阳区', 133, 3, 0, 'Luyang Qu', 'CN');
INSERT INTO `sys_region` VALUES (1402, '340104', '蜀山区', 133, 3, 0, 'Shushan Qu', 'CN');
INSERT INTO `sys_region` VALUES (1403, '340111', '包河区', 133, 3, 0, 'Baohe Qu', 'CN');
INSERT INTO `sys_region` VALUES (1404, '340121', '长丰县', 133, 3, 0, 'Changfeng Xian', 'CN');
INSERT INTO `sys_region` VALUES (1405, '340122', '肥东县', 133, 3, 0, 'Feidong Xian', 'CN');
INSERT INTO `sys_region` VALUES (1406, '340123', '肥西县', 133, 3, 0, 'Feixi Xian', 'CN');
INSERT INTO `sys_region` VALUES (1407, '340201', '市辖区', 1412, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (1408, '340202', '镜湖区', 1412, 3, 0, 'Jinghu Qu', 'CN');
INSERT INTO `sys_region` VALUES (1409, '340208', '三山区', 1412, 3, 0, 'Matang Qu', 'CN');
INSERT INTO `sys_region` VALUES (1410, '340203', '弋江区', 1412, 3, 0, 'Xinwu Qu', 'CN');
INSERT INTO `sys_region` VALUES (1411, '340207', '鸠江区', 1412, 3, 0, 'Jiujiang Qu', 'CN');
INSERT INTO `sys_region` VALUES (1412, '340204', '芜湖市', 134, 3, 0, 'Wuhu Shi', 'CN');
INSERT INTO `sys_region` VALUES (1413, '340222', '繁昌县', 1412, 3, 0, 'Fanchang Xian', 'CN');
INSERT INTO `sys_region` VALUES (1414, '340223', '南陵县', 1412, 3, 0, 'Nanling Xian', 'CN');
INSERT INTO `sys_region` VALUES (1415, '340301', '市辖区', 135, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (1416, '340302', '龙子湖区', 135, 3, 0, 'Longzihu Qu', 'CN');
INSERT INTO `sys_region` VALUES (1417, '340303', '蚌山区', 135, 3, 0, 'Bangshan Qu', 'CN');
INSERT INTO `sys_region` VALUES (1418, '340304', '禹会区', 135, 3, 0, 'Yuhui Qu', 'CN');
INSERT INTO `sys_region` VALUES (1419, '340311', '淮上区', 135, 3, 0, 'Huaishang Qu', 'CN');
INSERT INTO `sys_region` VALUES (1420, '340321', '怀远县', 135, 3, 0, 'Huaiyuan Qu', 'CN');
INSERT INTO `sys_region` VALUES (1421, '340322', '五河县', 135, 3, 0, 'Wuhe Xian', 'CN');
INSERT INTO `sys_region` VALUES (1422, '340323', '固镇县', 135, 3, 0, 'Guzhen Xian', 'CN');
INSERT INTO `sys_region` VALUES (1423, '340401', '市辖区', 136, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (1424, '340402', '大通区', 136, 3, 0, 'Datong Qu', 'CN');
INSERT INTO `sys_region` VALUES (1425, '340403', '田家庵区', 136, 3, 0, 'Tianjia,an Qu', 'CN');
INSERT INTO `sys_region` VALUES (1426, '340404', '谢家集区', 136, 3, 0, 'Xiejiaji Qu', 'CN');
INSERT INTO `sys_region` VALUES (1427, '340405', '八公山区', 136, 3, 0, 'Bagongshan Qu', 'CN');
INSERT INTO `sys_region` VALUES (1428, '340406', '潘集区', 136, 3, 0, 'Panji Qu', 'CN');
INSERT INTO `sys_region` VALUES (1429, '340421', '凤台县', 136, 3, 0, 'Fengtai Xian', 'CN');
INSERT INTO `sys_region` VALUES (1430, '340501', '市辖区', 137, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (1431, '340502', '金家庄区', 137, 3, 0, 'Jinjiazhuang Qu', 'CN');
INSERT INTO `sys_region` VALUES (1432, '340503', '花山区', 137, 3, 0, 'Huashan Qu', 'CN');
INSERT INTO `sys_region` VALUES (1433, '340504', '雨山区', 137, 3, 0, 'Yushan Qu', 'CN');
INSERT INTO `sys_region` VALUES (1434, '340521', '当涂县', 137, 3, 0, 'Dangtu Xian', 'CN');
INSERT INTO `sys_region` VALUES (1435, '340601', '市辖区', 138, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (1436, '340602', '杜集区', 138, 3, 0, 'Duji Qu', 'CN');
INSERT INTO `sys_region` VALUES (1437, '340603', '相山区', 138, 3, 0, 'Xiangshan Qu', 'CN');
INSERT INTO `sys_region` VALUES (1438, '340604', '烈山区', 138, 3, 0, 'Lieshan Qu', 'CN');
INSERT INTO `sys_region` VALUES (1439, '340621', '濉溪县', 138, 3, 0, 'Suixi Xian', 'CN');
INSERT INTO `sys_region` VALUES (1440, '340701', '市辖区', 139, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (1441, '340702', '铜官山区', 139, 3, 0, 'Tongguanshan Qu', 'CN');
INSERT INTO `sys_region` VALUES (1442, '340703', '狮子山区', 139, 3, 0, 'Shizishan Qu', 'CN');
INSERT INTO `sys_region` VALUES (1443, '340711', '郊区', 139, 3, 0, 'Jiaoqu', 'CN');
INSERT INTO `sys_region` VALUES (1444, '340721', '铜陵县', 139, 3, 0, 'Tongling Xian', 'CN');
INSERT INTO `sys_region` VALUES (1445, '340801', '市辖区', 140, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (1446, '340802', '迎江区', 140, 3, 0, 'Yingjiang Qu', 'CN');
INSERT INTO `sys_region` VALUES (1447, '340803', '大观区', 140, 3, 0, 'Daguan Qu', 'CN');
INSERT INTO `sys_region` VALUES (1448, '340811', '宜秀区', 140, 3, 0, 'Yixiu Qu', 'CN');
INSERT INTO `sys_region` VALUES (1449, '340822', '怀宁县', 140, 3, 0, 'Huaining Xian', 'CN');
INSERT INTO `sys_region` VALUES (1450, '340823', '枞阳县', 140, 3, 0, 'Zongyang Xian', 'CN');
INSERT INTO `sys_region` VALUES (1451, '340824', '潜山县', 140, 3, 0, 'Qianshan Xian', 'CN');
INSERT INTO `sys_region` VALUES (1452, '340825', '太湖县', 140, 3, 0, 'Taihu Xian', 'CN');
INSERT INTO `sys_region` VALUES (1453, '340826', '宿松县', 140, 3, 0, 'Susong Xian', 'CN');
INSERT INTO `sys_region` VALUES (1454, '340827', '望江县', 140, 3, 0, 'Wangjiang Xian', 'CN');
INSERT INTO `sys_region` VALUES (1455, '340828', '岳西县', 140, 3, 0, 'Yuexi Xian', 'CN');
INSERT INTO `sys_region` VALUES (1456, '340881', '桐城市', 140, 3, 0, 'Tongcheng Shi', 'CN');
INSERT INTO `sys_region` VALUES (1457, '341001', '市辖区', 141, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (1458, '341002', '屯溪区', 141, 3, 0, 'Tunxi Qu', 'CN');
INSERT INTO `sys_region` VALUES (1459, '341003', '黄山区', 141, 3, 0, 'Huangshan Qu', 'CN');
INSERT INTO `sys_region` VALUES (1460, '341004', '徽州区', 141, 3, 0, 'Huizhou Qu', 'CN');
INSERT INTO `sys_region` VALUES (1461, '341021', '歙县', 141, 3, 0, 'She Xian', 'CN');
INSERT INTO `sys_region` VALUES (1462, '341022', '休宁县', 141, 3, 0, 'Xiuning Xian', 'CN');
INSERT INTO `sys_region` VALUES (1463, '341023', '黟县', 141, 3, 0, 'Yi Xian', 'CN');
INSERT INTO `sys_region` VALUES (1464, '341024', '祁门县', 141, 3, 0, 'Qimen Xian', 'CN');
INSERT INTO `sys_region` VALUES (1465, '341101', '市辖区', 142, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (1466, '341102', '琅琊区', 142, 3, 0, 'Langya Qu', 'CN');
INSERT INTO `sys_region` VALUES (1467, '341103', '南谯区', 142, 3, 0, 'Nanqiao Qu', 'CN');
INSERT INTO `sys_region` VALUES (1468, '341122', '来安县', 142, 3, 0, 'Lai,an Xian', 'CN');
INSERT INTO `sys_region` VALUES (1469, '341124', '全椒县', 142, 3, 0, 'Quanjiao Xian', 'CN');
INSERT INTO `sys_region` VALUES (1470, '341125', '定远县', 142, 3, 0, 'Dingyuan Xian', 'CN');
INSERT INTO `sys_region` VALUES (1471, '341126', '凤阳县', 142, 3, 0, 'Fengyang Xian', 'CN');
INSERT INTO `sys_region` VALUES (1472, '341181', '天长市', 142, 3, 0, 'Tianchang Shi', 'CN');
INSERT INTO `sys_region` VALUES (1473, '341182', '明光市', 142, 3, 0, 'Mingguang Shi', 'CN');
INSERT INTO `sys_region` VALUES (1474, '341201', '市辖区', 143, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (1475, '341202', '颍州区', 143, 3, 0, 'Yingzhou Qu', 'CN');
INSERT INTO `sys_region` VALUES (1476, '341203', '颍东区', 143, 3, 0, 'Yingdong Qu', 'CN');
INSERT INTO `sys_region` VALUES (1477, '341204', '颍泉区', 143, 3, 0, 'Yingquan Qu', 'CN');
INSERT INTO `sys_region` VALUES (1478, '341221', '临泉县', 143, 3, 0, 'Linquan Xian', 'CN');
INSERT INTO `sys_region` VALUES (1479, '341222', '太和县', 143, 3, 0, 'Taihe Xian', 'CN');
INSERT INTO `sys_region` VALUES (1480, '341225', '阜南县', 143, 3, 0, 'Funan Xian', 'CN');
INSERT INTO `sys_region` VALUES (1481, '341226', '颍上县', 143, 3, 0, 'Yingshang Xian', 'CN');
INSERT INTO `sys_region` VALUES (1482, '341282', '界首市', 143, 3, 0, 'Jieshou Shi', 'CN');
INSERT INTO `sys_region` VALUES (1483, '341301', '市辖区', 144, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (1484, '341302', '埇桥区', 144, 3, 0, 'Yongqiao Qu', 'CN');
INSERT INTO `sys_region` VALUES (1485, '341321', '砀山县', 144, 3, 0, 'Dangshan Xian', 'CN');
INSERT INTO `sys_region` VALUES (1486, '341322', '萧县', 144, 3, 0, 'Xiao Xian', 'CN');
INSERT INTO `sys_region` VALUES (1487, '341323', '灵璧县', 144, 3, 0, 'Lingbi Xian', 'CN');
INSERT INTO `sys_region` VALUES (1488, '341324', '泗县', 144, 3, 0, 'Si Xian ', 'CN');
INSERT INTO `sys_region` VALUES (1489, '341401', '市辖区', 145, 3, 0, '1', 'CN');
INSERT INTO `sys_region` VALUES (1490, '341402', '居巢区', 145, 3, 0, 'Juchao Qu', 'CN');
INSERT INTO `sys_region` VALUES (1491, '341421', '庐江县', 145, 3, 0, 'Lujiang Xian', 'CN');
INSERT INTO `sys_region` VALUES (1492, '341422', '无为县', 145, 3, 0, 'Wuwei Xian', 'CN');
INSERT INTO `sys_region` VALUES (1493, '341423', '含山县', 145, 3, 0, 'Hanshan Xian', 'CN');
INSERT INTO `sys_region` VALUES (1494, '341424', '和县', 145, 3, 0, 'He Xian ', 'CN');
INSERT INTO `sys_region` VALUES (1495, '341501', '市辖区', 146, 3, 0, '1', 'CN');
INSERT INTO `sys_region` VALUES (1496, '341502', '金安区', 146, 3, 0, 'Jinan Qu', 'CN');
INSERT INTO `sys_region` VALUES (1497, '341503', '裕安区', 146, 3, 0, 'Yuan Qu', 'CN');
INSERT INTO `sys_region` VALUES (1498, '341521', '寿县', 146, 3, 0, 'Shou Xian', 'CN');
INSERT INTO `sys_region` VALUES (1499, '341522', '霍邱县', 146, 3, 0, 'Huoqiu Xian', 'CN');
INSERT INTO `sys_region` VALUES (1500, '341523', '舒城县', 146, 3, 0, 'Shucheng Xian', 'CN');
INSERT INTO `sys_region` VALUES (1501, '341524', '金寨县', 146, 3, 0, 'Jingzhai Xian', 'CN');
INSERT INTO `sys_region` VALUES (1502, '341525', '霍山县', 146, 3, 0, 'Huoshan Xian', 'CN');
INSERT INTO `sys_region` VALUES (1503, '341601', '市辖区', 147, 3, 0, '1', 'CN');
INSERT INTO `sys_region` VALUES (1504, '341602', '谯城区', 147, 3, 0, 'Qiaocheng Qu', 'CN');
INSERT INTO `sys_region` VALUES (1505, '341621', '涡阳县', 147, 3, 0, 'Guoyang Xian', 'CN');
INSERT INTO `sys_region` VALUES (1506, '341622', '蒙城县', 147, 3, 0, 'Mengcheng Xian', 'CN');
INSERT INTO `sys_region` VALUES (1507, '341623', '利辛县', 147, 3, 0, 'Lixin Xian', 'CN');
INSERT INTO `sys_region` VALUES (1508, '341701', '市辖区', 148, 3, 0, '1', 'CN');
INSERT INTO `sys_region` VALUES (1509, '341702', '贵池区', 148, 3, 0, 'Guichi Qu', 'CN');
INSERT INTO `sys_region` VALUES (1510, '341721', '东至县', 148, 3, 0, 'Dongzhi Xian', 'CN');
INSERT INTO `sys_region` VALUES (1511, '341722', '石台县', 148, 3, 0, 'Shitai Xian', 'CN');
INSERT INTO `sys_region` VALUES (1512, '341723', '青阳县', 148, 3, 0, 'Qingyang Xian', 'CN');
INSERT INTO `sys_region` VALUES (1513, '341801', '市辖区', 149, 3, 0, '1', 'CN');
INSERT INTO `sys_region` VALUES (1514, '341802', '宣州区', 149, 3, 0, 'Xuanzhou Qu', 'CN');
INSERT INTO `sys_region` VALUES (1515, '341821', '郎溪县', 149, 3, 0, 'Langxi Xian', 'CN');
INSERT INTO `sys_region` VALUES (1516, '341822', '广德县', 149, 3, 0, 'Guangde Xian', 'CN');
INSERT INTO `sys_region` VALUES (1517, '341823', '泾县', 149, 3, 0, 'Jing Xian', 'CN');
INSERT INTO `sys_region` VALUES (1518, '341824', '绩溪县', 149, 3, 0, 'Jixi Xian', 'CN');
INSERT INTO `sys_region` VALUES (1519, '341825', '旌德县', 149, 3, 0, 'Jingde Xian', 'CN');
INSERT INTO `sys_region` VALUES (1520, '341881', '宁国市', 149, 3, 0, 'Ningguo Shi', 'CN');
INSERT INTO `sys_region` VALUES (1521, '350101', '市辖区', 150, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (1522, '350102', '鼓楼区', 150, 3, 0, 'Gulou Qu', 'CN');
INSERT INTO `sys_region` VALUES (1523, '350103', '台江区', 150, 3, 0, 'Taijiang Qu', 'CN');
INSERT INTO `sys_region` VALUES (1524, '350104', '仓山区', 150, 3, 0, 'Cangshan Qu', 'CN');
INSERT INTO `sys_region` VALUES (1525, '350105', '马尾区', 150, 3, 0, 'Mawei Qu', 'CN');
INSERT INTO `sys_region` VALUES (1526, '350111', '晋安区', 150, 3, 0, 'Jin,an Qu', 'CN');
INSERT INTO `sys_region` VALUES (1527, '350121', '闽侯县', 150, 3, 0, 'Minhou Qu', 'CN');
INSERT INTO `sys_region` VALUES (1528, '350122', '连江县', 150, 3, 0, 'Lianjiang Xian', 'CN');
INSERT INTO `sys_region` VALUES (1529, '350123', '罗源县', 150, 3, 0, 'Luoyuan Xian', 'CN');
INSERT INTO `sys_region` VALUES (1530, '350124', '闽清县', 150, 3, 0, 'Minqing Xian', 'CN');
INSERT INTO `sys_region` VALUES (1531, '350125', '永泰县', 150, 3, 0, 'Yongtai Xian', 'CN');
INSERT INTO `sys_region` VALUES (1532, '350128', '平潭县', 150, 3, 0, 'Pingtan Xian', 'CN');
INSERT INTO `sys_region` VALUES (1533, '350181', '福清市', 150, 3, 0, 'Fuqing Shi', 'CN');
INSERT INTO `sys_region` VALUES (1534, '350182', '长乐市', 150, 3, 0, 'Changle Shi', 'CN');
INSERT INTO `sys_region` VALUES (1535, '350201', '市辖区', 151, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (1536, '350203', '思明区', 151, 3, 0, 'Siming Qu', 'CN');
INSERT INTO `sys_region` VALUES (1537, '350205', '海沧区', 151, 3, 0, 'Haicang Qu', 'CN');
INSERT INTO `sys_region` VALUES (1538, '350206', '湖里区', 151, 3, 0, 'Huli Qu', 'CN');
INSERT INTO `sys_region` VALUES (1539, '350211', '集美区', 151, 3, 0, 'Jimei Qu', 'CN');
INSERT INTO `sys_region` VALUES (1540, '350212', '同安区', 151, 3, 0, 'Tong,an Qu', 'CN');
INSERT INTO `sys_region` VALUES (1541, '350213', '翔安区', 151, 3, 0, 'Xiangan Qu', 'CN');
INSERT INTO `sys_region` VALUES (1542, '350301', '市辖区', 152, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (1543, '350302', '城厢区', 152, 3, 0, 'Chengxiang Qu', 'CN');
INSERT INTO `sys_region` VALUES (1544, '350303', '涵江区', 152, 3, 0, 'Hanjiang Qu', 'CN');
INSERT INTO `sys_region` VALUES (1545, '350304', '荔城区', 152, 3, 0, 'Licheng Qu', 'CN');
INSERT INTO `sys_region` VALUES (1546, '350305', '秀屿区', 152, 3, 0, 'Xiuyu Qu', 'CN');
INSERT INTO `sys_region` VALUES (1547, '350322', '仙游县', 152, 3, 0, 'Xianyou Xian', 'CN');
INSERT INTO `sys_region` VALUES (1548, '350401', '市辖区', 153, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (1549, '350402', '梅列区', 153, 3, 0, 'Meilie Qu', 'CN');
INSERT INTO `sys_region` VALUES (1550, '350403', '三元区', 153, 3, 0, 'Sanyuan Qu', 'CN');
INSERT INTO `sys_region` VALUES (1551, '350421', '明溪县', 153, 3, 0, 'Mingxi Xian', 'CN');
INSERT INTO `sys_region` VALUES (1552, '350423', '清流县', 153, 3, 0, 'Qingliu Xian', 'CN');
INSERT INTO `sys_region` VALUES (1553, '350424', '宁化县', 153, 3, 0, 'Ninghua Xian', 'CN');
INSERT INTO `sys_region` VALUES (1554, '350425', '大田县', 153, 3, 0, 'Datian Xian', 'CN');
INSERT INTO `sys_region` VALUES (1555, '350426', '尤溪县', 153, 3, 0, 'Youxi Xian', 'CN');
INSERT INTO `sys_region` VALUES (1556, '350427', '沙县', 153, 3, 0, 'Sha Xian', 'CN');
INSERT INTO `sys_region` VALUES (1557, '350428', '将乐县', 153, 3, 0, 'Jiangle Xian', 'CN');
INSERT INTO `sys_region` VALUES (1558, '350429', '泰宁县', 153, 3, 0, 'Taining Xian', 'CN');
INSERT INTO `sys_region` VALUES (1559, '350430', '建宁县', 153, 3, 0, 'Jianning Xian', 'CN');
INSERT INTO `sys_region` VALUES (1560, '350481', '永安市', 153, 3, 0, 'Yong,an Shi', 'CN');
INSERT INTO `sys_region` VALUES (1561, '350501', '市辖区', 154, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (1562, '350502', '鲤城区', 154, 3, 0, 'Licheng Qu', 'CN');
INSERT INTO `sys_region` VALUES (1563, '350503', '丰泽区', 154, 3, 0, 'Fengze Qu', 'CN');
INSERT INTO `sys_region` VALUES (1564, '350504', '洛江区', 154, 3, 0, 'Luojiang Qu', 'CN');
INSERT INTO `sys_region` VALUES (1565, '350505', '泉港区', 154, 3, 0, 'Quangang Qu', 'CN');
INSERT INTO `sys_region` VALUES (1566, '350521', '惠安县', 154, 3, 0, 'Hui,an Xian', 'CN');
INSERT INTO `sys_region` VALUES (1567, '350524', '安溪县', 154, 3, 0, 'Anxi Xian', 'CN');
INSERT INTO `sys_region` VALUES (1568, '350525', '永春县', 154, 3, 0, 'Yongchun Xian', 'CN');
INSERT INTO `sys_region` VALUES (1569, '350526', '德化县', 154, 3, 0, 'Dehua Xian', 'CN');
INSERT INTO `sys_region` VALUES (1570, '350527', '金门县', 154, 3, 0, 'Jinmen Xian', 'CN');
INSERT INTO `sys_region` VALUES (1571, '350581', '石狮市', 154, 3, 0, 'Shishi Shi', 'CN');
INSERT INTO `sys_region` VALUES (1572, '350582', '晋江市', 154, 3, 0, 'Jinjiang Shi', 'CN');
INSERT INTO `sys_region` VALUES (1573, '350583', '南安市', 154, 3, 0, 'Nan,an Shi', 'CN');
INSERT INTO `sys_region` VALUES (1574, '350601', '市辖区', 155, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (1575, '350602', '芗城区', 155, 3, 0, 'Xiangcheng Qu', 'CN');
INSERT INTO `sys_region` VALUES (1576, '350603', '龙文区', 155, 3, 0, 'Longwen Qu', 'CN');
INSERT INTO `sys_region` VALUES (1577, '350622', '云霄县', 155, 3, 0, 'Yunxiao Xian', 'CN');
INSERT INTO `sys_region` VALUES (1578, '350623', '漳浦县', 155, 3, 0, 'Zhangpu Xian', 'CN');
INSERT INTO `sys_region` VALUES (1579, '350624', '诏安县', 155, 3, 0, 'Zhao,an Xian', 'CN');
INSERT INTO `sys_region` VALUES (1580, '350625', '长泰县', 155, 3, 0, 'Changtai Xian', 'CN');
INSERT INTO `sys_region` VALUES (1581, '350626', '东山县', 155, 3, 0, 'Dongshan Xian', 'CN');
INSERT INTO `sys_region` VALUES (1582, '350627', '南靖县', 155, 3, 0, 'Nanjing Xian', 'CN');
INSERT INTO `sys_region` VALUES (1583, '350628', '平和县', 155, 3, 0, 'Pinghe Xian', 'CN');
INSERT INTO `sys_region` VALUES (1584, '350629', '华安县', 155, 3, 0, 'Hua,an Xian', 'CN');
INSERT INTO `sys_region` VALUES (1585, '350681', '龙海市', 155, 3, 0, 'Longhai Shi', 'CN');
INSERT INTO `sys_region` VALUES (1586, '350701', '市辖区', 156, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (1587, '350702', '延平区', 156, 3, 0, 'Yanping Qu', 'CN');
INSERT INTO `sys_region` VALUES (1588, '350721', '顺昌县', 156, 3, 0, 'Shunchang Xian', 'CN');
INSERT INTO `sys_region` VALUES (1589, '350722', '浦城县', 156, 3, 0, 'Pucheng Xian', 'CN');
INSERT INTO `sys_region` VALUES (1590, '350723', '光泽县', 156, 3, 0, 'Guangze Xian', 'CN');
INSERT INTO `sys_region` VALUES (1591, '350724', '松溪县', 156, 3, 0, 'Songxi Xian', 'CN');
INSERT INTO `sys_region` VALUES (1592, '350725', '政和县', 156, 3, 0, 'Zhenghe Xian', 'CN');
INSERT INTO `sys_region` VALUES (1593, '350781', '邵武市', 156, 3, 0, 'Shaowu Shi', 'CN');
INSERT INTO `sys_region` VALUES (1594, '350782', '武夷山市', 156, 3, 0, 'Wuyishan Shi', 'CN');
INSERT INTO `sys_region` VALUES (1595, '350783', '建瓯市', 156, 3, 0, 'Jian,ou Shi', 'CN');
INSERT INTO `sys_region` VALUES (1596, '350784', '建阳市', 156, 3, 0, 'Jianyang Shi', 'CN');
INSERT INTO `sys_region` VALUES (1597, '350801', '市辖区', 157, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (1598, '350802', '新罗区', 157, 3, 0, 'Xinluo Qu', 'CN');
INSERT INTO `sys_region` VALUES (1599, '350821', '长汀县', 157, 3, 0, 'Changting Xian', 'CN');
INSERT INTO `sys_region` VALUES (1600, '350822', '永定县', 157, 3, 0, 'Yongding Xian', 'CN');
INSERT INTO `sys_region` VALUES (1601, '350823', '上杭县', 157, 3, 0, 'Shanghang Xian', 'CN');
INSERT INTO `sys_region` VALUES (1602, '350824', '武平县', 157, 3, 0, 'Wuping Xian', 'CN');
INSERT INTO `sys_region` VALUES (1603, '350825', '连城县', 157, 3, 0, 'Liancheng Xian', 'CN');
INSERT INTO `sys_region` VALUES (1604, '350881', '漳平市', 157, 3, 0, 'Zhangping Xian', 'CN');
INSERT INTO `sys_region` VALUES (1605, '350901', '市辖区', 158, 3, 0, '1', 'CN');
INSERT INTO `sys_region` VALUES (1606, '350902', '蕉城区', 158, 3, 0, 'Jiaocheng Qu', 'CN');
INSERT INTO `sys_region` VALUES (1607, '350921', '霞浦县', 158, 3, 0, 'Xiapu Xian', 'CN');
INSERT INTO `sys_region` VALUES (1608, '350922', '古田县', 158, 3, 0, 'Gutian Xian', 'CN');
INSERT INTO `sys_region` VALUES (1609, '350923', '屏南县', 158, 3, 0, 'Pingnan Xian', 'CN');
INSERT INTO `sys_region` VALUES (1610, '350924', '寿宁县', 158, 3, 0, 'Shouning Xian', 'CN');
INSERT INTO `sys_region` VALUES (1611, '350925', '周宁县', 158, 3, 0, 'Zhouning Xian', 'CN');
INSERT INTO `sys_region` VALUES (1612, '350926', '柘荣县', 158, 3, 0, 'Zherong Xian', 'CN');
INSERT INTO `sys_region` VALUES (1613, '350981', '福安市', 158, 3, 0, 'Fu,an Shi', 'CN');
INSERT INTO `sys_region` VALUES (1614, '350982', '福鼎市', 158, 3, 0, 'Fuding Shi', 'CN');
INSERT INTO `sys_region` VALUES (1615, '360101', '市辖区', 159, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (1616, '360102', '东湖区', 159, 3, 0, 'Donghu Qu', 'CN');
INSERT INTO `sys_region` VALUES (1617, '360103', '西湖区', 159, 3, 0, 'Xihu Qu ', 'CN');
INSERT INTO `sys_region` VALUES (1618, '360104', '青云谱区', 159, 3, 0, 'Qingyunpu Qu', 'CN');
INSERT INTO `sys_region` VALUES (1619, '360105', '湾里区', 159, 3, 0, 'Wanli Qu', 'CN');
INSERT INTO `sys_region` VALUES (1620, '360111', '青山湖区', 159, 3, 0, 'Qingshanhu Qu', 'CN');
INSERT INTO `sys_region` VALUES (1621, '360121', '南昌县', 159, 3, 0, 'Nanchang Xian', 'CN');
INSERT INTO `sys_region` VALUES (1622, '360122', '新建县', 159, 3, 0, 'Xinjian Xian', 'CN');
INSERT INTO `sys_region` VALUES (1623, '360123', '安义县', 159, 3, 0, 'Anyi Xian', 'CN');
INSERT INTO `sys_region` VALUES (1624, '360124', '进贤县', 159, 3, 0, 'Jinxian Xian', 'CN');
INSERT INTO `sys_region` VALUES (1625, '360201', '市辖区', 160, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (1626, '360202', '昌江区', 160, 3, 0, 'Changjiang Qu', 'CN');
INSERT INTO `sys_region` VALUES (1627, '360203', '珠山区', 160, 3, 0, 'Zhushan Qu', 'CN');
INSERT INTO `sys_region` VALUES (1628, '360222', '浮梁县', 160, 3, 0, 'Fuliang Xian', 'CN');
INSERT INTO `sys_region` VALUES (1629, '360281', '乐平市', 160, 3, 0, 'Leping Shi', 'CN');
INSERT INTO `sys_region` VALUES (1630, '360301', '市辖区', 161, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (1631, '360302', '安源区', 161, 3, 0, 'Anyuan Qu', 'CN');
INSERT INTO `sys_region` VALUES (1632, '360313', '湘东区', 161, 3, 0, 'Xiangdong Qu', 'CN');
INSERT INTO `sys_region` VALUES (1633, '360321', '莲花县', 161, 3, 0, 'Lianhua Xian', 'CN');
INSERT INTO `sys_region` VALUES (1634, '360322', '上栗县', 161, 3, 0, 'Shangli Xian', 'CN');
INSERT INTO `sys_region` VALUES (1635, '360323', '芦溪县', 161, 3, 0, 'Lixi Xian', 'CN');
INSERT INTO `sys_region` VALUES (1636, '360401', '市辖区', 162, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (1637, '360402', '庐山区', 162, 3, 0, 'Lushan Qu', 'CN');
INSERT INTO `sys_region` VALUES (1638, '360403', '浔阳区', 162, 3, 0, 'Xunyang Qu', 'CN');
INSERT INTO `sys_region` VALUES (1639, '360421', '九江县', 162, 3, 0, 'Jiujiang Xian', 'CN');
INSERT INTO `sys_region` VALUES (1640, '360423', '武宁县', 162, 3, 0, 'Wuning Xian', 'CN');
INSERT INTO `sys_region` VALUES (1641, '360424', '修水县', 162, 3, 0, 'Xiushui Xian', 'CN');
INSERT INTO `sys_region` VALUES (1642, '360425', '永修县', 162, 3, 0, 'Yongxiu Xian', 'CN');
INSERT INTO `sys_region` VALUES (1643, '360426', '德安县', 162, 3, 0, 'De,an Xian', 'CN');
INSERT INTO `sys_region` VALUES (1644, '360427', '星子县', 162, 3, 0, 'Xingzi Xian', 'CN');
INSERT INTO `sys_region` VALUES (1645, '360428', '都昌县', 162, 3, 0, 'Duchang Xian', 'CN');
INSERT INTO `sys_region` VALUES (1646, '360429', '湖口县', 162, 3, 0, 'Hukou Xian', 'CN');
INSERT INTO `sys_region` VALUES (1647, '360430', '彭泽县', 162, 3, 0, 'Pengze Xian', 'CN');
INSERT INTO `sys_region` VALUES (1648, '360481', '瑞昌市', 162, 3, 0, 'Ruichang Shi', 'CN');
INSERT INTO `sys_region` VALUES (1649, '360501', '市辖区', 163, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (1650, '360502', '渝水区', 163, 3, 0, 'Yushui Qu', 'CN');
INSERT INTO `sys_region` VALUES (1651, '360521', '分宜县', 163, 3, 0, 'Fenyi Xian', 'CN');
INSERT INTO `sys_region` VALUES (1652, '360601', '市辖区', 164, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (1653, '360602', '月湖区', 164, 3, 0, 'Yuehu Qu', 'CN');
INSERT INTO `sys_region` VALUES (1654, '360622', '余江县', 164, 3, 0, 'Yujiang Xian', 'CN');
INSERT INTO `sys_region` VALUES (1655, '360681', '贵溪市', 164, 3, 0, 'Guixi Shi', 'CN');
INSERT INTO `sys_region` VALUES (1656, '360701', '市辖区', 165, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (1657, '360702', '章贡区', 165, 3, 0, 'Zhanggong Qu', 'CN');
INSERT INTO `sys_region` VALUES (1658, '360721', '赣县', 165, 3, 0, 'Gan Xian', 'CN');
INSERT INTO `sys_region` VALUES (1659, '360722', '信丰县', 165, 3, 0, 'Xinfeng Xian ', 'CN');
INSERT INTO `sys_region` VALUES (1660, '360723', '大余县', 165, 3, 0, 'Dayu Xian', 'CN');
INSERT INTO `sys_region` VALUES (1661, '360724', '上犹县', 165, 3, 0, 'Shangyou Xian', 'CN');
INSERT INTO `sys_region` VALUES (1662, '360725', '崇义县', 165, 3, 0, 'Chongyi Xian', 'CN');
INSERT INTO `sys_region` VALUES (1663, '360726', '安远县', 165, 3, 0, 'Anyuan Xian', 'CN');
INSERT INTO `sys_region` VALUES (1664, '360727', '龙南县', 165, 3, 0, 'Longnan Xian', 'CN');
INSERT INTO `sys_region` VALUES (1665, '360728', '定南县', 165, 3, 0, 'Dingnan Xian', 'CN');
INSERT INTO `sys_region` VALUES (1666, '360729', '全南县', 165, 3, 0, 'Quannan Xian', 'CN');
INSERT INTO `sys_region` VALUES (1667, '360730', '宁都县', 165, 3, 0, 'Ningdu Xian', 'CN');
INSERT INTO `sys_region` VALUES (1668, '360731', '于都县', 165, 3, 0, 'Yudu Xian', 'CN');
INSERT INTO `sys_region` VALUES (1669, '360732', '兴国县', 165, 3, 0, 'Xingguo Xian', 'CN');
INSERT INTO `sys_region` VALUES (1670, '360733', '会昌县', 165, 3, 0, 'Huichang Xian', 'CN');
INSERT INTO `sys_region` VALUES (1671, '360734', '寻乌县', 165, 3, 0, 'Xunwu Xian', 'CN');
INSERT INTO `sys_region` VALUES (1672, '360735', '石城县', 165, 3, 0, 'Shicheng Xian', 'CN');
INSERT INTO `sys_region` VALUES (1673, '360781', '瑞金市', 165, 3, 0, 'Ruijin Shi', 'CN');
INSERT INTO `sys_region` VALUES (1674, '360782', '南康市', 165, 3, 0, 'Nankang Shi', 'CN');
INSERT INTO `sys_region` VALUES (1675, '360801', '市辖区', 166, 3, 0, '1', 'CN');
INSERT INTO `sys_region` VALUES (1676, '360802', '吉州区', 166, 3, 0, 'Jizhou Qu', 'CN');
INSERT INTO `sys_region` VALUES (1677, '360803', '青原区', 166, 3, 0, 'Qingyuan Qu', 'CN');
INSERT INTO `sys_region` VALUES (1678, '360821', '吉安县', 166, 3, 0, 'Ji,an Xian', 'CN');
INSERT INTO `sys_region` VALUES (1679, '360822', '吉水县', 166, 3, 0, 'Jishui Xian', 'CN');
INSERT INTO `sys_region` VALUES (1680, '360823', '峡江县', 166, 3, 0, 'Xiajiang Xian', 'CN');
INSERT INTO `sys_region` VALUES (1681, '360824', '新干县', 166, 3, 0, 'Xingan Xian', 'CN');
INSERT INTO `sys_region` VALUES (1682, '360825', '永丰县', 166, 3, 0, 'Yongfeng Xian', 'CN');
INSERT INTO `sys_region` VALUES (1683, '360826', '泰和县', 166, 3, 0, 'Taihe Xian', 'CN');
INSERT INTO `sys_region` VALUES (1684, '360827', '遂川县', 166, 3, 0, 'Suichuan Xian', 'CN');
INSERT INTO `sys_region` VALUES (1685, '360828', '万安县', 166, 3, 0, 'Wan,an Xian', 'CN');
INSERT INTO `sys_region` VALUES (1686, '360829', '安福县', 166, 3, 0, 'Anfu Xian', 'CN');
INSERT INTO `sys_region` VALUES (1687, '360830', '永新县', 166, 3, 0, 'Yongxin Xian ', 'CN');
INSERT INTO `sys_region` VALUES (1688, '360881', '井冈山市', 166, 3, 0, 'Jinggangshan Shi', 'CN');
INSERT INTO `sys_region` VALUES (1689, '360901', '市辖区', 167, 3, 0, '1', 'CN');
INSERT INTO `sys_region` VALUES (1690, '360902', '袁州区', 167, 3, 0, 'Yuanzhou Qu', 'CN');
INSERT INTO `sys_region` VALUES (1691, '360921', '奉新县', 167, 3, 0, 'Fengxin Xian', 'CN');
INSERT INTO `sys_region` VALUES (1692, '360922', '万载县', 167, 3, 0, 'Wanzai Xian', 'CN');
INSERT INTO `sys_region` VALUES (1693, '360923', '上高县', 167, 3, 0, 'Shanggao Xian', 'CN');
INSERT INTO `sys_region` VALUES (1694, '360924', '宜丰县', 167, 3, 0, 'Yifeng Xian', 'CN');
INSERT INTO `sys_region` VALUES (1695, '360925', '靖安县', 167, 3, 0, 'Jing,an Xian', 'CN');
INSERT INTO `sys_region` VALUES (1696, '360926', '铜鼓县', 167, 3, 0, 'Tonggu Xian', 'CN');
INSERT INTO `sys_region` VALUES (1697, '360981', '丰城市', 167, 3, 0, 'Fengcheng Shi', 'CN');
INSERT INTO `sys_region` VALUES (1698, '360982', '樟树市', 167, 3, 0, 'Zhangshu Shi', 'CN');
INSERT INTO `sys_region` VALUES (1699, '360983', '高安市', 167, 3, 0, 'Gao,an Shi', 'CN');
INSERT INTO `sys_region` VALUES (1700, '361001', '市辖区', 168, 3, 0, '1', 'CN');
INSERT INTO `sys_region` VALUES (1701, '361002', '临川区', 168, 3, 0, 'Linchuan Qu', 'CN');
INSERT INTO `sys_region` VALUES (1702, '361021', '南城县', 168, 3, 0, 'Nancheng Xian', 'CN');
INSERT INTO `sys_region` VALUES (1703, '361022', '黎川县', 168, 3, 0, 'Lichuan Xian', 'CN');
INSERT INTO `sys_region` VALUES (1704, '361023', '南丰县', 168, 3, 0, 'Nanfeng Xian', 'CN');
INSERT INTO `sys_region` VALUES (1705, '361024', '崇仁县', 168, 3, 0, 'Chongren Xian', 'CN');
INSERT INTO `sys_region` VALUES (1706, '361025', '乐安县', 168, 3, 0, 'Le,an Xian', 'CN');
INSERT INTO `sys_region` VALUES (1707, '361026', '宜黄县', 168, 3, 0, 'Yihuang Xian', 'CN');
INSERT INTO `sys_region` VALUES (1708, '361027', '金溪县', 168, 3, 0, 'Jinxi Xian', 'CN');
INSERT INTO `sys_region` VALUES (1709, '361028', '资溪县', 168, 3, 0, 'Zixi Xian', 'CN');
INSERT INTO `sys_region` VALUES (1710, '361029', '东乡县', 168, 3, 0, 'Dongxiang Xian', 'CN');
INSERT INTO `sys_region` VALUES (1711, '361030', '广昌县', 168, 3, 0, 'Guangchang Xian', 'CN');
INSERT INTO `sys_region` VALUES (1712, '361101', '市辖区', 169, 3, 0, '1', 'CN');
INSERT INTO `sys_region` VALUES (1713, '361102', '信州区', 169, 3, 0, 'Xinzhou Qu', 'CN');
INSERT INTO `sys_region` VALUES (1714, '361121', '上饶县', 169, 3, 0, 'Shangrao Xian ', 'CN');
INSERT INTO `sys_region` VALUES (1715, '361122', '广丰县', 169, 3, 0, 'Guangfeng Xian', 'CN');
INSERT INTO `sys_region` VALUES (1716, '361123', '玉山县', 169, 3, 0, 'Yushan Xian', 'CN');
INSERT INTO `sys_region` VALUES (1717, '361124', '铅山县', 169, 3, 0, 'Qianshan Xian', 'CN');
INSERT INTO `sys_region` VALUES (1718, '361125', '横峰县', 169, 3, 0, 'Hengfeng Xian', 'CN');
INSERT INTO `sys_region` VALUES (1719, '361126', '弋阳县', 169, 3, 0, 'Yiyang Xian', 'CN');
INSERT INTO `sys_region` VALUES (1720, '361127', '余干县', 169, 3, 0, 'Yugan Xian', 'CN');
INSERT INTO `sys_region` VALUES (1721, '361128', '鄱阳县', 169, 3, 0, 'Poyang Xian', 'CN');
INSERT INTO `sys_region` VALUES (1722, '361129', '万年县', 169, 3, 0, 'Wannian Xian', 'CN');
INSERT INTO `sys_region` VALUES (1723, '361130', '婺源县', 169, 3, 0, 'Wuyuan Xian', 'CN');
INSERT INTO `sys_region` VALUES (1724, '361181', '德兴市', 169, 3, 0, 'Dexing Shi', 'CN');
INSERT INTO `sys_region` VALUES (1725, '370101', '市辖区', 170, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (1726, '370102', '历下区', 170, 3, 0, 'Lixia Qu', 'CN');
INSERT INTO `sys_region` VALUES (1727, '370103', '市中区', 170, 3, 0, 'Shizhong Qu', 'CN');
INSERT INTO `sys_region` VALUES (1728, '370104', '槐荫区', 170, 3, 0, 'Huaiyin Qu', 'CN');
INSERT INTO `sys_region` VALUES (1729, '370105', '天桥区', 170, 3, 0, 'Tianqiao Qu', 'CN');
INSERT INTO `sys_region` VALUES (1730, '370112', '历城区', 170, 3, 0, 'Licheng Qu', 'CN');
INSERT INTO `sys_region` VALUES (1731, '370113', '长清区', 170, 3, 0, 'Changqing Qu', 'CN');
INSERT INTO `sys_region` VALUES (1732, '370124', '平阴县', 170, 3, 0, 'Pingyin Xian', 'CN');
INSERT INTO `sys_region` VALUES (1733, '370125', '济阳县', 170, 3, 0, 'Jiyang Xian', 'CN');
INSERT INTO `sys_region` VALUES (1734, '370126', '商河县', 170, 3, 0, 'Shanghe Xian', 'CN');
INSERT INTO `sys_region` VALUES (1735, '370181', '章丘市', 170, 3, 0, 'Zhangqiu Shi', 'CN');
INSERT INTO `sys_region` VALUES (1736, '370201', '市辖区', 171, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (1737, '370202', '市南区', 171, 3, 0, 'Shinan Qu', 'CN');
INSERT INTO `sys_region` VALUES (1738, '370203', '市北区', 171, 3, 0, 'Shibei Qu', 'CN');
INSERT INTO `sys_region` VALUES (1739, '370205', '四方区', 171, 3, 0, 'Sifang Qu', 'CN');
INSERT INTO `sys_region` VALUES (1740, '370211', '黄岛区', 171, 3, 0, 'Huangdao Qu', 'CN');
INSERT INTO `sys_region` VALUES (1741, '370212', '崂山区', 171, 3, 0, 'Laoshan Qu', 'CN');
INSERT INTO `sys_region` VALUES (1742, '370213', '李沧区', 171, 3, 0, 'Licang Qu', 'CN');
INSERT INTO `sys_region` VALUES (1743, '370214', '城阳区', 171, 3, 0, 'Chengyang Qu', 'CN');
INSERT INTO `sys_region` VALUES (1744, '370281', '胶州市', 171, 3, 0, 'Jiaozhou Shi', 'CN');
INSERT INTO `sys_region` VALUES (1745, '370282', '即墨市', 171, 3, 0, 'Jimo Shi', 'CN');
INSERT INTO `sys_region` VALUES (1746, '370283', '平度市', 171, 3, 0, 'Pingdu Shi', 'CN');
INSERT INTO `sys_region` VALUES (1747, '370284', '胶南市', 171, 3, 0, 'Jiaonan Shi', 'CN');
INSERT INTO `sys_region` VALUES (1748, '370285', '莱西市', 171, 3, 0, 'Laixi Shi', 'CN');
INSERT INTO `sys_region` VALUES (1749, '370301', '市辖区', 172, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (1750, '370302', '淄川区', 172, 3, 0, 'Zichuan Qu', 'CN');
INSERT INTO `sys_region` VALUES (1751, '370303', '张店区', 172, 3, 0, 'Zhangdian Qu', 'CN');
INSERT INTO `sys_region` VALUES (1752, '370304', '博山区', 172, 3, 0, 'Boshan Qu', 'CN');
INSERT INTO `sys_region` VALUES (1753, '370305', '临淄区', 172, 3, 0, 'Linzi Qu', 'CN');
INSERT INTO `sys_region` VALUES (1754, '370306', '周村区', 172, 3, 0, 'Zhoucun Qu', 'CN');
INSERT INTO `sys_region` VALUES (1755, '370321', '桓台县', 172, 3, 0, 'Huantai Xian', 'CN');
INSERT INTO `sys_region` VALUES (1756, '370322', '高青县', 172, 3, 0, 'Gaoqing Xian', 'CN');
INSERT INTO `sys_region` VALUES (1757, '370323', '沂源县', 172, 3, 0, 'Yiyuan Xian', 'CN');
INSERT INTO `sys_region` VALUES (1758, '370401', '市辖区', 173, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (1759, '370402', '市中区', 173, 3, 0, 'Shizhong Qu', 'CN');
INSERT INTO `sys_region` VALUES (1760, '370403', '薛城区', 173, 3, 0, 'Xuecheng Qu', 'CN');
INSERT INTO `sys_region` VALUES (1761, '370404', '峄城区', 173, 3, 0, 'Yicheng Qu', 'CN');
INSERT INTO `sys_region` VALUES (1762, '370405', '台儿庄区', 173, 3, 0, 'Tai,erzhuang Qu', 'CN');
INSERT INTO `sys_region` VALUES (1763, '370406', '山亭区', 173, 3, 0, 'Shanting Qu', 'CN');
INSERT INTO `sys_region` VALUES (1764, '370481', '滕州市', 173, 3, 0, 'Tengzhou Shi', 'CN');
INSERT INTO `sys_region` VALUES (1765, '370501', '市辖区', 174, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (1766, '370502', '东营区', 174, 3, 0, 'Dongying Qu', 'CN');
INSERT INTO `sys_region` VALUES (1767, '370503', '河口区', 174, 3, 0, 'Hekou Qu', 'CN');
INSERT INTO `sys_region` VALUES (1768, '370521', '垦利县', 174, 3, 0, 'Kenli Xian', 'CN');
INSERT INTO `sys_region` VALUES (1769, '370522', '利津县', 174, 3, 0, 'Lijin Xian', 'CN');
INSERT INTO `sys_region` VALUES (1770, '370523', '广饶县', 174, 3, 0, 'Guangrao Xian ', 'CN');
INSERT INTO `sys_region` VALUES (1771, '370601', '市辖区', 175, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (1772, '370602', '芝罘区', 175, 3, 0, 'Zhifu Qu', 'CN');
INSERT INTO `sys_region` VALUES (1773, '370611', '福山区', 175, 3, 0, 'Fushan Qu', 'CN');
INSERT INTO `sys_region` VALUES (1774, '370612', '牟平区', 175, 3, 0, 'Muping Qu', 'CN');
INSERT INTO `sys_region` VALUES (1775, '370613', '莱山区', 175, 3, 0, 'Laishan Qu', 'CN');
INSERT INTO `sys_region` VALUES (1776, '370634', '长岛县', 175, 3, 0, 'Changdao Xian', 'CN');
INSERT INTO `sys_region` VALUES (1777, '370681', '龙口市', 175, 3, 0, 'Longkou Shi', 'CN');
INSERT INTO `sys_region` VALUES (1778, '370682', '莱阳市', 175, 3, 0, 'Laiyang Shi', 'CN');
INSERT INTO `sys_region` VALUES (1779, '370683', '莱州市', 175, 3, 0, 'Laizhou Shi', 'CN');
INSERT INTO `sys_region` VALUES (1780, '370684', '蓬莱市', 175, 3, 0, 'Penglai Shi', 'CN');
INSERT INTO `sys_region` VALUES (1781, '370685', '招远市', 175, 3, 0, 'Zhaoyuan Shi', 'CN');
INSERT INTO `sys_region` VALUES (1782, '370686', '栖霞市', 175, 3, 0, 'Qixia Shi', 'CN');
INSERT INTO `sys_region` VALUES (1783, '370687', '海阳市', 175, 3, 0, 'Haiyang Shi', 'CN');
INSERT INTO `sys_region` VALUES (1784, '370701', '市辖区', 176, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (1785, '370702', '潍城区', 176, 3, 0, 'Weicheng Qu', 'CN');
INSERT INTO `sys_region` VALUES (1786, '370703', '寒亭区', 176, 3, 0, 'Hanting Qu', 'CN');
INSERT INTO `sys_region` VALUES (1787, '370704', '坊子区', 176, 3, 0, 'Fangzi Qu', 'CN');
INSERT INTO `sys_region` VALUES (1788, '370705', '奎文区', 176, 3, 0, 'Kuiwen Qu', 'CN');
INSERT INTO `sys_region` VALUES (1789, '370724', '临朐县', 176, 3, 0, 'Linqu Xian', 'CN');
INSERT INTO `sys_region` VALUES (1790, '370725', '昌乐县', 176, 3, 0, 'Changle Xian', 'CN');
INSERT INTO `sys_region` VALUES (1791, '370781', '青州市', 176, 3, 0, 'Qingzhou Shi', 'CN');
INSERT INTO `sys_region` VALUES (1792, '370782', '诸城市', 176, 3, 0, 'Zhucheng Shi', 'CN');
INSERT INTO `sys_region` VALUES (1793, '370783', '寿光市', 176, 3, 0, 'Shouguang Shi', 'CN');
INSERT INTO `sys_region` VALUES (1794, '370784', '安丘市', 176, 3, 0, 'Anqiu Shi', 'CN');
INSERT INTO `sys_region` VALUES (1795, '370785', '高密市', 176, 3, 0, 'Gaomi Shi', 'CN');
INSERT INTO `sys_region` VALUES (1796, '370786', '昌邑市', 176, 3, 0, 'Changyi Shi', 'CN');
INSERT INTO `sys_region` VALUES (1797, '370801', '市辖区', 177, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (1798, '370802', '市中区', 177, 3, 0, 'Shizhong Qu', 'CN');
INSERT INTO `sys_region` VALUES (1799, '370811', '任城区', 177, 3, 0, 'Rencheng Qu', 'CN');
INSERT INTO `sys_region` VALUES (1800, '370826', '微山县', 177, 3, 0, 'Weishan Xian', 'CN');
INSERT INTO `sys_region` VALUES (1801, '370827', '鱼台县', 177, 3, 0, 'Yutai Xian', 'CN');
INSERT INTO `sys_region` VALUES (1802, '370828', '金乡县', 177, 3, 0, 'Jinxiang Xian', 'CN');
INSERT INTO `sys_region` VALUES (1803, '370829', '嘉祥县', 177, 3, 0, 'Jiaxiang Xian', 'CN');
INSERT INTO `sys_region` VALUES (1804, '370830', '汶上县', 177, 3, 0, 'Wenshang Xian', 'CN');
INSERT INTO `sys_region` VALUES (1805, '370831', '泗水县', 177, 3, 0, 'Sishui Xian', 'CN');
INSERT INTO `sys_region` VALUES (1806, '370832', '梁山县', 177, 3, 0, 'Liangshan Xian', 'CN');
INSERT INTO `sys_region` VALUES (1807, '370881', '曲阜市', 177, 3, 0, 'Qufu Shi', 'CN');
INSERT INTO `sys_region` VALUES (1808, '370882', '兖州市', 177, 3, 0, 'Yanzhou Shi', 'CN');
INSERT INTO `sys_region` VALUES (1809, '370883', '邹城市', 177, 3, 0, 'Zoucheng Shi', 'CN');
INSERT INTO `sys_region` VALUES (1810, '370901', '市辖区', 178, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (1811, '370902', '泰山区', 178, 3, 0, 'Taishan Qu', 'CN');
INSERT INTO `sys_region` VALUES (1812, '370911', '岱岳区', 178, 3, 0, 'Daiyue Qu', 'CN');
INSERT INTO `sys_region` VALUES (1813, '370921', '宁阳县', 178, 3, 0, 'Ningyang Xian', 'CN');
INSERT INTO `sys_region` VALUES (1814, '370923', '东平县', 178, 3, 0, 'Dongping Xian', 'CN');
INSERT INTO `sys_region` VALUES (1815, '370982', '新泰市', 178, 3, 0, 'Xintai Shi', 'CN');
INSERT INTO `sys_region` VALUES (1816, '370983', '肥城市', 178, 3, 0, 'Feicheng Shi', 'CN');
INSERT INTO `sys_region` VALUES (1817, '371001', '市辖区', 179, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (1818, '371002', '环翠区', 179, 3, 0, 'Huancui Qu', 'CN');
INSERT INTO `sys_region` VALUES (1819, '371081', '文登市', 179, 3, 0, 'Wendeng Shi', 'CN');
INSERT INTO `sys_region` VALUES (1820, '371082', '荣成市', 179, 3, 0, 'Rongcheng Shi', 'CN');
INSERT INTO `sys_region` VALUES (1821, '371083', '乳山市', 179, 3, 0, 'Rushan Shi', 'CN');
INSERT INTO `sys_region` VALUES (1822, '371101', '市辖区', 180, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (1823, '371102', '东港区', 180, 3, 0, 'Donggang Qu', 'CN');
INSERT INTO `sys_region` VALUES (1824, '371103', '岚山区', 180, 3, 0, 'Lanshan Qu', 'CN');
INSERT INTO `sys_region` VALUES (1825, '371121', '五莲县', 180, 3, 0, 'Wulian Xian', 'CN');
INSERT INTO `sys_region` VALUES (1826, '371122', '莒县', 180, 3, 0, 'Ju Xian', 'CN');
INSERT INTO `sys_region` VALUES (1827, '371201', '市辖区', 181, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (1828, '371202', '莱城区', 181, 3, 0, 'Laicheng Qu', 'CN');
INSERT INTO `sys_region` VALUES (1829, '371203', '钢城区', 181, 3, 0, 'Gangcheng Qu', 'CN');
INSERT INTO `sys_region` VALUES (1830, '371301', '市辖区', 182, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (1831, '371302', '兰山区', 182, 3, 0, 'Lanshan Qu', 'CN');
INSERT INTO `sys_region` VALUES (1832, '371311', '罗庄区', 182, 3, 0, 'Luozhuang Qu', 'CN');
INSERT INTO `sys_region` VALUES (1833, '371303', '河东区', 182, 3, 0, 'Hedong Qu', 'CN');
INSERT INTO `sys_region` VALUES (1834, '371321', '沂南县', 182, 3, 0, 'Yinan Xian', 'CN');
INSERT INTO `sys_region` VALUES (1835, '371322', '郯城县', 182, 3, 0, 'Tancheng Xian', 'CN');
INSERT INTO `sys_region` VALUES (1836, '371323', '沂水县', 182, 3, 0, 'Yishui Xian', 'CN');
INSERT INTO `sys_region` VALUES (1837, '371324', '苍山县', 182, 3, 0, 'Cangshan Xian', 'CN');
INSERT INTO `sys_region` VALUES (1838, '371325', '费县', 182, 3, 0, 'Fei Xian', 'CN');
INSERT INTO `sys_region` VALUES (1839, '371326', '平邑县', 182, 3, 0, 'Pingyi Xian', 'CN');
INSERT INTO `sys_region` VALUES (1840, '371327', '莒南县', 182, 3, 0, 'Junan Xian', 'CN');
INSERT INTO `sys_region` VALUES (1841, '371328', '蒙阴县', 182, 3, 0, 'Mengyin Xian', 'CN');
INSERT INTO `sys_region` VALUES (1842, '371329', '临沭县', 182, 3, 0, 'Linshu Xian', 'CN');
INSERT INTO `sys_region` VALUES (1843, '371401', '市辖区', 183, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (1844, '371402', '德城区', 183, 3, 0, 'Decheng Qu', 'CN');
INSERT INTO `sys_region` VALUES (1845, '371421', '陵县', 183, 3, 0, 'Ling Xian', 'CN');
INSERT INTO `sys_region` VALUES (1846, '371422', '宁津县', 183, 3, 0, 'Ningjin Xian', 'CN');
INSERT INTO `sys_region` VALUES (1847, '371423', '庆云县', 183, 3, 0, 'Qingyun Xian', 'CN');
INSERT INTO `sys_region` VALUES (1848, '371424', '临邑县', 183, 3, 0, 'Linyi xian', 'CN');
INSERT INTO `sys_region` VALUES (1849, '371425', '齐河县', 183, 3, 0, 'Qihe Xian', 'CN');
INSERT INTO `sys_region` VALUES (1850, '371426', '平原县', 183, 3, 0, 'Pingyuan Xian', 'CN');
INSERT INTO `sys_region` VALUES (1851, '371427', '夏津县', 183, 3, 0, 'Xiajin Xian', 'CN');
INSERT INTO `sys_region` VALUES (1852, '371428', '武城县', 183, 3, 0, 'Wucheng Xian', 'CN');
INSERT INTO `sys_region` VALUES (1853, '371481', '乐陵市', 183, 3, 0, 'Leling Shi', 'CN');
INSERT INTO `sys_region` VALUES (1854, '371482', '禹城市', 183, 3, 0, 'Yucheng Shi', 'CN');
INSERT INTO `sys_region` VALUES (1855, '371501', '市辖区', 184, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (1856, '371502', '东昌府区', 184, 3, 0, 'Dongchangfu Qu', 'CN');
INSERT INTO `sys_region` VALUES (1857, '371521', '阳谷县', 184, 3, 0, 'Yanggu Xian ', 'CN');
INSERT INTO `sys_region` VALUES (1858, '371522', '莘县', 184, 3, 0, 'Shen Xian', 'CN');
INSERT INTO `sys_region` VALUES (1859, '371523', '茌平县', 184, 3, 0, 'Chiping Xian ', 'CN');
INSERT INTO `sys_region` VALUES (1860, '371524', '东阿县', 184, 3, 0, 'Dong,e Xian', 'CN');
INSERT INTO `sys_region` VALUES (1861, '371525', '冠县', 184, 3, 0, 'Guan Xian', 'CN');
INSERT INTO `sys_region` VALUES (1862, '371526', '高唐县', 184, 3, 0, 'Gaotang Xian', 'CN');
INSERT INTO `sys_region` VALUES (1863, '371581', '临清市', 184, 3, 0, 'Linqing Xian', 'CN');
INSERT INTO `sys_region` VALUES (1864, '371601', '市辖区', 185, 3, 0, '1', 'CN');
INSERT INTO `sys_region` VALUES (1865, '371602', '滨城区', 185, 3, 0, 'Bincheng Qu', 'CN');
INSERT INTO `sys_region` VALUES (1866, '371621', '惠民县', 185, 3, 0, 'Huimin Xian', 'CN');
INSERT INTO `sys_region` VALUES (1867, '371622', '阳信县', 185, 3, 0, 'Yangxin Xian', 'CN');
INSERT INTO `sys_region` VALUES (1868, '371623', '无棣县', 185, 3, 0, 'Wudi Xian', 'CN');
INSERT INTO `sys_region` VALUES (1869, '371624', '沾化县', 185, 3, 0, 'Zhanhua Xian', 'CN');
INSERT INTO `sys_region` VALUES (1870, '371625', '博兴县', 185, 3, 0, 'Boxing Xian', 'CN');
INSERT INTO `sys_region` VALUES (1871, '371626', '邹平县', 185, 3, 0, 'Zouping Xian', 'CN');
INSERT INTO `sys_region` VALUES (1873, '371702', '牡丹区', 186, 3, 0, 'Mudan Qu', 'CN');
INSERT INTO `sys_region` VALUES (1874, '371721', '曹县', 186, 3, 0, 'Cao Xian', 'CN');
INSERT INTO `sys_region` VALUES (1875, '371722', '单县', 186, 3, 0, 'Shan Xian', 'CN');
INSERT INTO `sys_region` VALUES (1876, '371723', '成武县', 186, 3, 0, 'Chengwu Xian', 'CN');
INSERT INTO `sys_region` VALUES (1877, '371724', '巨野县', 186, 3, 0, 'Juye Xian', 'CN');
INSERT INTO `sys_region` VALUES (1878, '371725', '郓城县', 186, 3, 0, 'Yuncheng Xian', 'CN');
INSERT INTO `sys_region` VALUES (1879, '371726', '鄄城县', 186, 3, 0, 'Juancheng Xian', 'CN');
INSERT INTO `sys_region` VALUES (1880, '371727', '定陶县', 186, 3, 0, 'Dingtao Xian', 'CN');
INSERT INTO `sys_region` VALUES (1881, '371728', '东明县', 186, 3, 0, 'Dongming Xian', 'CN');
INSERT INTO `sys_region` VALUES (1882, '410101', '市辖区', 187, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (1883, '410102', '中原区', 187, 3, 0, 'Zhongyuan Qu', 'CN');
INSERT INTO `sys_region` VALUES (1884, '410103', '二七区', 187, 3, 0, 'Erqi Qu', 'CN');
INSERT INTO `sys_region` VALUES (1885, '410104', '管城回族区', 187, 3, 0, 'Guancheng Huizu Qu', 'CN');
INSERT INTO `sys_region` VALUES (1886, '410105', '金水区', 187, 3, 0, 'Jinshui Qu', 'CN');
INSERT INTO `sys_region` VALUES (1887, '410106', '上街区', 187, 3, 0, 'Shangjie Qu', 'CN');
INSERT INTO `sys_region` VALUES (1888, '410108', '惠济区', 187, 3, 0, 'Mangshan Qu', 'CN');
INSERT INTO `sys_region` VALUES (1889, '410122', '中牟县', 187, 3, 0, 'Zhongmou Xian', 'CN');
INSERT INTO `sys_region` VALUES (1890, '410181', '巩义市', 187, 3, 0, 'Gongyi Shi', 'CN');
INSERT INTO `sys_region` VALUES (1891, '410182', '荥阳市', 187, 3, 0, 'Xingyang Shi', 'CN');
INSERT INTO `sys_region` VALUES (1892, '410183', '新密市', 187, 3, 0, 'Xinmi Shi', 'CN');
INSERT INTO `sys_region` VALUES (1893, '410184', '新郑市', 187, 3, 0, 'Xinzheng Shi', 'CN');
INSERT INTO `sys_region` VALUES (1894, '410185', '登封市', 187, 3, 0, 'Dengfeng Shi', 'CN');
INSERT INTO `sys_region` VALUES (1895, '410201', '市辖区', 188, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (1896, '410202', '龙亭区', 188, 3, 0, 'Longting Qu', 'CN');
INSERT INTO `sys_region` VALUES (1897, '410203', '顺河回族区', 188, 3, 0, 'Shunhe Huizu Qu', 'CN');
INSERT INTO `sys_region` VALUES (1898, '410204', '鼓楼区', 188, 3, 0, 'Gulou Qu', 'CN');
INSERT INTO `sys_region` VALUES (1899, '410205', '禹王台区', 188, 3, 0, 'Yuwangtai Qu', 'CN');
INSERT INTO `sys_region` VALUES (1900, '410211', '金明区', 188, 3, 0, 'Jinming Qu', 'CN');
INSERT INTO `sys_region` VALUES (1901, '410221', '杞县', 188, 3, 0, 'Qi Xian', 'CN');
INSERT INTO `sys_region` VALUES (1902, '410222', '通许县', 188, 3, 0, 'Tongxu Xian', 'CN');
INSERT INTO `sys_region` VALUES (1903, '410223', '尉氏县', 188, 3, 0, 'Weishi Xian', 'CN');
INSERT INTO `sys_region` VALUES (1904, '410224', '开封县', 188, 3, 0, 'Kaifeng Xian', 'CN');
INSERT INTO `sys_region` VALUES (1905, '410225', '兰考县', 188, 3, 0, 'Lankao Xian', 'CN');
INSERT INTO `sys_region` VALUES (1906, '410301', '市辖区', 189, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (1907, '410302', '老城区', 189, 3, 0, 'Laocheng Qu', 'CN');
INSERT INTO `sys_region` VALUES (1908, '410303', '西工区', 189, 3, 0, 'Xigong Qu', 'CN');
INSERT INTO `sys_region` VALUES (1909, '410304', '瀍河回族区', 189, 3, 0, 'Chanhehuizu Qu', 'CN');
INSERT INTO `sys_region` VALUES (1910, '410305', '涧西区', 189, 3, 0, 'Jianxi Qu', 'CN');
INSERT INTO `sys_region` VALUES (1911, '410306', '吉利区', 189, 3, 0, 'Jili Qu', 'CN');
INSERT INTO `sys_region` VALUES (1912, '410311', '洛龙区', 189, 3, 0, 'Luolong Qu', 'CN');
INSERT INTO `sys_region` VALUES (1913, '410322', '孟津县', 189, 3, 0, 'Mengjin Xian', 'CN');
INSERT INTO `sys_region` VALUES (1914, '410323', '新安县', 189, 3, 0, 'Xin,an Xian', 'CN');
INSERT INTO `sys_region` VALUES (1915, '410324', '栾川县', 189, 3, 0, 'Luanchuan Xian', 'CN');
INSERT INTO `sys_region` VALUES (1916, '410325', '嵩县', 189, 3, 0, 'Song Xian', 'CN');
INSERT INTO `sys_region` VALUES (1917, '410326', '汝阳县', 189, 3, 0, 'Ruyang Xian', 'CN');
INSERT INTO `sys_region` VALUES (1918, '410327', '宜阳县', 189, 3, 0, 'Yiyang Xian', 'CN');
INSERT INTO `sys_region` VALUES (1919, '410328', '洛宁县', 189, 3, 0, 'Luoning Xian', 'CN');
INSERT INTO `sys_region` VALUES (1920, '410329', '伊川县', 189, 3, 0, 'Yichuan Xian', 'CN');
INSERT INTO `sys_region` VALUES (1921, '410381', '偃师市', 189, 3, 0, 'Yanshi Shi', 'CN');
INSERT INTO `sys_region` VALUES (1922, '410401', '市辖区', 190, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (1923, '410402', '新华区', 190, 3, 0, 'Xinhua Qu', 'CN');
INSERT INTO `sys_region` VALUES (1924, '410403', '卫东区', 190, 3, 0, 'Weidong Qu', 'CN');
INSERT INTO `sys_region` VALUES (1925, '410404', '石龙区', 190, 3, 0, 'Shilong Qu', 'CN');
INSERT INTO `sys_region` VALUES (1926, '410411', '湛河区', 190, 3, 0, 'Zhanhe Qu', 'CN');
INSERT INTO `sys_region` VALUES (1927, '410421', '宝丰县', 190, 3, 0, 'Baofeng Xian', 'CN');
INSERT INTO `sys_region` VALUES (1928, '410422', '叶县', 190, 3, 0, 'Ye Xian', 'CN');
INSERT INTO `sys_region` VALUES (1929, '410423', '鲁山县', 190, 3, 0, 'Lushan Xian', 'CN');
INSERT INTO `sys_region` VALUES (1930, '410425', '郏县', 190, 3, 0, 'Jia Xian', 'CN');
INSERT INTO `sys_region` VALUES (1931, '410481', '舞钢市', 190, 3, 0, 'Wugang Shi', 'CN');
INSERT INTO `sys_region` VALUES (1932, '410482', '汝州市', 190, 3, 0, 'Ruzhou Shi', 'CN');
INSERT INTO `sys_region` VALUES (1933, '410501', '市辖区', 191, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (1934, '410502', '文峰区', 191, 3, 0, 'Wenfeng Qu', 'CN');
INSERT INTO `sys_region` VALUES (1935, '410503', '北关区', 191, 3, 0, 'Beiguan Qu', 'CN');
INSERT INTO `sys_region` VALUES (1936, '410505', '殷都区', 191, 3, 0, 'Yindu Qu', 'CN');
INSERT INTO `sys_region` VALUES (1937, '410506', '龙安区', 191, 3, 0, 'Longan Qu', 'CN');
INSERT INTO `sys_region` VALUES (1938, '410522', '安阳县', 191, 3, 0, 'Anyang Xian', 'CN');
INSERT INTO `sys_region` VALUES (1939, '410523', '汤阴县', 191, 3, 0, 'Tangyin Xian', 'CN');
INSERT INTO `sys_region` VALUES (1940, '410526', '滑县', 191, 3, 0, 'Hua Xian', 'CN');
INSERT INTO `sys_region` VALUES (1941, '410527', '内黄县', 191, 3, 0, 'Neihuang Xian', 'CN');
INSERT INTO `sys_region` VALUES (1942, '410581', '林州市', 191, 3, 0, 'Linzhou Shi', 'CN');
INSERT INTO `sys_region` VALUES (1943, '410601', '市辖区', 192, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (1944, '410602', '鹤山区', 192, 3, 0, 'Heshan Qu', 'CN');
INSERT INTO `sys_region` VALUES (1945, '410603', '山城区', 192, 3, 0, 'Shancheng Qu', 'CN');
INSERT INTO `sys_region` VALUES (1946, '410611', '淇滨区', 192, 3, 0, 'Qibin Qu', 'CN');
INSERT INTO `sys_region` VALUES (1947, '410621', '浚县', 192, 3, 0, 'Xun Xian', 'CN');
INSERT INTO `sys_region` VALUES (1948, '410622', '淇县', 192, 3, 0, 'Qi Xian', 'CN');
INSERT INTO `sys_region` VALUES (1949, '410701', '市辖区', 193, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (1950, '410702', '红旗区', 193, 3, 0, 'Hongqi Qu', 'CN');
INSERT INTO `sys_region` VALUES (1951, '410703', '卫滨区', 193, 3, 0, 'Weibin Qu', 'CN');
INSERT INTO `sys_region` VALUES (1952, '410704', '凤泉区', 193, 3, 0, 'Fengquan Qu', 'CN');
INSERT INTO `sys_region` VALUES (1953, '410711', '牧野区', 193, 3, 0, 'Muye Qu', 'CN');
INSERT INTO `sys_region` VALUES (1954, '410721', '新乡县', 193, 3, 0, 'Xinxiang Xian', 'CN');
INSERT INTO `sys_region` VALUES (1955, '410724', '获嘉县', 193, 3, 0, 'Huojia Xian', 'CN');
INSERT INTO `sys_region` VALUES (1956, '410725', '原阳县', 193, 3, 0, 'Yuanyang Xian', 'CN');
INSERT INTO `sys_region` VALUES (1957, '410726', '延津县', 193, 3, 0, 'Yanjin Xian', 'CN');
INSERT INTO `sys_region` VALUES (1958, '410727', '封丘县', 193, 3, 0, 'Fengqiu Xian', 'CN');
INSERT INTO `sys_region` VALUES (1959, '410728', '长垣县', 193, 3, 0, 'Changyuan Xian', 'CN');
INSERT INTO `sys_region` VALUES (1960, '410781', '卫辉市', 193, 3, 0, 'Weihui Shi', 'CN');
INSERT INTO `sys_region` VALUES (1961, '410782', '辉县市', 193, 3, 0, 'Huixian Shi', 'CN');
INSERT INTO `sys_region` VALUES (1962, '410801', '市辖区', 194, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (1963, '410802', '解放区', 194, 3, 0, 'Jiefang Qu', 'CN');
INSERT INTO `sys_region` VALUES (1964, '410803', '中站区', 194, 3, 0, 'Zhongzhan Qu', 'CN');
INSERT INTO `sys_region` VALUES (1965, '410804', '马村区', 194, 3, 0, 'Macun Qu', 'CN');
INSERT INTO `sys_region` VALUES (1966, '410811', '山阳区', 194, 3, 0, 'Shanyang Qu', 'CN');
INSERT INTO `sys_region` VALUES (1967, '410821', '修武县', 194, 3, 0, 'Xiuwu Xian', 'CN');
INSERT INTO `sys_region` VALUES (1968, '410822', '博爱县', 194, 3, 0, 'Bo,ai Xian', 'CN');
INSERT INTO `sys_region` VALUES (1969, '410823', '武陟县', 194, 3, 0, 'Wuzhi Xian', 'CN');
INSERT INTO `sys_region` VALUES (1970, '410825', '温县', 194, 3, 0, 'Wen Xian', 'CN');
INSERT INTO `sys_region` VALUES (1971, '419001', '济源市', 194, 3, 0, 'Jiyuan Shi', 'CN');
INSERT INTO `sys_region` VALUES (1972, '410882', '沁阳市', 194, 3, 0, 'Qinyang Shi', 'CN');
INSERT INTO `sys_region` VALUES (1973, '410883', '孟州市', 194, 3, 0, 'Mengzhou Shi', 'CN');
INSERT INTO `sys_region` VALUES (1974, '410901', '市辖区', 195, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (1975, '410902', '华龙区', 195, 3, 0, 'Hualong Qu', 'CN');
INSERT INTO `sys_region` VALUES (1976, '410922', '清丰县', 195, 3, 0, 'Qingfeng Xian', 'CN');
INSERT INTO `sys_region` VALUES (1977, '410923', '南乐县', 195, 3, 0, 'Nanle Xian', 'CN');
INSERT INTO `sys_region` VALUES (1978, '410926', '范县', 195, 3, 0, 'Fan Xian', 'CN');
INSERT INTO `sys_region` VALUES (1979, '410927', '台前县', 195, 3, 0, 'Taiqian Xian', 'CN');
INSERT INTO `sys_region` VALUES (1980, '410928', '濮阳县', 195, 3, 0, 'Puyang Xian', 'CN');
INSERT INTO `sys_region` VALUES (1981, '411001', '市辖区', 196, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (1982, '411002', '魏都区', 196, 3, 0, 'Weidu Qu', 'CN');
INSERT INTO `sys_region` VALUES (1983, '411023', '许昌县', 196, 3, 0, 'Xuchang Xian', 'CN');
INSERT INTO `sys_region` VALUES (1984, '411024', '鄢陵县', 196, 3, 0, 'Yanling Xian', 'CN');
INSERT INTO `sys_region` VALUES (1985, '411025', '襄城县', 196, 3, 0, 'Xiangcheng Xian', 'CN');
INSERT INTO `sys_region` VALUES (1986, '411081', '禹州市', 196, 3, 0, 'Yuzhou Shi', 'CN');
INSERT INTO `sys_region` VALUES (1987, '411082', '长葛市', 196, 3, 0, 'Changge Shi', 'CN');
INSERT INTO `sys_region` VALUES (1988, '411101', '市辖区', 197, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (1989, '411102', '源汇区', 197, 3, 0, 'Yuanhui Qu', 'CN');
INSERT INTO `sys_region` VALUES (1990, '411103', '郾城区', 197, 3, 0, 'Yancheng Qu', 'CN');
INSERT INTO `sys_region` VALUES (1991, '411104', '召陵区', 197, 3, 0, 'Zhaoling Qu', 'CN');
INSERT INTO `sys_region` VALUES (1992, '411121', '舞阳县', 197, 3, 0, 'Wuyang Xian', 'CN');
INSERT INTO `sys_region` VALUES (1993, '411122', '临颍县', 197, 3, 0, 'Linying Xian', 'CN');
INSERT INTO `sys_region` VALUES (1994, '411201', '市辖区', 198, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (1995, '411202', '湖滨区', 198, 3, 0, 'Hubin Qu', 'CN');
INSERT INTO `sys_region` VALUES (1996, '411221', '渑池县', 198, 3, 0, 'Mianchi Xian', 'CN');
INSERT INTO `sys_region` VALUES (1997, '411222', '陕县', 198, 3, 0, 'Shan Xian', 'CN');
INSERT INTO `sys_region` VALUES (1998, '411224', '卢氏县', 198, 3, 0, 'Lushi Xian', 'CN');
INSERT INTO `sys_region` VALUES (1999, '411281', '义马市', 198, 3, 0, 'Yima Shi', 'CN');
INSERT INTO `sys_region` VALUES (2000, '411282', '灵宝市', 198, 3, 0, 'Lingbao Shi', 'CN');
INSERT INTO `sys_region` VALUES (2001, '411301', '市辖区', 199, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (2002, '411302', '宛城区', 199, 3, 0, 'Wancheng Qu', 'CN');
INSERT INTO `sys_region` VALUES (2003, '411303', '卧龙区', 199, 3, 0, 'Wolong Qu', 'CN');
INSERT INTO `sys_region` VALUES (2004, '411321', '南召县', 199, 3, 0, 'Nanzhao Xian', 'CN');
INSERT INTO `sys_region` VALUES (2005, '411322', '方城县', 199, 3, 0, 'Fangcheng Xian', 'CN');
INSERT INTO `sys_region` VALUES (2006, '411323', '西峡县', 199, 3, 0, 'Xixia Xian', 'CN');
INSERT INTO `sys_region` VALUES (2007, '411324', '镇平县', 199, 3, 0, 'Zhenping Xian', 'CN');
INSERT INTO `sys_region` VALUES (2008, '411325', '内乡县', 199, 3, 0, 'Neixiang Xian', 'CN');
INSERT INTO `sys_region` VALUES (2009, '411326', '淅川县', 199, 3, 0, 'Xichuan Xian', 'CN');
INSERT INTO `sys_region` VALUES (2010, '411327', '社旗县', 199, 3, 0, 'Sheqi Xian', 'CN');
INSERT INTO `sys_region` VALUES (2011, '411328', '唐河县', 199, 3, 0, 'Tanghe Xian', 'CN');
INSERT INTO `sys_region` VALUES (2012, '411329', '新野县', 199, 3, 0, 'Xinye Xian', 'CN');
INSERT INTO `sys_region` VALUES (2013, '411330', '桐柏县', 199, 3, 0, 'Tongbai Xian', 'CN');
INSERT INTO `sys_region` VALUES (2014, '411381', '邓州市', 199, 3, 0, 'Dengzhou Shi', 'CN');
INSERT INTO `sys_region` VALUES (2015, '411401', '市辖区', 200, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (2016, '411402', '梁园区', 200, 3, 0, 'Liangyuan Qu', 'CN');
INSERT INTO `sys_region` VALUES (2017, '411403', '睢阳区', 200, 3, 0, 'Suiyang Qu', 'CN');
INSERT INTO `sys_region` VALUES (2018, '411421', '民权县', 200, 3, 0, 'Minquan Xian', 'CN');
INSERT INTO `sys_region` VALUES (2019, '411422', '睢县', 200, 3, 0, 'Sui Xian', 'CN');
INSERT INTO `sys_region` VALUES (2020, '411423', '宁陵县', 200, 3, 0, 'Ningling Xian', 'CN');
INSERT INTO `sys_region` VALUES (2021, '411424', '柘城县', 200, 3, 0, 'Zhecheng Xian', 'CN');
INSERT INTO `sys_region` VALUES (2022, '411425', '虞城县', 200, 3, 0, 'Yucheng Xian', 'CN');
INSERT INTO `sys_region` VALUES (2023, '411426', '夏邑县', 200, 3, 0, 'Xiayi Xian', 'CN');
INSERT INTO `sys_region` VALUES (2024, '411481', '永城市', 200, 3, 0, 'Yongcheng Shi', 'CN');
INSERT INTO `sys_region` VALUES (2025, '411501', '市辖区', 201, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (2026, '411502', '浉河区', 201, 3, 0, 'Shihe Qu', 'CN');
INSERT INTO `sys_region` VALUES (2027, '411503', '平桥区', 201, 3, 0, 'Pingqiao Qu', 'CN');
INSERT INTO `sys_region` VALUES (2028, '411521', '罗山县', 201, 3, 0, 'Luoshan Xian', 'CN');
INSERT INTO `sys_region` VALUES (2029, '411522', '光山县', 201, 3, 0, 'Guangshan Xian', 'CN');
INSERT INTO `sys_region` VALUES (2030, '411523', '新县', 201, 3, 0, 'Xin Xian', 'CN');
INSERT INTO `sys_region` VALUES (2031, '411524', '商城县', 201, 3, 0, 'Shangcheng Xian', 'CN');
INSERT INTO `sys_region` VALUES (2032, '411525', '固始县', 201, 3, 0, 'Gushi Xian', 'CN');
INSERT INTO `sys_region` VALUES (2033, '411526', '潢川县', 201, 3, 0, 'Huangchuan Xian', 'CN');
INSERT INTO `sys_region` VALUES (2034, '411527', '淮滨县', 201, 3, 0, 'Huaibin Xian', 'CN');
INSERT INTO `sys_region` VALUES (2035, '411528', '息县', 201, 3, 0, 'Xi Xian', 'CN');
INSERT INTO `sys_region` VALUES (2036, '411601', '市辖区', 202, 3, 0, '1', 'CN');
INSERT INTO `sys_region` VALUES (2037, '411602', '川汇区', 202, 3, 0, 'Chuanhui Qu', 'CN');
INSERT INTO `sys_region` VALUES (2038, '411621', '扶沟县', 202, 3, 0, 'Fugou Xian', 'CN');
INSERT INTO `sys_region` VALUES (2039, '411622', '西华县', 202, 3, 0, 'Xihua Xian', 'CN');
INSERT INTO `sys_region` VALUES (2040, '411623', '商水县', 202, 3, 0, 'Shangshui Xian', 'CN');
INSERT INTO `sys_region` VALUES (2041, '411624', '沈丘县', 202, 3, 0, 'Shenqiu Xian', 'CN');
INSERT INTO `sys_region` VALUES (2042, '411625', '郸城县', 202, 3, 0, 'Dancheng Xian', 'CN');
INSERT INTO `sys_region` VALUES (2043, '411626', '淮阳县', 202, 3, 0, 'Huaiyang Xian', 'CN');
INSERT INTO `sys_region` VALUES (2044, '411627', '太康县', 202, 3, 0, 'Taikang Xian', 'CN');
INSERT INTO `sys_region` VALUES (2045, '411628', '鹿邑县', 202, 3, 0, 'Luyi Xian', 'CN');
INSERT INTO `sys_region` VALUES (2046, '411681', '项城市', 202, 3, 0, 'Xiangcheng Shi', 'CN');
INSERT INTO `sys_region` VALUES (2047, '411701', '市辖区', 203, 3, 0, '1', 'CN');
INSERT INTO `sys_region` VALUES (2048, '411702', '驿城区', 203, 3, 0, 'Yicheng Qu', 'CN');
INSERT INTO `sys_region` VALUES (2049, '411721', '西平县', 203, 3, 0, 'Xiping Xian', 'CN');
INSERT INTO `sys_region` VALUES (2050, '411722', '上蔡县', 203, 3, 0, 'Shangcai Xian', 'CN');
INSERT INTO `sys_region` VALUES (2051, '411723', '平舆县', 203, 3, 0, 'Pingyu Xian', 'CN');
INSERT INTO `sys_region` VALUES (2052, '411724', '正阳县', 203, 3, 0, 'Zhengyang Xian', 'CN');
INSERT INTO `sys_region` VALUES (2053, '411725', '确山县', 203, 3, 0, 'Queshan Xian', 'CN');
INSERT INTO `sys_region` VALUES (2054, '411726', '泌阳县', 203, 3, 0, 'Biyang Xian', 'CN');
INSERT INTO `sys_region` VALUES (2055, '411727', '汝南县', 203, 3, 0, 'Runan Xian', 'CN');
INSERT INTO `sys_region` VALUES (2056, '411728', '遂平县', 203, 3, 0, 'Suiping Xian', 'CN');
INSERT INTO `sys_region` VALUES (2057, '411729', '新蔡县', 203, 3, 0, 'Xincai Xian', 'CN');
INSERT INTO `sys_region` VALUES (2058, '420101', '市辖区', 204, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (2059, '420102', '江岸区', 204, 3, 0, 'Jiang,an Qu', 'CN');
INSERT INTO `sys_region` VALUES (2060, '420103', '江汉区', 204, 3, 0, 'Jianghan Qu', 'CN');
INSERT INTO `sys_region` VALUES (2061, '420104', '硚口区', 204, 3, 0, 'Qiaokou Qu', 'CN');
INSERT INTO `sys_region` VALUES (2062, '420105', '汉阳区', 204, 3, 0, 'Hanyang Qu', 'CN');
INSERT INTO `sys_region` VALUES (2063, '420106', '武昌区', 204, 3, 0, 'Wuchang Qu', 'CN');
INSERT INTO `sys_region` VALUES (2064, '420107', '青山区', 204, 3, 0, 'Qingshan Qu', 'CN');
INSERT INTO `sys_region` VALUES (2065, '420111', '洪山区', 204, 3, 0, 'Hongshan Qu', 'CN');
INSERT INTO `sys_region` VALUES (2066, '420112', '东西湖区', 204, 3, 0, 'Dongxihu Qu', 'CN');
INSERT INTO `sys_region` VALUES (2067, '420113', '汉南区', 204, 3, 0, 'Hannan Qu', 'CN');
INSERT INTO `sys_region` VALUES (2068, '420114', '蔡甸区', 204, 3, 0, 'Caidian Qu', 'CN');
INSERT INTO `sys_region` VALUES (2069, '420115', '江夏区', 204, 3, 0, 'Jiangxia Qu', 'CN');
INSERT INTO `sys_region` VALUES (2070, '420116', '黄陂区', 204, 3, 0, 'Huangpi Qu', 'CN');
INSERT INTO `sys_region` VALUES (2071, '420117', '新洲区', 204, 3, 0, 'Xinzhou Qu', 'CN');
INSERT INTO `sys_region` VALUES (2072, '420201', '市辖区', 205, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (2073, '420202', '黄石港区', 205, 3, 0, 'Huangshigang Qu', 'CN');
INSERT INTO `sys_region` VALUES (2074, '420203', '西塞山区', 205, 3, 0, 'Xisaishan Qu', 'CN');
INSERT INTO `sys_region` VALUES (2075, '420204', '下陆区', 205, 3, 0, 'Xialu Qu', 'CN');
INSERT INTO `sys_region` VALUES (2076, '420205', '铁山区', 205, 3, 0, 'Tieshan Qu', 'CN');
INSERT INTO `sys_region` VALUES (2077, '420222', '阳新县', 205, 3, 0, 'Yangxin Xian', 'CN');
INSERT INTO `sys_region` VALUES (2078, '420281', '大冶市', 205, 3, 0, 'Daye Shi', 'CN');
INSERT INTO `sys_region` VALUES (2079, '420301', '市辖区', 206, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (2080, '420302', '茅箭区', 206, 3, 0, 'Maojian Qu', 'CN');
INSERT INTO `sys_region` VALUES (2081, '420303', '张湾区', 206, 3, 0, 'Zhangwan Qu', 'CN');
INSERT INTO `sys_region` VALUES (2082, '420321', '郧县', 206, 3, 0, 'Yun Xian', 'CN');
INSERT INTO `sys_region` VALUES (2083, '420322', '郧西县', 206, 3, 0, 'Yunxi Xian', 'CN');
INSERT INTO `sys_region` VALUES (2084, '420323', '竹山县', 206, 3, 0, 'Zhushan Xian', 'CN');
INSERT INTO `sys_region` VALUES (2085, '420324', '竹溪县', 206, 3, 0, 'Zhuxi Xian', 'CN');
INSERT INTO `sys_region` VALUES (2086, '420325', '房县', 206, 3, 0, 'Fang Xian', 'CN');
INSERT INTO `sys_region` VALUES (2087, '420381', '丹江口市', 206, 3, 0, 'Danjiangkou Shi', 'CN');
INSERT INTO `sys_region` VALUES (2088, '420501', '市辖区', 207, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (2089, '420502', '西陵区', 207, 3, 0, 'Xiling Qu', 'CN');
INSERT INTO `sys_region` VALUES (2090, '420503', '伍家岗区', 207, 3, 0, 'Wujiagang Qu', 'CN');
INSERT INTO `sys_region` VALUES (2091, '420504', '点军区', 207, 3, 0, 'Dianjun Qu', 'CN');
INSERT INTO `sys_region` VALUES (2092, '420505', '猇亭区', 207, 3, 0, 'Xiaoting Qu', 'CN');
INSERT INTO `sys_region` VALUES (2093, '420506', '夷陵区', 207, 3, 0, 'Yiling Qu', 'CN');
INSERT INTO `sys_region` VALUES (2094, '420525', '远安县', 207, 3, 0, 'Yuan,an Xian', 'CN');
INSERT INTO `sys_region` VALUES (2095, '420526', '兴山县', 207, 3, 0, 'Xingshan Xian', 'CN');
INSERT INTO `sys_region` VALUES (2096, '420527', '秭归县', 207, 3, 0, 'Zigui Xian', 'CN');
INSERT INTO `sys_region` VALUES (2097, '420528', '长阳土家族自治县', 207, 3, 0, 'Changyang Tujiazu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (2098, '420529', '五峰土家族自治县', 207, 3, 0, 'Wufeng Tujiazu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (2099, '420581', '宜都市', 207, 3, 0, 'Yidu Shi', 'CN');
INSERT INTO `sys_region` VALUES (2100, '420582', '当阳市', 207, 3, 0, 'Dangyang Shi', 'CN');
INSERT INTO `sys_region` VALUES (2101, '420583', '枝江市', 207, 3, 0, 'Zhijiang Shi', 'CN');
INSERT INTO `sys_region` VALUES (2102, '420601', '市辖区', 208, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (2103, '420602', '襄城区', 208, 3, 0, 'Xiangcheng Qu', 'CN');
INSERT INTO `sys_region` VALUES (2104, '420606', '樊城区', 208, 3, 0, 'Fancheng Qu', 'CN');
INSERT INTO `sys_region` VALUES (2105, '420607', '襄阳区', 208, 3, 0, 'Xiangyang Qu', 'CN');
INSERT INTO `sys_region` VALUES (2106, '420624', '南漳县', 208, 3, 0, 'Nanzhang Xian', 'CN');
INSERT INTO `sys_region` VALUES (2107, '420625', '谷城县', 208, 3, 0, 'Gucheng Xian', 'CN');
INSERT INTO `sys_region` VALUES (2108, '420626', '保康县', 208, 3, 0, 'Baokang Xian', 'CN');
INSERT INTO `sys_region` VALUES (2109, '420682', '老河口市', 208, 3, 0, 'Laohekou Shi', 'CN');
INSERT INTO `sys_region` VALUES (2110, '420683', '枣阳市', 208, 3, 0, 'Zaoyang Shi', 'CN');
INSERT INTO `sys_region` VALUES (2111, '420684', '宜城市', 208, 3, 0, 'Yicheng Shi', 'CN');
INSERT INTO `sys_region` VALUES (2112, '420701', '市辖区', 209, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (2113, '420702', '梁子湖区', 209, 3, 0, 'Liangzihu Qu', 'CN');
INSERT INTO `sys_region` VALUES (2114, '420703', '华容区', 209, 3, 0, 'Huarong Qu', 'CN');
INSERT INTO `sys_region` VALUES (2115, '420704', '鄂城区', 209, 3, 0, 'Echeng Qu', 'CN');
INSERT INTO `sys_region` VALUES (2116, '420801', '市辖区', 210, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (2117, '420802', '东宝区', 210, 3, 0, 'Dongbao Qu', 'CN');
INSERT INTO `sys_region` VALUES (2118, '420804', '掇刀区', 210, 3, 0, 'Duodao Qu', 'CN');
INSERT INTO `sys_region` VALUES (2119, '420821', '京山县', 210, 3, 0, 'Jingshan Xian', 'CN');
INSERT INTO `sys_region` VALUES (2120, '420822', '沙洋县', 210, 3, 0, 'Shayang Xian', 'CN');
INSERT INTO `sys_region` VALUES (2121, '420881', '钟祥市', 210, 3, 0, 'Zhongxiang Shi', 'CN');
INSERT INTO `sys_region` VALUES (2122, '420901', '市辖区', 211, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (2123, '420902', '孝南区', 211, 3, 0, 'Xiaonan Qu', 'CN');
INSERT INTO `sys_region` VALUES (2124, '420921', '孝昌县', 211, 3, 0, 'Xiaochang Xian', 'CN');
INSERT INTO `sys_region` VALUES (2125, '420922', '大悟县', 211, 3, 0, 'Dawu Xian', 'CN');
INSERT INTO `sys_region` VALUES (2126, '420923', '云梦县', 211, 3, 0, 'Yunmeng Xian', 'CN');
INSERT INTO `sys_region` VALUES (2127, '420981', '应城市', 211, 3, 0, 'Yingcheng Shi', 'CN');
INSERT INTO `sys_region` VALUES (2128, '420982', '安陆市', 211, 3, 0, 'Anlu Shi', 'CN');
INSERT INTO `sys_region` VALUES (2129, '420984', '汉川市', 211, 3, 0, 'Hanchuan Shi', 'CN');
INSERT INTO `sys_region` VALUES (2130, '421001', '市辖区', 212, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (2131, '421002', '沙市区', 212, 3, 0, 'Shashi Qu', 'CN');
INSERT INTO `sys_region` VALUES (2132, '421003', '荆州区', 212, 3, 0, 'Jingzhou Qu', 'CN');
INSERT INTO `sys_region` VALUES (2133, '421022', '公安县', 212, 3, 0, 'Gong,an Xian', 'CN');
INSERT INTO `sys_region` VALUES (2134, '421023', '监利县', 212, 3, 0, 'Jianli Xian', 'CN');
INSERT INTO `sys_region` VALUES (2135, '421024', '江陵县', 212, 3, 0, 'Jiangling Xian', 'CN');
INSERT INTO `sys_region` VALUES (2136, '421081', '石首市', 212, 3, 0, 'Shishou Shi', 'CN');
INSERT INTO `sys_region` VALUES (2137, '421083', '洪湖市', 212, 3, 0, 'Honghu Shi', 'CN');
INSERT INTO `sys_region` VALUES (2138, '421087', '松滋市', 212, 3, 0, 'Songzi Shi', 'CN');
INSERT INTO `sys_region` VALUES (2139, '421101', '市辖区', 213, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (2140, '421102', '黄州区', 213, 3, 0, 'Huangzhou Qu', 'CN');
INSERT INTO `sys_region` VALUES (2141, '421121', '团风县', 213, 3, 0, 'Tuanfeng Xian', 'CN');
INSERT INTO `sys_region` VALUES (2142, '421122', '红安县', 213, 3, 0, 'Hong,an Xian', 'CN');
INSERT INTO `sys_region` VALUES (2143, '421123', '罗田县', 213, 3, 0, 'Luotian Xian', 'CN');
INSERT INTO `sys_region` VALUES (2144, '421124', '英山县', 213, 3, 0, 'Yingshan Xian', 'CN');
INSERT INTO `sys_region` VALUES (2145, '421125', '浠水县', 213, 3, 0, 'Xishui Xian', 'CN');
INSERT INTO `sys_region` VALUES (2146, '421126', '蕲春县', 213, 3, 0, 'Qichun Xian', 'CN');
INSERT INTO `sys_region` VALUES (2147, '421127', '黄梅县', 213, 3, 0, 'Huangmei Xian', 'CN');
INSERT INTO `sys_region` VALUES (2148, '421181', '麻城市', 213, 3, 0, 'Macheng Shi', 'CN');
INSERT INTO `sys_region` VALUES (2149, '421182', '武穴市', 213, 3, 0, 'Wuxue Shi', 'CN');
INSERT INTO `sys_region` VALUES (2150, '421201', '市辖区', 214, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (2151, '421202', '咸安区', 214, 3, 0, 'Xian,an Qu', 'CN');
INSERT INTO `sys_region` VALUES (2152, '421221', '嘉鱼县', 214, 3, 0, 'Jiayu Xian', 'CN');
INSERT INTO `sys_region` VALUES (2153, '421222', '通城县', 214, 3, 0, 'Tongcheng Xian', 'CN');
INSERT INTO `sys_region` VALUES (2154, '421223', '崇阳县', 214, 3, 0, 'Chongyang Xian', 'CN');
INSERT INTO `sys_region` VALUES (2155, '421224', '通山县', 214, 3, 0, 'Tongshan Xian', 'CN');
INSERT INTO `sys_region` VALUES (2156, '421281', '赤壁市', 214, 3, 0, 'Chibi Shi', 'CN');
INSERT INTO `sys_region` VALUES (2157, '421301', '市辖区', 215, 3, 0, '1', 'CN');
INSERT INTO `sys_region` VALUES (2158, '421303', '曾都区', 215, 3, 0, 'Zengdu Qu', 'CN');
INSERT INTO `sys_region` VALUES (2159, '421381', '广水市', 215, 3, 0, 'Guangshui Shi', 'CN');
INSERT INTO `sys_region` VALUES (2160, '422801', '恩施市', 216, 3, 0, 'Enshi Shi', 'CN');
INSERT INTO `sys_region` VALUES (2161, '422802', '利川市', 216, 3, 0, 'Lichuan Shi', 'CN');
INSERT INTO `sys_region` VALUES (2162, '422822', '建始县', 216, 3, 0, 'Jianshi Xian', 'CN');
INSERT INTO `sys_region` VALUES (2163, '422823', '巴东县', 216, 3, 0, 'Badong Xian', 'CN');
INSERT INTO `sys_region` VALUES (2164, '422825', '宣恩县', 216, 3, 0, 'Xuan,en Xian', 'CN');
INSERT INTO `sys_region` VALUES (2165, '422826', '咸丰县', 216, 3, 0, 'Xianfeng Xian', 'CN');
INSERT INTO `sys_region` VALUES (2166, '422827', '来凤县', 216, 3, 0, 'Laifeng Xian', 'CN');
INSERT INTO `sys_region` VALUES (2167, '422828', '鹤峰县', 216, 3, 0, 'Hefeng Xian', 'CN');
INSERT INTO `sys_region` VALUES (2168, '429004', '仙桃市', 217, 3, 0, 'Xiantao Shi', 'CN');
INSERT INTO `sys_region` VALUES (2169, '429005', '潜江市', 217, 3, 0, 'Qianjiang Shi', 'CN');
INSERT INTO `sys_region` VALUES (2170, '429006', '天门市', 217, 3, 0, 'Tianmen Shi', 'CN');
INSERT INTO `sys_region` VALUES (2171, '429021', '神农架林区', 217, 3, 0, 'Shennongjia Linqu', 'CN');
INSERT INTO `sys_region` VALUES (2172, '430101', '市辖区', 218, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (2173, '430102', '芙蓉区', 218, 3, 0, 'Furong Qu', 'CN');
INSERT INTO `sys_region` VALUES (2174, '430103', '天心区', 218, 3, 0, 'Tianxin Qu', 'CN');
INSERT INTO `sys_region` VALUES (2175, '430104', '岳麓区', 218, 3, 0, 'Yuelu Qu', 'CN');
INSERT INTO `sys_region` VALUES (2176, '430105', '开福区', 218, 3, 0, 'Kaifu Qu', 'CN');
INSERT INTO `sys_region` VALUES (2177, '430111', '雨花区', 218, 3, 0, 'Yuhua Qu', 'CN');
INSERT INTO `sys_region` VALUES (2178, '430121', '长沙县', 218, 3, 0, 'Changsha Xian', 'CN');
INSERT INTO `sys_region` VALUES (2179, '430122', '望城县', 218, 3, 0, 'Wangcheng Xian', 'CN');
INSERT INTO `sys_region` VALUES (2180, '430124', '宁乡县', 218, 3, 0, 'Ningxiang Xian', 'CN');
INSERT INTO `sys_region` VALUES (2181, '430181', '浏阳市', 218, 3, 0, 'Liuyang Shi', 'CN');
INSERT INTO `sys_region` VALUES (2182, '430201', '市辖区', 219, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (2183, '430202', '荷塘区', 219, 3, 0, 'Hetang Qu', 'CN');
INSERT INTO `sys_region` VALUES (2184, '430203', '芦淞区', 219, 3, 0, 'Lusong Qu', 'CN');
INSERT INTO `sys_region` VALUES (2185, '430204', '石峰区', 219, 3, 0, 'Shifeng Qu', 'CN');
INSERT INTO `sys_region` VALUES (2186, '430211', '天元区', 219, 3, 0, 'Tianyuan Qu', 'CN');
INSERT INTO `sys_region` VALUES (2187, '430221', '株洲县', 219, 3, 0, 'Zhuzhou Xian', 'CN');
INSERT INTO `sys_region` VALUES (2188, '430223', '攸县', 219, 3, 0, 'You Xian', 'CN');
INSERT INTO `sys_region` VALUES (2189, '430224', '茶陵县', 219, 3, 0, 'Chaling Xian', 'CN');
INSERT INTO `sys_region` VALUES (2190, '430225', '炎陵县', 219, 3, 0, 'Yanling Xian', 'CN');
INSERT INTO `sys_region` VALUES (2191, '430281', '醴陵市', 219, 3, 0, 'Liling Shi', 'CN');
INSERT INTO `sys_region` VALUES (2192, '430301', '市辖区', 220, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (2193, '430302', '雨湖区', 220, 3, 0, 'Yuhu Qu', 'CN');
INSERT INTO `sys_region` VALUES (2194, '430304', '岳塘区', 220, 3, 0, 'Yuetang Qu', 'CN');
INSERT INTO `sys_region` VALUES (2195, '430321', '湘潭县', 220, 3, 0, 'Xiangtan Qu', 'CN');
INSERT INTO `sys_region` VALUES (2196, '430381', '湘乡市', 220, 3, 0, 'Xiangxiang Shi', 'CN');
INSERT INTO `sys_region` VALUES (2197, '430382', '韶山市', 220, 3, 0, 'Shaoshan Shi', 'CN');
INSERT INTO `sys_region` VALUES (2198, '430401', '市辖区', 221, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (2199, '430405', '珠晖区', 221, 3, 0, 'Zhuhui Qu', 'CN');
INSERT INTO `sys_region` VALUES (2200, '430406', '雁峰区', 221, 3, 0, 'Yanfeng Qu', 'CN');
INSERT INTO `sys_region` VALUES (2201, '430407', '石鼓区', 221, 3, 0, 'Shigu Qu', 'CN');
INSERT INTO `sys_region` VALUES (2202, '430408', '蒸湘区', 221, 3, 0, 'Zhengxiang Qu', 'CN');
INSERT INTO `sys_region` VALUES (2203, '430412', '南岳区', 221, 3, 0, 'Nanyue Qu', 'CN');
INSERT INTO `sys_region` VALUES (2204, '430421', '衡阳县', 221, 3, 0, 'Hengyang Xian', 'CN');
INSERT INTO `sys_region` VALUES (2205, '430422', '衡南县', 221, 3, 0, 'Hengnan Xian', 'CN');
INSERT INTO `sys_region` VALUES (2206, '430423', '衡山县', 221, 3, 0, 'Hengshan Xian', 'CN');
INSERT INTO `sys_region` VALUES (2207, '430424', '衡东县', 221, 3, 0, 'Hengdong Xian', 'CN');
INSERT INTO `sys_region` VALUES (2208, '430426', '祁东县', 221, 3, 0, 'Qidong Xian', 'CN');
INSERT INTO `sys_region` VALUES (2209, '430481', '耒阳市', 221, 3, 0, 'Leiyang Shi', 'CN');
INSERT INTO `sys_region` VALUES (2210, '430482', '常宁市', 221, 3, 0, 'Changning Shi', 'CN');
INSERT INTO `sys_region` VALUES (2211, '430501', '市辖区', 222, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (2212, '430502', '双清区', 222, 3, 0, 'Shuangqing Qu', 'CN');
INSERT INTO `sys_region` VALUES (2213, '430503', '大祥区', 222, 3, 0, 'Daxiang Qu', 'CN');
INSERT INTO `sys_region` VALUES (2214, '430511', '北塔区', 222, 3, 0, 'Beita Qu', 'CN');
INSERT INTO `sys_region` VALUES (2215, '430521', '邵东县', 222, 3, 0, 'Shaodong Xian', 'CN');
INSERT INTO `sys_region` VALUES (2216, '430522', '新邵县', 222, 3, 0, 'Xinshao Xian', 'CN');
INSERT INTO `sys_region` VALUES (2217, '430523', '邵阳县', 222, 3, 0, 'Shaoyang Xian', 'CN');
INSERT INTO `sys_region` VALUES (2218, '430524', '隆回县', 222, 3, 0, 'Longhui Xian', 'CN');
INSERT INTO `sys_region` VALUES (2219, '430525', '洞口县', 222, 3, 0, 'Dongkou Xian', 'CN');
INSERT INTO `sys_region` VALUES (2220, '430527', '绥宁县', 222, 3, 0, 'Suining Xian', 'CN');
INSERT INTO `sys_region` VALUES (2221, '430528', '新宁县', 222, 3, 0, 'Xinning Xian', 'CN');
INSERT INTO `sys_region` VALUES (2222, '430529', '城步苗族自治县', 222, 3, 0, 'Chengbu Miaozu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (2223, '430581', '武冈市', 222, 3, 0, 'Wugang Shi', 'CN');
INSERT INTO `sys_region` VALUES (2224, '430601', '市辖区', 223, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (2225, '430602', '岳阳楼区', 223, 3, 0, 'Yueyanglou Qu', 'CN');
INSERT INTO `sys_region` VALUES (2226, '430603', '云溪区', 223, 3, 0, 'Yunxi Qu', 'CN');
INSERT INTO `sys_region` VALUES (2227, '430611', '君山区', 223, 3, 0, 'Junshan Qu', 'CN');
INSERT INTO `sys_region` VALUES (2228, '430621', '岳阳县', 223, 3, 0, 'Yueyang Xian', 'CN');
INSERT INTO `sys_region` VALUES (2229, '430623', '华容县', 223, 3, 0, 'Huarong Xian', 'CN');
INSERT INTO `sys_region` VALUES (2230, '430624', '湘阴县', 223, 3, 0, 'Xiangyin Xian', 'CN');
INSERT INTO `sys_region` VALUES (2231, '430626', '平江县', 223, 3, 0, 'Pingjiang Xian', 'CN');
INSERT INTO `sys_region` VALUES (2232, '430681', '汨罗市', 223, 3, 0, 'Miluo Shi', 'CN');
INSERT INTO `sys_region` VALUES (2233, '430682', '临湘市', 223, 3, 0, 'Linxiang Shi', 'CN');
INSERT INTO `sys_region` VALUES (2234, '430701', '市辖区', 224, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (2235, '430702', '武陵区', 224, 3, 0, 'Wuling Qu', 'CN');
INSERT INTO `sys_region` VALUES (2236, '430703', '鼎城区', 224, 3, 0, 'Dingcheng Qu', 'CN');
INSERT INTO `sys_region` VALUES (2237, '430721', '安乡县', 224, 3, 0, 'Anxiang Xian', 'CN');
INSERT INTO `sys_region` VALUES (2238, '430722', '汉寿县', 224, 3, 0, 'Hanshou Xian', 'CN');
INSERT INTO `sys_region` VALUES (2239, '430723', '澧县', 224, 3, 0, 'Li Xian', 'CN');
INSERT INTO `sys_region` VALUES (2240, '430724', '临澧县', 224, 3, 0, 'Linli Xian', 'CN');
INSERT INTO `sys_region` VALUES (2241, '430725', '桃源县', 224, 3, 0, 'Taoyuan Xian', 'CN');
INSERT INTO `sys_region` VALUES (2242, '430726', '石门县', 224, 3, 0, 'Shimen Xian', 'CN');
INSERT INTO `sys_region` VALUES (2243, '430781', '津市市', 224, 3, 0, 'Jinshi Shi', 'CN');
INSERT INTO `sys_region` VALUES (2244, '430801', '市辖区', 225, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (2245, '430802', '永定区', 225, 3, 0, 'Yongding Qu', 'CN');
INSERT INTO `sys_region` VALUES (2246, '430811', '武陵源区', 225, 3, 0, 'Wulingyuan Qu', 'CN');
INSERT INTO `sys_region` VALUES (2247, '430821', '慈利县', 225, 3, 0, 'Cili Xian', 'CN');
INSERT INTO `sys_region` VALUES (2248, '430822', '桑植县', 225, 3, 0, 'Sangzhi Xian', 'CN');
INSERT INTO `sys_region` VALUES (2249, '430901', '市辖区', 226, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (2250, '430902', '资阳区', 226, 3, 0, 'Ziyang Qu', 'CN');
INSERT INTO `sys_region` VALUES (2251, '430903', '赫山区', 226, 3, 0, 'Heshan Qu', 'CN');
INSERT INTO `sys_region` VALUES (2252, '430921', '南县', 226, 3, 0, 'Nan Xian', 'CN');
INSERT INTO `sys_region` VALUES (2253, '430922', '桃江县', 226, 3, 0, 'Taojiang Xian', 'CN');
INSERT INTO `sys_region` VALUES (2254, '430923', '安化县', 226, 3, 0, 'Anhua Xian', 'CN');
INSERT INTO `sys_region` VALUES (2255, '430981', '沅江市', 226, 3, 0, 'Yuanjiang Shi', 'CN');
INSERT INTO `sys_region` VALUES (2256, '431001', '市辖区', 227, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (2257, '431002', '北湖区', 227, 3, 0, 'Beihu Qu', 'CN');
INSERT INTO `sys_region` VALUES (2258, '431003', '苏仙区', 227, 3, 0, 'Suxian Qu', 'CN');
INSERT INTO `sys_region` VALUES (2259, '431021', '桂阳县', 227, 3, 0, 'Guiyang Xian', 'CN');
INSERT INTO `sys_region` VALUES (2260, '431022', '宜章县', 227, 3, 0, 'yizhang Xian', 'CN');
INSERT INTO `sys_region` VALUES (2261, '431023', '永兴县', 227, 3, 0, 'Yongxing Xian', 'CN');
INSERT INTO `sys_region` VALUES (2262, '431024', '嘉禾县', 227, 3, 0, 'Jiahe Xian', 'CN');
INSERT INTO `sys_region` VALUES (2263, '431025', '临武县', 227, 3, 0, 'Linwu Xian', 'CN');
INSERT INTO `sys_region` VALUES (2264, '431026', '汝城县', 227, 3, 0, 'Rucheng Xian', 'CN');
INSERT INTO `sys_region` VALUES (2265, '431027', '桂东县', 227, 3, 0, 'Guidong Xian', 'CN');
INSERT INTO `sys_region` VALUES (2266, '431028', '安仁县', 227, 3, 0, 'Anren Xian', 'CN');
INSERT INTO `sys_region` VALUES (2267, '431081', '资兴市', 227, 3, 0, 'Zixing Shi', 'CN');
INSERT INTO `sys_region` VALUES (2268, '431101', '市辖区', 228, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (2270, '431103', '冷水滩区', 228, 3, 0, 'Lengshuitan Qu', 'CN');
INSERT INTO `sys_region` VALUES (2271, '431121', '祁阳县', 228, 3, 0, 'Qiyang Xian', 'CN');
INSERT INTO `sys_region` VALUES (2272, '431122', '东安县', 228, 3, 0, 'Dong,an Xian', 'CN');
INSERT INTO `sys_region` VALUES (2273, '431123', '双牌县', 228, 3, 0, 'Shuangpai Xian', 'CN');
INSERT INTO `sys_region` VALUES (2274, '431124', '道县', 228, 3, 0, 'Dao Xian', 'CN');
INSERT INTO `sys_region` VALUES (2275, '431125', '江永县', 228, 3, 0, 'Jiangyong Xian', 'CN');
INSERT INTO `sys_region` VALUES (2276, '431126', '宁远县', 228, 3, 0, 'Ningyuan Xian', 'CN');
INSERT INTO `sys_region` VALUES (2277, '431127', '蓝山县', 228, 3, 0, 'Lanshan Xian', 'CN');
INSERT INTO `sys_region` VALUES (2278, '431128', '新田县', 228, 3, 0, 'Xintian Xian', 'CN');
INSERT INTO `sys_region` VALUES (2279, '431129', '江华瑶族自治县', 228, 3, 0, 'Jianghua Yaozu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (2280, '431201', '市辖区', 229, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (2281, '431202', '鹤城区', 229, 3, 0, 'Hecheng Qu', 'CN');
INSERT INTO `sys_region` VALUES (2282, '431221', '中方县', 229, 3, 0, 'Zhongfang Xian', 'CN');
INSERT INTO `sys_region` VALUES (2283, '431222', '沅陵县', 229, 3, 0, 'Yuanling Xian', 'CN');
INSERT INTO `sys_region` VALUES (2284, '431223', '辰溪县', 229, 3, 0, 'Chenxi Xian', 'CN');
INSERT INTO `sys_region` VALUES (2285, '431224', '溆浦县', 229, 3, 0, 'Xupu Xian', 'CN');
INSERT INTO `sys_region` VALUES (2286, '431225', '会同县', 229, 3, 0, 'Huitong Xian', 'CN');
INSERT INTO `sys_region` VALUES (2287, '431226', '麻阳苗族自治县', 229, 3, 0, 'Mayang Miaozu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (2288, '431227', '新晃侗族自治县', 229, 3, 0, 'Xinhuang Dongzu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (2289, '431228', '芷江侗族自治县', 229, 3, 0, 'Zhijiang Dongzu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (2290, '431229', '靖州苗族侗族自治县', 229, 3, 0, 'Jingzhou Miaozu Dongzu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (2291, '431230', '通道侗族自治县', 229, 3, 0, 'Tongdao Dongzu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (2292, '431281', '洪江市', 229, 3, 0, 'Hongjiang Shi', 'CN');
INSERT INTO `sys_region` VALUES (2293, '431301', '市辖区', 230, 3, 0, '1', 'CN');
INSERT INTO `sys_region` VALUES (2294, '431302', '娄星区', 230, 3, 0, 'Louxing Qu', 'CN');
INSERT INTO `sys_region` VALUES (2295, '431321', '双峰县', 230, 3, 0, 'Shuangfeng Xian', 'CN');
INSERT INTO `sys_region` VALUES (2296, '431322', '新化县', 230, 3, 0, 'Xinhua Xian', 'CN');
INSERT INTO `sys_region` VALUES (2297, '431381', '冷水江市', 230, 3, 0, 'Lengshuijiang Shi', 'CN');
INSERT INTO `sys_region` VALUES (2298, '431382', '涟源市', 230, 3, 0, 'Lianyuan Shi', 'CN');
INSERT INTO `sys_region` VALUES (2299, '433101', '吉首市', 231, 3, 0, 'Jishou Shi', 'CN');
INSERT INTO `sys_region` VALUES (2300, '433122', '泸溪县', 231, 3, 0, 'Luxi Xian', 'CN');
INSERT INTO `sys_region` VALUES (2301, '433123', '凤凰县', 231, 3, 0, 'Fenghuang Xian', 'CN');
INSERT INTO `sys_region` VALUES (2302, '433124', '花垣县', 231, 3, 0, 'Huayuan Xian', 'CN');
INSERT INTO `sys_region` VALUES (2303, '433125', '保靖县', 231, 3, 0, 'Baojing Xian', 'CN');
INSERT INTO `sys_region` VALUES (2304, '433126', '古丈县', 231, 3, 0, 'Guzhang Xian', 'CN');
INSERT INTO `sys_region` VALUES (2305, '433127', '永顺县', 231, 3, 0, 'Yongshun Xian', 'CN');
INSERT INTO `sys_region` VALUES (2306, '433130', '龙山县', 231, 3, 0, 'Longshan Xian', 'CN');
INSERT INTO `sys_region` VALUES (2307, '440101', '市辖区', 232, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (2308, '440115', '南沙区', 232, 3, 0, 'Nansha Qu', 'CN');
INSERT INTO `sys_region` VALUES (2309, '440103', '荔湾区', 232, 3, 0, 'Liwan Qu', 'CN');
INSERT INTO `sys_region` VALUES (2310, '440104', '越秀区', 232, 3, 0, 'Yuexiu Qu', 'CN');
INSERT INTO `sys_region` VALUES (2311, '440105', '海珠区', 232, 3, 0, 'Haizhu Qu', 'CN');
INSERT INTO `sys_region` VALUES (2312, '440106', '天河区', 232, 3, 0, 'Tianhe Qu', 'CN');
INSERT INTO `sys_region` VALUES (2313, '440116', '萝岗区', 232, 3, 0, 'Luogang Qu', 'CN');
INSERT INTO `sys_region` VALUES (2314, '440111', '白云区', 232, 3, 0, 'Baiyun Qu', 'CN');
INSERT INTO `sys_region` VALUES (2315, '440112', '黄埔区', 232, 3, 0, 'Huangpu Qu', 'CN');
INSERT INTO `sys_region` VALUES (2316, '440113', '番禺区', 232, 3, 0, 'Panyu Qu', 'CN');
INSERT INTO `sys_region` VALUES (2317, '440114', '花都区', 232, 3, 0, 'Huadu Qu', 'CN');
INSERT INTO `sys_region` VALUES (2318, '440183', '增城市', 232, 3, 0, 'Zengcheng Shi', 'CN');
INSERT INTO `sys_region` VALUES (2319, '440184', '从化市', 232, 3, 0, 'Conghua Shi', 'CN');
INSERT INTO `sys_region` VALUES (2320, '440201', '市辖区', 233, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (2321, '440203', '武江区', 233, 3, 0, 'Wujiang Qu', 'CN');
INSERT INTO `sys_region` VALUES (2322, '440204', '浈江区', 233, 3, 0, 'Zhenjiang Qu', 'CN');
INSERT INTO `sys_region` VALUES (2323, '440205', '曲江区', 233, 3, 0, 'Qujiang Qu', 'CN');
INSERT INTO `sys_region` VALUES (2324, '440222', '始兴县', 233, 3, 0, 'Shixing Xian', 'CN');
INSERT INTO `sys_region` VALUES (2325, '440224', '仁化县', 233, 3, 0, 'Renhua Xian', 'CN');
INSERT INTO `sys_region` VALUES (2326, '440229', '翁源县', 233, 3, 0, 'Wengyuan Xian', 'CN');
INSERT INTO `sys_region` VALUES (2327, '440232', '乳源瑶族自治县', 233, 3, 0, 'Ruyuan Yaozu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (2328, '440233', '新丰县', 233, 3, 0, 'Xinfeng Xian', 'CN');
INSERT INTO `sys_region` VALUES (2329, '440281', '乐昌市', 233, 3, 0, 'Lechang Shi', 'CN');
INSERT INTO `sys_region` VALUES (2330, '440282', '南雄市', 233, 3, 0, 'Nanxiong Shi', 'CN');
INSERT INTO `sys_region` VALUES (2331, '440301', '市辖区', 234, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (2332, '440303', '罗湖区', 234, 3, 0, 'Luohu Qu', 'CN');
INSERT INTO `sys_region` VALUES (2333, '440304', '福田区', 234, 3, 0, 'Futian Qu', 'CN');
INSERT INTO `sys_region` VALUES (2334, '440305', '南山区', 234, 3, 0, 'Nanshan Qu', 'CN');
INSERT INTO `sys_region` VALUES (2335, '440306', '宝安区', 234, 3, 0, 'Bao,an Qu', 'CN');
INSERT INTO `sys_region` VALUES (2336, '440307', '龙岗区', 234, 3, 0, 'Longgang Qu', 'CN');
INSERT INTO `sys_region` VALUES (2337, '440308', '盐田区', 234, 3, 0, 'Yan Tian Qu', 'CN');
INSERT INTO `sys_region` VALUES (2338, '440401', '市辖区', 235, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (2339, '440402', '香洲区', 235, 3, 0, 'Xiangzhou Qu', 'CN');
INSERT INTO `sys_region` VALUES (2340, '440403', '斗门区', 235, 3, 0, 'Doumen Qu', 'CN');
INSERT INTO `sys_region` VALUES (2341, '440404', '金湾区', 235, 3, 0, 'Jinwan Qu', 'CN');
INSERT INTO `sys_region` VALUES (2342, '440501', '市辖区', 236, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (2343, '440507', '龙湖区', 236, 3, 0, 'Longhu Qu', 'CN');
INSERT INTO `sys_region` VALUES (2344, '440511', '金平区', 236, 3, 0, 'Jinping Qu', 'CN');
INSERT INTO `sys_region` VALUES (2345, '440512', '濠江区', 236, 3, 0, 'Haojiang Qu', 'CN');
INSERT INTO `sys_region` VALUES (2346, '440513', '潮阳区', 236, 3, 0, 'Chaoyang  Qu', 'CN');
INSERT INTO `sys_region` VALUES (2347, '440514', '潮南区', 236, 3, 0, 'Chaonan Qu', 'CN');
INSERT INTO `sys_region` VALUES (2348, '440515', '澄海区', 236, 3, 0, 'Chenghai QU', 'CN');
INSERT INTO `sys_region` VALUES (2349, '440523', '南澳县', 236, 3, 0, 'Nan,ao Xian', 'CN');
INSERT INTO `sys_region` VALUES (2350, '440601', '市辖区', 237, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (2351, '440604', '禅城区', 237, 3, 0, 'Chancheng Qu', 'CN');
INSERT INTO `sys_region` VALUES (2352, '440605', '南海区', 237, 3, 0, 'Nanhai Shi', 'CN');
INSERT INTO `sys_region` VALUES (2353, '440606', '顺德区', 237, 3, 0, 'Shunde Shi', 'CN');
INSERT INTO `sys_region` VALUES (2354, '440607', '三水区', 237, 3, 0, 'Sanshui Shi', 'CN');
INSERT INTO `sys_region` VALUES (2355, '440608', '高明区', 237, 3, 0, 'Gaoming Shi', 'CN');
INSERT INTO `sys_region` VALUES (2356, '440701', '市辖区', 238, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (2357, '440703', '蓬江区', 238, 3, 0, 'Pengjiang Qu', 'CN');
INSERT INTO `sys_region` VALUES (2358, '440704', '江海区', 238, 3, 0, 'Jianghai Qu', 'CN');
INSERT INTO `sys_region` VALUES (2359, '440705', '新会区', 238, 3, 0, 'Xinhui Shi', 'CN');
INSERT INTO `sys_region` VALUES (2360, '440781', '台山市', 238, 3, 0, 'Taishan Shi', 'CN');
INSERT INTO `sys_region` VALUES (2361, '440783', '开平市', 238, 3, 0, 'Kaiping Shi', 'CN');
INSERT INTO `sys_region` VALUES (2362, '440784', '鹤山市', 238, 3, 0, 'Heshan Shi', 'CN');
INSERT INTO `sys_region` VALUES (2363, '440785', '恩平市', 238, 3, 0, 'Enping Shi', 'CN');
INSERT INTO `sys_region` VALUES (2364, '440801', '市辖区', 239, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (2365, '440802', '赤坎区', 239, 3, 0, 'Chikan Qu', 'CN');
INSERT INTO `sys_region` VALUES (2366, '440803', '霞山区', 239, 3, 0, 'Xiashan Qu', 'CN');
INSERT INTO `sys_region` VALUES (2367, '440804', '坡头区', 239, 3, 0, 'Potou Qu', 'CN');
INSERT INTO `sys_region` VALUES (2368, '440811', '麻章区', 239, 3, 0, 'Mazhang Qu', 'CN');
INSERT INTO `sys_region` VALUES (2369, '440823', '遂溪县', 239, 3, 0, 'Suixi Xian', 'CN');
INSERT INTO `sys_region` VALUES (2370, '440825', '徐闻县', 239, 3, 0, 'Xuwen Xian', 'CN');
INSERT INTO `sys_region` VALUES (2371, '440881', '廉江市', 239, 3, 0, 'Lianjiang Shi', 'CN');
INSERT INTO `sys_region` VALUES (2372, '440882', '雷州市', 239, 3, 0, 'Leizhou Shi', 'CN');
INSERT INTO `sys_region` VALUES (2373, '440883', '吴川市', 239, 3, 0, 'Wuchuan Shi', 'CN');
INSERT INTO `sys_region` VALUES (2374, '440901', '市辖区', 240, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (2375, '440902', '茂南区', 240, 3, 0, 'Maonan Qu', 'CN');
INSERT INTO `sys_region` VALUES (2376, '440903', '茂港区', 240, 3, 0, 'Maogang Qu', 'CN');
INSERT INTO `sys_region` VALUES (2377, '440923', '电白县', 240, 3, 0, 'Dianbai Xian', 'CN');
INSERT INTO `sys_region` VALUES (2378, '440981', '高州市', 240, 3, 0, 'Gaozhou Shi', 'CN');
INSERT INTO `sys_region` VALUES (2379, '440982', '化州市', 240, 3, 0, 'Huazhou Shi', 'CN');
INSERT INTO `sys_region` VALUES (2380, '440983', '信宜市', 240, 3, 0, 'Xinyi Shi', 'CN');
INSERT INTO `sys_region` VALUES (2381, '441201', '市辖区', 241, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (2382, '441202', '端州区', 241, 3, 0, 'Duanzhou Qu', 'CN');
INSERT INTO `sys_region` VALUES (2383, '441203', '鼎湖区', 241, 3, 0, 'Dinghu Qu', 'CN');
INSERT INTO `sys_region` VALUES (2384, '441223', '广宁县', 241, 3, 0, 'Guangning Xian', 'CN');
INSERT INTO `sys_region` VALUES (2385, '441224', '怀集县', 241, 3, 0, 'Huaiji Xian', 'CN');
INSERT INTO `sys_region` VALUES (2386, '441225', '封开县', 241, 3, 0, 'Fengkai Xian', 'CN');
INSERT INTO `sys_region` VALUES (2387, '441226', '德庆县', 241, 3, 0, 'Deqing Xian', 'CN');
INSERT INTO `sys_region` VALUES (2388, '441283', '高要市', 241, 3, 0, 'Gaoyao Xian', 'CN');
INSERT INTO `sys_region` VALUES (2389, '441284', '四会市', 241, 3, 0, 'Sihui Shi', 'CN');
INSERT INTO `sys_region` VALUES (2390, '441301', '市辖区', 242, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (2391, '441302', '惠城区', 242, 3, 0, 'Huicheng Qu', 'CN');
INSERT INTO `sys_region` VALUES (2392, '441303', '惠阳区', 242, 3, 0, 'Huiyang Shi', 'CN');
INSERT INTO `sys_region` VALUES (2393, '441322', '博罗县', 242, 3, 0, 'Boluo Xian', 'CN');
INSERT INTO `sys_region` VALUES (2394, '441323', '惠东县', 242, 3, 0, 'Huidong Xian', 'CN');
INSERT INTO `sys_region` VALUES (2395, '441324', '龙门县', 242, 3, 0, 'Longmen Xian', 'CN');
INSERT INTO `sys_region` VALUES (2396, '441401', '市辖区', 243, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (2397, '441402', '梅江区', 243, 3, 0, 'Meijiang Qu', 'CN');
INSERT INTO `sys_region` VALUES (2398, '441421', '梅县', 243, 3, 0, 'Mei Xian', 'CN');
INSERT INTO `sys_region` VALUES (2399, '441422', '大埔县', 243, 3, 0, 'Dabu Xian', 'CN');
INSERT INTO `sys_region` VALUES (2400, '441423', '丰顺县', 243, 3, 0, 'Fengshun Xian', 'CN');
INSERT INTO `sys_region` VALUES (2401, '441424', '五华县', 243, 3, 0, 'Wuhua Xian', 'CN');
INSERT INTO `sys_region` VALUES (2402, '441426', '平远县', 243, 3, 0, 'Pingyuan Xian', 'CN');
INSERT INTO `sys_region` VALUES (2403, '441427', '蕉岭县', 243, 3, 0, 'Jiaoling Xian', 'CN');
INSERT INTO `sys_region` VALUES (2404, '441481', '兴宁市', 243, 3, 0, 'Xingning Shi', 'CN');
INSERT INTO `sys_region` VALUES (2405, '441501', '市辖区', 244, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (2406, '441502', '城区', 244, 3, 0, 'Chengqu', 'CN');
INSERT INTO `sys_region` VALUES (2407, '441521', '海丰县', 244, 3, 0, 'Haifeng Xian', 'CN');
INSERT INTO `sys_region` VALUES (2408, '441523', '陆河县', 244, 3, 0, 'Luhe Xian', 'CN');
INSERT INTO `sys_region` VALUES (2409, '441581', '陆丰市', 244, 3, 0, 'Lufeng Shi', 'CN');
INSERT INTO `sys_region` VALUES (2410, '441601', '市辖区', 245, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (2411, '441602', '源城区', 245, 3, 0, 'Yuancheng Qu', 'CN');
INSERT INTO `sys_region` VALUES (2412, '441621', '紫金县', 245, 3, 0, 'Zijin Xian', 'CN');
INSERT INTO `sys_region` VALUES (2413, '441622', '龙川县', 245, 3, 0, 'Longchuan Xian', 'CN');
INSERT INTO `sys_region` VALUES (2414, '441623', '连平县', 245, 3, 0, 'Lianping Xian', 'CN');
INSERT INTO `sys_region` VALUES (2415, '441624', '和平县', 245, 3, 0, 'Heping Xian', 'CN');
INSERT INTO `sys_region` VALUES (2416, '441625', '东源县', 245, 3, 0, 'Dongyuan Xian', 'CN');
INSERT INTO `sys_region` VALUES (2417, '441701', '市辖区', 246, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (2418, '441702', '江城区', 246, 3, 0, 'Jiangcheng Qu', 'CN');
INSERT INTO `sys_region` VALUES (2419, '441721', '阳西县', 246, 3, 0, 'Yangxi Xian', 'CN');
INSERT INTO `sys_region` VALUES (2420, '441723', '阳东县', 246, 3, 0, 'Yangdong Xian', 'CN');
INSERT INTO `sys_region` VALUES (2421, '441781', '阳春市', 246, 3, 0, 'Yangchun Shi', 'CN');
INSERT INTO `sys_region` VALUES (2422, '441801', '市辖区', 247, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (2423, '441802', '清城区', 247, 3, 0, 'Qingcheng Qu', 'CN');
INSERT INTO `sys_region` VALUES (2424, '441821', '佛冈县', 247, 3, 0, 'Fogang Xian', 'CN');
INSERT INTO `sys_region` VALUES (2425, '441823', '阳山县', 247, 3, 0, 'Yangshan Xian', 'CN');
INSERT INTO `sys_region` VALUES (2426, '441825', '连山壮族瑶族自治县', 247, 3, 0, 'Lianshan Zhuangzu Yaozu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (2427, '441826', '连南瑶族自治县', 247, 3, 0, 'Liannanyaozuzizhi Qu', 'CN');
INSERT INTO `sys_region` VALUES (2428, '441827', '清新县', 247, 3, 0, 'Qingxin Xian', 'CN');
INSERT INTO `sys_region` VALUES (2429, '441881', '英德市', 247, 3, 0, 'Yingde Shi', 'CN');
INSERT INTO `sys_region` VALUES (2430, '441882', '连州市', 247, 3, 0, 'Lianzhou Shi', 'CN');
INSERT INTO `sys_region` VALUES (2431, '445101', '市辖区', 250, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (2432, '445102', '湘桥区', 250, 3, 0, 'Xiangqiao Qu', 'CN');
INSERT INTO `sys_region` VALUES (2433, '445121', '潮安县', 250, 3, 0, 'Chao,an Xian', 'CN');
INSERT INTO `sys_region` VALUES (2434, '445122', '饶平县', 250, 3, 0, 'Raoping Xian', 'CN');
INSERT INTO `sys_region` VALUES (2435, '445201', '市辖区', 251, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (2436, '445202', '榕城区', 251, 3, 0, 'Rongcheng Qu', 'CN');
INSERT INTO `sys_region` VALUES (2437, '445221', '揭东县', 251, 3, 0, 'Jiedong Xian', 'CN');
INSERT INTO `sys_region` VALUES (2438, '445222', '揭西县', 251, 3, 0, 'Jiexi Xian', 'CN');
INSERT INTO `sys_region` VALUES (2439, '445224', '惠来县', 251, 3, 0, 'Huilai Xian', 'CN');
INSERT INTO `sys_region` VALUES (2440, '445281', '普宁市', 251, 3, 0, 'Puning Shi', 'CN');
INSERT INTO `sys_region` VALUES (2441, '445301', '市辖区', 252, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (2442, '445302', '云城区', 252, 3, 0, 'Yuncheng Qu', 'CN');
INSERT INTO `sys_region` VALUES (2443, '445321', '新兴县', 252, 3, 0, 'Xinxing Xian', 'CN');
INSERT INTO `sys_region` VALUES (2444, '445322', '郁南县', 252, 3, 0, 'Yunan Xian', 'CN');
INSERT INTO `sys_region` VALUES (2445, '445323', '云安县', 252, 3, 0, 'Yun,an Xian', 'CN');
INSERT INTO `sys_region` VALUES (2446, '445381', '罗定市', 252, 3, 0, 'Luoding Shi', 'CN');
INSERT INTO `sys_region` VALUES (2447, '450101', '市辖区', 253, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (2448, '450102', '兴宁区', 253, 3, 0, 'Xingning Qu', 'CN');
INSERT INTO `sys_region` VALUES (2449, '450103', '青秀区', 253, 3, 0, 'Qingxiu Qu', 'CN');
INSERT INTO `sys_region` VALUES (2450, '450105', '江南区', 253, 3, 0, 'Jiangnan Qu', 'CN');
INSERT INTO `sys_region` VALUES (2451, '450107', '西乡塘区', 253, 3, 0, 'Xixiangtang Qu', 'CN');
INSERT INTO `sys_region` VALUES (2452, '450108', '良庆区', 253, 3, 0, 'Liangqing Qu', 'CN');
INSERT INTO `sys_region` VALUES (2453, '450109', '邕宁区', 253, 3, 0, 'Yongning Qu', 'CN');
INSERT INTO `sys_region` VALUES (2454, '450122', '武鸣县', 253, 3, 0, 'Wuming Xian', 'CN');
INSERT INTO `sys_region` VALUES (2455, '450123', '隆安县', 253, 3, 0, 'Long,an Xian', 'CN');
INSERT INTO `sys_region` VALUES (2456, '450124', '马山县', 253, 3, 0, 'Mashan Xian', 'CN');
INSERT INTO `sys_region` VALUES (2457, '450125', '上林县', 253, 3, 0, 'Shanglin Xian', 'CN');
INSERT INTO `sys_region` VALUES (2458, '450126', '宾阳县', 253, 3, 0, 'Binyang Xian', 'CN');
INSERT INTO `sys_region` VALUES (2459, '450127', '横县', 253, 3, 0, 'Heng Xian', 'CN');
INSERT INTO `sys_region` VALUES (2460, '450201', '市辖区', 254, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (2461, '450202', '城中区', 254, 3, 0, 'Chengzhong Qu', 'CN');
INSERT INTO `sys_region` VALUES (2462, '450203', '鱼峰区', 254, 3, 0, 'Yufeng Qu', 'CN');
INSERT INTO `sys_region` VALUES (2463, '450204', '柳南区', 254, 3, 0, 'Liunan Qu', 'CN');
INSERT INTO `sys_region` VALUES (2464, '450205', '柳北区', 254, 3, 0, 'Liubei Qu', 'CN');
INSERT INTO `sys_region` VALUES (2465, '450221', '柳江县', 254, 3, 0, 'Liujiang Xian', 'CN');
INSERT INTO `sys_region` VALUES (2466, '450222', '柳城县', 254, 3, 0, 'Liucheng Xian', 'CN');
INSERT INTO `sys_region` VALUES (2467, '450223', '鹿寨县', 254, 3, 0, 'Luzhai Xian', 'CN');
INSERT INTO `sys_region` VALUES (2468, '450224', '融安县', 254, 3, 0, 'Rong,an Xian', 'CN');
INSERT INTO `sys_region` VALUES (2469, '450225', '融水苗族自治县', 254, 3, 0, 'Rongshui Miaozu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (2470, '450226', '三江侗族自治县', 254, 3, 0, 'Sanjiang Dongzu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (2471, '450301', '市辖区', 255, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (2472, '450302', '秀峰区', 255, 3, 0, 'Xiufeng Qu', 'CN');
INSERT INTO `sys_region` VALUES (2473, '450303', '叠彩区', 255, 3, 0, 'Diecai Qu', 'CN');
INSERT INTO `sys_region` VALUES (2474, '450304', '象山区', 255, 3, 0, 'Xiangshan Qu', 'CN');
INSERT INTO `sys_region` VALUES (2475, '450305', '七星区', 255, 3, 0, 'Qixing Qu', 'CN');
INSERT INTO `sys_region` VALUES (2476, '450311', '雁山区', 255, 3, 0, 'Yanshan Qu', 'CN');
INSERT INTO `sys_region` VALUES (2477, '450321', '阳朔县', 255, 3, 0, 'Yangshuo Xian', 'CN');
INSERT INTO `sys_region` VALUES (2478, '450322', '临桂县', 255, 3, 0, 'Lingui Xian', 'CN');
INSERT INTO `sys_region` VALUES (2479, '450323', '灵川县', 255, 3, 0, 'Lingchuan Xian', 'CN');
INSERT INTO `sys_region` VALUES (2480, '450324', '全州县', 255, 3, 0, 'Quanzhou Xian', 'CN');
INSERT INTO `sys_region` VALUES (2481, '450325', '兴安县', 255, 3, 0, 'Xing,an Xian', 'CN');
INSERT INTO `sys_region` VALUES (2482, '450326', '永福县', 255, 3, 0, 'Yongfu Xian', 'CN');
INSERT INTO `sys_region` VALUES (2483, '450327', '灌阳县', 255, 3, 0, 'Guanyang Xian', 'CN');
INSERT INTO `sys_region` VALUES (2484, '450328', '龙胜各族自治县', 255, 3, 0, 'Longsheng Gezu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (2485, '450329', '资源县', 255, 3, 0, 'Ziyuan Xian', 'CN');
INSERT INTO `sys_region` VALUES (2486, '450330', '平乐县', 255, 3, 0, 'Pingle Xian', 'CN');
INSERT INTO `sys_region` VALUES (2487, '450331', '荔蒲县', 255, 3, 0, 'Lipu Xian', 'CN');
INSERT INTO `sys_region` VALUES (2488, '450332', '恭城瑶族自治县', 255, 3, 0, 'Gongcheng Yaozu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (2489, '450401', '市辖区', 256, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (2490, '450403', '万秀区', 256, 3, 0, 'Wanxiu Qu', 'CN');
INSERT INTO `sys_region` VALUES (2491, '450404', '蝶山区', 256, 3, 0, 'Dieshan Qu', 'CN');
INSERT INTO `sys_region` VALUES (2492, '450405', '长洲区', 256, 3, 0, 'Changzhou Qu', 'CN');
INSERT INTO `sys_region` VALUES (2493, '450421', '苍梧县', 256, 3, 0, 'Cangwu Xian', 'CN');
INSERT INTO `sys_region` VALUES (2494, '450422', '藤县', 256, 3, 0, 'Teng Xian', 'CN');
INSERT INTO `sys_region` VALUES (2495, '450423', '蒙山县', 256, 3, 0, 'Mengshan Xian', 'CN');
INSERT INTO `sys_region` VALUES (2496, '450481', '岑溪市', 256, 3, 0, 'Cenxi Shi', 'CN');
INSERT INTO `sys_region` VALUES (2497, '450501', '市辖区', 257, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (2498, '450502', '海城区', 257, 3, 0, 'Haicheng Qu', 'CN');
INSERT INTO `sys_region` VALUES (2499, '450503', '银海区', 257, 3, 0, 'Yinhai Qu', 'CN');
INSERT INTO `sys_region` VALUES (2500, '450512', '铁山港区', 257, 3, 0, 'Tieshangangqu ', 'CN');
INSERT INTO `sys_region` VALUES (2501, '450521', '合浦县', 257, 3, 0, 'Hepu Xian', 'CN');
INSERT INTO `sys_region` VALUES (2502, '450601', '市辖区', 258, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (2503, '450602', '港口区', 258, 3, 0, 'Gangkou Qu', 'CN');
INSERT INTO `sys_region` VALUES (2504, '450603', '防城区', 258, 3, 0, 'Fangcheng Qu', 'CN');
INSERT INTO `sys_region` VALUES (2505, '450621', '上思县', 258, 3, 0, 'Shangsi Xian', 'CN');
INSERT INTO `sys_region` VALUES (2506, '450681', '东兴市', 258, 3, 0, 'Dongxing Shi', 'CN');
INSERT INTO `sys_region` VALUES (2507, '450701', '市辖区', 259, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (2508, '450702', '钦南区', 259, 3, 0, 'Qinnan Qu', 'CN');
INSERT INTO `sys_region` VALUES (2509, '450703', '钦北区', 259, 3, 0, 'Qinbei Qu', 'CN');
INSERT INTO `sys_region` VALUES (2510, '450721', '灵山县', 259, 3, 0, 'Lingshan Xian', 'CN');
INSERT INTO `sys_region` VALUES (2511, '450722', '浦北县', 259, 3, 0, 'Pubei Xian', 'CN');
INSERT INTO `sys_region` VALUES (2512, '450801', '市辖区', 260, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (2513, '450802', '港北区', 260, 3, 0, 'Gangbei Qu', 'CN');
INSERT INTO `sys_region` VALUES (2514, '450803', '港南区', 260, 3, 0, 'Gangnan Qu', 'CN');
INSERT INTO `sys_region` VALUES (2515, '450804', '覃塘区', 260, 3, 0, 'Tantang Qu', 'CN');
INSERT INTO `sys_region` VALUES (2516, '450821', '平南县', 260, 3, 0, 'Pingnan Xian', 'CN');
INSERT INTO `sys_region` VALUES (2517, '450881', '桂平市', 260, 3, 0, 'Guiping Shi', 'CN');
INSERT INTO `sys_region` VALUES (2518, '450901', '市辖区', 261, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (2519, '450902', '玉州区', 261, 3, 0, 'Yuzhou Qu', 'CN');
INSERT INTO `sys_region` VALUES (2520, '450921', '容县', 261, 3, 0, 'Rong Xian', 'CN');
INSERT INTO `sys_region` VALUES (2521, '450922', '陆川县', 261, 3, 0, 'Luchuan Xian', 'CN');
INSERT INTO `sys_region` VALUES (2522, '450923', '博白县', 261, 3, 0, 'Bobai Xian', 'CN');
INSERT INTO `sys_region` VALUES (2523, '450924', '兴业县', 261, 3, 0, 'Xingye Xian', 'CN');
INSERT INTO `sys_region` VALUES (2524, '450981', '北流市', 261, 3, 0, 'Beiliu Shi', 'CN');
INSERT INTO `sys_region` VALUES (2525, '451001', '市辖区', 262, 3, 0, '1', 'CN');
INSERT INTO `sys_region` VALUES (2526, '451002', '右江区', 262, 3, 0, 'Youjiang Qu', 'CN');
INSERT INTO `sys_region` VALUES (2527, '451021', '田阳县', 262, 3, 0, 'Tianyang Xian', 'CN');
INSERT INTO `sys_region` VALUES (2528, '451022', '田东县', 262, 3, 0, 'Tiandong Xian', 'CN');
INSERT INTO `sys_region` VALUES (2529, '451023', '平果县', 262, 3, 0, 'Pingguo Xian', 'CN');
INSERT INTO `sys_region` VALUES (2530, '451024', '德保县', 262, 3, 0, 'Debao Xian', 'CN');
INSERT INTO `sys_region` VALUES (2531, '451025', '靖西县', 262, 3, 0, 'Jingxi Xian', 'CN');
INSERT INTO `sys_region` VALUES (2532, '451026', '那坡县', 262, 3, 0, 'Napo Xian', 'CN');
INSERT INTO `sys_region` VALUES (2533, '451027', '凌云县', 262, 3, 0, 'Lingyun Xian', 'CN');
INSERT INTO `sys_region` VALUES (2534, '451028', '乐业县', 262, 3, 0, 'Leye Xian', 'CN');
INSERT INTO `sys_region` VALUES (2535, '451029', '田林县', 262, 3, 0, 'Tianlin Xian', 'CN');
INSERT INTO `sys_region` VALUES (2536, '451030', '西林县', 262, 3, 0, 'Xilin Xian', 'CN');
INSERT INTO `sys_region` VALUES (2537, '451031', '隆林各族自治县', 262, 3, 0, 'Longlin Gezu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (2538, '451101', '市辖区', 263, 3, 0, '1', 'CN');
INSERT INTO `sys_region` VALUES (2539, '451102', '八步区', 263, 3, 0, 'Babu Qu', 'CN');
INSERT INTO `sys_region` VALUES (2540, '451121', '昭平县', 263, 3, 0, 'Zhaoping Xian', 'CN');
INSERT INTO `sys_region` VALUES (2541, '451122', '钟山县', 263, 3, 0, 'Zhongshan Xian', 'CN');
INSERT INTO `sys_region` VALUES (2542, '451123', '富川瑶族自治县', 263, 3, 0, 'Fuchuan Yaozu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (2543, '451201', '市辖区', 264, 3, 0, '1', 'CN');
INSERT INTO `sys_region` VALUES (2544, '451202', '金城江区', 264, 3, 0, 'Jinchengjiang Qu', 'CN');
INSERT INTO `sys_region` VALUES (2545, '451221', '南丹县', 264, 3, 0, 'Nandan Xian', 'CN');
INSERT INTO `sys_region` VALUES (2546, '451222', '天峨县', 264, 3, 0, 'Tian,e Xian', 'CN');
INSERT INTO `sys_region` VALUES (2547, '451223', '凤山县', 264, 3, 0, 'Fengshan Xian', 'CN');
INSERT INTO `sys_region` VALUES (2548, '451224', '东兰县', 264, 3, 0, 'Donglan Xian', 'CN');
INSERT INTO `sys_region` VALUES (2549, '451225', '罗城仫佬族自治县', 264, 3, 0, 'Luocheng Mulaozu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (2550, '451226', '环江毛南族自治县', 264, 3, 0, 'Huanjiang Maonanzu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (2551, '451227', '巴马瑶族自治县', 264, 3, 0, 'Bama Yaozu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (2552, '451228', '都安瑶族自治县', 264, 3, 0, 'Du,an Yaozu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (2553, '451229', '大化瑶族自治县', 264, 3, 0, 'Dahua Yaozu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (2554, '451281', '宜州市', 264, 3, 0, 'Yizhou Shi', 'CN');
INSERT INTO `sys_region` VALUES (2555, '451301', '市辖区', 265, 3, 0, '1', 'CN');
INSERT INTO `sys_region` VALUES (2556, '451302', '兴宾区', 265, 3, 0, 'Xingbin Qu', 'CN');
INSERT INTO `sys_region` VALUES (2557, '451321', '忻城县', 265, 3, 0, 'Xincheng Xian', 'CN');
INSERT INTO `sys_region` VALUES (2558, '451322', '象州县', 265, 3, 0, 'Xiangzhou Xian', 'CN');
INSERT INTO `sys_region` VALUES (2559, '451323', '武宣县', 265, 3, 0, 'Wuxuan Xian', 'CN');
INSERT INTO `sys_region` VALUES (2560, '451324', '金秀瑶族自治县', 265, 3, 0, 'Jinxiu Yaozu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (2561, '451381', '合山市', 265, 3, 0, 'Heshan Shi', 'CN');
INSERT INTO `sys_region` VALUES (2562, '451401', '市辖区', 266, 3, 0, '1', 'CN');
INSERT INTO `sys_region` VALUES (2563, '451402', '江洲区', 266, 3, 0, 'Jiangzhou Qu', 'CN');
INSERT INTO `sys_region` VALUES (2564, '451421', '扶绥县', 266, 3, 0, 'Fusui Xian', 'CN');
INSERT INTO `sys_region` VALUES (2565, '451422', '宁明县', 266, 3, 0, 'Ningming Xian', 'CN');
INSERT INTO `sys_region` VALUES (2566, '451423', '龙州县', 266, 3, 0, 'Longzhou Xian', 'CN');
INSERT INTO `sys_region` VALUES (2567, '451424', '大新县', 266, 3, 0, 'Daxin Xian', 'CN');
INSERT INTO `sys_region` VALUES (2568, '451425', '天等县', 266, 3, 0, 'Tiandeng Xian', 'CN');
INSERT INTO `sys_region` VALUES (2569, '451481', '凭祥市', 266, 3, 0, 'Pingxiang Shi', 'CN');
INSERT INTO `sys_region` VALUES (2570, '460101', '市辖区', 267, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (2571, '460105', '秀英区', 267, 3, 0, 'Xiuying Qu', 'CN');
INSERT INTO `sys_region` VALUES (2572, '460106', '龙华区', 267, 3, 0, 'LongHua Qu', 'CN');
INSERT INTO `sys_region` VALUES (2573, '460107', '琼山区', 267, 3, 0, 'QiongShan Qu', 'CN');
INSERT INTO `sys_region` VALUES (2574, '460108', '美兰区', 267, 3, 0, 'MeiLan Qu', 'CN');
INSERT INTO `sys_region` VALUES (2575, '460201', '市辖区', 268, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (2576, '469001', '五指山市', 269, 3, 0, 'Wuzhishan Qu', 'CN');
INSERT INTO `sys_region` VALUES (2577, '469002', '琼海市', 269, 3, 0, 'Qionghai Shi', 'CN');
INSERT INTO `sys_region` VALUES (2578, '469003', '儋州市', 269, 3, 0, 'Danzhou Shi', 'CN');
INSERT INTO `sys_region` VALUES (2579, '469005', '文昌市', 269, 3, 0, 'Wenchang Shi', 'CN');
INSERT INTO `sys_region` VALUES (2580, '469006', '万宁市', 269, 3, 0, 'Wanning Shi', 'CN');
INSERT INTO `sys_region` VALUES (2581, '469007', '东方市', 269, 3, 0, 'Dongfang Shi', 'CN');
INSERT INTO `sys_region` VALUES (2582, '469021', '定安县', 269, 3, 0, 'Ding,an Xian', 'CN');
INSERT INTO `sys_region` VALUES (2583, '469022', '屯昌县', 269, 3, 0, 'Tunchang Xian', 'CN');
INSERT INTO `sys_region` VALUES (2584, '469023', '澄迈县', 269, 3, 0, 'Chengmai Xian', 'CN');
INSERT INTO `sys_region` VALUES (2585, '469024', '临高县', 269, 3, 0, 'Lingao Xian', 'CN');
INSERT INTO `sys_region` VALUES (2586, '469025', '白沙黎族自治县', 269, 3, 0, 'Baisha Lizu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (2587, '469026', '昌江黎族自治县', 269, 3, 0, 'Changjiang Lizu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (2588, '469027', '乐东黎族自治县', 269, 3, 0, 'Ledong Lizu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (2589, '469028', '陵水黎族自治县', 269, 3, 0, 'Lingshui Lizu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (2590, '469029', '保亭黎族苗族自治县', 269, 3, 0, 'Baoting Lizu Miaozu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (2591, '469030', '琼中黎族苗族自治县', 269, 3, 0, 'Qiongzhong Lizu Miaozu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (2592, '469031', '西沙群岛', 269, 3, 0, 'Xisha Qundao', 'CN');
INSERT INTO `sys_region` VALUES (2593, '469032', '南沙群岛', 269, 3, 0, 'Nansha Qundao', 'CN');
INSERT INTO `sys_region` VALUES (2594, '469033', '中沙群岛的岛礁及其海域', 269, 3, 0, 'Zhongsha Qundao de Daojiao Jiqi Haiyu', 'CN');
INSERT INTO `sys_region` VALUES (2595, '500101', '万州区', 270, 3, 0, 'Wanzhou Qu', 'CN');
INSERT INTO `sys_region` VALUES (2596, '500102', '涪陵区', 270, 3, 0, 'Fuling Qu', 'CN');
INSERT INTO `sys_region` VALUES (2597, '500103', '渝中区', 270, 3, 0, 'Yuzhong Qu', 'CN');
INSERT INTO `sys_region` VALUES (2598, '500104', '大渡口区', 270, 3, 0, 'Dadukou Qu', 'CN');
INSERT INTO `sys_region` VALUES (2599, '500105', '江北区', 270, 3, 0, 'Jiangbei Qu', 'CN');
INSERT INTO `sys_region` VALUES (2600, '500106', '沙坪坝区', 270, 3, 0, 'Shapingba Qu', 'CN');
INSERT INTO `sys_region` VALUES (2601, '500107', '九龙坡区', 270, 3, 0, 'Jiulongpo Qu', 'CN');
INSERT INTO `sys_region` VALUES (2602, '500108', '南岸区', 270, 3, 0, 'Nan,an Qu', 'CN');
INSERT INTO `sys_region` VALUES (2603, '500109', '北碚区', 270, 3, 0, 'Beibei Qu', 'CN');
INSERT INTO `sys_region` VALUES (2604, '500110', '万盛区', 270, 3, 0, 'Wansheng Qu', 'CN');
INSERT INTO `sys_region` VALUES (2605, '500111', '双桥区', 270, 3, 0, 'Shuangqiao Qu', 'CN');
INSERT INTO `sys_region` VALUES (2606, '500112', '渝北区', 270, 3, 0, 'Yubei Qu', 'CN');
INSERT INTO `sys_region` VALUES (2607, '500113', '巴南区', 270, 3, 0, 'Banan Qu', 'CN');
INSERT INTO `sys_region` VALUES (2608, '500114', '黔江区', 270, 3, 0, 'Qianjiang Qu', 'CN');
INSERT INTO `sys_region` VALUES (2609, '500115', '长寿区', 270, 3, 0, 'Changshou Qu', 'CN');
INSERT INTO `sys_region` VALUES (2610, '500222', '綦江县', 271, 3, 0, 'Qijiang Xian', 'CN');
INSERT INTO `sys_region` VALUES (2611, '500223', '潼南县', 271, 3, 0, 'Tongnan Xian', 'CN');
INSERT INTO `sys_region` VALUES (2612, '500224', '铜梁县', 271, 3, 0, 'Tongliang Xian', 'CN');
INSERT INTO `sys_region` VALUES (2613, '500225', '大足县', 271, 3, 0, 'Dazu Xian', 'CN');
INSERT INTO `sys_region` VALUES (2614, '500226', '荣昌县', 271, 3, 0, 'Rongchang Xian', 'CN');
INSERT INTO `sys_region` VALUES (2615, '500227', '璧山县', 271, 3, 0, 'Bishan Xian', 'CN');
INSERT INTO `sys_region` VALUES (2616, '500228', '梁平县', 271, 3, 0, 'Liangping Xian', 'CN');
INSERT INTO `sys_region` VALUES (2617, '500229', '城口县', 271, 3, 0, 'Chengkou Xian', 'CN');
INSERT INTO `sys_region` VALUES (2618, '500230', '丰都县', 271, 3, 0, 'Fengdu Xian', 'CN');
INSERT INTO `sys_region` VALUES (2619, '500231', '垫江县', 271, 3, 0, 'Dianjiang Xian', 'CN');
INSERT INTO `sys_region` VALUES (2620, '500232', '武隆县', 271, 3, 0, 'Wulong Xian', 'CN');
INSERT INTO `sys_region` VALUES (2621, '500233', '忠县', 271, 3, 0, 'Zhong Xian', 'CN');
INSERT INTO `sys_region` VALUES (2622, '500234', '开县', 271, 3, 0, 'Kai Xian', 'CN');
INSERT INTO `sys_region` VALUES (2623, '500235', '云阳县', 271, 3, 0, 'Yunyang Xian', 'CN');
INSERT INTO `sys_region` VALUES (2624, '500236', '奉节县', 271, 3, 0, 'Fengjie Xian', 'CN');
INSERT INTO `sys_region` VALUES (2625, '500237', '巫山县', 271, 3, 0, 'Wushan Xian', 'CN');
INSERT INTO `sys_region` VALUES (2626, '500238', '巫溪县', 271, 3, 0, 'Wuxi Xian', 'CN');
INSERT INTO `sys_region` VALUES (2627, '500240', '石柱土家族自治县', 271, 3, 0, 'Shizhu Tujiazu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (2628, '500241', '秀山土家族苗族自治县', 271, 3, 0, 'Xiushan Tujiazu Miaozu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (2629, '500242', '酉阳土家族苗族自治县', 271, 3, 0, 'Youyang Tujiazu Miaozu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (2630, '500243', '彭水苗族土家族自治县', 271, 3, 0, 'Pengshui Miaozu Tujiazu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (2635, '510101', '市辖区', 273, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (2636, '510104', '锦江区', 273, 3, 0, 'Jinjiang Qu', 'CN');
INSERT INTO `sys_region` VALUES (2637, '510105', '青羊区', 273, 3, 0, 'Qingyang Qu', 'CN');
INSERT INTO `sys_region` VALUES (2638, '510106', '金牛区', 273, 3, 0, 'Jinniu Qu', 'CN');
INSERT INTO `sys_region` VALUES (2639, '510107', '武侯区', 273, 3, 0, 'Wuhou Qu', 'CN');
INSERT INTO `sys_region` VALUES (2640, '510108', '成华区', 273, 3, 0, 'Chenghua Qu', 'CN');
INSERT INTO `sys_region` VALUES (2641, '510112', '龙泉驿区', 273, 3, 0, 'Longquanyi Qu', 'CN');
INSERT INTO `sys_region` VALUES (2642, '510113', '青白江区', 273, 3, 0, 'Qingbaijiang Qu', 'CN');
INSERT INTO `sys_region` VALUES (2643, '510114', '新都区', 273, 3, 0, 'Xindu Qu', 'CN');
INSERT INTO `sys_region` VALUES (2644, '510115', '温江区', 273, 3, 0, 'Wenjiang Qu', 'CN');
INSERT INTO `sys_region` VALUES (2645, '510121', '金堂县', 273, 3, 0, 'Jintang Xian', 'CN');
INSERT INTO `sys_region` VALUES (2646, '510122', '双流县', 273, 3, 0, 'Shuangliu Xian', 'CN');
INSERT INTO `sys_region` VALUES (2647, '510124', '郫县', 273, 3, 0, 'Pi Xian', 'CN');
INSERT INTO `sys_region` VALUES (2648, '510129', '大邑县', 273, 3, 0, 'Dayi Xian', 'CN');
INSERT INTO `sys_region` VALUES (2649, '510131', '蒲江县', 273, 3, 0, 'Pujiang Xian', 'CN');
INSERT INTO `sys_region` VALUES (2650, '510132', '新津县', 273, 3, 0, 'Xinjin Xian', 'CN');
INSERT INTO `sys_region` VALUES (2651, '510181', '都江堰市', 273, 3, 0, 'Dujiangyan Shi', 'CN');
INSERT INTO `sys_region` VALUES (2652, '510182', '彭州市', 273, 3, 0, 'Pengzhou Shi', 'CN');
INSERT INTO `sys_region` VALUES (2653, '510183', '邛崃市', 273, 3, 0, 'Qionglai Shi', 'CN');
INSERT INTO `sys_region` VALUES (2654, '510184', '崇州市', 273, 3, 0, 'Chongzhou Shi', 'CN');
INSERT INTO `sys_region` VALUES (2655, '510301', '市辖区', 274, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (2656, '510302', '自流井区', 274, 3, 0, 'Ziliujing Qu', 'CN');
INSERT INTO `sys_region` VALUES (2657, '510303', '贡井区', 274, 3, 0, 'Gongjing Qu', 'CN');
INSERT INTO `sys_region` VALUES (2658, '510304', '大安区', 274, 3, 0, 'Da,an Qu', 'CN');
INSERT INTO `sys_region` VALUES (2659, '510311', '沿滩区', 274, 3, 0, 'Yantan Qu', 'CN');
INSERT INTO `sys_region` VALUES (2660, '510321', '荣县', 274, 3, 0, 'Rong Xian', 'CN');
INSERT INTO `sys_region` VALUES (2661, '510322', '富顺县', 274, 3, 0, 'Fushun Xian', 'CN');
INSERT INTO `sys_region` VALUES (2662, '510401', '市辖区', 275, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (2663, '510402', '东区', 275, 3, 0, 'Dong Qu', 'CN');
INSERT INTO `sys_region` VALUES (2664, '510403', '西区', 275, 3, 0, 'Xi Qu', 'CN');
INSERT INTO `sys_region` VALUES (2665, '510411', '仁和区', 275, 3, 0, 'Renhe Qu', 'CN');
INSERT INTO `sys_region` VALUES (2666, '510421', '米易县', 275, 3, 0, 'Miyi Xian', 'CN');
INSERT INTO `sys_region` VALUES (2667, '510422', '盐边县', 275, 3, 0, 'Yanbian Xian', 'CN');
INSERT INTO `sys_region` VALUES (2668, '510501', '市辖区', 276, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (2669, '510502', '江阳区', 276, 3, 0, 'Jiangyang Qu', 'CN');
INSERT INTO `sys_region` VALUES (2670, '510503', '纳溪区', 276, 3, 0, 'Naxi Qu', 'CN');
INSERT INTO `sys_region` VALUES (2671, '510504', '龙马潭区', 276, 3, 0, 'Longmatan Qu', 'CN');
INSERT INTO `sys_region` VALUES (2672, '510521', '泸县', 276, 3, 0, 'Lu Xian', 'CN');
INSERT INTO `sys_region` VALUES (2673, '510522', '合江县', 276, 3, 0, 'Hejiang Xian', 'CN');
INSERT INTO `sys_region` VALUES (2674, '510524', '叙永县', 276, 3, 0, 'Xuyong Xian', 'CN');
INSERT INTO `sys_region` VALUES (2675, '510525', '古蔺县', 276, 3, 0, 'Gulin Xian', 'CN');
INSERT INTO `sys_region` VALUES (2676, '510601', '市辖区', 277, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (2677, '510603', '旌阳区', 277, 3, 0, 'Jingyang Qu', 'CN');
INSERT INTO `sys_region` VALUES (2678, '510623', '中江县', 277, 3, 0, 'Zhongjiang Xian', 'CN');
INSERT INTO `sys_region` VALUES (2679, '510626', '罗江县', 277, 3, 0, 'Luojiang Xian', 'CN');
INSERT INTO `sys_region` VALUES (2680, '510681', '广汉市', 277, 3, 0, 'Guanghan Shi', 'CN');
INSERT INTO `sys_region` VALUES (2681, '510682', '什邡市', 277, 3, 0, 'Shifang Shi', 'CN');
INSERT INTO `sys_region` VALUES (2682, '510683', '绵竹市', 277, 3, 0, 'Jinzhou Shi', 'CN');
INSERT INTO `sys_region` VALUES (2683, '510701', '市辖区', 278, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (2684, '510703', '涪城区', 278, 3, 0, 'Fucheng Qu', 'CN');
INSERT INTO `sys_region` VALUES (2685, '510704', '游仙区', 278, 3, 0, 'Youxian Qu', 'CN');
INSERT INTO `sys_region` VALUES (2686, '510722', '三台县', 278, 3, 0, 'Santai Xian', 'CN');
INSERT INTO `sys_region` VALUES (2687, '510723', '盐亭县', 278, 3, 0, 'Yanting Xian', 'CN');
INSERT INTO `sys_region` VALUES (2688, '510724', '安县', 278, 3, 0, 'An Xian', 'CN');
INSERT INTO `sys_region` VALUES (2689, '510725', '梓潼县', 278, 3, 0, 'Zitong Xian', 'CN');
INSERT INTO `sys_region` VALUES (2690, '510726', '北川羌族自治县', 278, 3, 0, 'Beichuanqiangzuzizhi Qu', 'CN');
INSERT INTO `sys_region` VALUES (2691, '510727', '平武县', 278, 3, 0, 'Pingwu Xian', 'CN');
INSERT INTO `sys_region` VALUES (2692, '510781', '江油市', 278, 3, 0, 'Jiangyou Shi', 'CN');
INSERT INTO `sys_region` VALUES (2693, '510801', '市辖区', 279, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (2695, '510811', '元坝区', 279, 3, 0, 'Yuanba Qu', 'CN');
INSERT INTO `sys_region` VALUES (2696, '510812', '朝天区', 279, 3, 0, 'Chaotian Qu', 'CN');
INSERT INTO `sys_region` VALUES (2697, '510821', '旺苍县', 279, 3, 0, 'Wangcang Xian', 'CN');
INSERT INTO `sys_region` VALUES (2698, '510822', '青川县', 279, 3, 0, 'Qingchuan Xian', 'CN');
INSERT INTO `sys_region` VALUES (2699, '510823', '剑阁县', 279, 3, 0, 'Jiange Xian', 'CN');
INSERT INTO `sys_region` VALUES (2700, '510824', '苍溪县', 279, 3, 0, 'Cangxi Xian', 'CN');
INSERT INTO `sys_region` VALUES (2701, '510901', '市辖区', 280, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (2702, '510903', '船山区', 280, 3, 0, 'Chuanshan Qu', 'CN');
INSERT INTO `sys_region` VALUES (2703, '510904', '安居区', 280, 3, 0, 'Anju Qu', 'CN');
INSERT INTO `sys_region` VALUES (2704, '510921', '蓬溪县', 280, 3, 0, 'Pengxi Xian', 'CN');
INSERT INTO `sys_region` VALUES (2705, '510922', '射洪县', 280, 3, 0, 'Shehong Xian', 'CN');
INSERT INTO `sys_region` VALUES (2706, '510923', '大英县', 280, 3, 0, 'Daying Xian', 'CN');
INSERT INTO `sys_region` VALUES (2707, '511001', '市辖区', 281, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (2708, '511002', '市中区', 281, 3, 0, 'Shizhong Qu', 'CN');
INSERT INTO `sys_region` VALUES (2709, '511011', '东兴区', 281, 3, 0, 'Dongxing Qu', 'CN');
INSERT INTO `sys_region` VALUES (2710, '511024', '威远县', 281, 3, 0, 'Weiyuan Xian', 'CN');
INSERT INTO `sys_region` VALUES (2711, '511025', '资中县', 281, 3, 0, 'Zizhong Xian', 'CN');
INSERT INTO `sys_region` VALUES (2712, '511028', '隆昌县', 281, 3, 0, 'Longchang Xian', 'CN');
INSERT INTO `sys_region` VALUES (2713, '511101', '市辖区', 282, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (2714, '511102', '市中区', 282, 3, 0, 'Shizhong Qu', 'CN');
INSERT INTO `sys_region` VALUES (2715, '511111', '沙湾区', 282, 3, 0, 'Shawan Qu', 'CN');
INSERT INTO `sys_region` VALUES (2716, '511112', '五通桥区', 282, 3, 0, 'Wutongqiao Qu', 'CN');
INSERT INTO `sys_region` VALUES (2717, '511113', '金口河区', 282, 3, 0, 'Jinkouhe Qu', 'CN');
INSERT INTO `sys_region` VALUES (2718, '511123', '犍为县', 282, 3, 0, 'Qianwei Xian', 'CN');
INSERT INTO `sys_region` VALUES (2719, '511124', '井研县', 282, 3, 0, 'Jingyan Xian', 'CN');
INSERT INTO `sys_region` VALUES (2720, '511126', '夹江县', 282, 3, 0, 'Jiajiang Xian', 'CN');
INSERT INTO `sys_region` VALUES (2721, '511129', '沐川县', 282, 3, 0, 'Muchuan Xian', 'CN');
INSERT INTO `sys_region` VALUES (2722, '511132', '峨边彝族自治县', 282, 3, 0, 'Ebian Yizu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (2723, '511133', '马边彝族自治县', 282, 3, 0, 'Mabian Yizu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (2724, '511181', '峨眉山市', 282, 3, 0, 'Emeishan Shi', 'CN');
INSERT INTO `sys_region` VALUES (2725, '511301', '市辖区', 283, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (2726, '511302', '顺庆区', 283, 3, 0, 'Shunqing Xian', 'CN');
INSERT INTO `sys_region` VALUES (2727, '511303', '高坪区', 283, 3, 0, 'Gaoping Qu', 'CN');
INSERT INTO `sys_region` VALUES (2728, '511304', '嘉陵区', 283, 3, 0, 'Jialing Qu', 'CN');
INSERT INTO `sys_region` VALUES (2729, '511321', '南部县', 283, 3, 0, 'Nanbu Xian', 'CN');
INSERT INTO `sys_region` VALUES (2730, '511322', '营山县', 283, 3, 0, 'Yingshan Xian', 'CN');
INSERT INTO `sys_region` VALUES (2731, '511323', '蓬安县', 283, 3, 0, 'Peng,an Xian', 'CN');
INSERT INTO `sys_region` VALUES (2732, '511324', '仪陇县', 283, 3, 0, 'Yilong Xian', 'CN');
INSERT INTO `sys_region` VALUES (2733, '511325', '西充县', 283, 3, 0, 'Xichong Xian', 'CN');
INSERT INTO `sys_region` VALUES (2734, '511381', '阆中市', 283, 3, 0, 'Langzhong Shi', 'CN');
INSERT INTO `sys_region` VALUES (2735, '511401', '市辖区', 284, 3, 0, '1', 'CN');
INSERT INTO `sys_region` VALUES (2736, '511402', '东坡区', 284, 3, 0, 'Dongpo Qu', 'CN');
INSERT INTO `sys_region` VALUES (2737, '511421', '仁寿县', 284, 3, 0, 'Renshou Xian', 'CN');
INSERT INTO `sys_region` VALUES (2738, '511422', '彭山县', 284, 3, 0, 'Pengshan Xian', 'CN');
INSERT INTO `sys_region` VALUES (2739, '511423', '洪雅县', 284, 3, 0, 'Hongya Xian', 'CN');
INSERT INTO `sys_region` VALUES (2740, '511424', '丹棱县', 284, 3, 0, 'Danling Xian', 'CN');
INSERT INTO `sys_region` VALUES (2741, '511425', '青神县', 284, 3, 0, 'Qingshen Xian', 'CN');
INSERT INTO `sys_region` VALUES (2742, '511501', '市辖区', 285, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (2743, '511502', '翠屏区', 285, 3, 0, 'Cuiping Qu', 'CN');
INSERT INTO `sys_region` VALUES (2744, '511521', '宜宾县', 285, 3, 0, 'Yibin Xian', 'CN');
INSERT INTO `sys_region` VALUES (2745, '511522', '南溪县', 285, 3, 0, 'Nanxi Xian', 'CN');
INSERT INTO `sys_region` VALUES (2746, '511523', '江安县', 285, 3, 0, 'Jiang,an Xian', 'CN');
INSERT INTO `sys_region` VALUES (2747, '511524', '长宁县', 285, 3, 0, 'Changning Xian', 'CN');
INSERT INTO `sys_region` VALUES (2748, '511525', '高县', 285, 3, 0, 'Gao Xian', 'CN');
INSERT INTO `sys_region` VALUES (2749, '511526', '珙县', 285, 3, 0, 'Gong Xian', 'CN');
INSERT INTO `sys_region` VALUES (2750, '511527', '筠连县', 285, 3, 0, 'Junlian Xian', 'CN');
INSERT INTO `sys_region` VALUES (2751, '511528', '兴文县', 285, 3, 0, 'Xingwen Xian', 'CN');
INSERT INTO `sys_region` VALUES (2752, '511529', '屏山县', 285, 3, 0, 'Pingshan Xian', 'CN');
INSERT INTO `sys_region` VALUES (2753, '511601', '市辖区', 286, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (2754, '511602', '广安区', 286, 3, 0, 'Guang,an Qu', 'CN');
INSERT INTO `sys_region` VALUES (2755, '511621', '岳池县', 286, 3, 0, 'Yuechi Xian', 'CN');
INSERT INTO `sys_region` VALUES (2756, '511622', '武胜县', 286, 3, 0, 'Wusheng Xian', 'CN');
INSERT INTO `sys_region` VALUES (2757, '511623', '邻水县', 286, 3, 0, 'Linshui Xian', 'CN');
INSERT INTO `sys_region` VALUES (2759, '511701', '市辖区', 287, 3, 0, '1', 'CN');
INSERT INTO `sys_region` VALUES (2760, '511702', '通川区', 287, 3, 0, 'Tongchuan Qu', 'CN');
INSERT INTO `sys_region` VALUES (2761, '511721', '达县', 287, 3, 0, 'Da Xian', 'CN');
INSERT INTO `sys_region` VALUES (2762, '511722', '宣汉县', 287, 3, 0, 'Xuanhan Xian', 'CN');
INSERT INTO `sys_region` VALUES (2763, '511723', '开江县', 287, 3, 0, 'Kaijiang Xian', 'CN');
INSERT INTO `sys_region` VALUES (2764, '511724', '大竹县', 287, 3, 0, 'Dazhu Xian', 'CN');
INSERT INTO `sys_region` VALUES (2765, '511725', '渠县', 287, 3, 0, 'Qu Xian', 'CN');
INSERT INTO `sys_region` VALUES (2766, '511781', '万源市', 287, 3, 0, 'Wanyuan Shi', 'CN');
INSERT INTO `sys_region` VALUES (2767, '511801', '市辖区', 288, 3, 0, '1', 'CN');
INSERT INTO `sys_region` VALUES (2768, '511802', '雨城区', 288, 3, 0, 'Yucheg Qu', 'CN');
INSERT INTO `sys_region` VALUES (2769, '511821', '名山县', 288, 3, 0, 'Mingshan Xian', 'CN');
INSERT INTO `sys_region` VALUES (2770, '511822', '荥经县', 288, 3, 0, 'Yingjing Xian', 'CN');
INSERT INTO `sys_region` VALUES (2771, '511823', '汉源县', 288, 3, 0, 'Hanyuan Xian', 'CN');
INSERT INTO `sys_region` VALUES (2772, '511824', '石棉县', 288, 3, 0, 'Shimian Xian', 'CN');
INSERT INTO `sys_region` VALUES (2773, '511825', '天全县', 288, 3, 0, 'Tianquan Xian', 'CN');
INSERT INTO `sys_region` VALUES (2774, '511826', '芦山县', 288, 3, 0, 'Lushan Xian', 'CN');
INSERT INTO `sys_region` VALUES (2775, '511827', '宝兴县', 288, 3, 0, 'Baoxing Xian', 'CN');
INSERT INTO `sys_region` VALUES (2776, '511901', '市辖区', 289, 3, 0, '1', 'CN');
INSERT INTO `sys_region` VALUES (2777, '511902', '巴州区', 289, 3, 0, 'Bazhou Qu', 'CN');
INSERT INTO `sys_region` VALUES (2778, '511921', '通江县', 289, 3, 0, 'Tongjiang Xian', 'CN');
INSERT INTO `sys_region` VALUES (2779, '511922', '南江县', 289, 3, 0, 'Nanjiang Xian', 'CN');
INSERT INTO `sys_region` VALUES (2780, '511923', '平昌县', 289, 3, 0, 'Pingchang Xian', 'CN');
INSERT INTO `sys_region` VALUES (2781, '512001', '市辖区', 290, 3, 0, '1', 'CN');
INSERT INTO `sys_region` VALUES (2782, '512002', '雁江区', 290, 3, 0, 'Yanjiang Qu', 'CN');
INSERT INTO `sys_region` VALUES (2783, '512021', '安岳县', 290, 3, 0, 'Anyue Xian', 'CN');
INSERT INTO `sys_region` VALUES (2784, '512022', '乐至县', 290, 3, 0, 'Lezhi Xian', 'CN');
INSERT INTO `sys_region` VALUES (2785, '512081', '简阳市', 290, 3, 0, 'Jianyang Shi', 'CN');
INSERT INTO `sys_region` VALUES (2786, '513221', '汶川县', 291, 3, 0, 'Wenchuan Xian', 'CN');
INSERT INTO `sys_region` VALUES (2787, '513222', '理县', 291, 3, 0, 'Li Xian', 'CN');
INSERT INTO `sys_region` VALUES (2788, '513223', '茂县', 291, 3, 0, 'Mao Xian', 'CN');
INSERT INTO `sys_region` VALUES (2789, '513224', '松潘县', 291, 3, 0, 'Songpan Xian', 'CN');
INSERT INTO `sys_region` VALUES (2790, '513225', '九寨沟县', 291, 3, 0, 'Jiuzhaigou Xian', 'CN');
INSERT INTO `sys_region` VALUES (2791, '513226', '金川县', 291, 3, 0, 'Jinchuan Xian', 'CN');
INSERT INTO `sys_region` VALUES (2792, '513227', '小金县', 291, 3, 0, 'Xiaojin Xian', 'CN');
INSERT INTO `sys_region` VALUES (2793, '513228', '黑水县', 291, 3, 0, 'Heishui Xian', 'CN');
INSERT INTO `sys_region` VALUES (2794, '513229', '马尔康县', 291, 3, 0, 'Barkam Xian', 'CN');
INSERT INTO `sys_region` VALUES (2795, '513230', '壤塘县', 291, 3, 0, 'Zamtang Xian', 'CN');
INSERT INTO `sys_region` VALUES (2796, '513231', '阿坝县', 291, 3, 0, 'Aba(Ngawa) Xian', 'CN');
INSERT INTO `sys_region` VALUES (2797, '513232', '若尔盖县', 291, 3, 0, 'ZoigeXian', 'CN');
INSERT INTO `sys_region` VALUES (2798, '513233', '红原县', 291, 3, 0, 'Hongyuan Xian', 'CN');
INSERT INTO `sys_region` VALUES (2799, '513321', '康定县', 292, 3, 0, 'Kangding(Dardo) Xian', 'CN');
INSERT INTO `sys_region` VALUES (2800, '513322', '泸定县', 292, 3, 0, 'Luding(Jagsamka) Xian', 'CN');
INSERT INTO `sys_region` VALUES (2801, '513323', '丹巴县', 292, 3, 0, 'Danba(Rongzhag) Xian', 'CN');
INSERT INTO `sys_region` VALUES (2802, '513324', '九龙县', 292, 3, 0, 'Jiulong(Gyaisi) Xian', 'CN');
INSERT INTO `sys_region` VALUES (2803, '513325', '雅江县', 292, 3, 0, 'Yajiang(Nyagquka) Xian', 'CN');
INSERT INTO `sys_region` VALUES (2804, '513326', '道孚县', 292, 3, 0, 'Dawu Xian', 'CN');
INSERT INTO `sys_region` VALUES (2805, '513327', '炉霍县', 292, 3, 0, 'Luhuo(Zhaggo) Xian', 'CN');
INSERT INTO `sys_region` VALUES (2806, '513328', '甘孜县', 292, 3, 0, 'Garze Xian', 'CN');
INSERT INTO `sys_region` VALUES (2807, '513329', '新龙县', 292, 3, 0, 'Xinlong(Nyagrong) Xian', 'CN');
INSERT INTO `sys_region` VALUES (2808, '513330', '德格县', 292, 3, 0, 'DegeXian', 'CN');
INSERT INTO `sys_region` VALUES (2809, '513331', '白玉县', 292, 3, 0, 'Baiyu Xian', 'CN');
INSERT INTO `sys_region` VALUES (2810, '513332', '石渠县', 292, 3, 0, 'Serxv Xian', 'CN');
INSERT INTO `sys_region` VALUES (2811, '513333', '色达县', 292, 3, 0, 'Sertar Xian', 'CN');
INSERT INTO `sys_region` VALUES (2812, '513334', '理塘县', 292, 3, 0, 'Litang Xian', 'CN');
INSERT INTO `sys_region` VALUES (2813, '513335', '巴塘县', 292, 3, 0, 'Batang Xian', 'CN');
INSERT INTO `sys_region` VALUES (2814, '513336', '乡城县', 292, 3, 0, 'Xiangcheng(Qagcheng) Xian', 'CN');
INSERT INTO `sys_region` VALUES (2815, '513337', '稻城县', 292, 3, 0, 'Daocheng(Dabba) Xian', 'CN');
INSERT INTO `sys_region` VALUES (2816, '513338', '得荣县', 292, 3, 0, 'Derong Xian', 'CN');
INSERT INTO `sys_region` VALUES (2817, '513401', '西昌市', 293, 3, 0, 'Xichang Shi', 'CN');
INSERT INTO `sys_region` VALUES (2818, '513422', '木里藏族自治县', 293, 3, 0, 'Muli Zangzu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (2819, '513423', '盐源县', 293, 3, 0, 'Yanyuan Xian', 'CN');
INSERT INTO `sys_region` VALUES (2820, '513424', '德昌县', 293, 3, 0, 'Dechang Xian', 'CN');
INSERT INTO `sys_region` VALUES (2821, '513425', '会理县', 293, 3, 0, 'Huili Xian', 'CN');
INSERT INTO `sys_region` VALUES (2822, '513426', '会东县', 293, 3, 0, 'Huidong Xian', 'CN');
INSERT INTO `sys_region` VALUES (2823, '513427', '宁南县', 293, 3, 0, 'Ningnan Xian', 'CN');
INSERT INTO `sys_region` VALUES (2824, '513428', '普格县', 293, 3, 0, 'Puge Xian', 'CN');
INSERT INTO `sys_region` VALUES (2825, '513429', '布拖县', 293, 3, 0, 'Butuo Xian', 'CN');
INSERT INTO `sys_region` VALUES (2826, '513430', '金阳县', 293, 3, 0, 'Jinyang Xian', 'CN');
INSERT INTO `sys_region` VALUES (2827, '513431', '昭觉县', 293, 3, 0, 'Zhaojue Xian', 'CN');
INSERT INTO `sys_region` VALUES (2828, '513432', '喜德县', 293, 3, 0, 'Xide Xian', 'CN');
INSERT INTO `sys_region` VALUES (2829, '513433', '冕宁县', 293, 3, 0, 'Mianning Xian', 'CN');
INSERT INTO `sys_region` VALUES (2830, '513434', '越西县', 293, 3, 0, 'Yuexi Xian', 'CN');
INSERT INTO `sys_region` VALUES (2831, '513435', '甘洛县', 293, 3, 0, 'Ganluo Xian', 'CN');
INSERT INTO `sys_region` VALUES (2832, '513436', '美姑县', 293, 3, 0, 'Meigu Xian', 'CN');
INSERT INTO `sys_region` VALUES (2833, '513437', '雷波县', 293, 3, 0, 'Leibo Xian', 'CN');
INSERT INTO `sys_region` VALUES (2834, '520101', '市辖区', 294, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (2835, '520102', '南明区', 294, 3, 0, 'Nanming Qu', 'CN');
INSERT INTO `sys_region` VALUES (2836, '520103', '云岩区', 294, 3, 0, 'Yunyan Qu', 'CN');
INSERT INTO `sys_region` VALUES (2837, '520111', '花溪区', 294, 3, 0, 'Huaxi Qu', 'CN');
INSERT INTO `sys_region` VALUES (2838, '520112', '乌当区', 294, 3, 0, 'Wudang Qu', 'CN');
INSERT INTO `sys_region` VALUES (2839, '520113', '白云区', 294, 3, 0, 'Baiyun Qu', 'CN');
INSERT INTO `sys_region` VALUES (2840, '520114', '小河区', 294, 3, 0, 'Xiaohe Qu', 'CN');
INSERT INTO `sys_region` VALUES (2841, '520121', '开阳县', 294, 3, 0, 'Kaiyang Xian', 'CN');
INSERT INTO `sys_region` VALUES (2842, '520122', '息烽县', 294, 3, 0, 'Xifeng Xian', 'CN');
INSERT INTO `sys_region` VALUES (2843, '520123', '修文县', 294, 3, 0, 'Xiuwen Xian', 'CN');
INSERT INTO `sys_region` VALUES (2844, '520181', '清镇市', 294, 3, 0, 'Qingzhen Shi', 'CN');
INSERT INTO `sys_region` VALUES (2845, '520201', '钟山区', 295, 3, 0, 'Zhongshan Qu', 'CN');
INSERT INTO `sys_region` VALUES (2846, '520203', '六枝特区', 295, 3, 0, 'Liuzhi Tequ', 'CN');
INSERT INTO `sys_region` VALUES (2847, '520221', '水城县', 295, 3, 0, 'Shuicheng Xian', 'CN');
INSERT INTO `sys_region` VALUES (2848, '520222', '盘县', 295, 3, 0, 'Pan Xian', 'CN');
INSERT INTO `sys_region` VALUES (2849, '520301', '市辖区', 296, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (2850, '520302', '红花岗区', 296, 3, 0, 'Honghuagang Qu', 'CN');
INSERT INTO `sys_region` VALUES (2851, '520303', '汇川区', 296, 3, 0, 'Huichuan Qu', 'CN');
INSERT INTO `sys_region` VALUES (2852, '520321', '遵义县', 296, 3, 0, 'Zunyi Xian', 'CN');
INSERT INTO `sys_region` VALUES (2853, '520322', '桐梓县', 296, 3, 0, 'Tongzi Xian', 'CN');
INSERT INTO `sys_region` VALUES (2854, '520323', '绥阳县', 296, 3, 0, 'Suiyang Xian', 'CN');
INSERT INTO `sys_region` VALUES (2855, '520324', '正安县', 296, 3, 0, 'Zhengan Xan', 'CN');
INSERT INTO `sys_region` VALUES (2856, '520325', '道真仡佬族苗族自治县', 296, 3, 0, 'Daozhen Gelaozu Miaozu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (2857, '520326', '务川仡佬族苗族自治县', 296, 3, 0, 'Wuchuan Gelaozu Miaozu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (2858, '520327', '凤冈县', 296, 3, 0, 'Fenggang Xian', 'CN');
INSERT INTO `sys_region` VALUES (2859, '520328', '湄潭县', 296, 3, 0, 'Meitan Xian', 'CN');
INSERT INTO `sys_region` VALUES (2860, '520329', '余庆县', 296, 3, 0, 'Yuqing Xian', 'CN');
INSERT INTO `sys_region` VALUES (2861, '520330', '习水县', 296, 3, 0, 'Xishui Xian', 'CN');
INSERT INTO `sys_region` VALUES (2862, '520381', '赤水市', 296, 3, 0, 'Chishui Shi', 'CN');
INSERT INTO `sys_region` VALUES (2863, '520382', '仁怀市', 296, 3, 0, 'Renhuai Shi', 'CN');
INSERT INTO `sys_region` VALUES (2864, '520401', '市辖区', 297, 3, 0, '1', 'CN');
INSERT INTO `sys_region` VALUES (2865, '520402', '西秀区', 297, 3, 0, 'Xixiu Qu', 'CN');
INSERT INTO `sys_region` VALUES (2866, '520421', '平坝县', 297, 3, 0, 'Pingba Xian', 'CN');
INSERT INTO `sys_region` VALUES (2867, '520422', '普定县', 297, 3, 0, 'Puding Xian', 'CN');
INSERT INTO `sys_region` VALUES (2868, '520423', '镇宁布依族苗族自治县', 297, 3, 0, 'Zhenning Buyeizu Miaozu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (2869, '520424', '关岭布依族苗族自治县', 297, 3, 0, 'Guanling Buyeizu Miaozu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (2870, '520425', '紫云苗族布依族自治县', 297, 3, 0, 'Ziyun Miaozu Buyeizu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (2871, '522201', '铜仁市', 298, 3, 0, 'Tongren Shi', 'CN');
INSERT INTO `sys_region` VALUES (2872, '522222', '江口县', 298, 3, 0, 'Jiangkou Xian', 'CN');
INSERT INTO `sys_region` VALUES (2873, '522223', '玉屏侗族自治县', 298, 3, 0, 'Yuping Dongzu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (2874, '522224', '石阡县', 298, 3, 0, 'Shiqian Xian', 'CN');
INSERT INTO `sys_region` VALUES (2875, '522225', '思南县', 298, 3, 0, 'Sinan Xian', 'CN');
INSERT INTO `sys_region` VALUES (2876, '522226', '印江土家族苗族自治县', 298, 3, 0, 'Yinjiang Tujiazu Miaozu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (2877, '522227', '德江县', 298, 3, 0, 'Dejiang Xian', 'CN');
INSERT INTO `sys_region` VALUES (2878, '522228', '沿河土家族自治县', 298, 3, 0, 'Yanhe Tujiazu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (2879, '522229', '松桃苗族自治县', 298, 3, 0, 'Songtao Miaozu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (2880, '522230', '万山特区', 298, 3, 0, 'Wanshan Tequ', 'CN');
INSERT INTO `sys_region` VALUES (2881, '522301', '兴义市', 299, 3, 0, 'Xingyi Shi', 'CN');
INSERT INTO `sys_region` VALUES (2882, '522322', '兴仁县', 299, 3, 0, 'Xingren Xian', 'CN');
INSERT INTO `sys_region` VALUES (2883, '522323', '普安县', 299, 3, 0, 'Pu,an Xian', 'CN');
INSERT INTO `sys_region` VALUES (2884, '522324', '晴隆县', 299, 3, 0, 'Qinglong Xian', 'CN');
INSERT INTO `sys_region` VALUES (2885, '522325', '贞丰县', 299, 3, 0, 'Zhenfeng Xian', 'CN');
INSERT INTO `sys_region` VALUES (2886, '522326', '望谟县', 299, 3, 0, 'Wangmo Xian', 'CN');
INSERT INTO `sys_region` VALUES (2887, '522327', '册亨县', 299, 3, 0, 'Ceheng Xian', 'CN');
INSERT INTO `sys_region` VALUES (2888, '522328', '安龙县', 299, 3, 0, 'Anlong Xian', 'CN');
INSERT INTO `sys_region` VALUES (2889, '522401', '毕节市', 300, 3, 0, 'Bijie Shi', 'CN');
INSERT INTO `sys_region` VALUES (2890, '522422', '大方县', 300, 3, 0, 'Dafang Xian', 'CN');
INSERT INTO `sys_region` VALUES (2891, '522423', '黔西县', 300, 3, 0, 'Qianxi Xian', 'CN');
INSERT INTO `sys_region` VALUES (2892, '522424', '金沙县', 300, 3, 0, 'Jinsha Xian', 'CN');
INSERT INTO `sys_region` VALUES (2893, '522425', '织金县', 300, 3, 0, 'Zhijin Xian', 'CN');
INSERT INTO `sys_region` VALUES (2894, '522426', '纳雍县', 300, 3, 0, 'Nayong Xian', 'CN');
INSERT INTO `sys_region` VALUES (2895, '522427', '威宁彝族回族苗族自治县', 300, 3, 0, 'Weining Yizu Huizu Miaozu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (2896, '522428', '赫章县', 300, 3, 0, 'Hezhang Xian', 'CN');
INSERT INTO `sys_region` VALUES (2897, '522601', '凯里市', 301, 3, 0, 'Kaili Shi', 'CN');
INSERT INTO `sys_region` VALUES (2898, '522622', '黄平县', 301, 3, 0, 'Huangping Xian', 'CN');
INSERT INTO `sys_region` VALUES (2899, '522623', '施秉县', 301, 3, 0, 'Shibing Xian', 'CN');
INSERT INTO `sys_region` VALUES (2900, '522624', '三穗县', 301, 3, 0, 'Sansui Xian', 'CN');
INSERT INTO `sys_region` VALUES (2901, '522625', '镇远县', 301, 3, 0, 'Zhenyuan Xian', 'CN');
INSERT INTO `sys_region` VALUES (2902, '522626', '岑巩县', 301, 3, 0, 'Cengong Xian', 'CN');
INSERT INTO `sys_region` VALUES (2903, '522627', '天柱县', 301, 3, 0, 'Tianzhu Xian', 'CN');
INSERT INTO `sys_region` VALUES (2904, '522628', '锦屏县', 301, 3, 0, 'Jinping Xian', 'CN');
INSERT INTO `sys_region` VALUES (2905, '522629', '剑河县', 301, 3, 0, 'Jianhe Xian', 'CN');
INSERT INTO `sys_region` VALUES (2906, '522630', '台江县', 301, 3, 0, 'Taijiang Xian', 'CN');
INSERT INTO `sys_region` VALUES (2907, '522631', '黎平县', 301, 3, 0, 'Liping Xian', 'CN');
INSERT INTO `sys_region` VALUES (2908, '522632', '榕江县', 301, 3, 0, 'Rongjiang Xian', 'CN');
INSERT INTO `sys_region` VALUES (2909, '522633', '从江县', 301, 3, 0, 'Congjiang Xian', 'CN');
INSERT INTO `sys_region` VALUES (2910, '522634', '雷山县', 301, 3, 0, 'Leishan Xian', 'CN');
INSERT INTO `sys_region` VALUES (2911, '522635', '麻江县', 301, 3, 0, 'Majiang Xian', 'CN');
INSERT INTO `sys_region` VALUES (2912, '522636', '丹寨县', 301, 3, 0, 'Danzhai Xian', 'CN');
INSERT INTO `sys_region` VALUES (2913, '522701', '都匀市', 302, 3, 0, 'Duyun Shi', 'CN');
INSERT INTO `sys_region` VALUES (2914, '522702', '福泉市', 302, 3, 0, 'Fuquan Shi', 'CN');
INSERT INTO `sys_region` VALUES (2915, '522722', '荔波县', 302, 3, 0, 'Libo Xian', 'CN');
INSERT INTO `sys_region` VALUES (2916, '522723', '贵定县', 302, 3, 0, 'Guiding Xian', 'CN');
INSERT INTO `sys_region` VALUES (2917, '522725', '瓮安县', 302, 3, 0, 'Weng,an Xian', 'CN');
INSERT INTO `sys_region` VALUES (2918, '522726', '独山县', 302, 3, 0, 'Dushan Xian', 'CN');
INSERT INTO `sys_region` VALUES (2919, '522727', '平塘县', 302, 3, 0, 'Pingtang Xian', 'CN');
INSERT INTO `sys_region` VALUES (2920, '522728', '罗甸县', 302, 3, 0, 'Luodian Xian', 'CN');
INSERT INTO `sys_region` VALUES (2921, '522729', '长顺县', 302, 3, 0, 'Changshun Xian', 'CN');
INSERT INTO `sys_region` VALUES (2922, '522730', '龙里县', 302, 3, 0, 'Longli Xian', 'CN');
INSERT INTO `sys_region` VALUES (2923, '522731', '惠水县', 302, 3, 0, 'Huishui Xian', 'CN');
INSERT INTO `sys_region` VALUES (2924, '522732', '三都水族自治县', 302, 3, 0, 'Sandu Suizu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (2925, '530101', '市辖区', 303, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (2926, '530102', '五华区', 303, 3, 0, 'Wuhua Qu', 'CN');
INSERT INTO `sys_region` VALUES (2927, '530103', '盘龙区', 303, 3, 0, 'Panlong Qu', 'CN');
INSERT INTO `sys_region` VALUES (2928, '530111', '官渡区', 303, 3, 0, 'Guandu Qu', 'CN');
INSERT INTO `sys_region` VALUES (2929, '530112', '西山区', 303, 3, 0, 'Xishan Qu', 'CN');
INSERT INTO `sys_region` VALUES (2930, '530113', '东川区', 303, 3, 0, 'Dongchuan Qu', 'CN');
INSERT INTO `sys_region` VALUES (2931, '530121', '呈贡县', 303, 3, 0, 'Chenggong Xian', 'CN');
INSERT INTO `sys_region` VALUES (2932, '530122', '晋宁县', 303, 3, 0, 'Jinning Xian', 'CN');
INSERT INTO `sys_region` VALUES (2933, '530124', '富民县', 303, 3, 0, 'Fumin Xian', 'CN');
INSERT INTO `sys_region` VALUES (2934, '530125', '宜良县', 303, 3, 0, 'Yiliang Xian', 'CN');
INSERT INTO `sys_region` VALUES (2935, '530126', '石林彝族自治县', 303, 3, 0, 'Shilin Yizu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (2936, '530127', '嵩明县', 303, 3, 0, 'Songming Xian', 'CN');
INSERT INTO `sys_region` VALUES (2937, '530128', '禄劝彝族苗族自治县', 303, 3, 0, 'Luchuan Yizu Miaozu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (2938, '530129', '寻甸回族彝族自治县', 303, 3, 0, 'Xundian Huizu Yizu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (2939, '530181', '安宁市', 303, 3, 0, 'Anning Shi', 'CN');
INSERT INTO `sys_region` VALUES (2940, '530301', '市辖区', 304, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (2941, '530302', '麒麟区', 304, 3, 0, 'Qilin Xian', 'CN');
INSERT INTO `sys_region` VALUES (2942, '530321', '马龙县', 304, 3, 0, 'Malong Xian', 'CN');
INSERT INTO `sys_region` VALUES (2943, '530322', '陆良县', 304, 3, 0, 'Luliang Xian', 'CN');
INSERT INTO `sys_region` VALUES (2944, '530323', '师宗县', 304, 3, 0, 'Shizong Xian', 'CN');
INSERT INTO `sys_region` VALUES (2945, '530324', '罗平县', 304, 3, 0, 'Luoping Xian', 'CN');
INSERT INTO `sys_region` VALUES (2946, '530325', '富源县', 304, 3, 0, 'Fuyuan Xian', 'CN');
INSERT INTO `sys_region` VALUES (2947, '530326', '会泽县', 304, 3, 0, 'Huize Xian', 'CN');
INSERT INTO `sys_region` VALUES (2948, '530328', '沾益县', 304, 3, 0, 'Zhanyi Xian', 'CN');
INSERT INTO `sys_region` VALUES (2949, '530381', '宣威市', 304, 3, 0, 'Xuanwei Shi', 'CN');
INSERT INTO `sys_region` VALUES (2950, '530401', '市辖区', 305, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (2951, '530402', '红塔区', 305, 3, 0, 'Hongta Qu', 'CN');
INSERT INTO `sys_region` VALUES (2952, '530421', '江川县', 305, 3, 0, 'Jiangchuan Xian', 'CN');
INSERT INTO `sys_region` VALUES (2953, '530422', '澄江县', 305, 3, 0, 'Chengjiang Xian', 'CN');
INSERT INTO `sys_region` VALUES (2954, '530423', '通海县', 305, 3, 0, 'Tonghai Xian', 'CN');
INSERT INTO `sys_region` VALUES (2955, '530424', '华宁县', 305, 3, 0, 'Huaning Xian', 'CN');
INSERT INTO `sys_region` VALUES (2956, '530425', '易门县', 305, 3, 0, 'Yimen Xian', 'CN');
INSERT INTO `sys_region` VALUES (2957, '530426', '峨山彝族自治县', 305, 3, 0, 'Eshan Yizu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (2958, '530427', '新平彝族傣族自治县', 305, 3, 0, 'Xinping Yizu Daizu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (2959, '530428', '元江哈尼族彝族傣族自治县', 305, 3, 0, 'Yuanjiang Hanizu Yizu Daizu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (2960, '530501', '市辖区', 306, 3, 0, '1', 'CN');
INSERT INTO `sys_region` VALUES (2961, '530502', '隆阳区', 306, 3, 0, 'Longyang Qu', 'CN');
INSERT INTO `sys_region` VALUES (2962, '530521', '施甸县', 306, 3, 0, 'Shidian Xian', 'CN');
INSERT INTO `sys_region` VALUES (2963, '530522', '腾冲县', 306, 3, 0, 'Tengchong Xian', 'CN');
INSERT INTO `sys_region` VALUES (2964, '530523', '龙陵县', 306, 3, 0, 'Longling Xian', 'CN');
INSERT INTO `sys_region` VALUES (2965, '530524', '昌宁县', 306, 3, 0, 'Changning Xian', 'CN');
INSERT INTO `sys_region` VALUES (2966, '530601', '市辖区', 307, 3, 0, '1', 'CN');
INSERT INTO `sys_region` VALUES (2967, '530602', '昭阳区', 307, 3, 0, 'Zhaoyang Qu', 'CN');
INSERT INTO `sys_region` VALUES (2968, '530621', '鲁甸县', 307, 3, 0, 'Ludian Xian', 'CN');
INSERT INTO `sys_region` VALUES (2969, '530622', '巧家县', 307, 3, 0, 'Qiaojia Xian', 'CN');
INSERT INTO `sys_region` VALUES (2970, '530623', '盐津县', 307, 3, 0, 'Yanjin Xian', 'CN');
INSERT INTO `sys_region` VALUES (2971, '530624', '大关县', 307, 3, 0, 'Daguan Xian', 'CN');
INSERT INTO `sys_region` VALUES (2972, '530625', '永善县', 307, 3, 0, 'Yongshan Xian', 'CN');
INSERT INTO `sys_region` VALUES (2973, '530626', '绥江县', 307, 3, 0, 'Suijiang Xian', 'CN');
INSERT INTO `sys_region` VALUES (2974, '530627', '镇雄县', 307, 3, 0, 'Zhenxiong Xian', 'CN');
INSERT INTO `sys_region` VALUES (2975, '530628', '彝良县', 307, 3, 0, 'Yiliang Xian', 'CN');
INSERT INTO `sys_region` VALUES (2976, '530629', '威信县', 307, 3, 0, 'Weixin Xian', 'CN');
INSERT INTO `sys_region` VALUES (2977, '530630', '水富县', 307, 3, 0, 'Shuifu Xian ', 'CN');
INSERT INTO `sys_region` VALUES (2978, '530701', '市辖区', 308, 3, 0, '1', 'CN');
INSERT INTO `sys_region` VALUES (2979, '530702', '古城区', 308, 3, 0, 'Gucheng Qu', 'CN');
INSERT INTO `sys_region` VALUES (2980, '530721', '玉龙纳西族自治县', 308, 3, 0, 'Yulongnaxizuzizhi Xian', 'CN');
INSERT INTO `sys_region` VALUES (2981, '530722', '永胜县', 308, 3, 0, 'Yongsheng Xian', 'CN');
INSERT INTO `sys_region` VALUES (2982, '530723', '华坪县', 308, 3, 0, 'Huaping Xian', 'CN');
INSERT INTO `sys_region` VALUES (2983, '530724', '宁蒗彝族自治县', 308, 3, 0, 'Ninglang Yizu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (2984, '530801', '市辖区', 309, 3, 0, '1', 'CN');
INSERT INTO `sys_region` VALUES (2985, '530802', '思茅区', 309, 3, 0, 'Simao Qu', 'CN');
INSERT INTO `sys_region` VALUES (2986, '530821', '宁洱哈尼族彝族自治县', 309, 3, 0, 'Pu,er Hanizu Yizu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (2987, '530822', '墨江哈尼族自治县', 309, 3, 0, 'Mojiang Hanizu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (2988, '530823', '景东彝族自治县', 309, 3, 0, 'Jingdong Yizu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (2989, '530824', '景谷傣族彝族自治县', 309, 3, 0, 'Jinggu Daizu Yizu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (2990, '530825', '镇沅彝族哈尼族拉祜族自治县', 309, 3, 0, 'Zhenyuan Yizu Hanizu Lahuzu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (2991, '530826', '江城哈尼族彝族自治县', 309, 3, 0, 'Jiangcheng Hanizu Yizu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (2992, '530827', '孟连傣族拉祜族佤族自治县', 309, 3, 0, 'Menglian Daizu Lahuzu Vazu Zizixian', 'CN');
INSERT INTO `sys_region` VALUES (2993, '530828', '澜沧拉祜族自治县', 309, 3, 0, 'Lancang Lahuzu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (2994, '530829', '西盟佤族自治县', 309, 3, 0, 'Ximeng Vazu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (2995, '530901', '市辖区', 310, 3, 0, '1', 'CN');
INSERT INTO `sys_region` VALUES (2996, '530902', '临翔区', 310, 3, 0, 'Linxiang Qu', 'CN');
INSERT INTO `sys_region` VALUES (2997, '530921', '凤庆县', 310, 3, 0, 'Fengqing Xian', 'CN');
INSERT INTO `sys_region` VALUES (2998, '530922', '云县', 310, 3, 0, 'Yun Xian', 'CN');
INSERT INTO `sys_region` VALUES (2999, '530923', '永德县', 310, 3, 0, 'Yongde Xian', 'CN');
INSERT INTO `sys_region` VALUES (3000, '530924', '镇康县', 310, 3, 0, 'Zhenkang Xian', 'CN');
INSERT INTO `sys_region` VALUES (3001, '530925', '双江拉祜族佤族布朗族傣族自治县', 310, 3, 0, 'Shuangjiang Lahuzu Vazu Bulangzu Daizu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (3002, '530926', '耿马傣族佤族自治县', 310, 3, 0, 'Gengma Daizu Vazu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (3003, '530927', '沧源佤族自治县', 310, 3, 0, 'Cangyuan Vazu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (3004, '532301', '楚雄市', 311, 3, 0, 'Chuxiong Shi', 'CN');
INSERT INTO `sys_region` VALUES (3005, '532322', '双柏县', 311, 3, 0, 'Shuangbai Xian', 'CN');
INSERT INTO `sys_region` VALUES (3006, '532323', '牟定县', 311, 3, 0, 'Mouding Xian', 'CN');
INSERT INTO `sys_region` VALUES (3007, '532324', '南华县', 311, 3, 0, 'Nanhua Xian', 'CN');
INSERT INTO `sys_region` VALUES (3008, '532325', '姚安县', 311, 3, 0, 'Yao,an Xian', 'CN');
INSERT INTO `sys_region` VALUES (3009, '532326', '大姚县', 311, 3, 0, 'Dayao Xian', 'CN');
INSERT INTO `sys_region` VALUES (3010, '532327', '永仁县', 311, 3, 0, 'Yongren Xian', 'CN');
INSERT INTO `sys_region` VALUES (3011, '532328', '元谋县', 311, 3, 0, 'Yuanmou Xian', 'CN');
INSERT INTO `sys_region` VALUES (3012, '532329', '武定县', 311, 3, 0, 'Wuding Xian', 'CN');
INSERT INTO `sys_region` VALUES (3013, '532331', '禄丰县', 311, 3, 0, 'Lufeng Xian', 'CN');
INSERT INTO `sys_region` VALUES (3014, '532501', '个旧市', 312, 3, 0, 'Gejiu Shi', 'CN');
INSERT INTO `sys_region` VALUES (3015, '532502', '开远市', 312, 3, 0, 'Kaiyuan Shi', 'CN');
INSERT INTO `sys_region` VALUES (3016, '532503', '蒙自市', 312, 3, 0, 'Mengzi Xian', 'CN');
INSERT INTO `sys_region` VALUES (3017, '532523', '屏边苗族自治县', 312, 3, 0, 'Pingbian Miaozu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (3018, '532524', '建水县', 312, 3, 0, 'Jianshui Xian', 'CN');
INSERT INTO `sys_region` VALUES (3019, '532525', '石屏县', 312, 3, 0, 'Shiping Xian', 'CN');
INSERT INTO `sys_region` VALUES (3020, '532526', '弥勒县', 312, 3, 0, 'Mile Xian', 'CN');
INSERT INTO `sys_region` VALUES (3021, '532527', '泸西县', 312, 3, 0, 'Luxi Xian', 'CN');
INSERT INTO `sys_region` VALUES (3022, '532528', '元阳县', 312, 3, 0, 'Yuanyang Xian', 'CN');
INSERT INTO `sys_region` VALUES (3023, '532529', '红河县', 312, 3, 0, 'Honghe Xian', 'CN');
INSERT INTO `sys_region` VALUES (3024, '532530', '金平苗族瑶族傣族自治县', 312, 3, 0, 'Jinping Miaozu Yaozu Daizu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (3025, '532531', '绿春县', 312, 3, 0, 'Lvchun Xian', 'CN');
INSERT INTO `sys_region` VALUES (3026, '532532', '河口瑶族自治县', 312, 3, 0, 'Hekou Yaozu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (3027, '532621', '文山县', 313, 3, 0, 'Wenshan Xian', 'CN');
INSERT INTO `sys_region` VALUES (3028, '532622', '砚山县', 313, 3, 0, 'Yanshan Xian', 'CN');
INSERT INTO `sys_region` VALUES (3029, '532623', '西畴县', 313, 3, 0, 'Xichou Xian', 'CN');
INSERT INTO `sys_region` VALUES (3030, '532624', '麻栗坡县', 313, 3, 0, 'Malipo Xian', 'CN');
INSERT INTO `sys_region` VALUES (3031, '532625', '马关县', 313, 3, 0, 'Maguan Xian', 'CN');
INSERT INTO `sys_region` VALUES (3032, '532626', '丘北县', 313, 3, 0, 'Qiubei Xian', 'CN');
INSERT INTO `sys_region` VALUES (3033, '532627', '广南县', 313, 3, 0, 'Guangnan Xian', 'CN');
INSERT INTO `sys_region` VALUES (3034, '532628', '富宁县', 313, 3, 0, 'Funing Xian', 'CN');
INSERT INTO `sys_region` VALUES (3035, '532801', '景洪市', 314, 3, 0, 'Jinghong Shi', 'CN');
INSERT INTO `sys_region` VALUES (3036, '532822', '勐海县', 314, 3, 0, 'Menghai Xian', 'CN');
INSERT INTO `sys_region` VALUES (3037, '532823', '勐腊县', 314, 3, 0, 'Mengla Xian', 'CN');
INSERT INTO `sys_region` VALUES (3038, '532901', '大理市', 315, 3, 0, 'Dali Shi', 'CN');
INSERT INTO `sys_region` VALUES (3039, '532922', '漾濞彝族自治县', 315, 3, 0, 'Yangbi Yizu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (3040, '532923', '祥云县', 315, 3, 0, 'Xiangyun Xian', 'CN');
INSERT INTO `sys_region` VALUES (3041, '532924', '宾川县', 315, 3, 0, 'Binchuan Xian', 'CN');
INSERT INTO `sys_region` VALUES (3042, '532925', '弥渡县', 315, 3, 0, 'Midu Xian', 'CN');
INSERT INTO `sys_region` VALUES (3043, '532926', '南涧彝族自治县', 315, 3, 0, 'Nanjian Yizu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (3044, '532927', '巍山彝族回族自治县', 315, 3, 0, 'Weishan Yizu Huizu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (3045, '532928', '永平县', 315, 3, 0, 'Yongping Xian', 'CN');
INSERT INTO `sys_region` VALUES (3046, '532929', '云龙县', 315, 3, 0, 'Yunlong Xian', 'CN');
INSERT INTO `sys_region` VALUES (3047, '532930', '洱源县', 315, 3, 0, 'Eryuan Xian', 'CN');
INSERT INTO `sys_region` VALUES (3048, '532931', '剑川县', 315, 3, 0, 'Jianchuan Xian', 'CN');
INSERT INTO `sys_region` VALUES (3049, '532932', '鹤庆县', 315, 3, 0, 'Heqing Xian', 'CN');
INSERT INTO `sys_region` VALUES (3050, '533102', '瑞丽市', 316, 3, 0, 'Ruili Shi', 'CN');
INSERT INTO `sys_region` VALUES (3051, '533103', '芒市', 316, 3, 0, 'Luxi Shi', 'CN');
INSERT INTO `sys_region` VALUES (3052, '533122', '梁河县', 316, 3, 0, 'Lianghe Xian', 'CN');
INSERT INTO `sys_region` VALUES (3053, '533123', '盈江县', 316, 3, 0, 'Yingjiang Xian', 'CN');
INSERT INTO `sys_region` VALUES (3054, '533124', '陇川县', 316, 3, 0, 'Longchuan Xian', 'CN');
INSERT INTO `sys_region` VALUES (3055, '533321', '泸水县', 317, 3, 0, 'Lushui Xian', 'CN');
INSERT INTO `sys_region` VALUES (3056, '533323', '福贡县', 317, 3, 0, 'Fugong Xian', 'CN');
INSERT INTO `sys_region` VALUES (3057, '533324', '贡山独龙族怒族自治县', 317, 3, 0, 'Gongshan Dulongzu Nuzu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (3058, '533325', '兰坪白族普米族自治县', 317, 3, 0, 'Lanping Baizu Pumizu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (3059, '533421', '香格里拉县', 318, 3, 0, 'Xianggelila Xian', 'CN');
INSERT INTO `sys_region` VALUES (3060, '533422', '德钦县', 318, 3, 0, 'Deqen Xian', 'CN');
INSERT INTO `sys_region` VALUES (3061, '533423', '维西傈僳族自治县', 318, 3, 0, 'Weixi Lisuzu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (3062, '540101', '市辖区', 319, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (3063, '540102', '城关区', 319, 3, 0, 'Chengguang Qu', 'CN');
INSERT INTO `sys_region` VALUES (3064, '540121', '林周县', 319, 3, 0, 'Lhvnzhub Xian', 'CN');
INSERT INTO `sys_region` VALUES (3065, '540122', '当雄县', 319, 3, 0, 'Damxung Xian', 'CN');
INSERT INTO `sys_region` VALUES (3066, '540123', '尼木县', 319, 3, 0, 'Nyemo Xian', 'CN');
INSERT INTO `sys_region` VALUES (3067, '540124', '曲水县', 319, 3, 0, 'Qvxv Xian', 'CN');
INSERT INTO `sys_region` VALUES (3068, '540125', '堆龙德庆县', 319, 3, 0, 'Doilungdeqen Xian', 'CN');
INSERT INTO `sys_region` VALUES (3069, '540126', '达孜县', 319, 3, 0, 'Dagze Xian', 'CN');
INSERT INTO `sys_region` VALUES (3070, '540127', '墨竹工卡县', 319, 3, 0, 'Maizhokunggar Xian', 'CN');
INSERT INTO `sys_region` VALUES (3071, '542121', '昌都县', 320, 3, 0, 'Qamdo Xian', 'CN');
INSERT INTO `sys_region` VALUES (3072, '542122', '江达县', 320, 3, 0, 'Jomda Xian', 'CN');
INSERT INTO `sys_region` VALUES (3073, '542123', '贡觉县', 320, 3, 0, 'Konjo Xian', 'CN');
INSERT INTO `sys_region` VALUES (3074, '542124', '类乌齐县', 320, 3, 0, 'Riwoqe Xian', 'CN');
INSERT INTO `sys_region` VALUES (3075, '542125', '丁青县', 320, 3, 0, 'Dengqen Xian', 'CN');
INSERT INTO `sys_region` VALUES (3076, '542126', '察雅县', 320, 3, 0, 'Chagyab Xian', 'CN');
INSERT INTO `sys_region` VALUES (3077, '542127', '八宿县', 320, 3, 0, 'Baxoi Xian', 'CN');
INSERT INTO `sys_region` VALUES (3078, '542128', '左贡县', 320, 3, 0, 'Zogang Xian', 'CN');
INSERT INTO `sys_region` VALUES (3079, '542129', '芒康县', 320, 3, 0, 'Mangkam Xian', 'CN');
INSERT INTO `sys_region` VALUES (3080, '542132', '洛隆县', 320, 3, 0, 'Lhorong Xian', 'CN');
INSERT INTO `sys_region` VALUES (3081, '542133', '边坝县', 320, 3, 0, 'Banbar Xian', 'CN');
INSERT INTO `sys_region` VALUES (3082, '542221', '乃东县', 321, 3, 0, 'Nedong Xian', 'CN');
INSERT INTO `sys_region` VALUES (3083, '542222', '扎囊县', 321, 3, 0, 'Chanang(Chatang) Xian', 'CN');
INSERT INTO `sys_region` VALUES (3084, '542223', '贡嘎县', 321, 3, 0, 'Gonggar Xian', 'CN');
INSERT INTO `sys_region` VALUES (3085, '542224', '桑日县', 321, 3, 0, 'Sangri Xian', 'CN');
INSERT INTO `sys_region` VALUES (3086, '542225', '琼结县', 321, 3, 0, 'Qonggyai Xian', 'CN');
INSERT INTO `sys_region` VALUES (3087, '542226', '曲松县', 321, 3, 0, 'Qusum Xian', 'CN');
INSERT INTO `sys_region` VALUES (3088, '542227', '措美县', 321, 3, 0, 'Comai Xian', 'CN');
INSERT INTO `sys_region` VALUES (3089, '542228', '洛扎县', 321, 3, 0, 'Lhozhag Xian', 'CN');
INSERT INTO `sys_region` VALUES (3090, '542229', '加查县', 321, 3, 0, 'Gyaca Xian', 'CN');
INSERT INTO `sys_region` VALUES (3091, '542231', '隆子县', 321, 3, 0, 'Lhvnze Xian', 'CN');
INSERT INTO `sys_region` VALUES (3092, '542232', '错那县', 321, 3, 0, 'Cona Xian', 'CN');
INSERT INTO `sys_region` VALUES (3093, '542233', '浪卡子县', 321, 3, 0, 'Nagarze Xian', 'CN');
INSERT INTO `sys_region` VALUES (3094, '542301', '日喀则市', 322, 3, 0, 'Xigaze Shi', 'CN');
INSERT INTO `sys_region` VALUES (3095, '542322', '南木林县', 322, 3, 0, 'Namling Xian', 'CN');
INSERT INTO `sys_region` VALUES (3096, '542323', '江孜县', 322, 3, 0, 'Gyangze Xian', 'CN');
INSERT INTO `sys_region` VALUES (3097, '542324', '定日县', 322, 3, 0, 'Tingri Xian', 'CN');
INSERT INTO `sys_region` VALUES (3098, '542325', '萨迦县', 322, 3, 0, 'Sa,gya Xian', 'CN');
INSERT INTO `sys_region` VALUES (3099, '542326', '拉孜县', 322, 3, 0, 'Lhaze Xian', 'CN');
INSERT INTO `sys_region` VALUES (3100, '542327', '昂仁县', 322, 3, 0, 'Ngamring Xian', 'CN');
INSERT INTO `sys_region` VALUES (3101, '542328', '谢通门县', 322, 3, 0, 'Xaitongmoin Xian', 'CN');
INSERT INTO `sys_region` VALUES (3102, '542329', '白朗县', 322, 3, 0, 'Bainang Xian', 'CN');
INSERT INTO `sys_region` VALUES (3103, '542330', '仁布县', 322, 3, 0, 'Rinbung Xian', 'CN');
INSERT INTO `sys_region` VALUES (3104, '542331', '康马县', 322, 3, 0, 'Kangmar Xian', 'CN');
INSERT INTO `sys_region` VALUES (3105, '542332', '定结县', 322, 3, 0, 'Dinggye Xian', 'CN');
INSERT INTO `sys_region` VALUES (3106, '542333', '仲巴县', 322, 3, 0, 'Zhongba Xian', 'CN');
INSERT INTO `sys_region` VALUES (3107, '542334', '亚东县', 322, 3, 0, 'Yadong(Chomo) Xian', 'CN');
INSERT INTO `sys_region` VALUES (3108, '542335', '吉隆县', 322, 3, 0, 'Gyirong Xian', 'CN');
INSERT INTO `sys_region` VALUES (3109, '542336', '聂拉木县', 322, 3, 0, 'Nyalam Xian', 'CN');
INSERT INTO `sys_region` VALUES (3110, '542337', '萨嘎县', 322, 3, 0, 'Saga Xian', 'CN');
INSERT INTO `sys_region` VALUES (3111, '542338', '岗巴县', 322, 3, 0, 'Gamba Xian', 'CN');
INSERT INTO `sys_region` VALUES (3112, '542421', '那曲县', 323, 3, 0, 'Nagqu Xian', 'CN');
INSERT INTO `sys_region` VALUES (3113, '542422', '嘉黎县', 323, 3, 0, 'Lhari Xian', 'CN');
INSERT INTO `sys_region` VALUES (3114, '542423', '比如县', 323, 3, 0, 'Biru Xian', 'CN');
INSERT INTO `sys_region` VALUES (3115, '542424', '聂荣县', 323, 3, 0, 'Nyainrong Xian', 'CN');
INSERT INTO `sys_region` VALUES (3116, '542425', '安多县', 323, 3, 0, 'Amdo Xian', 'CN');
INSERT INTO `sys_region` VALUES (3117, '542426', '申扎县', 323, 3, 0, 'Xainza Xian', 'CN');
INSERT INTO `sys_region` VALUES (3118, '542427', '索县', 323, 3, 0, 'Sog Xian', 'CN');
INSERT INTO `sys_region` VALUES (3119, '542428', '班戈县', 323, 3, 0, 'Bangoin Xian', 'CN');
INSERT INTO `sys_region` VALUES (3120, '542429', '巴青县', 323, 3, 0, 'Baqen Xian', 'CN');
INSERT INTO `sys_region` VALUES (3121, '542430', '尼玛县', 323, 3, 0, 'Nyima Xian', 'CN');
INSERT INTO `sys_region` VALUES (3122, '542521', '普兰县', 324, 3, 0, 'Burang Xian', 'CN');
INSERT INTO `sys_region` VALUES (3123, '542522', '札达县', 324, 3, 0, 'Zanda Xian', 'CN');
INSERT INTO `sys_region` VALUES (3124, '542523', '噶尔县', 324, 3, 0, 'Gar Xian', 'CN');
INSERT INTO `sys_region` VALUES (3125, '542524', '日土县', 324, 3, 0, 'Rutog Xian', 'CN');
INSERT INTO `sys_region` VALUES (3126, '542525', '革吉县', 324, 3, 0, 'Ge,gyai Xian', 'CN');
INSERT INTO `sys_region` VALUES (3127, '542526', '改则县', 324, 3, 0, 'Gerze Xian', 'CN');
INSERT INTO `sys_region` VALUES (3128, '542527', '措勤县', 324, 3, 0, 'Coqen Xian', 'CN');
INSERT INTO `sys_region` VALUES (3129, '542621', '林芝县', 325, 3, 0, 'Nyingchi Xian', 'CN');
INSERT INTO `sys_region` VALUES (3130, '542622', '工布江达县', 325, 3, 0, 'Gongbo,gyamda Xian', 'CN');
INSERT INTO `sys_region` VALUES (3131, '542623', '米林县', 325, 3, 0, 'Mainling Xian', 'CN');
INSERT INTO `sys_region` VALUES (3132, '542624', '墨脱县', 325, 3, 0, 'Metog Xian', 'CN');
INSERT INTO `sys_region` VALUES (3133, '542625', '波密县', 325, 3, 0, 'Bomi(Bowo) Xian', 'CN');
INSERT INTO `sys_region` VALUES (3134, '542626', '察隅县', 325, 3, 0, 'Zayv Xian', 'CN');
INSERT INTO `sys_region` VALUES (3135, '542627', '朗县', 325, 3, 0, 'Nang Xian', 'CN');
INSERT INTO `sys_region` VALUES (3136, '610101', '市辖区', 326, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (3137, '610102', '新城区', 326, 3, 0, 'Xincheng Qu', 'CN');
INSERT INTO `sys_region` VALUES (3138, '610103', '碑林区', 326, 3, 0, 'Beilin Qu', 'CN');
INSERT INTO `sys_region` VALUES (3139, '610104', '莲湖区', 326, 3, 0, 'Lianhu Qu', 'CN');
INSERT INTO `sys_region` VALUES (3140, '610111', '灞桥区', 326, 3, 0, 'Baqiao Qu', 'CN');
INSERT INTO `sys_region` VALUES (3141, '610112', '未央区', 326, 3, 0, 'Weiyang Qu', 'CN');
INSERT INTO `sys_region` VALUES (3142, '610113', '雁塔区', 326, 3, 0, 'Yanta Qu', 'CN');
INSERT INTO `sys_region` VALUES (3143, '610114', '阎良区', 326, 3, 0, 'Yanliang Qu', 'CN');
INSERT INTO `sys_region` VALUES (3144, '610115', '临潼区', 326, 3, 0, 'Lintong Qu', 'CN');
INSERT INTO `sys_region` VALUES (3145, '610116', '长安区', 326, 3, 0, 'Changan Qu', 'CN');
INSERT INTO `sys_region` VALUES (3146, '610122', '蓝田县', 326, 3, 0, 'Lantian Xian', 'CN');
INSERT INTO `sys_region` VALUES (3147, '610124', '周至县', 326, 3, 0, 'Zhouzhi Xian', 'CN');
INSERT INTO `sys_region` VALUES (3148, '610125', '户县', 326, 3, 0, 'Hu Xian', 'CN');
INSERT INTO `sys_region` VALUES (3149, '610126', '高陵县', 326, 3, 0, 'Gaoling Xian', 'CN');
INSERT INTO `sys_region` VALUES (3150, '610201', '市辖区', 327, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (3151, '610202', '王益区', 327, 3, 0, 'Wangyi Qu', 'CN');
INSERT INTO `sys_region` VALUES (3152, '610203', '印台区', 327, 3, 0, 'Yintai Qu', 'CN');
INSERT INTO `sys_region` VALUES (3153, '610204', '耀州区', 327, 3, 0, 'Yaozhou Qu', 'CN');
INSERT INTO `sys_region` VALUES (3154, '610222', '宜君县', 327, 3, 0, 'Yijun Xian', 'CN');
INSERT INTO `sys_region` VALUES (3155, '610301', '市辖区', 328, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (3156, '610302', '渭滨区', 328, 3, 0, 'Weibin Qu', 'CN');
INSERT INTO `sys_region` VALUES (3157, '610303', '金台区', 328, 3, 0, 'Jintai Qu', 'CN');
INSERT INTO `sys_region` VALUES (3158, '610304', '陈仓区', 328, 3, 0, 'Chencang Qu', 'CN');
INSERT INTO `sys_region` VALUES (3159, '610322', '凤翔县', 328, 3, 0, 'Fengxiang Xian', 'CN');
INSERT INTO `sys_region` VALUES (3160, '610323', '岐山县', 328, 3, 0, 'Qishan Xian', 'CN');
INSERT INTO `sys_region` VALUES (3161, '610324', '扶风县', 328, 3, 0, 'Fufeng Xian', 'CN');
INSERT INTO `sys_region` VALUES (3162, '610326', '眉县', 328, 3, 0, 'Mei Xian', 'CN');
INSERT INTO `sys_region` VALUES (3163, '610327', '陇县', 328, 3, 0, 'Long Xian', 'CN');
INSERT INTO `sys_region` VALUES (3164, '610328', '千阳县', 328, 3, 0, 'Qianyang Xian', 'CN');
INSERT INTO `sys_region` VALUES (3165, '610329', '麟游县', 328, 3, 0, 'Linyou Xian', 'CN');
INSERT INTO `sys_region` VALUES (3166, '610330', '凤县', 328, 3, 0, 'Feng Xian', 'CN');
INSERT INTO `sys_region` VALUES (3167, '610331', '太白县', 328, 3, 0, 'Taibai Xian', 'CN');
INSERT INTO `sys_region` VALUES (3168, '610401', '市辖区', 329, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (3169, '610402', '秦都区', 329, 3, 0, 'Qindu Qu', 'CN');
INSERT INTO `sys_region` VALUES (3170, '610403', '杨陵区', 329, 3, 0, 'Yangling Qu', 'CN');
INSERT INTO `sys_region` VALUES (3171, '610404', '渭城区', 329, 3, 0, 'Weicheng Qu', 'CN');
INSERT INTO `sys_region` VALUES (3172, '610422', '三原县', 329, 3, 0, 'Sanyuan Xian', 'CN');
INSERT INTO `sys_region` VALUES (3173, '610423', '泾阳县', 329, 3, 0, 'Jingyang Xian', 'CN');
INSERT INTO `sys_region` VALUES (3174, '610424', '乾县', 329, 3, 0, 'Qian Xian', 'CN');
INSERT INTO `sys_region` VALUES (3175, '610425', '礼泉县', 329, 3, 0, 'Liquan Xian', 'CN');
INSERT INTO `sys_region` VALUES (3176, '610426', '永寿县', 329, 3, 0, 'Yongshou Xian', 'CN');
INSERT INTO `sys_region` VALUES (3177, '610427', '彬县', 329, 3, 0, 'Bin Xian', 'CN');
INSERT INTO `sys_region` VALUES (3178, '610428', '长武县', 329, 3, 0, 'Changwu Xian', 'CN');
INSERT INTO `sys_region` VALUES (3179, '610429', '旬邑县', 329, 3, 0, 'Xunyi Xian', 'CN');
INSERT INTO `sys_region` VALUES (3180, '610430', '淳化县', 329, 3, 0, 'Chunhua Xian', 'CN');
INSERT INTO `sys_region` VALUES (3181, '610431', '武功县', 329, 3, 0, 'Wugong Xian', 'CN');
INSERT INTO `sys_region` VALUES (3182, '610481', '兴平市', 329, 3, 0, 'Xingping Shi', 'CN');
INSERT INTO `sys_region` VALUES (3183, '610501', '市辖区', 330, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (3184, '610502', '临渭区', 330, 3, 0, 'Linwei Qu', 'CN');
INSERT INTO `sys_region` VALUES (3185, '610521', '华县', 330, 3, 0, 'Hua Xian', 'CN');
INSERT INTO `sys_region` VALUES (3186, '610522', '潼关县', 330, 3, 0, 'Tongguan Xian', 'CN');
INSERT INTO `sys_region` VALUES (3187, '610523', '大荔县', 330, 3, 0, 'Dali Xian', 'CN');
INSERT INTO `sys_region` VALUES (3188, '610524', '合阳县', 330, 3, 0, 'Heyang Xian', 'CN');
INSERT INTO `sys_region` VALUES (3189, '610525', '澄城县', 330, 3, 0, 'Chengcheng Xian', 'CN');
INSERT INTO `sys_region` VALUES (3190, '610526', '蒲城县', 330, 3, 0, 'Pucheng Xian', 'CN');
INSERT INTO `sys_region` VALUES (3191, '610527', '白水县', 330, 3, 0, 'Baishui Xian', 'CN');
INSERT INTO `sys_region` VALUES (3192, '610528', '富平县', 330, 3, 0, 'Fuping Xian', 'CN');
INSERT INTO `sys_region` VALUES (3193, '610581', '韩城市', 330, 3, 0, 'Hancheng Shi', 'CN');
INSERT INTO `sys_region` VALUES (3194, '610582', '华阴市', 330, 3, 0, 'Huayin Shi', 'CN');
INSERT INTO `sys_region` VALUES (3195, '610601', '市辖区', 331, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (3196, '610602', '宝塔区', 331, 3, 0, 'Baota Qu', 'CN');
INSERT INTO `sys_region` VALUES (3197, '610621', '延长县', 331, 3, 0, 'Yanchang Xian', 'CN');
INSERT INTO `sys_region` VALUES (3198, '610622', '延川县', 331, 3, 0, 'Yanchuan Xian', 'CN');
INSERT INTO `sys_region` VALUES (3199, '610623', '子长县', 331, 3, 0, 'Zichang Xian', 'CN');
INSERT INTO `sys_region` VALUES (3200, '610624', '安塞县', 331, 3, 0, 'Ansai Xian', 'CN');
INSERT INTO `sys_region` VALUES (3201, '610625', '志丹县', 331, 3, 0, 'Zhidan Xian', 'CN');
INSERT INTO `sys_region` VALUES (3202, '610626', '吴起县', 331, 3, 0, 'Wuqi Xian', 'CN');
INSERT INTO `sys_region` VALUES (3203, '610627', '甘泉县', 331, 3, 0, 'Ganquan Xian', 'CN');
INSERT INTO `sys_region` VALUES (3204, '610628', '富县', 331, 3, 0, 'Fu Xian', 'CN');
INSERT INTO `sys_region` VALUES (3205, '610629', '洛川县', 331, 3, 0, 'Luochuan Xian', 'CN');
INSERT INTO `sys_region` VALUES (3206, '610630', '宜川县', 331, 3, 0, 'Yichuan Xian', 'CN');
INSERT INTO `sys_region` VALUES (3207, '610631', '黄龙县', 331, 3, 0, 'Huanglong Xian', 'CN');
INSERT INTO `sys_region` VALUES (3208, '610632', '黄陵县', 331, 3, 0, 'Huangling Xian', 'CN');
INSERT INTO `sys_region` VALUES (3209, '610701', '市辖区', 332, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (3210, '610702', '汉台区', 332, 3, 0, 'Hantai Qu', 'CN');
INSERT INTO `sys_region` VALUES (3211, '610721', '南郑县', 332, 3, 0, 'Nanzheng Xian', 'CN');
INSERT INTO `sys_region` VALUES (3212, '610722', '城固县', 332, 3, 0, 'Chenggu Xian', 'CN');
INSERT INTO `sys_region` VALUES (3213, '610723', '洋县', 332, 3, 0, 'Yang Xian', 'CN');
INSERT INTO `sys_region` VALUES (3214, '610724', '西乡县', 332, 3, 0, 'Xixiang Xian', 'CN');
INSERT INTO `sys_region` VALUES (3215, '610725', '勉县', 332, 3, 0, 'Mian Xian', 'CN');
INSERT INTO `sys_region` VALUES (3216, '610726', '宁强县', 332, 3, 0, 'Ningqiang Xian', 'CN');
INSERT INTO `sys_region` VALUES (3217, '610727', '略阳县', 332, 3, 0, 'Lueyang Xian', 'CN');
INSERT INTO `sys_region` VALUES (3218, '610728', '镇巴县', 332, 3, 0, 'Zhenba Xian', 'CN');
INSERT INTO `sys_region` VALUES (3219, '610729', '留坝县', 332, 3, 0, 'Liuba Xian', 'CN');
INSERT INTO `sys_region` VALUES (3220, '610730', '佛坪县', 332, 3, 0, 'Foping Xian', 'CN');
INSERT INTO `sys_region` VALUES (3221, '610801', '市辖区', 333, 3, 0, '1', 'CN');
INSERT INTO `sys_region` VALUES (3222, '610802', '榆阳区', 333, 3, 0, 'Yuyang Qu', 'CN');
INSERT INTO `sys_region` VALUES (3223, '610821', '神木县', 333, 3, 0, 'Shenmu Xian', 'CN');
INSERT INTO `sys_region` VALUES (3224, '610822', '府谷县', 333, 3, 0, 'Fugu Xian', 'CN');
INSERT INTO `sys_region` VALUES (3225, '610823', '横山县', 333, 3, 0, 'Hengshan Xian', 'CN');
INSERT INTO `sys_region` VALUES (3226, '610824', '靖边县', 333, 3, 0, 'Jingbian Xian', 'CN');
INSERT INTO `sys_region` VALUES (3227, '610825', '定边县', 333, 3, 0, 'Dingbian Xian', 'CN');
INSERT INTO `sys_region` VALUES (3228, '610826', '绥德县', 333, 3, 0, 'Suide Xian', 'CN');
INSERT INTO `sys_region` VALUES (3229, '610827', '米脂县', 333, 3, 0, 'Mizhi Xian', 'CN');
INSERT INTO `sys_region` VALUES (3230, '610828', '佳县', 333, 3, 0, 'Jia Xian', 'CN');
INSERT INTO `sys_region` VALUES (3231, '610829', '吴堡县', 333, 3, 0, 'Wubu Xian', 'CN');
INSERT INTO `sys_region` VALUES (3232, '610830', '清涧县', 333, 3, 0, 'Qingjian Xian', 'CN');
INSERT INTO `sys_region` VALUES (3233, '610831', '子洲县', 333, 3, 0, 'Zizhou Xian', 'CN');
INSERT INTO `sys_region` VALUES (3234, '610901', '市辖区', 334, 3, 0, '1', 'CN');
INSERT INTO `sys_region` VALUES (3235, '610902', '汉滨区', 334, 3, 0, 'Hanbin Qu', 'CN');
INSERT INTO `sys_region` VALUES (3236, '610921', '汉阴县', 334, 3, 0, 'Hanyin Xian', 'CN');
INSERT INTO `sys_region` VALUES (3237, '610922', '石泉县', 334, 3, 0, 'Shiquan Xian', 'CN');
INSERT INTO `sys_region` VALUES (3238, '610923', '宁陕县', 334, 3, 0, 'Ningshan Xian', 'CN');
INSERT INTO `sys_region` VALUES (3239, '610924', '紫阳县', 334, 3, 0, 'Ziyang Xian', 'CN');
INSERT INTO `sys_region` VALUES (3240, '610925', '岚皋县', 334, 3, 0, 'Langao Xian', 'CN');
INSERT INTO `sys_region` VALUES (3241, '610926', '平利县', 334, 3, 0, 'Pingli Xian', 'CN');
INSERT INTO `sys_region` VALUES (3242, '610927', '镇坪县', 334, 3, 0, 'Zhenping Xian', 'CN');
INSERT INTO `sys_region` VALUES (3243, '610928', '旬阳县', 334, 3, 0, 'Xunyang Xian', 'CN');
INSERT INTO `sys_region` VALUES (3244, '610929', '白河县', 334, 3, 0, 'Baihe Xian', 'CN');
INSERT INTO `sys_region` VALUES (3245, '611001', '市辖区', 335, 3, 0, '1', 'CN');
INSERT INTO `sys_region` VALUES (3246, '611002', '商州区', 335, 3, 0, 'Shangzhou Qu', 'CN');
INSERT INTO `sys_region` VALUES (3247, '611021', '洛南县', 335, 3, 0, 'Luonan Xian', 'CN');
INSERT INTO `sys_region` VALUES (3248, '611022', '丹凤县', 335, 3, 0, 'Danfeng Xian', 'CN');
INSERT INTO `sys_region` VALUES (3249, '611023', '商南县', 335, 3, 0, 'Shangnan Xian', 'CN');
INSERT INTO `sys_region` VALUES (3250, '611024', '山阳县', 335, 3, 0, 'Shanyang Xian', 'CN');
INSERT INTO `sys_region` VALUES (3251, '611025', '镇安县', 335, 3, 0, 'Zhen,an Xian', 'CN');
INSERT INTO `sys_region` VALUES (3252, '611026', '柞水县', 335, 3, 0, 'Zhashui Xian', 'CN');
INSERT INTO `sys_region` VALUES (3253, '620101', '市辖区', 336, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (3254, '620102', '城关区', 336, 3, 0, 'Chengguan Qu', 'CN');
INSERT INTO `sys_region` VALUES (3255, '620103', '七里河区', 336, 3, 0, 'Qilihe Qu', 'CN');
INSERT INTO `sys_region` VALUES (3256, '620104', '西固区', 336, 3, 0, 'Xigu Qu', 'CN');
INSERT INTO `sys_region` VALUES (3257, '620105', '安宁区', 336, 3, 0, 'Anning Qu', 'CN');
INSERT INTO `sys_region` VALUES (3258, '620111', '红古区', 336, 3, 0, 'Honggu Qu', 'CN');
INSERT INTO `sys_region` VALUES (3259, '620121', '永登县', 336, 3, 0, 'Yongdeng Xian', 'CN');
INSERT INTO `sys_region` VALUES (3260, '620122', '皋兰县', 336, 3, 0, 'Gaolan Xian', 'CN');
INSERT INTO `sys_region` VALUES (3261, '620123', '榆中县', 336, 3, 0, 'Yuzhong Xian', 'CN');
INSERT INTO `sys_region` VALUES (3262, '620201', '市辖区', 337, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (3263, '620301', '市辖区', 338, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (3264, '620302', '金川区', 338, 3, 0, 'Jinchuan Qu', 'CN');
INSERT INTO `sys_region` VALUES (3265, '620321', '永昌县', 338, 3, 0, 'Yongchang Xian', 'CN');
INSERT INTO `sys_region` VALUES (3266, '620401', '市辖区', 339, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (3267, '620402', '白银区', 339, 3, 0, 'Baiyin Qu', 'CN');
INSERT INTO `sys_region` VALUES (3268, '620403', '平川区', 339, 3, 0, 'Pingchuan Qu', 'CN');
INSERT INTO `sys_region` VALUES (3269, '620421', '靖远县', 339, 3, 0, 'Jingyuan Xian', 'CN');
INSERT INTO `sys_region` VALUES (3270, '620422', '会宁县', 339, 3, 0, 'Huining xian', 'CN');
INSERT INTO `sys_region` VALUES (3271, '620423', '景泰县', 339, 3, 0, 'Jingtai Xian', 'CN');
INSERT INTO `sys_region` VALUES (3272, '620501', '市辖区', 340, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (3274, '620502', '秦州区', 340, 3, 0, 'Beidao Qu', 'CN');
INSERT INTO `sys_region` VALUES (3275, '620521', '清水县', 340, 3, 0, 'Qingshui Xian', 'CN');
INSERT INTO `sys_region` VALUES (3276, '620522', '秦安县', 340, 3, 0, 'Qin,an Xian', 'CN');
INSERT INTO `sys_region` VALUES (3277, '620523', '甘谷县', 340, 3, 0, 'Gangu Xian', 'CN');
INSERT INTO `sys_region` VALUES (3278, '620524', '武山县', 340, 3, 0, 'Wushan Xian', 'CN');
INSERT INTO `sys_region` VALUES (3279, '620525', '张家川回族自治县', 340, 3, 0, 'Zhangjiachuan Huizu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (3280, '620601', '市辖区', 341, 3, 0, '1', 'CN');
INSERT INTO `sys_region` VALUES (3281, '620602', '凉州区', 341, 3, 0, 'Liangzhou Qu', 'CN');
INSERT INTO `sys_region` VALUES (3282, '620621', '民勤县', 341, 3, 0, 'Minqin Xian', 'CN');
INSERT INTO `sys_region` VALUES (3283, '620622', '古浪县', 341, 3, 0, 'Gulang Xian', 'CN');
INSERT INTO `sys_region` VALUES (3284, '620623', '天祝藏族自治县', 341, 3, 0, 'Tianzhu Zangzu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (3285, '620701', '市辖区', 342, 3, 0, '1', 'CN');
INSERT INTO `sys_region` VALUES (3286, '620702', '甘州区', 342, 3, 0, 'Ganzhou Qu', 'CN');
INSERT INTO `sys_region` VALUES (3287, '620721', '肃南裕固族自治县', 342, 3, 0, 'Sunan Yugurzu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (3288, '620722', '民乐县', 342, 3, 0, 'Minle Xian', 'CN');
INSERT INTO `sys_region` VALUES (3289, '620723', '临泽县', 342, 3, 0, 'Linze Xian', 'CN');
INSERT INTO `sys_region` VALUES (3290, '620724', '高台县', 342, 3, 0, 'Gaotai Xian', 'CN');
INSERT INTO `sys_region` VALUES (3291, '620725', '山丹县', 342, 3, 0, 'Shandan Xian', 'CN');
INSERT INTO `sys_region` VALUES (3292, '620801', '市辖区', 343, 3, 0, '1', 'CN');
INSERT INTO `sys_region` VALUES (3293, '620802', '崆峒区', 343, 3, 0, 'Kongdong Qu', 'CN');
INSERT INTO `sys_region` VALUES (3294, '620821', '泾川县', 343, 3, 0, 'Jingchuan Xian', 'CN');
INSERT INTO `sys_region` VALUES (3295, '620822', '灵台县', 343, 3, 0, 'Lingtai Xian', 'CN');
INSERT INTO `sys_region` VALUES (3296, '620823', '崇信县', 343, 3, 0, 'Chongxin Xian', 'CN');
INSERT INTO `sys_region` VALUES (3297, '620824', '华亭县', 343, 3, 0, 'Huating Xian', 'CN');
INSERT INTO `sys_region` VALUES (3298, '620825', '庄浪县', 343, 3, 0, 'Zhuanglang Xian', 'CN');
INSERT INTO `sys_region` VALUES (3299, '620826', '静宁县', 343, 3, 0, 'Jingning Xian', 'CN');
INSERT INTO `sys_region` VALUES (3300, '620901', '市辖区', 344, 3, 0, '1', 'CN');
INSERT INTO `sys_region` VALUES (3301, '620902', '肃州区', 344, 3, 0, 'Suzhou Qu', 'CN');
INSERT INTO `sys_region` VALUES (3302, '620921', '金塔县', 344, 3, 0, 'Jinta Xian', 'CN');
INSERT INTO `sys_region` VALUES (3304, '620923', '肃北蒙古族自治县', 344, 3, 0, 'Subei Monguzu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (3305, '620924', '阿克塞哈萨克族自治县', 344, 3, 0, 'Aksay Kazakzu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (3306, '620981', '玉门市', 344, 3, 0, 'Yumen Shi', 'CN');
INSERT INTO `sys_region` VALUES (3307, '620982', '敦煌市', 344, 3, 0, 'Dunhuang Shi', 'CN');
INSERT INTO `sys_region` VALUES (3308, '621001', '市辖区', 345, 3, 0, '1', 'CN');
INSERT INTO `sys_region` VALUES (3309, '621002', '西峰区', 345, 3, 0, 'Xifeng Qu', 'CN');
INSERT INTO `sys_region` VALUES (3310, '621021', '庆城县', 345, 3, 0, 'Qingcheng Xian', 'CN');
INSERT INTO `sys_region` VALUES (3311, '621022', '环县', 345, 3, 0, 'Huan Xian', 'CN');
INSERT INTO `sys_region` VALUES (3312, '621023', '华池县', 345, 3, 0, 'Huachi Xian', 'CN');
INSERT INTO `sys_region` VALUES (3313, '621024', '合水县', 345, 3, 0, 'Heshui Xian', 'CN');
INSERT INTO `sys_region` VALUES (3314, '621025', '正宁县', 345, 3, 0, 'Zhengning Xian', 'CN');
INSERT INTO `sys_region` VALUES (3315, '621026', '宁县', 345, 3, 0, 'Ning Xian', 'CN');
INSERT INTO `sys_region` VALUES (3316, '621027', '镇原县', 345, 3, 0, 'Zhenyuan Xian', 'CN');
INSERT INTO `sys_region` VALUES (3317, '621101', '市辖区', 346, 3, 0, '1', 'CN');
INSERT INTO `sys_region` VALUES (3318, '621102', '安定区', 346, 3, 0, 'Anding Qu', 'CN');
INSERT INTO `sys_region` VALUES (3319, '621121', '通渭县', 346, 3, 0, 'Tongwei Xian', 'CN');
INSERT INTO `sys_region` VALUES (3320, '621122', '陇西县', 346, 3, 0, 'Longxi Xian', 'CN');
INSERT INTO `sys_region` VALUES (3321, '621123', '渭源县', 346, 3, 0, 'Weiyuan Xian', 'CN');
INSERT INTO `sys_region` VALUES (3322, '621124', '临洮县', 346, 3, 0, 'Lintao Xian', 'CN');
INSERT INTO `sys_region` VALUES (3323, '621125', '漳县', 346, 3, 0, 'Zhang Xian', 'CN');
INSERT INTO `sys_region` VALUES (3324, '621126', '岷县', 346, 3, 0, 'Min Xian', 'CN');
INSERT INTO `sys_region` VALUES (3325, '621201', '市辖区', 347, 3, 0, '1', 'CN');
INSERT INTO `sys_region` VALUES (3326, '621202', '武都区', 347, 3, 0, 'Wudu Qu', 'CN');
INSERT INTO `sys_region` VALUES (3327, '621221', '成县', 347, 3, 0, 'Cheng Xian', 'CN');
INSERT INTO `sys_region` VALUES (3328, '621222', '文县', 347, 3, 0, 'Wen Xian', 'CN');
INSERT INTO `sys_region` VALUES (3329, '621223', '宕昌县', 347, 3, 0, 'Dangchang Xian', 'CN');
INSERT INTO `sys_region` VALUES (3330, '621224', '康县', 347, 3, 0, 'Kang Xian', 'CN');
INSERT INTO `sys_region` VALUES (3331, '621225', '西和县', 347, 3, 0, 'Xihe Xian', 'CN');
INSERT INTO `sys_region` VALUES (3332, '621226', '礼县', 347, 3, 0, 'Li Xian', 'CN');
INSERT INTO `sys_region` VALUES (3333, '621227', '徽县', 347, 3, 0, 'Hui Xian', 'CN');
INSERT INTO `sys_region` VALUES (3334, '621228', '两当县', 347, 3, 0, 'Liangdang Xian', 'CN');
INSERT INTO `sys_region` VALUES (3335, '622901', '临夏市', 348, 3, 0, 'Linxia Shi', 'CN');
INSERT INTO `sys_region` VALUES (3336, '622921', '临夏县', 348, 3, 0, 'Linxia Xian', 'CN');
INSERT INTO `sys_region` VALUES (3337, '622922', '康乐县', 348, 3, 0, 'Kangle Xian', 'CN');
INSERT INTO `sys_region` VALUES (3338, '622923', '永靖县', 348, 3, 0, 'Yongjing Xian', 'CN');
INSERT INTO `sys_region` VALUES (3339, '622924', '广河县', 348, 3, 0, 'Guanghe Xian', 'CN');
INSERT INTO `sys_region` VALUES (3340, '622925', '和政县', 348, 3, 0, 'Hezheng Xian', 'CN');
INSERT INTO `sys_region` VALUES (3341, '622926', '东乡族自治县', 348, 3, 0, 'Dongxiangzu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (3342, '622927', '积石山保安族东乡族撒拉族自治县', 348, 3, 0, 'Jishishan Bonanzu Dongxiangzu Salarzu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (3343, '623001', '合作市', 349, 3, 0, 'Hezuo Shi', 'CN');
INSERT INTO `sys_region` VALUES (3344, '623021', '临潭县', 349, 3, 0, 'Lintan Xian', 'CN');
INSERT INTO `sys_region` VALUES (3345, '623022', '卓尼县', 349, 3, 0, 'Jone', 'CN');
INSERT INTO `sys_region` VALUES (3346, '623023', '舟曲县', 349, 3, 0, 'Zhugqu Xian', 'CN');
INSERT INTO `sys_region` VALUES (3347, '623024', '迭部县', 349, 3, 0, 'Tewo Xian', 'CN');
INSERT INTO `sys_region` VALUES (3348, '623025', '玛曲县', 349, 3, 0, 'Maqu Xian', 'CN');
INSERT INTO `sys_region` VALUES (3349, '623026', '碌曲县', 349, 3, 0, 'Luqu Xian', 'CN');
INSERT INTO `sys_region` VALUES (3350, '623027', '夏河县', 349, 3, 0, 'Xiahe Xian', 'CN');
INSERT INTO `sys_region` VALUES (3351, '630101', '市辖区', 350, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (3352, '630102', '城东区', 350, 3, 0, 'Chengdong Qu', 'CN');
INSERT INTO `sys_region` VALUES (3353, '630103', '城中区', 350, 3, 0, 'Chengzhong Qu', 'CN');
INSERT INTO `sys_region` VALUES (3354, '630104', '城西区', 350, 3, 0, 'Chengxi Qu', 'CN');
INSERT INTO `sys_region` VALUES (3355, '630105', '城北区', 350, 3, 0, 'Chengbei Qu', 'CN');
INSERT INTO `sys_region` VALUES (3356, '630121', '大通回族土族自治县', 350, 3, 0, 'Datong Huizu Tuzu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (3357, '630122', '湟中县', 350, 3, 0, 'Huangzhong Xian', 'CN');
INSERT INTO `sys_region` VALUES (3358, '630123', '湟源县', 350, 3, 0, 'Huangyuan Xian', 'CN');
INSERT INTO `sys_region` VALUES (3359, '632121', '平安县', 351, 3, 0, 'Ping,an Xian', 'CN');
INSERT INTO `sys_region` VALUES (3360, '632122', '民和回族土族自治县', 351, 3, 0, 'Minhe Huizu Tuzu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (3361, '632123', '乐都县', 351, 3, 0, 'Ledu Xian', 'CN');
INSERT INTO `sys_region` VALUES (3362, '632126', '互助土族自治县', 351, 3, 0, 'Huzhu Tuzu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (3363, '632127', '化隆回族自治县', 351, 3, 0, 'Hualong Huizu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (3364, '632128', '循化撒拉族自治县', 351, 3, 0, 'Xunhua Salazu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (3365, '632221', '门源回族自治县', 352, 3, 0, 'Menyuan Huizu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (3366, '632222', '祁连县', 352, 3, 0, 'Qilian Xian', 'CN');
INSERT INTO `sys_region` VALUES (3367, '632223', '海晏县', 352, 3, 0, 'Haiyan Xian', 'CN');
INSERT INTO `sys_region` VALUES (3368, '632224', '刚察县', 352, 3, 0, 'Gangca Xian', 'CN');
INSERT INTO `sys_region` VALUES (3369, '632321', '同仁县', 353, 3, 0, 'Tongren Xian', 'CN');
INSERT INTO `sys_region` VALUES (3370, '632322', '尖扎县', 353, 3, 0, 'Jainca Xian', 'CN');
INSERT INTO `sys_region` VALUES (3371, '632323', '泽库县', 353, 3, 0, 'Zekog Xian', 'CN');
INSERT INTO `sys_region` VALUES (3372, '632324', '河南蒙古族自治县', 353, 3, 0, 'Henan Mongolzu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (3373, '632521', '共和县', 354, 3, 0, 'Gonghe Xian', 'CN');
INSERT INTO `sys_region` VALUES (3374, '632522', '同德县', 354, 3, 0, 'Tongde Xian', 'CN');
INSERT INTO `sys_region` VALUES (3375, '632523', '贵德县', 354, 3, 0, 'Guide Xian', 'CN');
INSERT INTO `sys_region` VALUES (3376, '632524', '兴海县', 354, 3, 0, 'Xinghai Xian', 'CN');
INSERT INTO `sys_region` VALUES (3377, '632525', '贵南县', 354, 3, 0, 'Guinan Xian', 'CN');
INSERT INTO `sys_region` VALUES (3378, '632621', '玛沁县', 355, 3, 0, 'Maqen Xian', 'CN');
INSERT INTO `sys_region` VALUES (3379, '632622', '班玛县', 355, 3, 0, 'Baima Xian', 'CN');
INSERT INTO `sys_region` VALUES (3380, '632623', '甘德县', 355, 3, 0, 'Gade Xian', 'CN');
INSERT INTO `sys_region` VALUES (3381, '632624', '达日县', 355, 3, 0, 'Tarlag Xian', 'CN');
INSERT INTO `sys_region` VALUES (3382, '632625', '久治县', 355, 3, 0, 'Jigzhi Xian', 'CN');
INSERT INTO `sys_region` VALUES (3383, '632626', '玛多县', 355, 3, 0, 'Madoi Xian', 'CN');
INSERT INTO `sys_region` VALUES (3384, '632721', '玉树县', 356, 3, 0, 'Yushu Xian', 'CN');
INSERT INTO `sys_region` VALUES (3385, '632722', '杂多县', 356, 3, 0, 'Zadoi Xian', 'CN');
INSERT INTO `sys_region` VALUES (3386, '632723', '称多县', 356, 3, 0, 'Chindu Xian', 'CN');
INSERT INTO `sys_region` VALUES (3387, '632724', '治多县', 356, 3, 0, 'Zhidoi Xian', 'CN');
INSERT INTO `sys_region` VALUES (3388, '632725', '囊谦县', 356, 3, 0, 'Nangqen Xian', 'CN');
INSERT INTO `sys_region` VALUES (3389, '632726', '曲麻莱县', 356, 3, 0, 'Qumarleb Xian', 'CN');
INSERT INTO `sys_region` VALUES (3390, '632801', '格尔木市', 357, 3, 0, 'Golmud Shi', 'CN');
INSERT INTO `sys_region` VALUES (3391, '632802', '德令哈市', 357, 3, 0, 'Delhi Shi', 'CN');
INSERT INTO `sys_region` VALUES (3392, '632821', '乌兰县', 357, 3, 0, 'Ulan Xian', 'CN');
INSERT INTO `sys_region` VALUES (3393, '632822', '都兰县', 357, 3, 0, 'Dulan Xian', 'CN');
INSERT INTO `sys_region` VALUES (3394, '632823', '天峻县', 357, 3, 0, 'Tianjun Xian', 'CN');
INSERT INTO `sys_region` VALUES (3395, '640101', '市辖区', 358, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (3396, '640104', '兴庆区', 358, 3, 0, 'Xingqing Qu', 'CN');
INSERT INTO `sys_region` VALUES (3397, '640105', '西夏区', 358, 3, 0, 'Xixia Qu', 'CN');
INSERT INTO `sys_region` VALUES (3398, '640106', '金凤区', 358, 3, 0, 'Jinfeng Qu', 'CN');
INSERT INTO `sys_region` VALUES (3399, '640121', '永宁县', 358, 3, 0, 'Yongning Xian', 'CN');
INSERT INTO `sys_region` VALUES (3400, '640122', '贺兰县', 358, 3, 0, 'Helan Xian', 'CN');
INSERT INTO `sys_region` VALUES (3401, '640181', '灵武市', 358, 3, 0, 'Lingwu Shi', 'CN');
INSERT INTO `sys_region` VALUES (3402, '640201', '市辖区', 359, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (3403, '640202', '大武口区', 359, 3, 0, 'Dawukou Qu', 'CN');
INSERT INTO `sys_region` VALUES (3404, '640205', '惠农区', 359, 3, 0, 'Huinong Qu', 'CN');
INSERT INTO `sys_region` VALUES (3405, '640221', '平罗县', 359, 3, 0, 'Pingluo Xian', 'CN');
INSERT INTO `sys_region` VALUES (3406, '640301', '市辖区', 360, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (3407, '640302', '利通区', 360, 3, 0, 'Litong Qu', 'CN');
INSERT INTO `sys_region` VALUES (3408, '640323', '盐池县', 360, 3, 0, 'Yanchi Xian', 'CN');
INSERT INTO `sys_region` VALUES (3409, '640324', '同心县', 360, 3, 0, 'Tongxin Xian', 'CN');
INSERT INTO `sys_region` VALUES (3410, '640381', '青铜峡市', 360, 3, 0, 'Qingtongxia Xian', 'CN');
INSERT INTO `sys_region` VALUES (3411, '640401', '市辖区', 361, 3, 0, '1', 'CN');
INSERT INTO `sys_region` VALUES (3412, '640402', '原州区', 361, 3, 0, 'Yuanzhou Qu', 'CN');
INSERT INTO `sys_region` VALUES (3413, '640422', '西吉县', 361, 3, 0, 'Xiji Xian', 'CN');
INSERT INTO `sys_region` VALUES (3414, '640423', '隆德县', 361, 3, 0, 'Longde Xian', 'CN');
INSERT INTO `sys_region` VALUES (3415, '640424', '泾源县', 361, 3, 0, 'Jingyuan Xian', 'CN');
INSERT INTO `sys_region` VALUES (3416, '640425', '彭阳县', 361, 3, 0, 'Pengyang Xian', 'CN');
INSERT INTO `sys_region` VALUES (3417, '640501', '市辖区', 362, 3, 0, '1', 'CN');
INSERT INTO `sys_region` VALUES (3418, '640502', '沙坡头区', 362, 3, 0, 'Shapotou Qu', 'CN');
INSERT INTO `sys_region` VALUES (3419, '640521', '中宁县', 362, 3, 0, 'Zhongning Xian', 'CN');
INSERT INTO `sys_region` VALUES (3420, '640522', '海原县', 362, 3, 0, 'Haiyuan Xian', 'CN');
INSERT INTO `sys_region` VALUES (3421, '650101', '市辖区', 363, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (3422, '650102', '天山区', 363, 3, 0, 'Tianshan Qu', 'CN');
INSERT INTO `sys_region` VALUES (3423, '650103', '沙依巴克区', 363, 3, 0, 'Saybag Qu', 'CN');
INSERT INTO `sys_region` VALUES (3424, '650104', '新市区', 363, 3, 0, 'Xinshi Qu', 'CN');
INSERT INTO `sys_region` VALUES (3425, '650105', '水磨沟区', 363, 3, 0, 'Shuimogou Qu', 'CN');
INSERT INTO `sys_region` VALUES (3426, '650106', '头屯河区', 363, 3, 0, 'Toutunhe Qu', 'CN');
INSERT INTO `sys_region` VALUES (3427, '650107', '达坂城区', 363, 3, 0, 'Dabancheng Qu', 'CN');
INSERT INTO `sys_region` VALUES (3428, '650109', '米东区', 363, 3, 0, 'Midong Qu', 'CN');
INSERT INTO `sys_region` VALUES (3429, '650121', '乌鲁木齐县', 363, 3, 0, 'Urumqi Xian', 'CN');
INSERT INTO `sys_region` VALUES (3430, '650201', '市辖区', 364, 3, 0, 'Shixiaqu', 'CN');
INSERT INTO `sys_region` VALUES (3431, '650202', '独山子区', 364, 3, 0, 'Dushanzi Qu', 'CN');
INSERT INTO `sys_region` VALUES (3432, '650203', '克拉玛依区', 364, 3, 0, 'Karamay Qu', 'CN');
INSERT INTO `sys_region` VALUES (3433, '650204', '白碱滩区', 364, 3, 0, 'Baijiantan Qu', 'CN');
INSERT INTO `sys_region` VALUES (3434, '650205', '乌尔禾区', 364, 3, 0, 'Orku Qu', 'CN');
INSERT INTO `sys_region` VALUES (3435, '652101', '吐鲁番市', 365, 3, 0, 'Turpan Shi', 'CN');
INSERT INTO `sys_region` VALUES (3436, '652122', '鄯善县', 365, 3, 0, 'Shanshan(piqan) Xian', 'CN');
INSERT INTO `sys_region` VALUES (3437, '652123', '托克逊县', 365, 3, 0, 'Toksun Xian', 'CN');
INSERT INTO `sys_region` VALUES (3438, '652201', '哈密市', 366, 3, 0, 'Hami(kumul) Shi', 'CN');
INSERT INTO `sys_region` VALUES (3439, '652222', '巴里坤哈萨克自治县', 366, 3, 0, 'Barkol Kazak Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (3440, '652223', '伊吾县', 366, 3, 0, 'Yiwu(Araturuk) Xian', 'CN');
INSERT INTO `sys_region` VALUES (3441, '652301', '昌吉市', 367, 3, 0, 'Changji Shi', 'CN');
INSERT INTO `sys_region` VALUES (3442, '652302', '阜康市', 367, 3, 0, 'Fukang Shi', 'CN');
INSERT INTO `sys_region` VALUES (3444, '652323', '呼图壁县', 367, 3, 0, 'Hutubi Xian', 'CN');
INSERT INTO `sys_region` VALUES (3445, '652324', '玛纳斯县', 367, 3, 0, 'Manas Xian', 'CN');
INSERT INTO `sys_region` VALUES (3446, '652325', '奇台县', 367, 3, 0, 'Qitai Xian', 'CN');
INSERT INTO `sys_region` VALUES (3447, '652327', '吉木萨尔县', 367, 3, 0, 'Jimsar Xian', 'CN');
INSERT INTO `sys_region` VALUES (3448, '652328', '木垒哈萨克自治县', 367, 3, 0, 'Mori Kazak Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (3449, '652701', '博乐市', 368, 3, 0, 'Bole(Bortala) Shi', 'CN');
INSERT INTO `sys_region` VALUES (3450, '652722', '精河县', 368, 3, 0, 'Jinghe(Jing) Xian', 'CN');
INSERT INTO `sys_region` VALUES (3451, '652723', '温泉县', 368, 3, 0, 'Wenquan(Arixang) Xian', 'CN');
INSERT INTO `sys_region` VALUES (3452, '652801', '库尔勒市', 369, 3, 0, 'Korla Shi', 'CN');
INSERT INTO `sys_region` VALUES (3453, '652822', '轮台县', 369, 3, 0, 'Luntai(Bugur) Xian', 'CN');
INSERT INTO `sys_region` VALUES (3454, '652823', '尉犁县', 369, 3, 0, 'Yuli(Lopnur) Xian', 'CN');
INSERT INTO `sys_region` VALUES (3455, '652824', '若羌县', 369, 3, 0, 'Ruoqiang(Qakilik) Xian', 'CN');
INSERT INTO `sys_region` VALUES (3456, '652825', '且末县', 369, 3, 0, 'Qiemo(Qarqan) Xian', 'CN');
INSERT INTO `sys_region` VALUES (3457, '652826', '焉耆回族自治县', 369, 3, 0, 'Yanqi Huizu Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (3458, '652827', '和静县', 369, 3, 0, 'Hejing Xian', 'CN');
INSERT INTO `sys_region` VALUES (3459, '652828', '和硕县', 369, 3, 0, 'Hoxud Xian', 'CN');
INSERT INTO `sys_region` VALUES (3460, '652829', '博湖县', 369, 3, 0, 'Bohu(Bagrax) Xian', 'CN');
INSERT INTO `sys_region` VALUES (3461, '652901', '阿克苏市', 370, 3, 0, 'Aksu Shi', 'CN');
INSERT INTO `sys_region` VALUES (3462, '652922', '温宿县', 370, 3, 0, 'Wensu Xian', 'CN');
INSERT INTO `sys_region` VALUES (3463, '652923', '库车县', 370, 3, 0, 'Kuqa Xian', 'CN');
INSERT INTO `sys_region` VALUES (3464, '652924', '沙雅县', 370, 3, 0, 'Xayar Xian', 'CN');
INSERT INTO `sys_region` VALUES (3465, '652925', '新和县', 370, 3, 0, 'Xinhe(Toksu) Xian', 'CN');
INSERT INTO `sys_region` VALUES (3466, '652926', '拜城县', 370, 3, 0, 'Baicheng(Bay) Xian', 'CN');
INSERT INTO `sys_region` VALUES (3467, '652927', '乌什县', 370, 3, 0, 'Wushi(Uqturpan) Xian', 'CN');
INSERT INTO `sys_region` VALUES (3468, '652928', '阿瓦提县', 370, 3, 0, 'Awat Xian', 'CN');
INSERT INTO `sys_region` VALUES (3469, '652929', '柯坪县', 370, 3, 0, 'Kalpin Xian', 'CN');
INSERT INTO `sys_region` VALUES (3470, '653001', '阿图什市', 371, 3, 0, 'Artux Shi', 'CN');
INSERT INTO `sys_region` VALUES (3471, '653022', '阿克陶县', 371, 3, 0, 'Akto Xian', 'CN');
INSERT INTO `sys_region` VALUES (3472, '653023', '阿合奇县', 371, 3, 0, 'Akqi Xian', 'CN');
INSERT INTO `sys_region` VALUES (3473, '653024', '乌恰县', 371, 3, 0, 'Wuqia(Ulugqat) Xian', 'CN');
INSERT INTO `sys_region` VALUES (3474, '653101', '喀什市', 372, 3, 0, 'Kashi (Kaxgar) Shi', 'CN');
INSERT INTO `sys_region` VALUES (3475, '653121', '疏附县', 372, 3, 0, 'Shufu Xian', 'CN');
INSERT INTO `sys_region` VALUES (3476, '653122', '疏勒县', 372, 3, 0, 'Shule Xian', 'CN');
INSERT INTO `sys_region` VALUES (3477, '653123', '英吉沙县', 372, 3, 0, 'Yengisar Xian', 'CN');
INSERT INTO `sys_region` VALUES (3478, '653124', '泽普县', 372, 3, 0, 'Zepu(Poskam) Xian', 'CN');
INSERT INTO `sys_region` VALUES (3479, '653125', '莎车县', 372, 3, 0, 'Shache(Yarkant) Xian', 'CN');
INSERT INTO `sys_region` VALUES (3480, '653126', '叶城县', 372, 3, 0, 'Yecheng(Kargilik) Xian', 'CN');
INSERT INTO `sys_region` VALUES (3481, '653127', '麦盖提县', 372, 3, 0, 'Markit Xian', 'CN');
INSERT INTO `sys_region` VALUES (3482, '653128', '岳普湖县', 372, 3, 0, 'Yopurga Xian', 'CN');
INSERT INTO `sys_region` VALUES (3483, '653129', '伽师县', 372, 3, 0, 'Jiashi(Payzawat) Xian', 'CN');
INSERT INTO `sys_region` VALUES (3484, '653130', '巴楚县', 372, 3, 0, 'Bachu(Maralbexi) Xian', 'CN');
INSERT INTO `sys_region` VALUES (3485, '653131', '塔什库尔干塔吉克自治县', 372, 3, 0, 'Taxkorgan Tajik Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (3486, '653201', '和田市', 373, 3, 0, 'Hotan Shi', 'CN');
INSERT INTO `sys_region` VALUES (3487, '653221', '和田县', 373, 3, 0, 'Hotan Xian', 'CN');
INSERT INTO `sys_region` VALUES (3488, '653222', '墨玉县', 373, 3, 0, 'Moyu(Karakax) Xian', 'CN');
INSERT INTO `sys_region` VALUES (3489, '653223', '皮山县', 373, 3, 0, 'Pishan(Guma) Xian', 'CN');
INSERT INTO `sys_region` VALUES (3490, '653224', '洛浦县', 373, 3, 0, 'Lop Xian', 'CN');
INSERT INTO `sys_region` VALUES (3491, '653225', '策勒县', 373, 3, 0, 'Qira Xian', 'CN');
INSERT INTO `sys_region` VALUES (3492, '653226', '于田县', 373, 3, 0, 'Yutian(Keriya) Xian', 'CN');
INSERT INTO `sys_region` VALUES (3493, '653227', '民丰县', 373, 3, 0, 'Minfeng(Niya) Xian', 'CN');
INSERT INTO `sys_region` VALUES (3494, '654002', '伊宁市', 374, 3, 0, 'Yining(Gulja) Shi', 'CN');
INSERT INTO `sys_region` VALUES (3495, '654003', '奎屯市', 374, 3, 0, 'Kuytun Shi', 'CN');
INSERT INTO `sys_region` VALUES (3496, '654021', '伊宁县', 374, 3, 0, 'Yining(Gulja) Xian', 'CN');
INSERT INTO `sys_region` VALUES (3497, '654022', '察布查尔锡伯自治县', 374, 3, 0, 'Qapqal Xibe Zizhixian', 'CN');
INSERT INTO `sys_region` VALUES (3498, '654023', '霍城县', 374, 3, 0, 'Huocheng Xin', 'CN');
INSERT INTO `sys_region` VALUES (3499, '654024', '巩留县', 374, 3, 0, 'Gongliu(Tokkuztara) Xian', 'CN');
INSERT INTO `sys_region` VALUES (3500, '654025', '新源县', 374, 3, 0, 'Xinyuan(Kunes) Xian', 'CN');
INSERT INTO `sys_region` VALUES (3501, '654026', '昭苏县', 374, 3, 0, 'Zhaosu(Mongolkure) Xian', 'CN');
INSERT INTO `sys_region` VALUES (3502, '654027', '特克斯县', 374, 3, 0, 'Tekes Xian', 'CN');
INSERT INTO `sys_region` VALUES (3503, '654028', '尼勒克县', 374, 3, 0, 'Nilka Xian', 'CN');
INSERT INTO `sys_region` VALUES (3504, '654201', '塔城市', 375, 3, 0, 'Tacheng(Qoqek) Shi', 'CN');
INSERT INTO `sys_region` VALUES (3505, '654202', '乌苏市', 375, 3, 0, 'Usu Shi', 'CN');
INSERT INTO `sys_region` VALUES (3506, '654221', '额敏县', 375, 3, 0, 'Emin(Dorbiljin) Xian', 'CN');
INSERT INTO `sys_region` VALUES (3507, '654223', '沙湾县', 375, 3, 0, 'Shawan Xian', 'CN');
INSERT INTO `sys_region` VALUES (3508, '654224', '托里县', 375, 3, 0, 'Toli Xian', 'CN');
INSERT INTO `sys_region` VALUES (3509, '654225', '裕民县', 375, 3, 0, 'Yumin(Qagantokay) Xian', 'CN');
INSERT INTO `sys_region` VALUES (3510, '654226', '和布克赛尔蒙古自治县', 375, 3, 0, 'Hebukesaiermengguzizhi Xian', 'CN');
INSERT INTO `sys_region` VALUES (3511, '654301', '阿勒泰市', 376, 3, 0, 'Altay Shi', 'CN');
INSERT INTO `sys_region` VALUES (3512, '654321', '布尔津县', 376, 3, 0, 'Burqin Xian', 'CN');
INSERT INTO `sys_region` VALUES (3513, '654322', '富蕴县', 376, 3, 0, 'Fuyun(Koktokay) Xian', 'CN');
INSERT INTO `sys_region` VALUES (3514, '654323', '福海县', 376, 3, 0, 'Fuhai(Burultokay) Xian', 'CN');
INSERT INTO `sys_region` VALUES (3515, '654324', '哈巴河县', 376, 3, 0, 'Habahe(Kaba) Xian', 'CN');
INSERT INTO `sys_region` VALUES (3516, '654325', '青河县', 376, 3, 0, 'Qinghe(Qinggil) Xian', 'CN');
INSERT INTO `sys_region` VALUES (3517, '654326', '吉木乃县', 376, 3, 0, 'Jeminay Xian', 'CN');
INSERT INTO `sys_region` VALUES (3518, '659001', '石河子市', 377, 3, 0, 'Shihezi Shi', 'CN');
INSERT INTO `sys_region` VALUES (3519, '659002', '阿拉尔市', 377, 3, 0, 'Alaer Shi', 'CN');
INSERT INTO `sys_region` VALUES (3520, '659003', '图木舒克市', 377, 3, 0, 'Tumushuke Shi', 'CN');
INSERT INTO `sys_region` VALUES (3521, '659004', '五家渠市', 377, 3, 0, 'Wujiaqu Shi', 'CN');
INSERT INTO `sys_region` VALUES (4000, '620503', '麦积区', 340, 3, 0, 'Maiji Qu', 'CN');
INSERT INTO `sys_region` VALUES (4001, '500116', '江津区', 270, 3, 0, 'Jiangjin Qu', 'CN');
INSERT INTO `sys_region` VALUES (4002, '500117', '合川区', 270, 3, 0, 'Hechuan Qu', 'CN');
INSERT INTO `sys_region` VALUES (4003, '500118', '永川区', 270, 3, 0, 'Yongchuan Qu', 'CN');
INSERT INTO `sys_region` VALUES (4004, '500119', '南川区', 270, 3, 0, 'Nanchuan Qu', 'CN');
INSERT INTO `sys_region` VALUES (4006, '340221', '芜湖县', 1412, 3, 0, 'Wuhu Xian', 'CN');
INSERT INTO `sys_region` VALUES (4100, '232701', '加格达奇区', 106, 3, 0, 'Jiagedaqi Qu', 'CN');
INSERT INTO `sys_region` VALUES (4101, '232702', '松岭区', 106, 3, 0, 'Songling Qu', 'CN');
INSERT INTO `sys_region` VALUES (4102, '232703', '新林区', 106, 3, 0, 'Xinlin Qu', 'CN');
INSERT INTO `sys_region` VALUES (4103, '232704', '呼中区', 106, 3, 0, 'Huzhong Qu', 'CN');
INSERT INTO `sys_region` VALUES (4200, '330402', '南湖区', 125, 3, 0, 'Nanhu Qu', 'CN');
INSERT INTO `sys_region` VALUES (4300, '360482', '共青城市', 162, 3, 0, 'Gongqingcheng Shi', 'CN');
INSERT INTO `sys_region` VALUES (4400, '640303', '红寺堡区', 360, 3, 0, 'Hongsibao Qu', 'CN');
INSERT INTO `sys_region` VALUES (4500, '620922', '瓜州县', 344, 3, 0, 'Guazhou Xian', 'CN');
INSERT INTO `sys_region` VALUES (4600, '421321', '随县', 215, 3, 0, 'Sui Xian', 'CN');
INSERT INTO `sys_region` VALUES (4700, '431102', '零陵区', 228, 3, 0, 'Lingling Qu', 'CN');
INSERT INTO `sys_region` VALUES (4800, '451119', '平桂管理区', 263, 3, 0, 'Pingguiguanli Qu', 'CN');
INSERT INTO `sys_region` VALUES (4900, '510802', '利州区', 279, 3, 0, 'Lizhou Qu', 'CN');
INSERT INTO `sys_region` VALUES (5000, '511681', '华蓥市', 286, 3, 0, 'Huaying Shi', 'CN');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '集团管理人员', 'admin', 1, '1', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2019-12-17 16:11:23', '管理员');
INSERT INTO `sys_role` VALUES (2, '系统管理人员', 'common', 2, '2', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2019-12-17 16:11:30', '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 2000);
INSERT INTO `sys_role_menu` VALUES (2, 2001);
INSERT INTO `sys_role_menu` VALUES (2, 2002);
INSERT INTO `sys_role_menu` VALUES (2, 2003);
INSERT INTO `sys_role_menu` VALUES (2, 2004);
INSERT INTO `sys_role_menu` VALUES (2, 2005);
INSERT INTO `sys_role_menu` VALUES (2, 2006);
INSERT INTO `sys_role_menu` VALUES (2, 2007);
INSERT INTO `sys_role_menu` VALUES (2, 2008);
INSERT INTO `sys_role_menu` VALUES (2, 2009);
INSERT INTO `sys_role_menu` VALUES (2, 2010);
INSERT INTO `sys_role_menu` VALUES (2, 2011);
INSERT INTO `sys_role_menu` VALUES (2, 2012);
INSERT INTO `sys_role_menu` VALUES (2, 2013);
INSERT INTO `sys_role_menu` VALUES (2, 2014);
INSERT INTO `sys_role_menu` VALUES (2, 2015);
INSERT INTO `sys_role_menu` VALUES (2, 2016);
INSERT INTO `sys_role_menu` VALUES (2, 2017);
INSERT INTO `sys_role_menu` VALUES (2, 2018);
INSERT INTO `sys_role_menu` VALUES (2, 2019);
INSERT INTO `sys_role_menu` VALUES (2, 2020);
INSERT INTO `sys_role_menu` VALUES (2, 2021);
INSERT INTO `sys_role_menu` VALUES (2, 2022);
INSERT INTO `sys_role_menu` VALUES (2, 2023);
INSERT INTO `sys_role_menu` VALUES (2, 2024);
INSERT INTO `sys_role_menu` VALUES (2, 2025);
INSERT INTO `sys_role_menu` VALUES (2, 2026);
INSERT INTO `sys_role_menu` VALUES (2, 2027);
INSERT INTO `sys_role_menu` VALUES (2, 2028);
INSERT INTO `sys_role_menu` VALUES (2, 2029);
INSERT INTO `sys_role_menu` VALUES (2, 2030);
INSERT INTO `sys_role_menu` VALUES (2, 2031);
INSERT INTO `sys_role_menu` VALUES (2, 2032);
INSERT INTO `sys_role_menu` VALUES (2, 2033);
INSERT INTO `sys_role_menu` VALUES (2, 2034);
INSERT INTO `sys_role_menu` VALUES (2, 2035);
INSERT INTO `sys_role_menu` VALUES (2, 2041);
INSERT INTO `sys_role_menu` VALUES (2, 2042);
INSERT INTO `sys_role_menu` VALUES (2, 2043);
INSERT INTO `sys_role_menu` VALUES (2, 2044);
INSERT INTO `sys_role_menu` VALUES (2, 2045);
INSERT INTO `sys_role_menu` VALUES (2, 2046);
INSERT INTO `sys_role_menu` VALUES (2, 2047);
INSERT INTO `sys_role_menu` VALUES (2, 2048);
INSERT INTO `sys_role_menu` VALUES (2, 2049);
INSERT INTO `sys_role_menu` VALUES (2, 2050);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `login_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '头像路径',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '盐加密',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最后登陆IP',
  `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登陆时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '超级管理员', '00', 'ry@163.com', '15888888888', '1', '2019/12/23/6cab38ea9d2d74ae95e5bffc932bbd9a.jpg', '4020ca9fa697390903f6685e571367c5', 'ce5eba', '0', '0', '127.0.0.1', '2019-12-23 16:17:02', 'admin', '2018-03-16 11:33:00', 'ry', '2019-12-23 16:17:01', '管理员');
INSERT INTO `sys_user` VALUES (2, 102, 'yutao', '于涛', '00', 'ry@qq.com', '15666666666', '1', '', '3bad472f3ad8ca911fec0bb964e747a4', 'b22fd4', '0', '0', '127.0.0.1', '2019-12-17 14:03:53', 'admin', '2018-03-16 11:33:00', 'admin', '2019-12-17 15:23:22', '测试员');

-- ----------------------------
-- Table structure for sys_user_online
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online`  (
  `sessionId` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `ipaddr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestamp` datetime(0) NULL DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime(0) NULL DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int(5) NULL DEFAULT 0 COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '在线用户记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_online
-- ----------------------------
INSERT INTO `sys_user_online` VALUES ('1440385b-0353-44e3-8e2b-e75988a96eaa', 'admin', '信义水厂', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', 'on_line', '2019-12-23 16:16:59', '2019-12-23 16:17:02', 1800000);
INSERT INTO `sys_user_online` VALUES ('1afee0ba-81ea-4883-ad36-2bbbc66b43cc', 'admin', '信义水厂', '219.217.246.243', 'XX XX', 'Chrome', 'Windows 7', 'on_line', '2019-12-23 15:18:51', '2019-12-23 16:18:50', 1800000);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);

SET FOREIGN_KEY_CHECKS = 1;
