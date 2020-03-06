/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 5.7.28 : Database - manager
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`manager` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `manager`;

/*Table structure for table `ACT_EVT_LOG` */

DROP TABLE IF EXISTS `ACT_EVT_LOG`;

CREATE TABLE `ACT_EVT_LOG` (
  `LOG_NR_` bigint(20) NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_STAMP_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DATA_` longblob,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `IS_PROCESSED_` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`LOG_NR_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `ACT_EVT_LOG` */

/*Table structure for table `ACT_GE_BYTEARRAY` */

DROP TABLE IF EXISTS `ACT_GE_BYTEARRAY`;

CREATE TABLE `ACT_GE_BYTEARRAY` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTES_` longblob,
  `GENERATED_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_BYTEARR_DEPL` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `ACT_RE_DEPLOYMENT` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `ACT_GE_BYTEARRAY` */

insert  into `ACT_GE_BYTEARRAY`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('2',1,'baoxiao.bpmn','1','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\r\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\"  xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:dc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:di=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/testm1583134321766\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1583134321766\" name=\"\" targetNamespace=\"http://www.activiti.org/testm1583134321766\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\r\n  <process id=\"myProcess_1\" isClosed=\"false\" isExecutable=\"true\" name=\"submit\" processType=\"None\">\r\n    <startEvent id=\"_2\" name=\"StartEvent\"/>\r\n    <userTask activiti:assignee=\"${adminUserId}\" activiti:exclusive=\"true\" id=\"_5\" name=\"管理员审批\"/>\r\n    <endEvent id=\"_7\" name=\"EndEvent\"/>\r\n    <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"_9\" name=\"ExclusiveGateway\"/>\r\n    <sequenceFlow id=\"_10\" sourceRef=\"_5\" targetRef=\"_9\"/>\r\n    <sequenceFlow id=\"_12\" name=\"通过\" sourceRef=\"_9\" targetRef=\"_7\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\">\r\n        <![CDATA[${flage==true}]]>\r\n      </conditionExpression>\r\n    </sequenceFlow>\r\n    <userTask activiti:assignee=\"${soruceUserId}\" activiti:exclusive=\"true\" id=\"_16\" name=\"重新提交\"/>\r\n    <sequenceFlow id=\"_17\" name=\"驳回\" sourceRef=\"_9\" targetRef=\"_16\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\">\r\n        <![CDATA[${flage==false}]]>\r\n      </conditionExpression>\r\n    </sequenceFlow>\r\n    <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"_19\" name=\"ExclusiveGateway\"/>\r\n    <sequenceFlow id=\"_20\" name=\"重新提交申请\" sourceRef=\"_19\" targetRef=\"_5\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\">\r\n        <![CDATA[${flage==true}]]>\r\n      </conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"_21\" name=\"撤销申请\" sourceRef=\"_19\" targetRef=\"_7\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\">\r\n        <![CDATA[${flage==false}]]>\r\n      </conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"_22\" sourceRef=\"_16\" targetRef=\"_19\"/>\r\n    <sequenceFlow id=\"_23\" sourceRef=\"_2\" targetRef=\"_5\"/>\r\n  </process>\r\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\r\n    <bpmndi:BPMNPlane bpmnElement=\"myProcess_1\">\r\n      <bpmndi:BPMNShape bpmnElement=\"_2\" id=\"Shape-_2\">\r\n        <dc:Bounds height=\"32.0\" width=\"32.0\" x=\"280.0\" y=\"90.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <dc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"_5\" id=\"Shape-_5\">\r\n        <dc:Bounds height=\"55.0\" width=\"85.0\" x=\"255.0\" y=\"265.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <dc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"_7\" id=\"Shape-_7\">\r\n        <dc:Bounds height=\"32.0\" width=\"32.0\" x=\"285.0\" y=\"530.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <dc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"_9\" id=\"Shape-_9\" isMarkerVisible=\"false\">\r\n        <dc:Bounds height=\"32.0\" width=\"32.0\" x=\"285.0\" y=\"410.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <dc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"_16\" id=\"Shape-_16\">\r\n        <dc:Bounds height=\"55.0\" width=\"85.0\" x=\"410.0\" y=\"310.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <dc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"_19\" id=\"Shape-_19\" isMarkerVisible=\"false\">\r\n        <dc:Bounds height=\"32.0\" width=\"32.0\" x=\"440.0\" y=\"240.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <dc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_12\" id=\"BPMNEdge__12\" sourceElement=\"_9\" targetElement=\"_7\">\r\n        <di:waypoint x=\"300.0\" y=\"441.0\"/>\r\n        <di:waypoint x=\"300.0\" y=\"494.0\"/>\r\n        <di:waypoint x=\"300.0\" y=\"530.0312805773287\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <dc:Bounds height=\"8.0\" width=\"0.0\" x=\"0.0\" y=\"47.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_23\" id=\"BPMNEdge__23\" sourceElement=\"_2\" targetElement=\"_5\">\r\n        <di:waypoint x=\"296.0\" y=\"122.0\"/>\r\n        <di:waypoint x=\"296.0\" y=\"265.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <dc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_17\" id=\"BPMNEdge__17\" sourceElement=\"_9\" targetElement=\"_16\">\r\n        <di:waypoint x=\"316.0\" y=\"425.0\"/>\r\n        <di:waypoint x=\"460.0\" y=\"425.0\"/>\r\n        <di:waypoint x=\"460.0\" y=\"365.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <dc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_20\" id=\"BPMNEdge__20\" sourceElement=\"_19\" targetElement=\"_5\">\r\n        <di:waypoint x=\"440.0\" y=\"256.0\"/>\r\n        <di:waypoint x=\"340.0\" y=\"292.5\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <dc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_22\" id=\"BPMNEdge__22\" sourceElement=\"_16\" targetElement=\"_19\">\r\n        <di:waypoint x=\"456.0\" y=\"310.0\"/>\r\n        <di:waypoint x=\"456.0\" y=\"272.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <dc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_10\" id=\"BPMNEdge__10\" sourceElement=\"_5\" targetElement=\"_9\">\r\n        <di:waypoint x=\"301.0\" y=\"320.0\"/>\r\n        <di:waypoint x=\"301.0\" y=\"410.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <dc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_21\" id=\"BPMNEdge__21\" sourceElement=\"_19\" targetElement=\"_7\">\r\n        <di:waypoint x=\"472.0\" y=\"256.0\"/>\r\n        <di:waypoint x=\"550.0\" y=\"420.0\"/>\r\n        <di:waypoint x=\"317.0\" y=\"546.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <dc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n    </bpmndi:BPMNPlane>\r\n  </bpmndi:BPMNDiagram>\r\n</definitions>\r\n',0),('2502',1,'D:\\MSOA\\毕业设计\\manager\\target\\classes\\baoxiao.bpmn','2501','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\r\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\"  xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:dc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:di=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/testm1583134321766\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1583134321766\" name=\"\" targetNamespace=\"http://www.activiti.org/testm1583134321766\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\r\n  <process id=\"myProcess_1\" isClosed=\"false\" isExecutable=\"true\" name=\"submit\" processType=\"None\">\r\n    <startEvent id=\"_2\" name=\"StartEvent\"/>\r\n    <userTask activiti:assignee=\"${adminUserId}\" activiti:exclusive=\"true\" id=\"_5\" name=\"管理员审批\"/>\r\n    <endEvent id=\"_7\" name=\"EndEvent\"/>\r\n    <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"_9\" name=\"ExclusiveGateway\"/>\r\n    <sequenceFlow id=\"_10\" sourceRef=\"_5\" targetRef=\"_9\"/>\r\n    <sequenceFlow id=\"_12\" name=\"通过\" sourceRef=\"_9\" targetRef=\"_7\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\">\r\n        <![CDATA[${flage==true}]]>\r\n      </conditionExpression>\r\n    </sequenceFlow>\r\n    <userTask activiti:assignee=\"${soruceUserId}\" activiti:exclusive=\"true\" id=\"_16\" name=\"重新提交\"/>\r\n    <sequenceFlow id=\"_17\" name=\"驳回\" sourceRef=\"_9\" targetRef=\"_16\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\">\r\n        <![CDATA[${flage==false}]]>\r\n      </conditionExpression>\r\n    </sequenceFlow>\r\n    <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"_19\" name=\"ExclusiveGateway\"/>\r\n    <sequenceFlow id=\"_20\" name=\"重新提交申请\" sourceRef=\"_19\" targetRef=\"_5\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\">\r\n        <![CDATA[${flage==true}]]>\r\n      </conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"_21\" name=\"撤销申请\" sourceRef=\"_19\" targetRef=\"_7\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\">\r\n        <![CDATA[${flage==false}]]>\r\n      </conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"_22\" sourceRef=\"_16\" targetRef=\"_19\"/>\r\n    <sequenceFlow id=\"_23\" sourceRef=\"_2\" targetRef=\"_5\"/>\r\n  </process>\r\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\r\n    <bpmndi:BPMNPlane bpmnElement=\"myProcess_1\">\r\n      <bpmndi:BPMNShape bpmnElement=\"_2\" id=\"Shape-_2\">\r\n        <dc:Bounds height=\"32.0\" width=\"32.0\" x=\"280.0\" y=\"90.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <dc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"_5\" id=\"Shape-_5\">\r\n        <dc:Bounds height=\"55.0\" width=\"85.0\" x=\"255.0\" y=\"265.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <dc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"_7\" id=\"Shape-_7\">\r\n        <dc:Bounds height=\"32.0\" width=\"32.0\" x=\"285.0\" y=\"530.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <dc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"_9\" id=\"Shape-_9\" isMarkerVisible=\"false\">\r\n        <dc:Bounds height=\"32.0\" width=\"32.0\" x=\"285.0\" y=\"410.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <dc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"_16\" id=\"Shape-_16\">\r\n        <dc:Bounds height=\"55.0\" width=\"85.0\" x=\"410.0\" y=\"310.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <dc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"_19\" id=\"Shape-_19\" isMarkerVisible=\"false\">\r\n        <dc:Bounds height=\"32.0\" width=\"32.0\" x=\"440.0\" y=\"240.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <dc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_12\" id=\"BPMNEdge__12\" sourceElement=\"_9\" targetElement=\"_7\">\r\n        <di:waypoint x=\"300.0\" y=\"441.0\"/>\r\n        <di:waypoint x=\"300.0\" y=\"494.0\"/>\r\n        <di:waypoint x=\"300.0\" y=\"530.0312805773287\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <dc:Bounds height=\"8.0\" width=\"0.0\" x=\"0.0\" y=\"47.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_23\" id=\"BPMNEdge__23\" sourceElement=\"_2\" targetElement=\"_5\">\r\n        <di:waypoint x=\"296.0\" y=\"122.0\"/>\r\n        <di:waypoint x=\"296.0\" y=\"265.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <dc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_17\" id=\"BPMNEdge__17\" sourceElement=\"_9\" targetElement=\"_16\">\r\n        <di:waypoint x=\"316.0\" y=\"425.0\"/>\r\n        <di:waypoint x=\"460.0\" y=\"425.0\"/>\r\n        <di:waypoint x=\"460.0\" y=\"365.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <dc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_20\" id=\"BPMNEdge__20\" sourceElement=\"_19\" targetElement=\"_5\">\r\n        <di:waypoint x=\"440.0\" y=\"256.0\"/>\r\n        <di:waypoint x=\"340.0\" y=\"292.5\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <dc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_22\" id=\"BPMNEdge__22\" sourceElement=\"_16\" targetElement=\"_19\">\r\n        <di:waypoint x=\"456.0\" y=\"310.0\"/>\r\n        <di:waypoint x=\"456.0\" y=\"272.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <dc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_10\" id=\"BPMNEdge__10\" sourceElement=\"_5\" targetElement=\"_9\">\r\n        <di:waypoint x=\"301.0\" y=\"320.0\"/>\r\n        <di:waypoint x=\"301.0\" y=\"410.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <dc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_21\" id=\"BPMNEdge__21\" sourceElement=\"_19\" targetElement=\"_7\">\r\n        <di:waypoint x=\"472.0\" y=\"256.0\"/>\r\n        <di:waypoint x=\"550.0\" y=\"420.0\"/>\r\n        <di:waypoint x=\"317.0\" y=\"546.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <dc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n    </bpmndi:BPMNPlane>\r\n  </bpmndi:BPMNDiagram>\r\n</definitions>\r\n',0),('2503',1,'D:\\MSOA\\毕业设计\\manager\\target\\classes\\baoxiao.myProcess_1.png','2501','�PNG\r\n\Z\n\0\0\0\rIHDR\0\00\0\0<\0\0\0�3�\0\03�IDATx���	�\\e�7�0�������:8ゟ�8aD!J�9}�TwB�4�*�F�(�(���(dQt\\P $V\rd�\r �@��d$��^��N�{WU����z�S������:�>u���2\0\0\0�����k�UY\0�4�v�D\0`\0@�`\0\0F�\0\0���($\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0`P��pq��\Z��\0\0�`�o��\0\0\0\0`\0@�\0E�1\n	\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0G�Zm�y��p�\'^u��G��������Z�R�uuu=q�<t�G��ӟ�������\00n��η�q�W��~���^�SO=��hѢڊ+jk֬�%�<�Hm�ʕ�ŋ��<��ڬY���g�}�4gΜ�dY��.\0-�d��^8{��\'�9��\r7��dP�%K��N<�������<pG\0�*�u9�������k�]w]m,n��ھ����{������Mt\0h�իW��a���	\'�P{��j���j�����{�}���\0��Jg^Rx�җ�T{��j�v�I\'=��{,�:uꆺ\r\0�Y��%�m�μ4#��:��������\0c�.�M׼4�m���N�k���T*Su\0���Q\Zm�F\Z�B������.��\0\0���yIC�[騣��]�R9H��K3�I�Zu���ҥK�V����\0�����f�m慻���^���;<\0�������\0���c���R��Y\0\0F$-̘�6\Z���/�\0s�g\0���tZ�q<�s�=�\0�Գ\0\0�Ȍ3�^U����`�x\0��\0QO��{\0��m�ݞ�30�8\0���?��5�u\r�ʕ+oq\r\00bGy���5\ni޼y��\0��QG������?�<0\0����>�g֬YO��L�k�Rf�\0Fe���[�교-Z��>��ZH\0��v�aGs�1O�2����Z�\Z\0����MzzzV/Y��%�媫���ξdY���\0�6{��i���#<�@S�˃>xW�Z�9�T]\0�l�=��ѱ��P/�]=k֬t���\r\04D��v����N<�ć�bVϙ3�{iޗ���n\0\r\r1===�}��_�߿��/\r{�h��N��\0�i!fƌg���_��������5/g8�\04]�ж��k�G�,��H�VZ�x����55i��v��JgM�<�]��fΜy�1�sݥ�^z�]wݵ�GyzU�0�^8/-�fح���e\0��$�Da�j���k�j���t�K<���<�v��j���:\0�)�<�e�3u\0(S�y���g#�\0\0�`βlc�\0\0�`֘�\0([������7�	\0�Lf��^\0����;;;��\0@��}Y�=W\'\0�2�?W����\0P�\0s�̙3��\0@���,�^�\0@��]EQ�H\'\0�2�Y��X\'\0�2��Q/�	\0�L���Η�\0P�\0s{�e��	\0�L�j��:\0�)�,˲�U:\0�)��.����\0P�\0ss�Z}�N\0\0�Q�MY�m�\0@iT*��b^�\0@iDxY�e�t\0(�J���<Ϸ�	\0�L���(�Y\'\0������j��&�\0\0J�R��*��:\0�)�\\]�Vߪ\0@��/�<�N\0\0e\n0��ޮ\0@��ϋ�x�N\0\0e\n0WF�K\'\0�2�ˋ�x�N\0\0���Ҏ����\0P\Z�Jea�T�\0\0J�(��;::��	\0�4*�ʂ���\0P�\0saQ��	\0�4�<��Z�n�\0@iT*��\"�L�	\0�4\"���Z�~P\'\0�ҨT*�F��Q\'\0�2�G�\0@i�y�â(>�\0@iT*�D��E\'\0�҈����(>�\0@iDx9;BL�\0@iT*���r�\0\0�`�S�\0\0J#�˙y�w�\0P\Z�J�1]:\0�F����<��\0@iT*�S��u\0(S�9%�:\0�)�|�(��u\0(S�����	\0�4�<�zQ{�\0P\Z�J�kbf�\0P�\0sb��:\0�)�|5���:\0�)���N\0\0�����EQ�\0@iDx�r��u\0(�J�rt�A:\0�FQ_���`�\0\0J�R�|!�P�\0\0�`>W�\'u\0(�/����S:\0�F�R�L��:\0�FQ�����\0\0J�R�5W\'\0�2����H:\0�F��7]ȫ\0@i�!�i(�N\0\0����\'\"�|^\'\0�҈�rH��/�\0P\Zi!Ǵ��N\0\0�����EQ|Y\'\0�ҨT*D}E\'\0����|��(��	\0�4\"��!��\0\0J�R��u�N\0\0�����0_�	\0�4\"��u�N\0\0e\n0=Q\'�\0P\ZEQ���7t\0(�J��ѨSt\0(S��:U\'\0��(�b�0��	\0�4\"�̈:]\'\0����(�3u\0(�/E�R��N\0\0��%�:K\'\0��(��#��t\0(�/�F��\0@i�y�K��\0P\ZEQ|8B�u\0(�/;W*��\0P\ZEQL���\0\0J�R�|(�:\0�F���\"���\0@iT���#�\\�\0@iDx�@�R��\0@itttlW�|�\0\0J#�˿W*��t\0(�/S��\0P\Z�-��R�\0\0J�R��k�e:\0�FGGǻ#�\\�\0@iE��0?�	\0�4\"��=j�N\0\0�����\"��R\'\0�҈�M�b�\0\0J#��D��F\'\0�ҨV�o�s�N\0\0�Q�?W*��u�q��\00b���o����`lU��Q+\0��(��R�ܨ�Cx�7���V�`��<}����^zC�B\0#�e�VEQܤ�Sx�~\0X_�Z}m�R�Y\'������S�:#\0˲l�0���^zy;	��U��WG���N0�K��j�31\0$��Q��$�����8@�,{e��u�	^����\0����ΗG��C\'hrx� j��v0�~�kb\0X_�e/�\0�G�����)Oͺ{� !f����|��\0𔮮��D��S\'hRxIv���� !�ox魙�|��S�� )��E`��	�^\n\'}CL������$\0��e�#���	�^�\n1�fx��u�Nhw3g�|~�{t�&���B�oG^�\r1��hV~U���)\Z^1#	/����N����P&��u�aؼ<N\Z��Ko�{����G�������\rv&�wu������6�z]��QI�\0�O��u�\0S�VߤC�&�l���C���\\3�ӻV���\0�0����\0s��0\\i[zK2��cv�e��QOb\Z*��(��B�I�\0�Yxv�������򏱟|4ꔨ�ƿ��yQs:::޻馛~hJ������e�ybzm3��#\0��sy��2_G���ӳQ�o����T~��\n��-�}f�{Vgg��Ν��E�������ݦ=�h83�ϻ�g@�����Ti_Y�=7�ɴ(��}ᒨ�Q���jT���\Z��[w����d���}�����uE��Љ�R�V�!��j��b�!��q���~:����v��o��%v�\'�̜2�ը�~��^\0X_����ub�Jo���eLf�a��|��\"������q{��S�n؄/=�s���P��6\\�l�9�-z���.�͟?_��,XP�����W\rm���vttl���yQ�E�&�#����5-�vFB�/\0�!���/���r����?��P�V��]z��G�q�:Ҋ�Q���_F�o�T��OO�]��8��Rx�y���^����̋���������n�A��G0�=Bʷ�n��S��\'��4~ڴiϚ��w��sC����J�������y��U`�����V�G�iʲl�8��+��!��qZ9<��Q�G���o�2�����Pgb��+�vMo��ku\"���+	@���7�����d�g��������,���ӓ�3_�>.�YWW�KJ�#�;ĺ���揉��+~�E%\nh\0�`����e�O�-Y�\'+�N�	,�?�dY��8Hψp����u�T0�GF�/�l�j����~g��\\���W�	`V߻�v��k����*ݗZ&O��0��*o���qP>;�������>��1���[~r�7N���)��*}ygz+)���`�;��d���[\\r��R�\0�Ξtttl���*�G�:�m��=�E��n�	��v�4�bm���+]̛&��0��҅_0��Ǆ���8о4]��㣮�_�rY���u-���k/a�����0��E���W��	07Ο;`�I�	-6�lP�?E�Q�,jU\Z)!����G\ZA䷠߳/��Y�����tưj\0f��&M�?���{�4�J|?ҟ��^Is����d�z�=~Xg_v�^�����C�?ê&X�I��\n0�1�e�&�R�h�s�f��ϵS��6�W�g��*�v��f����L�&(���n��:z�ga��(�+O0��Ǆ�����mM��d4ga��e}��o��X����������Q0cW_8��O���^0�OaX5�D	0Z~C���\\��/=&�`\"h�G��%1�;)��Ǽ->���\"sl��C}���I+8ۃ~���H��V\r0L�[�>}�\0��X0�������<tvv>\'B����������q�Ŷ\Z�����J�� �%�����͇����\0��C�[~~��o�}�1���\0���q [<��pa���T�Z�3_��F����Ζ�}I�խ}ϔ�Ss�`��\0�fڽ�ʯx\rLz�l����<\"+9>�?^���{zz6�7N,麢t6�O�\"�΋���\r��\0��C��\\\\��s/��>&}��1O�W��P��Z;�r[�LX<G���V\r��\03�Ygc�|�6cƌN~����	0�\'�;�I����hU��Y���ƴ��y��5\n)]��d��H����[��҂�c�4�U�*��6���k`��7�t�L g�\'��ٓ3\Z�y�hE�Q�\Z5���ѨS\Z���`�/��Y<�֠\0cX5�\0#�В\0�_Q�5��V\r �04]�C�B���|�U0Ma��u�|h@(2�\Z@�`hj�Ik#��OkX5�\0#��<2�����M���U0M0ǥy�tvǰj��`���[�q�B�IQ{6�sV\rP�\03�}���\0�\0!�4�]��V\r �04<`���yg�>�a�\0�\0C3��iA�&\rê�Ɖ`�㨝��e�`\Z\'������-8�cX5�\0#�а`qqGGǶ-:�cX5�D0S��d\"T\\��}-ê&Z�1�%\r0���i�ê���������7���V\r �04��MY�m��iX5�\0#�0z$n�ڢ�_ְj\0F�aL�Ψ��Ùê�Q�{fΜ��q�چU0�\n��,�l���a�\0�\0èB��`6��oX5�\0#�L\0�Zm�e˖��hѢ�/��\'�4�+�ø~���?����}���o{��,XP����r�/ �(��Rx����k+W����.\\X�ԧ>U{衇ֺժU�K/���3�ڳ\0F	0M�μ/#�\\�̙�d�Y��1Ǿ�Ԟ0J�i�����c�dɒڬY�j<�@�ڣ�,@�Q�}mB���_;묳�k\0*�D������e�O�-Y�\'+�N���>�bŊ�����־ �0l_[}��ڍ��]���תt_z����t&����Lq]Bj��F`�X���Ko�qɹm�o�k`ҵ0�h{�]v�\n#C\ZW˗/?�Ȑ����8`�I�V���jh[_|�Η\\r�}w�}��eR:�ϼ��`�����1�\0s������a�k�`����pqz�c�Ίz���̨CT��R�E�i�j�\"������D\'&o�I��\n0�1f�a�@	�y~o��ub��[�<q�\0�^�V���H�(��;���^��7��i�\r�/<r����������tA�=`��eY��J\'&o�Iu�է�`�}B��ê�j�y����0�E�$�tb��������(�{xb�B���׿�.n_���0q��\\S�Vߪ�3���vo��^�k��x׭�輫\"�w��\0&n�������:1��C�V�rq���0��V�������u&�/�ߍ;�O����`b�`�Ӊ�`�:��l���݊ߍoG����`b�s�<�Q\'&O��Y����0O�WDݓ��4�	&��<;L��\'��6���\0�׉���t&ƞ0����5C\'&O�Q�0�\Z�t-�a�\0/��գ�z����h$ê&^�9>j_�`���F��a�\0/�|!�P�`Ԁf�a�\0/�̍:R\'5p����V\r0�̡�,�N0j�\0cX5�D���~�W�q:!���LbX5��9ӓF\"�\0��0�UL�303���tB�nŗ�Z��x��Yê&@���l�:!��$�v_��\03Űj��/���zH:!�0�0�U���u���	F�~�I��30��+tB�`F`�/�j���|�N0��L�\0ê�C�eo��%:!�0#0�U���W���uB�1�z��~ưj�V���zI��ީ�\Z]��bX5����y^���Y\'5�\0cX5@�uwwo/�ktB�Q�0�a�\0��N?�\r�\Zs�1�\Z����t&F\'5�\0�V\r�By��fs�`���a�\0�=sg\Z���\Z[����1�\Z�EfY�e��	F�=�L1�\Z�5�L�iF^�`TC�a�\0-:sMZI\'՘\0S��2�\Z��抎��w�\0�\Z\Z`�hr�Yf;�`T�LbX5@s̹y���jl�1�\Z���ĳ�6�	F56����h��ӣf�\0�\Z`�V\rд\0srT�N��E]$t4��D�y��ϓa�\0�	0�G��s�e��X�r��ѠZ�|�Y`�6��̰j���~!�P�(��/�x�K.�侻��Adlg^RxY�`��Q�6��̰j���΍:R\'�)�;Ο?qz�#]��FU�wK�^zV\r��\0sh:��`_�j��Y�mՎ?�a�\0\r/���_����4u��\r��*�uV����j���UܓF\"�Mʕzx�mڴ�U4��23^LO�	���_\'�,Mgeڱ�U4&�di6^��������uL���BV\r0������N�Đ��u�K�V����6\r0�U�EZ�:\"�u�fȲl�0�`R���<V\r0���ċ�:A3ľ�� ᥷��co��j���x�Z\'hR�Y�O`y$���/�=5��6�°j��Ȳ�\r�\"�D\'h�4�(\r���M���vRl����êF�Z��:^@��3�>���:�W�U�BWW�K���N���,{f\ZR=w��g��_V\r0B�j�y���g����Ud^�k�İj������$^4��-<X�&]{�k3�\Z`d�E��k-0������V\r0�ʚt&F\'h��vNZ�B\'�gX5���R#�l��(�|-�{�D�����4\ZI\'h��67�N�ϰj��P�eY�*��E���y���N�#ê����Bh���u�N\Z`�Ƌ�5iM$��E���4I\'�z�Uq@������:A���C\Zê�0҂{:A+XiDaϰj�A̹�Wގ:A+XiD�䯼�M,F�C������iX5�\0�ӣf�-�笇4�~V\r�ϋ��Q=:A�9�!��_�U���x|Ծ:A�9�!��a�\0�L�u�N��}�zH#dX5����6͑:A����:12�U�}094���	Z��Yit������8��U��4��V\rP�k�\'�D�	Z��Yil�3�\Z ���bxZ���ݽy�8n�~���,�C\Zs�1�\Zh/���/��[�n��rolkT�n�,�CjH4�\Zh����$���e�ԩ��b=��3�\Zh;��0k\n0�8[�hA���V\r��)�`Vuwwo�C� �Xi���K�b�U���u��!5�a�@�Io�^M#�t��!5���U�#]��k{L�\0~WWh�A�zH��a�@{�\0S�s���:B��Cj ê�v1���Gt��!5�a�@������.���N��3�Cj|O\r�����jQ;j�b=��0�\Zh�E�ul}+�Ъ��CjN_\r��&���Z�zH�cX5�N�e��������\0cX5�V��㫧<uF�y��R�V\r�[x���$Z`���$�U�^���US���y�zHMdX5Ў���[5ř�`���\\�Um^����Ќ\0c=�&3�\Z�,�%�J�m�Ч���8��Ќ\0c=�����Q��@���)S��u��AB�@������QV�!5YQ/�#z�X�e�#@��K�[=��	1}�Ko�\\���L�9�Z�I�����\"��)���v]�^\n\'}CL������$\Z�zH�7s���G`�|}\"��F�TW�2���B�3�^�~���!5N�Z}^����rRgg��u�,�e�����uC�kb�!�]�eϭϺ�*�#����\0�1�bF^z=�vRZ�&�o��ӳѴiӞ������f���s���7O�S����_����������bl_�ާ��W��-c���n�����_��1o��?��o����Ml�۷������\Z����&������| ������(��w��c�Kܷk�#�yl���3nψ��Ŷ;�q{���D���J��}�������=0��}���O�����T�wxԑ��g�!.�������c�����O�����}_O��oF�uj|�i�=#�g��;Qg�kH�c������Q�������^����^ۅ��4��G]��4�Y�/����U��kc{}ԯ���.��M��9�wQˢn��=\rэZ�\"�H�g�u_��Q����&��G�E�QODլ�4r�w����rJ���JW��ټ<N\Z��{F?g^~[�$>�BQ��J���Pԃ��V:x��{���������Ψ?���`xk��nI��A�7Q7���!T��k������+�.��F]���v^� ~^�O��Ob�����i2���0�BA=���\Z���>���tj>��2��G~%��F�/֯?�\\=�|&\r���H�jR��ۇ��S�I�\'��?n��g�G�̊��������R���g�I�R�Ja+��4\\��H\nc)��};��#�}0���������@�m\nw)��}�������c�\Z�ߜBb\n�q��i�����&S���^���/�:S�L�Y���P��i\n��-�tv hS�M�D��$no�Bn\n�)(/#>�Y�{N�J�6=�L�30�};g�30���L\Z��aO4O:���o��)dGp�G]&[�i�50�	1�k%�����(�A�e�靈a��c�h�t��1&��&Jo���Z�3]甮��BL�����e�ybzm3��#h�t|�@�~a���k�th\'������ݦ=�h83�ϻ�C㤋�����.���]�;��p2�P�>Nx�K#��#��(����`���QB}C��)�[����Y>\0\Zh�ԩևȧ�Ώ��t`mc�1Wx�I���\'H�}��(�ã+\0�!�M^�Q�eF}�Ƌ�D��М0\"��������T�%z��\0�\\��sC������Xl��ت�%���x��\0��PgV��+�up�HZ3�i1Q-hl�Y�O��o�`�i^�Mi�@sC�}va�����ү�3]G\0������)V����i�lK:�ξ�@km/�5��\\>��oI׹��]�=1$\0���2��Gt�F�G�&�0\\\0�����7����/�ʿ�9\\�\\.�RMs��\n�8˲��|�N�z��=i�����%͢�f���	b�̙Ϗ�{t�.�߉�zEi�\"�`��ǋ�\n��ݥ����i��1���u`���WD�A\'h������i��\\�H��\n���~u:U�������uG���,�XW\0J\"^��J�+t�v�����-?�Z��>ӦM{��\0�L��[�	�t��.��?E����QDx��\0�T���9�W:�$.���n��wE��>�������J\'����k#�����Q�Θ1�ot`����xw�]\'�,�<M��ߊZ5g��v�[]�d�~j�B���,{U�˧D��sDgg�st`�*���i�Q����啱�w�Q:��Owwwo�+\0�\\�Z�`���3��l:;;_��k����ؗ��+\0m\"���q\0��NP���4�)�D}!��+\0m&�r�H����]Z�+���\"��)����u�MEx��92t��jƌ�����+q�E����0#�t�`�����_��㻺�^�+\0������:�D�e���>��t�K����LW\0X���=� �u�`��QDZ�������@��@1;���	�K�eύ}pn}�oD��]`PiU�ta�N�ji����KS�E��Epy��\00,q�8$](��J�e��~���ZE�ǿ��\0F$�˧�,�:A��ՠS`��rWԷ#�l�+\0�J�ڃ#u�f������~�\"ꬸ�z]`��?������ݽI���b��3Ꜹ���\0�EQ|),��2mڴg�G��1�?��]����rl���u��ʲl�؟fEp�Cl�7�\n\0M��I-����ӳQ�G�u[�K?��6�@S�O�l�:�HM�:u��Rˢ�E�]W\0h��R:�Õe�3#�����D�KW\0hu�9=�H�e�ܹψ�����Q��UW\0q@�n���`������4겎��mu�q��G���NЏ\rb��\"��ue���	!L?��I\'X\'��uC������Z�D0�Łj�N�ľ�sԵ�_,����\00!E1�[��uuԯ����K\"���N�m��!��������q��@̕��h����x�^�@wW����_�y�6�hit<�G�&\r�NC�u��IlV��7�Ĥ.�MoF�6��N��R�گ〶�NL����x�/J����<3-�+\0�^Q7�Am+��\\\"�����Ⲹ��������W��W�Ĥ	.oKs�D��===�\n\0�1��!�:Q���xϭ?�{fY���\00�̊8ؽX\'J\\�%��<�1j�iӦ=KW\0h�\0s�̙3���.[��8��[�oww�&�@;��;;;���e��9�^:s�����u�v0:�\"�l��w���r����7�\0�9�<j���U�V_���QwGp�D��t\0�R��.����Ԩ�Q���N�+\0��\0�!����\"�Q�����湺\0�(���*���rr\Z������u\0��e<_��\\^���Ճ�ƿ�NW\0`�\0sGgg��u�����^�����b�Ţ(^�+\00�\0�V)~�N�F�E����cf̘���\0#?�.I���Ds���R`��cS��\0�8��*��:�i��������֑�\0���/����h�t1n�(�~q��\\g\0�\r0�E�o:�i�s\Z].\'��Ѻ\0�0��<��N�M�K\'�xD}�4��\0Mݟ��v\'��4���S�)�OMK\0�\n\04YQg�8Ӊ��1c�ߤ��\"�Qg�Eu\0Z$|#�t���L�>}�.G���N�e[�\n\0�>���5>��������Q+��g�\0Gi��(�҉�uwwo�eߨ�Q?���|��\0�8���Wҙ�X[�eG_���cԏ\"����\0�Q���Ũ:񔞞��\"�����s�7o�\0�`� =7�H��g�s�G/n�:/����\00A�A��q��\\���S�N�0����,��в\n\0Pq�>0]�n?w�eό�}f��D]����n{\0�D\Z��F\"���;w��g�����ց��Js���`�!��ϙG�&��.�����J���x\'�A�|�F����y��Y��K� ���&ip��Q�G]?��m\0�$�J�Q?N��,�,no���g��2=~�_E]mG�2\0�X\n(q@�6�F���\rPs���U�����8��Q;{�`���Q��T����7/Yp�>��EZn��%���3\r\0�H�m������tttl��EQ,I��.\00����˚x�����sj�eQK��-�i�*\0Lr��0�]����<��k�¨���o�\0�L}���L�Z}�\r.��w~l���2\0�A\0hS�I��	\\����QSM/z�\0��կ%�\r0S\'���M���������g\0�~���^���\'��#���,��3\0m.���ԯ�s~\Z�A�>ga�HךD}>]#��ݽI+���Z�_������iӦ=˳\0m.-\r�f׍��!&�[��|1\'��FH>?��U\"�l�����3\r�nU`\0&�\"\"$|�Z��e��e�z4�����؃��g�A�����R@����X��l\0�˖�_7���^��O>��hѢ����kk֬�%i�r���5�\\S;��j����yb�\ZC[Lޑ&ë��u������;�����1c��x�\0���Dgg�Z�|��O���{�6\\�]w]mΜ9뭕��\n����nY�c���N����\'��z�\0���K�Z}�7DD���{�#\n.���j���k���n���N]��M���b����������\0��t�#�˟��]t��7�\Z��n���>랉ٺ^��~&B�O��z�g\0XO}���}�K�������b�51���ߺJ}�V3�\0�J����mԨ3/���Y��C�b�`��g\0XK���P�t�K3�kbF8�Y\0`mi�����y�Z�r�!}ϰ|˳\0\0[�ڗ�g�MC�[�nX�m$C��aKÙ�^�;���#�w���v�g\0��O��o~�V:��3���{6\0����{CDZ����U}�FZ��\0\0�`���Ŋ-\r0i^�>��\00�\0�ho��]��U���;\\ڳ\07�< ƃ\0\0�&�8\0�.��\0(]�1\n	\0(]�1\0P.><^3���~O��\0��R���ZH\0@�D�8��jԭ83gΜ��$�\00\"Y��8B���@q��65�\\p�}�ˣ����,\0\0#��b������7�ܔ�r�m��v�m�\'���u\0����M�<����i��F��2{���{�F�z���>\00j(���VR\n1�:�μ�\r/�뤯��\0��uttl�7Ĥ���51c��7]���F�Fx�Q�������I�]w݈�J~��k�wT?�\"�\0\0�����{ML߷�Ҍ��/~r�� �6]�BN�a��$u}�y�\0�T����5놑VZ��h�\0-�����ؾ3��V�Iꊢx�.\0�\"-;P_;��*ַ�X����F�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0h�����ڃ-�\0\0\0\0IEND�B`�',1),('3',1,'baoxiao.png','1','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0;\0\0!\0\0\0���\0\08\'IDATx^��[�Ⱦ����k�]�}i��\"w�*(�M�*rWDAD��ꨨ{֚/���_���7��>�y}����R鄆�N:�����J�~I�*�IU���O�!���BHCc		4��0Ac		4��0Ac		4��0Ac		4��0Ac		4��0Ac		4��0Ac		4��0Ac		4��0Ac		4��0ad�<		��#�����{hl���ч�F	\Z}hl���ч�F	\Z}hl���ч�F	\Z}hl���ч�F	\Z}hl���ч�F��2���t`��݇;����me�ō�;ZLg��{�ɒ�2-=�xܢ�8�����j�����QH\r\Z%�ol�H\"~�HÒ���6_%��c����6o�������[+�ɤ��[�	d�m���[M�=4�xR��F���r��e������X��ftr]���5=�N�=��x�BE���(����1��\ZgJʛa���O�+*�����0I����/��+�u�Ȱ�����70n�~�����Z� 洈�)-+��Y�x�G�wc7��x���6����ӋZ:RV6�����EEE(\'\"QH`|�6�2���>d���#���W�b����\"r3)���94Vl�O��dE�H��i<o>�69<DFq����S��m�.�>��58:9������W�xB�\n�n.,?�z�h����Y#eh|*�[xp��7U������)�swq���U�;Pk��L��En����ۻ�Ɓ�;o?��H��2+���976�Ir��Gɷ�1R3\r��`�$խ%P�m�]�P��\r㰈��2�^�,�[�+,?~��իn2�op�N�;����s�;p8rcN\\�Dʕkj<�V9�^���V���Ԡ�Q�c�-�I2&�R0��/>���詘�j1��T��Ճ`mN�M����1�[H�M`D��e\n��N���r���\ZI�%\"5�c��w�ɔ�g!5hl��/c���Cc���+�\Z͞ɾ.��p���yp���E||��{U�\nߠ��$�[�+`�]YU�nj������7b�b_]�b��i0b�\r�˯��سm���I���,�����٬Xn�,�&����ZQU���|�[z�i����9k)�uc=ֱ�Ԑx1�?�ſدoܛ߂է/QB�BۮM̈\0\ZK<ȹ��yrRY]�����=$��v$���Ⱥx�O�\\��>�����آ�\",�1�Ɣ��3dpke�۴��(���946�i��*+[5cщ�D���k��!̙�O}�=�����Xputa�ֿ�/��I�;����(����1�H�`�<!g���r��읭��7_�*\r4�mCO� �30|��eD���un!����]�X>}���������櫫#7��t��gd���������ҽ�m]ד�{cn	S��s��w\\\Z�~��Idh�G!5hl�Ⱦ�G��}��^r���������u/�b�)#�eEz<�;a�ͅ妖��ፍy���[qc�9�b����~�i�1�g,�QBy:�En�����Ac�D��5?��ں�������v�����Ѿ$�,�p	�٣�v����ʉ���\\�;��F��2��\Z%hl���Q��F\Z%hl���Q��F\Z%hl���Q��F\Z%hl���Q��F\Z%hl���Q���V����(aj,	��#����H255�\'�7�X��߿�I��\r4V�ƒ|����X���X\ZK�\Z�CcI>Ccuh,�gh��%��ա�$���:4��34V�ƒ|����X���X\ZK�\Z�CcI>Ccuh,�gh��%��ա�$���:4��34V�ƒ|����X���X\ZK�\Z�CcI>Ccuh,�gh��%��ա�$���:4��34V�ƒ|����X���X\ZK�\Z�CcI>Ccuh,�gh��%��ա�$���:4��34V�ƒ|����X���X\ZK�\Z�CcI>Ccuh,�gh�N4��N���e��1i��!\Z��*&O��꘴f��ZD��Cc�MOO����CٚHD�L�s�Q���\Z���������ٓ\'O�Z;8D\"���|���ۭ�ңI��X#N�8���4��ϟ;;;��E\"���|E�EWWv�����5enn�$�q�M4jQ|���$�o߾��H���hԢ�Nc����V�:��0������z���XsZ[[վ�C=\"D���;�5����?~;8�#�\0����Q섴���f���1�ױ�煇h�\"����p�ԩ?-��煇h�\"��ج�j�����z*�hl֨��S�F4ja\n��y�7�φdLa#y\0�5�����&�X�74�\ZK��ƚ@c���Xh,�\Zk�=:��56_\r�Nj�e�n��Z���[+c7JJK���~���wKqBcM��G�r� z���GZz��H��}_K�F�u�M��p�x���m������[QY��C���F�\'4�\Z{tn��pz���ڸ3Q���,5@��|��z��v������w�t���-�	�5���ںzt�+�&JJJן��|�kYY�Ⱥ�(�h����T���<�.�ޯ����怛n�1�7�ǖ�\n�}�\'4�\Z{D�ﭯm���q�w����O݊�w�ƖV�_꽊���{ڹg�w��������r�;K弚���?$�D�ƚP��&�<pS�5�n.��7��x\"���y��X��e����b`��<KC\r�d_C�ƹ��nYi�LtȔ3\rM[�����\Zk����x\'��l����m?[8˖v�O�P���b������_�4�\Z뵩�N<���3ҭ�;���ޛ~�>�\\-� �Ye姝a\"������j�\n�5��zmj��\r�MF��3�m���#^O�簹Z�3@\"�&��?{�)%%^���Xh�צƻ���,�[�[��\ZS\\\\�����O^��u���R�EEEm�]3�DVg��ҝa�\'4�\Z뵩�nx�Q�,��3m�j��g��Ǵ�NDz���;���/^V��a�\'4�\Z뵩�n8;���\'(���;?��y��E���*��\"is�8s�g�D�r�9S��Xh�צƻ�I�hmY\\O�ց+/.�\r��	5 �k�1Mg۰ke#m�g�����Y�0��\Z�������+��&�X�M�wC�Q�M;��Lý�g�Kk-��,Aڳ4Ԙ����:�6׉��i7�45K�{�RYU�H��h�	4�kS����ܱ�r���,Ս���1%�:sim���d���Wp�j)�\0��%���M��[O�C���{�����;߁����\Zk����x7<:w�\\����s,�k�ֶv�w?`b�����pg����m�]z�;�P))-C�,..>��.��o�ok�,**B�����e��h\'��T�Xh�צƻ�T˹��QRR�Q���#�������8Ӱ���LP���x�;6����F&弹����7\\�����٥�է]��?���ƚP��f��{4Ƨn=������Ƨoc�)7\'�D	\"\'�����E9ݠ�&�X��Ɔ\ZK��ƚ@c���Xh,�\Zk�%~CcM���oh�	4��\r�5�����&�X�74�\ZK��ƚPXƶ�<�ƚPXƒ<A6$c\n��h055�\'�B�Ɔ�F\"�I��`��H0�\046\0L�\0&����#����\00y`$�t\0\Z\0&�D\0�@c�䁑`�hl\0�<0L:\0�\r\0�F\"�I��`��H0�\046\0L�\0&����#����\00y`$�t\0\Z\0&�D\0�@c�䁑`�hl\0�<0L:\0�\r\0�F\"�I��`��H0�\046\0L�\0&����#����\00y`$�t\0\Z\0&�D\0�@c�䁑`�hl\0�<0L:\0�\r\0�F\"�I��`��H0�\046\0L�\0&����#����\00y`$�t\0\Z\0&�D\0�@c�䁑`�hl\0�<0L:\0�\r\0�F\"�I��`��H0�\046\0L�\0&����#����\00y`$�t\0\Z\0&�D\0�@c�䁑`�hl\0�<0L:\0�\r\0�F\"�I��~0==]^^.�C\"�d:)hl����������ٓ\'O�vp�Dd��$���|�ĉ_�|�s���sgg����HD�M��\rsss� Q�#�w\Z��$�o߾����z)\0hl8���V�šA\n\ZZ[[Ucq�G�Ɔ��Ǐ��Q���0���allL�=�464�:u�O��y�`��ab�BO%��\r�z*)$3v���_h	��!�@c4��\Z+��$�X�%��\nh,	4V@cI8��\ZK���Xh��ƒp@cg���gr�::�gg������o�z�r$h� ��-.�/�m9���z=Ԁ��El�����~����gg�{��p����zF������[�x����kۻ��/��A�tv_���,)-�3�\Z+�#c��8����uu��=��\Zs��2�ƶ^��mk�3������vߣ\n��Ϧn��Z�@�����ԭ\\���O~��r����u\r��;8D�=*\r�X�r=#�`l�8�м���Ƌ�5�m�����\rMg�����A�G�VVW�l$�:��D\"Yj�oc�#gW1	l>w^&VTUc9��������g1�O�m��,�)sn�^�܇[�]���)H�)��_�6���׿a{��vh|J�d�mh̖U[W�ĉ�E5 ee�,gQQQ��0\"�^��|7>}����F��j;8���^\\s��w**�D���K�lO_��렡di�U�GD�KJJe�\0�#}`xBz�a�f�v�]�vP���l\Z�v{�q����(@\"��_��Ƃ3�������WХ�!p�:��\Z]���ޘ[�Q�~\\����ޫ#�[Z/ �2�P��E��;0|�N3�{����j��G�@�����L����s�W{Fn��A��W�֥e�Ik2,�ӂW�����[����Kk8���S��m(6X�t���[[{���G�G�UW�7����7!�opLz��>}�k�r�����.=ܖ)*4V�5c��ͅ����Q��G.��6W �]~����W������5�/�b_��;�zd\n��Y	Iqdc�����]_+�[�C���ߴ���8<w��#7�d���TM��g����K���Flr����\r�jk��}<f��e��I^\r�a\"n��ީ�Ż�����e@w�R.�\r�\Z+Ț��c7��%���!�0=ca�s��欷u��k�k�y��ڈ,�f�<P���Ӂ��L&1��2w�FT��x1��o��UN�H���:\"\n��e����{�(\n,��g��)\Z��Y�OM�z�s�T��ڤ��5ye��۷}��,l�~��-�4�vߧ-O���ec���F��޾�D\Zb���1�E$��ڂG���Ĵ��t��1k���[Қ�bV�,���`f�ArV����l���0�u���S����?:����5uH��(�V5��?4����2���.�^�1Oc���Ǔ�#0��a���4���9�7�����\Z�~��>Rd��d��l͊=ֱ��l<G$Bڐ.�̙�т�N��<A�$�B?ƺN���\"��s^�=�b���E�tҶk3�E$�,���$�����>.2����>#&&��]�p�\r�V����5 ÷��oD@&eh:ۆ�sK��Hz~N�������\'�eB����5�Bgj���U�鄙ұ��)�Rvi�J�3�(�?\Z��\"f��0M��\Z��Ug���J�s�[[Y��_13��V���q�����n͖Xj�K���\rL�]�����^�(I��\nL:��´�\" �2�Հ�\r=ʏ��x��XA6���������BZ�%��1�i�e\'n:�^%Vh1뇢���U7c���d�.������Y�\\���,1ڈo<i�x%\ZA�ߪ�3���D@\"�pڂ�x騉��0>u�<�ɹT��>��kۻ�ӷE@�e����)�{u�u����d��Xj���/(�h�J�0vu��������z��y{�C����_RR��2�]�� >i-q�Dǥޞ+�0��=� r+�k0sƆ��L�	�8l��R1K3��:6�&$ck�������ұ�B\'�����x9x&�IkFm}kI�d\"��֓��toL�w\\�LC����O �?�w�\\��{J\Z+|�t�{���e�-bR���Cu�V-�{ˁ� LC�1ÏYk{�YȆʰ������,����Ac�7�ȸ}+nlNَ>$~?*��Æ0�z�oPD�\r}E~�m���3Fgw���ߒV��\0�Q\"�[W������ݾ��~�����j�1�g����<uT��	Sb���g�aQ-���bm�����\r�t��~!S/�~��.C��C�B|���S��$�b\" �2��O�s���\'���.xyCT�_�<@/����X�a�\\][W]{F��1�`,��R���y�jb�%tڵ(ހ87��t�U������Lʰ��zs���\r\Z+���$`F]3��\Z+��$\0\Z�Z���a���R����X\0����!m&��h�>4�@qq��?���\nh,	4V@cI8��\ZK���Xh��ƒp@c4��\Z+05��_��Sc	�\r�������g����$�l7��i0i�B���&�Lc�\r���42�%6�n>`��4��`���I#�Xb���&�Lc�\r���42�%6�n>`��4��`���I#�Xb���&�&c��|�l70i��\'�l�F��F����L\Z��ld0id\ZKl��}���i,��F��F����L\Z��ld0id\ZKl��}���i,��F��F����L\Z��ld0id\ZKl��}���i,��F��F����L\Z��ld0id\ZKl��}���i,��F��F����L\Z��ld0id\ZKl��}���i,��F��F����L\Z��ld0id\ZKl��}���i,��F��F����L\Z��ld0id\ZKl��}���i,��F��F����L\Z��ld0id\ZKl��}���i,��F��F����L\Z��:�������P62�%�I1��4������������ɓ\'�Y��\"Yz4�&=��:\'N���������]]]b�\"Yz4�&=�ƒcsss� Q�#Y�AO���X\"���훪+��Ǒ,aғi,I����\Z�C=�d��LcI���V�X�${��d\ZKR?~�ÇBW��P� �ä\'�X���ؘ0;z�*&=�ƒ=N�:��v�<�ULz2�%?�o���lcғi,�A���J��IO��>1O��޾�¤\'�X�@\'��,AcÁI=��f\ZL�846���p`R����Y�Ɔ�z��\"46��3phl����������&���MO�hji]X~<>}[��<��R46��3prmlQQQIiiEU����s�;.�\r�O�.�=J��1�G+h��nimǹ6_!}����J%|�,q�vSNJO�a*46��3p�n,<�|���O��gl��wkۻ��������Bg7���Ll����n����g�i�z$:�0L�Ɔ�zN֍uO$2����s0��l���k���X���X������BcÁI=\'��:�����>>u+iMz���?������Z��yY�LTs3���se���x\\�s@cÁI=G36q�偛\Z�!�K��.\"���w,���>����}������=+m�J홆ɹ�b�>�y�LM�_��ɫ��p`R���7c����BpSK���OPWn�\n�M;WK�$FS��o�n.ȔDI���\ZN�x�7�%t�Ɔ�zN��u��v;�Yj���=DVqq1�hy�v�ϴhi�����Ӌ��tP\\_~��ʵ���E��(�.�7j�\r&���\Z�v�6E��\n犬��	�\\�����z��G�������Ho��A��������:�g�<���\ZL�895��M?MA\r�����+úz��rn�#7f�ma��E��������g\Z��_QYuo=�z�z�\n�\r&���\Z�v�6E&�mO_����\'&%=÷V6Ԭ�W��l���Sܨ���y�K�x<��މ�n.,�A.��p`R���+cUՐS`I���Z][��G;oE�����9LVKJKe&���|���)\\��I����l����+�hl80�g����7��X,�cv:u{E`C%�O�߾�!b�΍)Y�އ�o�t�[KP�{��D&�z�;46��3prd�Ɓ��������3�H�)HYZ��#7R�������TWߤ�gBqq|n�!�}�����ƥ�hl80�g���X�G&�z�w�,?~.~>�H�m����s%2Kː���1�v;Ew�z��m�UյX	cj��HKcÁI=\'�:�D�቙��Tš<���L���T\\\\�e9�Y������D�Q�EEzeU\rf�X��ߒ�2�U���FX<������1�Bc���\ZL�8�c��<e�΃d���i����OW$��Mb���7(ҫk�F\'��0�Ĺb��1�UC����3{vi������g\ZfW����Gm�]n?���p`R��ь5D�!�M������{o�YYY�3Kc����Xvv�ML/�O��$�fŠ}mb\Z2c(��[��G\'W7_a:��Y��p`R��ɮ���6���\r&��(846��3phl�������Cc��\r&�\Z�Ehl80�g���,BcÁI=��f\ZL�846���p`R����Y�Ɔ�z��\"46��3p��ZI��������3O��޾�¤\'�XbcjjJO\"�Ƥ\'�Xb���&�Lc�\r6��42�%6��>`��4��`#��I#�Xb���&�Lc�\r6��42�%6��>`��4��`#��I#�Xb���&�Lc�\r6��42�%6��>`��4��`#��I#�Xb���&�Lc�\r6��42�%6��>`��4��`#��I#�Xb���&�Lc�\r6��42�%6��>`��4��`#��I#�Xb���&�Lc�\r6��42�%6��>`��4��`#��I#�Xb���&�Lc�\r6��42�%6��>`��4��`#��I#�Xb���&�Lc�\r6��42�%6��>`��4��`#��I#�Xb���&�Lc�\r6��42�%6��>`��4��`#��I#�Xb���&�Lc�\r6��42�%6��>`��4��`#��I#�Xb���&�Lc������ry(�Ȓ�$���d\Z[����|��uvv��ɓǬF���,=�d��Lc�\'N|��m������N����,=�d��Lcɱ������Ǒ,�ݠ\'�Xr,�H|��M��H��H�0��4�����V�šA��IO��$Ekk�j,��=Lz2�%)�?���G�+vp�G��aғi,�cllL�=�d��Lc��N���;z�*&=�ƒ�Z�$ۘ�d\ZK~Pk���lcғ#k�<!>��?OՓ5�ll�_���9T=i,�\r\Z��CՓ�ߠ��9T=i,�\r\Z��CՓ�ߠ��9T=i,�\r\Z��CՓ�ߠ��9T=i,�\r\Z��CՓ�ߠ��9T=�h���gr�::�gg������o�z�r$hlzU��\Z[\\_Z�rn5u�z�3��&��%��>9W���֟�w%��,QYU3:9������׶w��/^�׃<��ro=YRZ�g�%46=��gv��\'������խ���j���\\�z�\"\n��]���/^��}�*,�?���rke�v��Oz�\'S�Vp\Z뤰�ml9w���Fq�\"��a,z���|06w�ih�y�q��ߚζ����↦�J���X7\n����ꕍd[G���C$\"KMt�m,z���*&�����Ċ�j,G1��\\�X~�b��,�鵭]�?e���؋��p��74� �2��+�&����7l�v��O�\\�,�\r�ٲj��81��&��l<��,**�F�������Ƨo�����h\"^m\'8������+`�|}�NEe��:�qI����_p4�,����(��~II�@~�O�C�2�Ì����*46=���f,����}�#j�\0���~�{�4�Ɩ�;oD_A�B��)��Sht$Bcx{cn	FaP�q7c{��hli�����B��:���ut;�X�����7U����V�2er�.Ν^\\��1{�6_�Z���\'�ɰN^U��Oǧn\r�N�.���7O�ך϶�T�`�1ҊClm��\ne�EV]��4JRW߄���1q�Q���%���YVV���p[�����������������(��#YH�+�.?~��իnj^ۈ��\Z�����ق��]=2w�����8���p�gˮ���-С���o��}E�;߁Ñs2�R_��xA���3vsAd�%XYU#69��DI���g����>�b�2`�$��0�km�T��]Q��k�2��)��e�\n�Mϡ�\Z;8vc��Z\"a{H*�3��:7-l�z[w_���֝�����\"k��%<=n:h,��d���+s�[`D���L���_��^��>�#R0��>^Fؿ:�׌��b[�N���n�����a�w0�M��@�Mz�\\�Wʹ}��ʀ������2\0Osk�}���h�����Xu=������?���ش0<iLt�e����\0�a51-n:hl�Z�b򖴦��;K(p��Y|�ܟU�_�+[,�0�#F� ��|��eďN�|uMR�=J�U�E+����u���b�K�We@��X�2������y�xjؿ61�}���E,�ͅe�4��Ƭ�����Ac�s�z�bV챎 le�9\"�҆t1g���t��ؘ�	�+$A�1�uj����Ԝ�������-2W,𠓶]��A.\"�e���%ilEU5�q��������11��X�2��;oవ�L�%��=�~#2)C��6�ܘ[����D��s\Z�Mϡ���\'�eB����5�Bgj���U�鄙ұ��)�Rvi�J�3�(�?\Z��\"f��0M��\Z��Ug���J�s�[[Y��_13��V���q�����n͖Xj�K���\rL�]�����^�(I��\nL:��´�\" �2�Հ�\r=ʏ��x������~��#���b_H���W>F<�!m���M\'ѫ�\n-f�P������f,�L�%��Bp�:K��5��%F�\'-�D#��[5vfq��C��N[0`\"/5Qp`ƧnaU��59�����Gxm{w|��ȰbR34>������b4֍C��il,5�I�H�G�A���\nON�NW�}=�м��!����/))�[�f�	����P��Roϕk�@֞i���5�9cC_L���pG6ZK���n�q�����u��g�t�a��z���OG����\0�Ƥ5�����~2��R��wIk��7&��;.a�|��I��	�\'�֏�׻z��\r��=%��a:��=�ATò�1)�h��:h��ֽ���e�����Ǭ�=�,dCeX��Kv�ND�D�Ҡ��9T=�\Z{dܾ76�lG����aCuP��7(\"ņ�\"?��6�M������oI��a\0�(�T���o|b���n��P��fr��CLM����3V}�A��:��)1FZ�˳ذ��?t��q��LZRay��J:l�Y���Q?�y����!M!����)�jo1�y��\'�U�ƺq�zf��삗7D�����ª�Z�Uf�յuյg����R�.u���g��&& XB�]��\r�s3)!NG[���`�ɤ˩7��ݠ��9T=��X\n0�����E\n�Mϡ�Ic��hhj��[̇1�?�Ka�ƺq�z�Xr4�/�[��C�Lt��X7UO\ZK�Fqq��?��Ʀ�P����7hlzUO\ZK|�Ʀ�P����7hlzUO\ZK|�Ʀ�P����7hlzUO\ZK|�Ʀ�P�D#��46=���<!>��?OՓ5\"kl>355�\'��L���d\Z\0����D��L*Bc 2�ȴ�IEhl\0D�\">�v3��\r��T�g\"�n&�����Ld�ͤ\"46\0\"S��L��T��@d*�3�i7����\0�LE|&2�fR\Z\0����D��L*Bc 2��B�[���\0�LE����\0�LE����\0�LE����\0�LE����\0�LE����\0�LE����\0�LE����\0�LE����\0�LE����\0�LE����\0�LE����\0�LE����\0�LE����\0�LE����\0�LE����\0�LE����\0�LE����\0�LE����\0�LE����\0�LE����\0�LE����\0�LE����\0�LE����\0�LE����\0�LE����\0�LE����\0�LE����\0�LE����\0�LE����\0�LE����\0�LE����\0�LE����\0�LE�������=��̠��%�e&���-a,3�ghln	c�I>CcsK�L�\Z�[�Xf������2�|���0���3ym���tyy�<���Ȓ�y��̌[��%�	9\Zymlww�ׯ_gggO�<y�����!��G�===(����_���cV���C$\"K�&�䵱\'N����:��ϟ�����E\"����\0��?P����.];��y[f\"��X077����|�\0��߿#Q�#��仱�D�۷oj��!��|\"m���G���wc��֖��q�G����j�q�Gr$L��?v��l��ڪ�~����ΝSˌC=\"K��$o	��Ǐ��������a@�ʯ������-�J��O����D�ǎ�gF��?::*�<22��e�ܕ��\'�0�ԩSZ`G�3#w��]�UrW~����Xp�BO5&���Q�UrZ~���\Z��zj~Sc��b@���x�������N\n��\'9��,46��؂�Ɔ\Z[���PBc\ZJhl�BcC	�-Xhl(���\r%4�`�����,�hl��������\r���,>[UR2W]����sc#6���z�����?��i��o������h^��埻�Eߗ�,~�w�����?���\r��҂5r�S�\Zۿ�?�h,�$������pUn��V��i{\\�0 ��ٽ�Ѡ��@rklU\"�vtU7 L�6�	3�O�1}�|���Kk������9[�/*�r�\r�\Z[tn����j�]$ˮ?��n!\n��/���x�B�7H����yy\Z[���X,V�����t�����v�[�aJo��Sܒ!ճ�6�#Uʥm�I��-p��/69�D�Ec�-�\\�B�X�9����9f7�u}��r��R�rq�,��Y*i���B�T綆5��!-�O��r��f��WP�������U�T�d���aV�lmL�u�������L�k�_�q(��f����A!U��GH��o�\"툪8M��m�BJ��qC\Z�lm�a�۔5�/�:X�1־\nMk��-��U�/n�	����}�)���@rkl�f�:y��e���ߟ��9��}s���7rk�o_��dH;+���\".�c����\np�hxR�}���,��:�|��뎷��=�ύ���P���B�\n�L���=��\"ہ��]g���PZ��`15։jl<KA!S7�3��bB���r;�����\'�2lm{�9qu�g^H5Qݴ\0	�)Xrnl<����EC���O���6t^8|Xc���u��X����\ZUHA��/=�\Z[��al�� i���Oƒ�Bc\ZJhl�BcC	�-Xhl(���\r%4�`�����,46��؂�Ɔ\Z[���PBc\ZJhl��c;I�����Ǝ�322r������#�3q�a�۝+v�?^UUu��%[��Ȓx�d���޹��!���_�]�&���_����chh��8q)��������������Y�X��N�B:v��ގ�/\\�������\";s�Lww�[\0�I �RYY�)������{��E��o__��t�;�vLI�;iKUZZ����0&���\"�8��诵��]]]Ⱕ����Z�-� �,��7CE�#��innƌ\ZΗ��755ɋ�![ڀs���\n���1�����`%%%gϞEJcc#�SSS#/�6]\\M+��ش�����eee�}Z��l922V ����r�\nD�z\"daԅ!���:�x̫�Y�k�ˋc�t\\�zU��RZ$A�9a���\0v0�����DBF:�E����[ȝ��¥0���q�W��V~=�D���Փ, 0:��c�\r:14ø��$�ńVL&/$��Q/�6\0����e�`R�3(�8;(�����N�tq5���r\'m�p�5p�:bZ.A+��M\"�э�\0PQ�1Q1����\0�醆9���b�RQ/�6\0�b��_��,	R�2��gLeET�tq5���r\'m��)V��3|D+��M\"�эź���B�1X+bk<�c1\n����xG�����Z$�O�D��11Ǝ�$HA$^���r��I�\\g�h�\Z��T���X��d�	J$�V~=�D��+�cZ�qU�E����\r�N�:f-G�o�2^|t��a��i`#��qogI�����p�������������1%Q�-����3biE\"!>p���#�C\'=�=��Ac1-_�3L\'$DD�XB\"�%$L�XB��%$L�XB��%$L�XB��%$L�XB��%$L�&!�NG	.\0\0\0\0IEND�B`�',0);

/*Table structure for table `ACT_GE_PROPERTY` */

DROP TABLE IF EXISTS `ACT_GE_PROPERTY`;

CREATE TABLE `ACT_GE_PROPERTY` (
  `NAME_` varchar(64) COLLATE utf8_bin NOT NULL,
  `VALUE_` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  PRIMARY KEY (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `ACT_GE_PROPERTY` */

insert  into `ACT_GE_PROPERTY`(`NAME_`,`VALUE_`,`REV_`) values ('next.dbid','10001',5),('schema.history','create(5.22.0.0)',1),('schema.version','5.22.0.0',1);

/*Table structure for table `ACT_HI_ACTINST` */

DROP TABLE IF EXISTS `ACT_HI_ACTINST`;

CREATE TABLE `ACT_HI_ACTINST` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ACT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_ACT_INST_START` (`START_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_PROCINST` (`PROC_INST_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_HI_ACT_INST_EXEC` (`EXECUTION_ID_`,`ACT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `ACT_HI_ACTINST` */

insert  into `ACT_HI_ACTINST`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TENANT_ID_`) values ('5002','myProcess_1:2:2504','5001','5001','_2',NULL,NULL,'StartEvent','startEvent',NULL,'2020-03-04 15:10:15.890','2020-03-04 15:10:15.928',38,''),('5005','myProcess_1:2:2504','5001','5001','_5','5006',NULL,'管理员审批','userTask','1','2020-03-04 15:10:15.930',NULL,NULL,''),('7502','myProcess_1:2:2504','7501','7501','_2',NULL,NULL,'StartEvent','startEvent',NULL,'2020-03-06 02:39:38.159','2020-03-06 02:39:38.177',18,''),('7505','myProcess_1:2:2504','7501','7501','_5','7506',NULL,'管理员审批','userTask','1','2020-03-06 02:39:38.179',NULL,NULL,'');

/*Table structure for table `ACT_HI_ATTACHMENT` */

DROP TABLE IF EXISTS `ACT_HI_ATTACHMENT`;

CREATE TABLE `ACT_HI_ATTACHMENT` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `URL_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CONTENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `ACT_HI_ATTACHMENT` */

/*Table structure for table `ACT_HI_COMMENT` */

DROP TABLE IF EXISTS `ACT_HI_COMMENT`;

CREATE TABLE `ACT_HI_COMMENT` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `MESSAGE_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `FULL_MSG_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `ACT_HI_COMMENT` */

/*Table structure for table `ACT_HI_DETAIL` */

DROP TABLE IF EXISTS `ACT_HI_DETAIL`;

CREATE TABLE `ACT_HI_DETAIL` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_DETAIL_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_ACT_INST` (`ACT_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_TIME` (`TIME_`),
  KEY `ACT_IDX_HI_DETAIL_NAME` (`NAME_`),
  KEY `ACT_IDX_HI_DETAIL_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `ACT_HI_DETAIL` */

/*Table structure for table `ACT_HI_IDENTITYLINK` */

DROP TABLE IF EXISTS `ACT_HI_IDENTITYLINK`;

CREATE TABLE `ACT_HI_IDENTITYLINK` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_TASK` (`TASK_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `ACT_HI_IDENTITYLINK` */

insert  into `ACT_HI_IDENTITYLINK`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`) values ('5007',NULL,'participant','1',NULL,'5001'),('7507',NULL,'participant','1',NULL,'7501');

/*Table structure for table `ACT_HI_PROCINST` */

DROP TABLE IF EXISTS `ACT_HI_PROCINST`;

CREATE TABLE `ACT_HI_PROCINST` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `END_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `PROC_INST_ID_` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PRO_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_PRO_I_BUSKEY` (`BUSINESS_KEY_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `ACT_HI_PROCINST` */

insert  into `ACT_HI_PROCINST`(`ID_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PROC_DEF_ID_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`START_USER_ID_`,`START_ACT_ID_`,`END_ACT_ID_`,`SUPER_PROCESS_INSTANCE_ID_`,`DELETE_REASON_`,`TENANT_ID_`,`NAME_`) values ('5001','5001',NULL,'myProcess_1:2:2504','2020-03-04 15:10:15.888',NULL,NULL,NULL,'_2',NULL,NULL,NULL,'',NULL),('7501','7501',NULL,'myProcess_1:2:2504','2020-03-06 02:39:38.157',NULL,NULL,NULL,'_2',NULL,NULL,NULL,'',NULL);

/*Table structure for table `ACT_HI_TASKINST` */

DROP TABLE IF EXISTS `ACT_HI_TASKINST`;

CREATE TABLE `ACT_HI_TASKINST` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `CLAIM_TIME_` datetime(3) DEFAULT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_TASK_INST_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `ACT_HI_TASKINST` */

insert  into `ACT_HI_TASKINST`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`,`CATEGORY_`,`TENANT_ID_`) values ('5006','myProcess_1:2:2504','_5','5001','5001','管理员审批',NULL,NULL,NULL,'1','2020-03-04 15:10:15.935',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('7506','myProcess_1:2:2504','_5','7501','7501','管理员审批',NULL,NULL,NULL,'1','2020-03-06 02:39:38.182',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'');

/*Table structure for table `ACT_HI_VARINST` */

DROP TABLE IF EXISTS `ACT_HI_VARINST`;

CREATE TABLE `ACT_HI_VARINST` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_PROCVAR_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_NAME_TYPE` (`NAME_`,`VAR_TYPE_`),
  KEY `ACT_IDX_HI_PROCVAR_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `ACT_HI_VARINST` */

insert  into `ACT_HI_VARINST`(`ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`REV_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('5003','5001','5001',NULL,'adminUserId','string',0,NULL,NULL,NULL,'1',NULL,'2020-03-04 15:10:15.890','2020-03-04 15:10:15.890'),('5004','5001','5001',NULL,'soruceUserId','integer',0,NULL,NULL,1,'1',NULL,'2020-03-04 15:10:15.891','2020-03-04 15:10:15.891'),('7503','7501','7501',NULL,'adminUserId','string',0,NULL,NULL,NULL,'1',NULL,'2020-03-06 02:39:38.159','2020-03-06 02:39:38.159'),('7504','7501','7501',NULL,'soruceUserId','integer',0,NULL,NULL,1,'1',NULL,'2020-03-06 02:39:38.160','2020-03-06 02:39:38.160');

/*Table structure for table `ACT_ID_GROUP` */

DROP TABLE IF EXISTS `ACT_ID_GROUP`;

CREATE TABLE `ACT_ID_GROUP` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `ACT_ID_GROUP` */

/*Table structure for table `ACT_ID_INFO` */

DROP TABLE IF EXISTS `ACT_ID_INFO`;

CREATE TABLE `ACT_ID_INFO` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `VALUE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PASSWORD_` longblob,
  `PARENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `ACT_ID_INFO` */

/*Table structure for table `ACT_ID_MEMBERSHIP` */

DROP TABLE IF EXISTS `ACT_ID_MEMBERSHIP`;

CREATE TABLE `ACT_ID_MEMBERSHIP` (
  `USER_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `GROUP_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`USER_ID_`,`GROUP_ID_`),
  KEY `ACT_FK_MEMB_GROUP` (`GROUP_ID_`),
  CONSTRAINT `ACT_FK_MEMB_GROUP` FOREIGN KEY (`GROUP_ID_`) REFERENCES `ACT_ID_GROUP` (`ID_`),
  CONSTRAINT `ACT_FK_MEMB_USER` FOREIGN KEY (`USER_ID_`) REFERENCES `ACT_ID_USER` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `ACT_ID_MEMBERSHIP` */

/*Table structure for table `ACT_ID_USER` */

DROP TABLE IF EXISTS `ACT_ID_USER`;

CREATE TABLE `ACT_ID_USER` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `FIRST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LAST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EMAIL_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PWD_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PICTURE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `ACT_ID_USER` */

/*Table structure for table `ACT_PROCDEF_INFO` */

DROP TABLE IF EXISTS `ACT_PROCDEF_INFO`;

CREATE TABLE `ACT_PROCDEF_INFO` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `INFO_JSON_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_IDX_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_INFO_JSON_BA` (`INFO_JSON_ID_`),
  CONSTRAINT `ACT_FK_INFO_JSON_BA` FOREIGN KEY (`INFO_JSON_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`),
  CONSTRAINT `ACT_FK_INFO_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `ACT_RE_PROCDEF` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `ACT_PROCDEF_INFO` */

/*Table structure for table `ACT_RE_DEPLOYMENT` */

DROP TABLE IF EXISTS `ACT_RE_DEPLOYMENT`;

CREATE TABLE `ACT_RE_DEPLOYMENT` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `DEPLOY_TIME_` timestamp(3) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `ACT_RE_DEPLOYMENT` */

insert  into `ACT_RE_DEPLOYMENT`(`ID_`,`NAME_`,`CATEGORY_`,`TENANT_ID_`,`DEPLOY_TIME_`) values ('1',NULL,NULL,'','2020-03-04 14:51:22.324'),('2501','SpringAutoDeployment',NULL,'','2020-03-04 15:04:10.581');

/*Table structure for table `ACT_RE_MODEL` */

DROP TABLE IF EXISTS `ACT_RE_MODEL`;

CREATE TABLE `ACT_RE_MODEL` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `VERSION_` int(11) DEFAULT NULL,
  `META_INFO_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_MODEL_SOURCE` (`EDITOR_SOURCE_VALUE_ID_`),
  KEY `ACT_FK_MODEL_SOURCE_EXTRA` (`EDITOR_SOURCE_EXTRA_VALUE_ID_`),
  KEY `ACT_FK_MODEL_DEPLOYMENT` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_MODEL_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `ACT_RE_DEPLOYMENT` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE_EXTRA` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `ACT_RE_MODEL` */

/*Table structure for table `ACT_RE_PROCDEF` */

DROP TABLE IF EXISTS `ACT_RE_PROCDEF`;

CREATE TABLE `ACT_RE_PROCDEF` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `HAS_START_FORM_KEY_` tinyint(4) DEFAULT NULL,
  `HAS_GRAPHICAL_NOTATION_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_PROCDEF` (`KEY_`,`VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `ACT_RE_PROCDEF` */

insert  into `ACT_RE_PROCDEF`(`ID_`,`REV_`,`CATEGORY_`,`NAME_`,`KEY_`,`VERSION_`,`DEPLOYMENT_ID_`,`RESOURCE_NAME_`,`DGRM_RESOURCE_NAME_`,`DESCRIPTION_`,`HAS_START_FORM_KEY_`,`HAS_GRAPHICAL_NOTATION_`,`SUSPENSION_STATE_`,`TENANT_ID_`) values ('myProcess_1:1:4',1,'http://www.activiti.org/testm1583134321766','submit','myProcess_1',1,'1','baoxiao.bpmn','baoxiao.png',NULL,0,1,1,''),('myProcess_1:2:2504',1,'http://www.activiti.org/testm1583134321766','submit','myProcess_1',2,'2501','D:\\MSOA\\毕业设计\\manager\\target\\classes\\baoxiao.bpmn','D:\\MSOA\\毕业设计\\manager\\target\\classes\\baoxiao.myProcess_1.png',NULL,0,1,1,'');

/*Table structure for table `ACT_RU_EVENT_SUBSCR` */

DROP TABLE IF EXISTS `ACT_RU_EVENT_SUBSCR`;

CREATE TABLE `ACT_RU_EVENT_SUBSCR` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EVENT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EVENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTIVITY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CONFIGURATION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATED_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EVENT_SUBSCR_CONFIG_` (`CONFIGURATION_`),
  KEY `ACT_FK_EVENT_EXEC` (`EXECUTION_ID_`),
  CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `ACT_RU_EVENT_SUBSCR` */

/*Table structure for table `ACT_RU_EXECUTION` */

DROP TABLE IF EXISTS `ACT_RU_EXECUTION`;

CREATE TABLE `ACT_RU_EXECUTION` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `IS_ACTIVE_` tinyint(4) DEFAULT NULL,
  `IS_CONCURRENT_` tinyint(4) DEFAULT NULL,
  `IS_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_EVENT_SCOPE_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `CACHED_ENT_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`),
  KEY `ACT_FK_EXE_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PARENT` (`PARENT_ID_`),
  KEY `ACT_FK_EXE_SUPER` (`SUPER_EXEC_`),
  KEY `ACT_FK_EXE_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `ACT_RE_PROCDEF` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `ACT_RU_EXECUTION` */

insert  into `ACT_RU_EXECUTION`(`ID_`,`REV_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PARENT_ID_`,`PROC_DEF_ID_`,`SUPER_EXEC_`,`ACT_ID_`,`IS_ACTIVE_`,`IS_CONCURRENT_`,`IS_SCOPE_`,`IS_EVENT_SCOPE_`,`SUSPENSION_STATE_`,`CACHED_ENT_STATE_`,`TENANT_ID_`,`NAME_`,`LOCK_TIME_`) values ('5001',1,'5001',NULL,NULL,'myProcess_1:2:2504',NULL,'_5',1,0,1,0,1,2,'',NULL,NULL),('7501',1,'7501',NULL,NULL,'myProcess_1:2:2504',NULL,'_5',1,0,1,0,1,2,'',NULL,NULL);

/*Table structure for table `ACT_RU_IDENTITYLINK` */

DROP TABLE IF EXISTS `ACT_RU_IDENTITYLINK`;

CREATE TABLE `ACT_RU_IDENTITYLINK` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_IDENT_LNK_GROUP` (`GROUP_ID_`),
  KEY `ACT_IDX_ATHRZ_PROCEDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TSKASS_TASK` (`TASK_ID_`),
  KEY `ACT_FK_IDL_PROCINST` (`PROC_INST_ID_`),
  CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `ACT_RE_PROCDEF` (`ID_`),
  CONSTRAINT `ACT_FK_IDL_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`),
  CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `ACT_RU_TASK` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `ACT_RU_IDENTITYLINK` */

insert  into `ACT_RU_IDENTITYLINK`(`ID_`,`REV_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`PROC_DEF_ID_`) values ('5007',1,NULL,'participant','1',NULL,'5001',NULL),('7507',1,NULL,'participant','1',NULL,'7501',NULL);

/*Table structure for table `ACT_RU_JOB` */

DROP TABLE IF EXISTS `ACT_RU_JOB`;

CREATE TABLE `ACT_RU_JOB` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `ACT_RU_JOB` */

/*Table structure for table `ACT_RU_TASK` */

DROP TABLE IF EXISTS `ACT_RU_TASK`;

CREATE TABLE `ACT_RU_TASK` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DELEGATION_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_TASK_CREATE` (`CREATE_TIME_`),
  KEY `ACT_FK_TASK_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_TASK_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_TASK_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `ACT_RE_PROCDEF` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `ACT_RU_TASK` */

insert  into `ACT_RU_TASK`(`ID_`,`REV_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`PROC_DEF_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`TASK_DEF_KEY_`,`OWNER_`,`ASSIGNEE_`,`DELEGATION_`,`PRIORITY_`,`CREATE_TIME_`,`DUE_DATE_`,`CATEGORY_`,`SUSPENSION_STATE_`,`TENANT_ID_`,`FORM_KEY_`) values ('5006',1,'5001','5001','myProcess_1:2:2504','管理员审批',NULL,NULL,'_5',NULL,'1',NULL,50,'2020-03-04 15:10:15.930',NULL,NULL,1,'',NULL),('7506',1,'7501','7501','myProcess_1:2:2504','管理员审批',NULL,NULL,'_5',NULL,'1',NULL,50,'2020-03-06 02:39:38.179',NULL,NULL,1,'',NULL);

/*Table structure for table `ACT_RU_VARIABLE` */

DROP TABLE IF EXISTS `ACT_RU_VARIABLE`;

CREATE TABLE `ACT_RU_VARIABLE` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`),
  KEY `ACT_FK_VAR_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_VAR_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_VAR_BYTEARRAY` (`BYTEARRAY_ID_`),
  CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `ACT_RU_VARIABLE` */

insert  into `ACT_RU_VARIABLE`(`ID_`,`REV_`,`TYPE_`,`NAME_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`TASK_ID_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('5003',1,'string','adminUserId','5001','5001',NULL,NULL,NULL,NULL,'1',NULL),('5004',1,'integer','soruceUserId','5001','5001',NULL,NULL,NULL,1,'1',NULL),('7503',1,'string','adminUserId','7501','7501',NULL,NULL,NULL,NULL,'1',NULL),('7504',1,'integer','soruceUserId','7501','7501',NULL,NULL,NULL,1,'1',NULL);

/*Table structure for table `sys_permission` */

DROP TABLE IF EXISTS `sys_permission`;

CREATE TABLE `sys_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `css` varchar(30) DEFAULT NULL,
  `href` varchar(1000) DEFAULT NULL,
  `type` tinyint(1) NOT NULL,
  `permission` varchar(50) DEFAULT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4;

/*Data for the table `sys_permission` */

insert  into `sys_permission`(`id`,`parentId`,`name`,`css`,`href`,`type`,`permission`,`sort`) values (1,0,'用户管理','fa-users','',1,'',1),(2,1,'用户查询','fa-user','/api/getPage?pageName=user/user-list',1,'',2),(3,2,'查询','','',2,'sys:user:query',100),(4,2,'新增','','',2,'sys:user:add',100),(5,2,'删除',NULL,NULL,2,'sys:user:del',100),(6,1,'修改密码','fa-pencil-square-o','/api/getPage?pageName=user/user-change-password',1,'sys:user:password',4),(7,0,'系统设置','fa-gears','',1,'',5),(8,7,'菜单','fa-cog','/api/getPage?pageName=permission/permission-list',1,'',6),(9,8,'查询','','',2,'sys:menu:query',100),(10,8,'新增','','',2,'sys:menu:add',100),(11,8,'删除','','',2,'sys:menu:del',100),(12,7,'角色','fa-user-secret','/api/getPage?pageName=role/role-list',1,'',7),(13,12,'查询','','',2,'sys:role:query',100),(14,12,'新增','','',2,'sys:role:add',100),(15,12,'删除','','',2,'sys:role:del',100),(16,0,'文件管理','fa-folder-open','/api/getPage?pageName=file/file-list',1,'',8),(17,16,'查询','','',2,'sys:file:query',100),(18,16,'删除','','',2,'sys:file:del',100),(19,0,'数据源监控','fa-eye','druid/index.html',1,'',9),(20,0,'接口swagger','fa-file-pdf-o','swagger-ui.html',1,'',10),(21,0,'字段生成','fa-wrench','/api/getPage?pageName=generate/edit',1,'generate:edit',11),(22,0,'日志查询','fa-reorder','/api/getPage?pageName=log/log-list',1,'sys:log:query',13),(23,8,'修改',NULL,NULL,2,'sys:menu:edit',100),(24,12,'修改',NULL,NULL,2,'sys:role:edit',100),(25,2,'修改',NULL,NULL,2,'sys:user:edit',100),(28,0,'流程管理','','',1,'',14),(29,28,'用户申请','','/api/getPage?pageName=process/process-apply',1,'',15),(30,28,'代办事务','','/api/getPage?pageName=task/task-list',1,'',16),(31,28,'流程部署','','/api/getPage?pageName=process/process-add',1,'',17);

/*Table structure for table `sys_process` */

DROP TABLE IF EXISTS `sys_process`;

CREATE TABLE `sys_process` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(48) NOT NULL,
  `content` varchar(256) DEFAULT NULL,
  `userId` bigint(20) NOT NULL,
  `username` varchar(12) NOT NULL,
  `createTime` datetime NOT NULL,
  `flage` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

/*Data for the table `sys_process` */

insert  into `sys_process`(`id`,`title`,`content`,`userId`,`username`,`createTime`,`flage`) values (1,'请假申请','肚子疼',1,'管理员','2020-03-28 14:58:01',1),(2,'asdas',NULL,1,'管理员','2020-03-03 10:35:05',0),(3,'asdas',NULL,1,'管理员','2020-03-03 10:38:54',0),(4,'asdas','',1,'管理员','2020-03-03 10:52:58',0),(5,'请假','很难搞！',1,'管理员','2020-03-03 10:56:50',0),(6,'asdas','asdas',44,'阿达','2020-03-04 05:00:50',0),(7,'asd','asdasd',1,'mama','2020-03-04 15:10:14',0),(8,'请假','肚子疼...',1,'管理员','2020-03-06 02:31:45',0);

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `createTime` datetime NOT NULL,
  `updateTime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

/*Data for the table `sys_role` */

insert  into `sys_role`(`id`,`name`,`description`,`createTime`,`updateTime`) values (1,'ADMIN','管理员','2017-05-01 13:25:39','2020-03-06 01:55:55'),(2,'USER','普通用户','2017-08-01 21:47:31','2019-05-30 09:08:24'),(3,'TEACHER','','2019-03-27 02:10:23','2019-05-23 07:48:01'),(4,'test','test','2019-04-29 02:16:48','2019-05-22 09:51:26'),(5,'Moster','Moster','2020-02-26 09:32:04','2020-02-26 09:32:04'),(6,'aaaa','mama ','2020-02-29 12:30:22','2020-03-04 05:13:20');

/*Table structure for table `sys_role_permission` */

DROP TABLE IF EXISTS `sys_role_permission`;

CREATE TABLE `sys_role_permission` (
  `roleId` int(11) NOT NULL,
  `permissionId` int(11) NOT NULL,
  PRIMARY KEY (`roleId`,`permissionId`),
  KEY `fk_sysrolepermission_permissionId` (`permissionId`),
  CONSTRAINT `fk_permission_roleId` FOREIGN KEY (`roleId`) REFERENCES `sys_role` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_sysrolepermission_permissionId` FOREIGN KEY (`permissionId`) REFERENCES `sys_permission` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `sys_role_permission` */

insert  into `sys_role_permission`(`roleId`,`permissionId`) values (1,1),(2,1),(3,1),(4,1),(6,1),(1,2),(2,2),(3,2),(4,2),(6,2),(1,3),(2,3),(3,3),(4,3),(6,3),(1,4),(3,4),(4,4),(6,4),(1,5),(2,5),(3,5),(4,5),(1,6),(2,6),(3,6),(4,6),(1,7),(3,7),(4,7),(6,7),(1,8),(3,8),(4,8),(1,9),(3,9),(4,9),(1,10),(3,10),(4,10),(1,11),(3,11),(4,11),(1,12),(3,12),(4,12),(6,12),(1,13),(3,13),(4,13),(6,13),(1,14),(3,14),(4,14),(6,14),(1,15),(3,15),(4,15),(6,15),(3,16),(4,16),(3,17),(4,17),(3,18),(4,18),(1,19),(3,19),(4,19),(1,20),(2,20),(3,20),(4,20),(1,21),(2,21),(3,21),(4,21),(3,22),(4,22),(1,23),(3,23),(4,23),(1,24),(3,24),(4,24),(6,24),(1,25),(2,25),(3,25),(4,25),(1,28),(6,28),(1,29),(6,29),(1,30),(6,30),(1,31),(6,31);

/*Table structure for table `sys_role_user` */

DROP TABLE IF EXISTS `sys_role_user`;

CREATE TABLE `sys_role_user` (
  `userId` int(11) NOT NULL,
  `roleId` int(11) NOT NULL,
  PRIMARY KEY (`userId`,`roleId`),
  KEY `fk_roleId` (`roleId`),
  CONSTRAINT `fk_roleId` FOREIGN KEY (`roleId`) REFERENCES `sys_role` (`id`),
  CONSTRAINT `fk_userId` FOREIGN KEY (`userId`) REFERENCES `sys_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `sys_role_user` */

insert  into `sys_role_user`(`userId`,`roleId`) values (1,1),(2,2),(18,2),(27,2),(28,2),(29,2),(30,2),(41,2),(3,3),(26,3),(32,3),(44,6);

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(60) NOT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `headImgUrl` varchar(255) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `telephone` varchar(30) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `sex` tinyint(1) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `createTime` datetime NOT NULL,
  `updateTime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4;

/*Data for the table `sys_user` */

insert  into `sys_user`(`id`,`username`,`password`,`nickname`,`headImgUrl`,`phone`,`telephone`,`email`,`birthday`,`sex`,`status`,`createTime`,`updateTime`) values (1,'admin','$2a$06$JlVBSJU9QvttHI1JMPu9kO3X3GN7i.mtMBC9Hd0Qq6khH9aDfz98q','管理员',NULL,NULL,'158784879852','12@qq.com',NULL,NULL,1,'2019-04-08 00:20:51','2019-04-08 00:20:51'),(2,'user','$2a$10$ILWAB4ZOoRr2pXqarliI6uAuL7Q/7dAMTpWO9p7dyVSHHO7zQMTeW','用户',NULL,NULL,'1111111111','11@qq.com','2019-03-31',NULL,1,'2019-04-09 06:44:50','2019-04-09 06:44:50'),(3,'alex','534b44a19bf18d20b71ecc4eb77c572f','讲师',NULL,'','13245698712','alex@qq.com','2019-03-31',1,1,'2019-03-27 02:27:35','2019-04-09 07:57:17'),(18,'user1','96e79218965eb72c92a549dd5a330112','111',NULL,NULL,'123455432123','134@qq.com','2019-05-12',NULL,1,'2019-05-14 04:44:22','2019-05-14 04:44:22'),(26,'user2','96e79218965eb72c92a549dd5a330112','user2',NULL,NULL,'09876567890','aa@QQ.com','2019-05-12',NULL,1,'2019-05-15 02:22:21','2019-05-21 00:57:14'),(27,'user3','96e79218965eb72c92a549dd5a330112','user3',NULL,NULL,'44366758876586578','bb@qq.com','2019-05-14',NULL,1,'2019-05-15 02:23:51','2019-05-15 02:23:51'),(28,'user4','96e79218965eb72c92a549dd5a330112','user4',NULL,NULL,'2143323543456876','cc@qq.com','2019-04-30',NULL,1,'2019-05-15 02:24:22','2019-05-15 02:24:22'),(29,'user5','96e79218965eb72c92a549dd5a330112','user5',NULL,NULL,'1221344234565','dd@qq.com','2018-12-03',NULL,1,'2019-05-15 02:24:49','2019-05-15 02:24:49'),(30,'user6','96e79218965eb72c92a549dd5a330112','user6',NULL,NULL,'123213215135453','ee@qq.coom','2019-05-15',NULL,1,'2019-05-15 02:25:16','2019-05-21 03:08:26'),(32,'user7','96e79218965eb72c92a549dd5a330112','user7',NULL,NULL,'21345457980765','tt@qq.com','2019-05-20',NULL,1,'2019-05-15 06:16:32','2019-05-21 03:08:37'),(41,'user67','96e79218965eb72c92a549dd5a330112','user67',NULL,NULL,'123456324568','asdsa@qq.com','2019-05-14',NULL,1,'2019-05-16 08:39:11','2019-05-16 08:39:11'),(43,'alex-s','$2a$10$uO3EmAB8LgkreKnwiro1Ium2n28iHDJw66e4prCesSOu0NrNvmkhu',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'2019-05-29 06:07:53','2019-05-29 06:07:53'),(44,'mama','$2a$10$tKyEqO4gCCZTWDoto/zCXeoCCv6gz2pviG5HiVasjl0HOfJzeDaTy','mama',NULL,NULL,'1213060407229','363054104@qq.com','2019-11-04',NULL,1,'2020-02-29 12:32:13','2020-02-29 12:32:13');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
