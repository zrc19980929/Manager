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

insert  into `ACT_GE_BYTEARRAY`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('2',1,'baoxiao.bpmn','1','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\r\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\"  xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:dc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:di=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/testm1583134321766\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1583134321766\" name=\"\" targetNamespace=\"http://www.activiti.org/testm1583134321766\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\r\n  <process id=\"myProcess_1\" isClosed=\"false\" isExecutable=\"true\" name=\"submit\" processType=\"None\">\r\n    <startEvent id=\"_2\" name=\"StartEvent\"/>\r\n    <userTask activiti:assignee=\"${adminUserId}\" activiti:exclusive=\"true\" id=\"_5\" name=\"ç®¡ç†å‘˜å®¡æ‰¹\"/>\r\n    <endEvent id=\"_7\" name=\"EndEvent\"/>\r\n    <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"_9\" name=\"ExclusiveGateway\"/>\r\n    <sequenceFlow id=\"_10\" sourceRef=\"_5\" targetRef=\"_9\"/>\r\n    <sequenceFlow id=\"_12\" name=\"é€šè¿‡\" sourceRef=\"_9\" targetRef=\"_7\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\">\r\n        <![CDATA[${flage==true}]]>\r\n      </conditionExpression>\r\n    </sequenceFlow>\r\n    <userTask activiti:assignee=\"${soruceUserId}\" activiti:exclusive=\"true\" id=\"_16\" name=\"é‡æ–°æäº¤\"/>\r\n    <sequenceFlow id=\"_17\" name=\"é©³å›\" sourceRef=\"_9\" targetRef=\"_16\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\">\r\n        <![CDATA[${flage==false}]]>\r\n      </conditionExpression>\r\n    </sequenceFlow>\r\n    <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"_19\" name=\"ExclusiveGateway\"/>\r\n    <sequenceFlow id=\"_20\" name=\"é‡æ–°æäº¤ç”³è¯·\" sourceRef=\"_19\" targetRef=\"_5\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\">\r\n        <![CDATA[${flage==true}]]>\r\n      </conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"_21\" name=\"æ’¤é”€ç”³è¯·\" sourceRef=\"_19\" targetRef=\"_7\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\">\r\n        <![CDATA[${flage==false}]]>\r\n      </conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"_22\" sourceRef=\"_16\" targetRef=\"_19\"/>\r\n    <sequenceFlow id=\"_23\" sourceRef=\"_2\" targetRef=\"_5\"/>\r\n  </process>\r\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\r\n    <bpmndi:BPMNPlane bpmnElement=\"myProcess_1\">\r\n      <bpmndi:BPMNShape bpmnElement=\"_2\" id=\"Shape-_2\">\r\n        <dc:Bounds height=\"32.0\" width=\"32.0\" x=\"280.0\" y=\"90.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <dc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"_5\" id=\"Shape-_5\">\r\n        <dc:Bounds height=\"55.0\" width=\"85.0\" x=\"255.0\" y=\"265.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <dc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"_7\" id=\"Shape-_7\">\r\n        <dc:Bounds height=\"32.0\" width=\"32.0\" x=\"285.0\" y=\"530.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <dc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"_9\" id=\"Shape-_9\" isMarkerVisible=\"false\">\r\n        <dc:Bounds height=\"32.0\" width=\"32.0\" x=\"285.0\" y=\"410.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <dc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"_16\" id=\"Shape-_16\">\r\n        <dc:Bounds height=\"55.0\" width=\"85.0\" x=\"410.0\" y=\"310.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <dc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"_19\" id=\"Shape-_19\" isMarkerVisible=\"false\">\r\n        <dc:Bounds height=\"32.0\" width=\"32.0\" x=\"440.0\" y=\"240.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <dc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_12\" id=\"BPMNEdge__12\" sourceElement=\"_9\" targetElement=\"_7\">\r\n        <di:waypoint x=\"300.0\" y=\"441.0\"/>\r\n        <di:waypoint x=\"300.0\" y=\"494.0\"/>\r\n        <di:waypoint x=\"300.0\" y=\"530.0312805773287\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <dc:Bounds height=\"8.0\" width=\"0.0\" x=\"0.0\" y=\"47.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_23\" id=\"BPMNEdge__23\" sourceElement=\"_2\" targetElement=\"_5\">\r\n        <di:waypoint x=\"296.0\" y=\"122.0\"/>\r\n        <di:waypoint x=\"296.0\" y=\"265.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <dc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_17\" id=\"BPMNEdge__17\" sourceElement=\"_9\" targetElement=\"_16\">\r\n        <di:waypoint x=\"316.0\" y=\"425.0\"/>\r\n        <di:waypoint x=\"460.0\" y=\"425.0\"/>\r\n        <di:waypoint x=\"460.0\" y=\"365.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <dc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_20\" id=\"BPMNEdge__20\" sourceElement=\"_19\" targetElement=\"_5\">\r\n        <di:waypoint x=\"440.0\" y=\"256.0\"/>\r\n        <di:waypoint x=\"340.0\" y=\"292.5\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <dc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_22\" id=\"BPMNEdge__22\" sourceElement=\"_16\" targetElement=\"_19\">\r\n        <di:waypoint x=\"456.0\" y=\"310.0\"/>\r\n        <di:waypoint x=\"456.0\" y=\"272.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <dc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_10\" id=\"BPMNEdge__10\" sourceElement=\"_5\" targetElement=\"_9\">\r\n        <di:waypoint x=\"301.0\" y=\"320.0\"/>\r\n        <di:waypoint x=\"301.0\" y=\"410.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <dc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_21\" id=\"BPMNEdge__21\" sourceElement=\"_19\" targetElement=\"_7\">\r\n        <di:waypoint x=\"472.0\" y=\"256.0\"/>\r\n        <di:waypoint x=\"550.0\" y=\"420.0\"/>\r\n        <di:waypoint x=\"317.0\" y=\"546.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <dc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n    </bpmndi:BPMNPlane>\r\n  </bpmndi:BPMNDiagram>\r\n</definitions>\r\n',0),('2502',1,'D:\\MSOA\\æ¯•ä¸šè®¾è®¡\\manager\\target\\classes\\baoxiao.bpmn','2501','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\r\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\"  xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:dc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:di=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/testm1583134321766\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1583134321766\" name=\"\" targetNamespace=\"http://www.activiti.org/testm1583134321766\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\r\n  <process id=\"myProcess_1\" isClosed=\"false\" isExecutable=\"true\" name=\"submit\" processType=\"None\">\r\n    <startEvent id=\"_2\" name=\"StartEvent\"/>\r\n    <userTask activiti:assignee=\"${adminUserId}\" activiti:exclusive=\"true\" id=\"_5\" name=\"ç®¡ç†å‘˜å®¡æ‰¹\"/>\r\n    <endEvent id=\"_7\" name=\"EndEvent\"/>\r\n    <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"_9\" name=\"ExclusiveGateway\"/>\r\n    <sequenceFlow id=\"_10\" sourceRef=\"_5\" targetRef=\"_9\"/>\r\n    <sequenceFlow id=\"_12\" name=\"é€šè¿‡\" sourceRef=\"_9\" targetRef=\"_7\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\">\r\n        <![CDATA[${flage==true}]]>\r\n      </conditionExpression>\r\n    </sequenceFlow>\r\n    <userTask activiti:assignee=\"${soruceUserId}\" activiti:exclusive=\"true\" id=\"_16\" name=\"é‡æ–°æäº¤\"/>\r\n    <sequenceFlow id=\"_17\" name=\"é©³å›\" sourceRef=\"_9\" targetRef=\"_16\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\">\r\n        <![CDATA[${flage==false}]]>\r\n      </conditionExpression>\r\n    </sequenceFlow>\r\n    <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"_19\" name=\"ExclusiveGateway\"/>\r\n    <sequenceFlow id=\"_20\" name=\"é‡æ–°æäº¤ç”³è¯·\" sourceRef=\"_19\" targetRef=\"_5\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\">\r\n        <![CDATA[${flage==true}]]>\r\n      </conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"_21\" name=\"æ’¤é”€ç”³è¯·\" sourceRef=\"_19\" targetRef=\"_7\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\">\r\n        <![CDATA[${flage==false}]]>\r\n      </conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"_22\" sourceRef=\"_16\" targetRef=\"_19\"/>\r\n    <sequenceFlow id=\"_23\" sourceRef=\"_2\" targetRef=\"_5\"/>\r\n  </process>\r\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\r\n    <bpmndi:BPMNPlane bpmnElement=\"myProcess_1\">\r\n      <bpmndi:BPMNShape bpmnElement=\"_2\" id=\"Shape-_2\">\r\n        <dc:Bounds height=\"32.0\" width=\"32.0\" x=\"280.0\" y=\"90.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <dc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"_5\" id=\"Shape-_5\">\r\n        <dc:Bounds height=\"55.0\" width=\"85.0\" x=\"255.0\" y=\"265.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <dc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"_7\" id=\"Shape-_7\">\r\n        <dc:Bounds height=\"32.0\" width=\"32.0\" x=\"285.0\" y=\"530.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <dc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"_9\" id=\"Shape-_9\" isMarkerVisible=\"false\">\r\n        <dc:Bounds height=\"32.0\" width=\"32.0\" x=\"285.0\" y=\"410.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <dc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"_16\" id=\"Shape-_16\">\r\n        <dc:Bounds height=\"55.0\" width=\"85.0\" x=\"410.0\" y=\"310.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <dc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"_19\" id=\"Shape-_19\" isMarkerVisible=\"false\">\r\n        <dc:Bounds height=\"32.0\" width=\"32.0\" x=\"440.0\" y=\"240.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <dc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_12\" id=\"BPMNEdge__12\" sourceElement=\"_9\" targetElement=\"_7\">\r\n        <di:waypoint x=\"300.0\" y=\"441.0\"/>\r\n        <di:waypoint x=\"300.0\" y=\"494.0\"/>\r\n        <di:waypoint x=\"300.0\" y=\"530.0312805773287\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <dc:Bounds height=\"8.0\" width=\"0.0\" x=\"0.0\" y=\"47.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_23\" id=\"BPMNEdge__23\" sourceElement=\"_2\" targetElement=\"_5\">\r\n        <di:waypoint x=\"296.0\" y=\"122.0\"/>\r\n        <di:waypoint x=\"296.0\" y=\"265.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <dc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_17\" id=\"BPMNEdge__17\" sourceElement=\"_9\" targetElement=\"_16\">\r\n        <di:waypoint x=\"316.0\" y=\"425.0\"/>\r\n        <di:waypoint x=\"460.0\" y=\"425.0\"/>\r\n        <di:waypoint x=\"460.0\" y=\"365.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <dc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_20\" id=\"BPMNEdge__20\" sourceElement=\"_19\" targetElement=\"_5\">\r\n        <di:waypoint x=\"440.0\" y=\"256.0\"/>\r\n        <di:waypoint x=\"340.0\" y=\"292.5\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <dc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_22\" id=\"BPMNEdge__22\" sourceElement=\"_16\" targetElement=\"_19\">\r\n        <di:waypoint x=\"456.0\" y=\"310.0\"/>\r\n        <di:waypoint x=\"456.0\" y=\"272.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <dc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_10\" id=\"BPMNEdge__10\" sourceElement=\"_5\" targetElement=\"_9\">\r\n        <di:waypoint x=\"301.0\" y=\"320.0\"/>\r\n        <di:waypoint x=\"301.0\" y=\"410.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <dc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_21\" id=\"BPMNEdge__21\" sourceElement=\"_19\" targetElement=\"_7\">\r\n        <di:waypoint x=\"472.0\" y=\"256.0\"/>\r\n        <di:waypoint x=\"550.0\" y=\"420.0\"/>\r\n        <di:waypoint x=\"317.0\" y=\"546.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <dc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n    </bpmndi:BPMNPlane>\r\n  </bpmndi:BPMNDiagram>\r\n</definitions>\r\n',0),('2503',1,'D:\\MSOA\\æ¯•ä¸šè®¾è®¡\\manager\\target\\classes\\baoxiao.myProcess_1.png','2501','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\00\0\0<\0\0\0ï3‘\0\03èIDATxÚíİ	˜\\e™7î €È0Š£»ƒŠƒ:8ã‚Ÿë8aD!JÀ9}êTwBÊ4Â*‹F–((‹ŒÈ(dQt\\P $V\rd‘\r †@‚²d$ìõ^¨ÆNÒ{WU÷éºïëz®S©êôòÔé:¿>uŞ÷2\0\0\0€Øÿ„‹kıUY\0Ú4ÀvßD\0`\0@€`\0\0F€\0\0 ”Æ($\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0`PûŸpq­¿\Zîã\0\0ã`»o¨Ç\0\0\0\0`\0@€\0E€1\n	\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0GµZm“yóæpâ‰\'^uôÑGß÷ñüÑîîîZ¥R©uuu=qÀ<tÄGüşÓŸşôÿì»ï¾Ûê\00nî¼óÎ·qÆWî·ß~ïµ×^µSO=µ¶hÑ¢ÚŠ+jkÖ¬©%<òHmåÊ•µÅ‹×Î<óÌÚ¬Y³ØgŸ}ş4gÎœÏdY¶™.\0-¹d³…^8{öì\'9æ˜Ú\r7ÜğdP®%K–ÔN<ñÄÚî»ïş—<pG\0š*u9şøãïßÿık×]w]m,nºé¦Ú¾ûîûØ{ìñÓîîîMt\0h¸Õ«WÿÛa‡öÈ	\'œP{àjŞjŠÏ÷èŞ{ï}©·”\0€†Jg^RxùÒ—¾T{ì±ÇjvÒI\'=²Ç{,˜:uê†º\r\0ŒYºæ%½m”Î¼4#¼ô:î¸ãìêêú®\0c–.ØM×¼4êm£ÁŞNÚk¯½î¯T*Su\0µôÖQ\Zm”F\ZµBº°·³³ó.×Ã\0\0£–æyIC¥[é¨£ú]¥R9H÷€K3ì¦IêZuö¥×Ò¥K®V«·» \0±ùóç”fØmæ…»éîî^™çù;<\0Àˆ¤µÒò\0ãáØc½®R©åY\0\0F$-Ì˜Ö6\Z¿øÅ/îˆ\0sg\0‘´ªtZ˜q<ÜsÏ=Š\0³Ô³\0\0ŒÈŒ3^UºÕÒâ`Öx\0€‰\0QOéë{\0€Ùm·İÇ30÷8\0ŒØÇ?şñ5ãu\rÌÊ•+oq\r\00bGyäÍã5\niŞ¼yç…\0ŒØQGõİñšæğÃ?×<0\0Àˆí³Ï>ÿgÖ¬YOŒÃL¼kÒRfâ\0Fe¿ıö[Õêµ-Z”Ş>ºÕZH\0À¨vØaGsÌ1O´2Àì±ÇçZ\Z\0µîîîMzzzV/Y²¤%áåª«®š—Î¾dY¶™î\0£6{öìiûì³Ï#<ğ@SÃËƒ>xWµZ½9ÌT]\0ÆlÏ=÷üÑ±ÇûP/è]=kÖ¬tíËº\r\04Dº vöìÙóN<ñÄ‡›bVÏ™3ç{iŞ—ô–•n\0\r\r1===ç}ùË_şß¿üå/\r{Ûhï½÷Níãº\0 i!fÆŒgî¹ç÷_ıõõ‚İú5/g8ó\04]ºĞ¶««kùG±,‚ÌHŞVZ³xñâóÓ55i´‘v€–JgMò<Ÿ]ÅïfÎœyÏ1Çsİ¥—^zû]wİµò‘GyzUé´0ã…^8/-fØ­—ƒ¼e\0Œ«$ÛDaæ»j®Ûk¢jõíÒtK<öù´<€v€‰jˆÍ:\0”)À<–eÙ3u\0(S€y¤§§g#\0\0Ê`Î²lc\0\0Ê`Ö˜ß\0([€ùËôéÓ7Õ	\0 Lfµ¹^\0€²˜û;;;Ÿ£\0@™Ì}Y–=W\'\0€2˜?W«Õçé\0P¦\0sÏÌ™3Ÿ¯\0@™ÌÊ,Ë^¨\0@™Ì]EQ¼H\'\0€2˜Y–½X\'\0€2˜åQ/Õ	\0 LæÎÎÎ—ë\0P¦\0s{–e¯Ô	\0 Læ¶jµú:\0”)À,Ë²ìU:\0”)Àü.Ïó×è\0P¦\0ssµZ}­N\0\0¥QÅMY–m¥\0@iT*•¥b^§\0@iDxY’eÙt\0(J¥òë<Ï·Ö	\0 Læú¢(şY\'\0€ÒÈóüÚjµú&\0\0J£R©ü*êÍ:\0”)À\\]­Vßª\0@™Ì/ó<›N\0\0e\n0‹¢Ş®\0@™ÌÏ‹¢x§N\0\0e\n0WF½K\'\0€2˜Ë‹¢xN\0\0¥áåÒ÷ê\0P\Z•JeaÔT\0\0J£(Š‹;::¶Õ	\0 4*•Ê‚¨÷é\0P¦\0saQï×	\0 4ò<¿ Z­n¯\0@iT*•ó\"ÄLÓ	\0 4\"¼ü¬Z­~P\'\0€Ò¨T*çFˆÙQ\'\0€2˜Gí¤\0@iäyşÃ¢(>¬\0@iT*•DˆÙE\'\0€Òˆğòı¢(>¢\0@iDx9;BL¦\0@iT*•³¢r\0\0Ê`¾S\0\0J#²Ë™ywê\0P\Z•JåŒ1]:\0”F„—Óò<Ÿ©\0@iT*•S£ºu\0(S€9%ê£:\0”)À|³(Šİu\0(S€ùï¨ÿĞ	\0 4ò<ÿzQ{è\0P\Z•Jåkbfé\0P¦\0sbÔŞ:\0”)À|5ÏóÙ:\0”)Àµ¯N\0\0¥‘çù±EQì¯\0@iDxùr„˜u\0(J¥rtÔA:\0”FQ_Êóü`\0\0J£R©|!êP\0\0Ê`>WÅ\'u\0(/ŸÍóüS:\0”F¥RùLÔá:\0”FQŸÎóü\0\0J£R©5W\'\0€2˜ÃÓÛH:\0”Fº€7]È«\0@i¤!Ôi(µN\0\0¥‘çù\'\"Ä|^\'\0€ÒˆğrH„˜/ê\0P\Zi!Ç´ £N\0\0¥‘çùEQ|Y\'\0€Ò¨T*D}E\'\0€ÒÈó|¿¢(Ó	\0 4\"¼ì!æ\0\0J£R©ìu¢N\0\0¥‘çù¬0_Ó	\0 4\"¼ìu’N\0\0e\n0=Q\'ë\0P\ZEQìçù7t\0(J¥òÑ¨St\0(S€é:U\'\0€Ò(Šb·0ßÒ	\0 4\"¼Ìˆ:]\'\0€ÒÈó¼³(Š3u\0(/E¥RùN\0\0¥á%:K\'\0€Ò(Š¢#Ì÷t\0(/»F£\0@iäy¾K˜è\0P\ZEQ|8BÌu\0(/;W*•é\0P\ZEQLó\0\0J£R©|(ê§:\0”FçÓ\"Àœ§\0@iT«Õí#Ä\\ \0@iDxù@¥R™§\0@itttlWÅ|\0\0J#ÂË¿W*•‹t\0(/S£ê\0P\Zï-ŠâR\0\0J£R©ükÔe:\0”FGGÇ»#À\\¡\0@iEñÎ0?×	\0 4\"¼¼=j‘N\0\0¥‘çùÛ\"ÀüR\'\0€Òˆğ²MÔb\0\0J#Ïó·D€¹F\'\0€Ò¨V«oŠs­N\0\0¥QÅ?W*•ëu‚q²¹\00boÌóü`lU‹ÚQ+\0‘¢(ş©R©Ü¨ŒCx¹7êØúVˆ`øò<}˜ßèã^zCËB\0#’eÙVEQÜ¤ŒSxê~\0X_µZ}m¥R¹Y\'ÇğÒ÷ñÕS:#\0Ë²lË0·èã^zy;	€¡U«ÕWG€ù½N0ÂKß³jŠ31\0$ÂËQ·ê$¼ôı«¦8@²,{e˜Ûu‚	^úş×Ä\0°¾ÎÎÎ—G€¹C\'hrxÙ j·úv0ë~œkb\0X_–e/‹\0óG Éáå”)OÍº{Ê !f ëı|ÎÄ\0ğ”®®®—D€¹S\'hRxIv«‡’Ú !¦oxé­™ë|ŞÕSœ‰ )ŠâE`îÒ	š^\n\'}CL³Ÿãí$\0’eÙ#À¬Ô	š^†\n1ÏfxéûuŒNhw3gÎ|~˜{t‚&†—ÁBÌoG^Ö\r1®‰hV~U¢ÎÑ)\Z^1#	/½¼ĞNŠ¢øğP&Ïó­uŠaØ¼<N\ZáÿKo­{æå·õûGâõÿ»¹§ \rv&ÎwuˆéçÁÎÀ6Äz]éë¥QIö\0´O€Ùu \0S­Vß¤CŒ&Äl¼ñÆC…‰á\\3œÓ»V’·\0Ú0Äü¢Ÿ\0s®Î0\\i[zK2ÏócvÙe—¥QOb\Z*İß(¤ÁBŒIí\0ÚYxvèçí£÷è‰ ò±Ÿ|4ê”¨ßÆ¿ïíyQs:::Ş»é¦›~hJÿ£ƒ†šçe¨ybzm3Åè#\0âÀsyŸğ2_GèÕÓÓ³QìoıâãT~˜æ\nŠº-ş}fü{VggççÎÛßE·½£ƒú†Œİ¦=Úh83ñ¦Ï»«g@€™ÚçÌTi_Y–=7‚É´(Ÿ}á’¨ÕQ¿ŠújTÖÌ\ZÁ§[wÚÿ¾ád°¡Ò}œğÀÚâ uE Ğ‰öR­Vÿ!÷jÔ×b¸!‚Ëqû¢Ø~:şıvÚéoÇø%vè\'ÄÌœ2¼Õ¨û~œù^\0X_°Ş®ÇubòJoõ¤ÑeLf§aòñ|ßµ\"şııø÷şq{›©S§nØ„/=Ös…€ñP«Õ6\\¶lÙ9‹-zü¢‹.ªÍŸ?_¢,XP»ì²Ëî‰ê²W\rmúôé›vttlÁäğ¨yQ÷Eı&ê¿#°ìÁå5-üvFBê/\0ã!…—Ë/¿¼¶råÊÚÃ?¬ÆP«V­ª]zé¥÷G˜qÄ:ÒŠâQ‰€ò•¨_FıoÔT¾÷OOë]ó·8¢åRxÙyçÙË^ÖíÙéÌ‹ğÒĞóğüùó—¶ùnµA“×G0Ù=BÊ·¢n‰úSšÃ\'êĞ4~Ú´iÏš€ßwïäsC½”†Jßû¾÷½ïœøy¾íU`¤·ÆV˜GÛiÊ²lã8¿+‚É!±ıqZ9<ê÷Q§GõÄão˜2üé÷ÇÛPgbÒã+¢vMoƒ¥ku\"¬½Ã+	@‹¥ë7„†˜ÚdŞgªÕêóâÀı¡,Ÿ¯ÏÓ“†3_ÿ>.æYWW×KJş#®;Äºïšµæ‰Ÿ¹+~öE%\nh\0í`ş÷¾µe‹O­-Yğ™\'+İN÷	,“?ÀdYöª8HÏˆpòõØŞušT0¶GF½/ßlşjô†˜ú„—~gğ\\•‚ŒW€	`Vß»¼vã¼Ãk×ÿìàµ*İ—Z&O€‰0òÌ*o‰ƒò¾qP>;¶Ëëõ½ø÷>é±ô1íğ»±å–[~rã7NÏåÜ)ƒ¬*}ygz+)½¥ä`˜;–üd½ğÒ[\\r®ĞRâ\0“Îtttlà¹õ³*÷Gı:m©¿=²E»şn¤	·İvÛ4bm ğÒ+]Ì›&ØóŠ0ÌÒ…_0À¤Ç„–ò˜8Ğ¾4]§Ûã£®©_¿rYÔçÒu-éú¿k/a±ıöÛï0ŒEıâåWèÀ	07ÎŸ;`€I	-6ÀlPÅ?EíQ´,jU\Z)!æàôÖG\ZAä· ß³/×öYƒëœáüŸtÆ°j\0fÒ˜&M‰?¥»»{“4ÇJ|?ÒŸÖç^Is°œšæd‰z=~Xg_ví^¬èéÖCı?Ãª&X€I£\n0é1¡eø&ÜR hÄs—f¯ÏµSšÍ6¶WÖg·½*Ív÷í’f¿µ‡Lº&(­Á´n€‰:z˜ga«˜(æ–+O0À¤Ç„–á˜úÁmMºîd4gaâàºe} oÄçXšÖŠÛÄö°´®Q0cW_8²ÖO­‰Ç^0ŒOaX5ÀD	0Z~CíÆ\\ÿí£¸/=&´`\"h¶Gû¼%1èš;)àÄÇ¼->ö€´\"slïŠúC}¥æ½ã¾I+8Ûƒ~öåÌHÎÂV\r0Lª[¯>}½\0“îX0õƒâ©ıêû<tvv>\'BÉâşÏÄğâ¨âöõqßÅ¶\ZŸç•öÖæJÏÉ á%ÕêîîîÍ‡ù¹«÷\0óĞCµ[~~ÒúoÅ}é1¡¥ÿ\0¡äåq [<ÀÁpa„“ØT¾Zñ’†3_½ÏFíå¹öÎ–Ÿ}IÏÕ­}Ï”õSs‡`«Ï\0“fÚ½ùÊ¯x\rLzÌl¼ë˜ú<\"+9>õ?^ŒíÛ{zz6²7N,éº¢t6¬Oİ\"‚Î‹‡ûÿ\r«\0óĞCµ·\\\\ûõs/½•>&}¬³1OÕW¾ò•PâíˆZ;Ïr[éLX<GçöÿV\rĞâ\03ÔYgc®|°6cÆŒN~õ«¨»	0Ù\'®;§IÿÆ‚«hU€ÎY—ÁÎÆ´û˜yóæ­5\n)]ø™dõ‘H¿é¯Œ[€ÉÒ‚–cü4†U´*ÀŒ6¼ô–k`Ÿ‰7štL gÛ\'®úÙ“3\Zğy«hE€Qí³\Z5‹ĞñÑ¨S\Zô¹«`š/ÏóY<¾Ö \0cX5€\0#ÀĞ’\0³_QÇ5êóV\r À04]CÒB™ú|†U0Maãğu—|h@(2¬\Z@€`hj€Ik#ÖàOkX5€\0#ÀĞ<2¾”çùÁMø¼†U0M0Ç¥y›tvÇ°j€‰`âËô[åq†BÆIQ{6ésV\rP†\03Ø}ãı¸\0Ã\0!ã”4™]ÏğV\r À04<`œ™çyg³>¿aÕ\0Œ\0C3ÌÙiAÇ&\rÃª†Æ‰`ñã¨šüe«`\Z\'ÏóªÕêö-8ÓcX5€\0#ÀĞ°`qqGGÇ¶-:ÛcX5ÀD0S£¦d\"T\\õ®}-Ãª&Z€1‘%\r0‹£¶iáÃª†±Éóü†ÎÎÎ7¶êëV\r À04âŒÈMY–mÕâ¯iX5€\0#À0z$nÚ¢Å_Ö°j\0F€aLæÎ¨—Ã™Ãª†Q˜{fÎœùüqúÚ†U0£\n«³,Ûlœ¾¶aÕ\0Œ\0Ã¨BÄÃ`6¯¯oX5€\0#ÀL\0µZmÃeË–³hÑ¢Ç/ºè¢\'û4‘+ÂÃ¸~ıóÏ?¿ö±}¬öío{­û,XP»ì²Ëî‰r¡/ À(¦ÙRx¹üòËk+W®´Ÿ³.\\XûÔ§>U{è¡‡ÖºÕªUµK/½ôş3»Ú³\0F	0M”Î¼/#«\\æÌ™ódY÷±1Ç¾¶Ô0J€i¢ô¶‘ıcäµdÉ’Ú¬Y³j<ğ@ûÚ£ö,@€QŒ}mBÖñÇ_;ë¬³ìk\0*ÌDİ×ş÷¾µe‹O­-Yğ™\'+İN÷µó>µbÅŠÚî»ïşäÖ¾ À0l_[}ïòÚó¯]ÿ³ƒ×ªt_z¬÷«t&‰±¯Lq]BjëF`îXò“õÂKoıqÉ¹m½o¥k`Òµ0éšh{—]vÙ\n#C\ZWË—/?ËÈÑ˜¥¿8`€IV½ö°jh[_|ñÎ—\\rÉ}wß}÷ƒeR:‘Ï¼¤ğ²`Á‚ÛÍÍ1ú\0sãü¹˜ô˜aÕk«`€¶Üã…pqzëc¢ÎŠzá…ûÌ¨CTêİRáE€iå°j \"À¬éîîŞD\'&o€I£\n0é1fíaÕ@	äy~o˜Íubò˜[®<qÀ\0“^ÖVı£ıH€(Á˜;»ºº^¢“7Àüiù\rµ/<rı·â¾ô˜ğ²ö°êtA¯=`â˜eY–½J\'&o€IuëÕ§¯`Ò}BËúÃªÓjÕy¿ÃŞ0E±$Ìtb˜‡ªİòó“Öû(î{xbB—úú×¿.n_íİÀ0qÏÀ\\S­Vßª“3À¤™vo¾ò«^“k÷Ùx×­úè¼«\"ÜwÙÃ\0&n€¹¢££ãİ:1ÉÌCÕVÜrqí×Ì0¼ôVú˜ô±ÎÆüu&Ş/ïŒß;¦OŸ¾©½`b˜`¶Ó‰É`†:ëâlÌğÖİŠßoGù´½`b˜só<ßQ\'&O€ÎY—ÁÎÆ0O˜WDİ“¶ö4€	&şÂ<;L¦“\'ÀŒ6¼ô–\0ó×‰ìÒ˜t&Æ0ñÎÀœ5C\'&O€Q0é\Z˜t-ŒaÕ\0/ÀœÕ£Œz¸ßÅÓh$Ãª&^€9>j_`ÔÃ­F½aÕ\0/À|!êP`Ô€fŠaÕ\0/ÀÌ:R\'5p€©ÿ®V\r0Ì¡é,ŒN0jÈ\0cX5ÀD‘çù~ñWåq:!À¨ÁLbX5ÀÄ9Ó“F\"é„\0£†0†ULœ303ã¯ÊÓtB€nÅ—í·Zõøx˜úYÃª&@€ÉÒl¼:!ÀŒ$Àv_³ï\03Å°j€ñ/ÂÓÓzH:!À0Ã0†UŒ·´u¼Ï×	F€~€I«ß30ï‰â+tB€`F`«/Õjõ­ñ|µN0ÌÈLı\0ÃªÆC–eoˆá%:!À0#0†UŒß˜WÇğïuB€1Œzä¦~Æ°j€VëêêzI¼øŞ©Œ\Z]€™bX5À¸œy^¼øşY\'5ê\0cX5@«uwwo/¼ktB€Q£0‰aÕ\0­•N?®\rŒ\Zs€1¬\Z •Ò˜t&F\'5ú\0“V\rĞByßfs`ÔØŒaÕ\0­=sg\Z¤Œ\Z[€©Ÿ…1¬\Z EfY–e¯Ò	F=ÀL1¬\Z 5ÒL¼iF^`TCŒaÕ\0-:sMZI\'Õ˜\0Sÿ½2¬\Z ÉæŠwë„\0£\Z\Z`«hr€Yf;`TãLbX5@sÌ¹yï¨Œjl€1¬\Z ‰â¯Ä³ã6Ó	F56ÀÔ¿«hÒ˜Ó£fè„\0£\Z`¦V\rĞ´\0srTN”ÏE]$t4¶ÖD€y´ÑÏ“aÕ\0Í	0ÇGí«åsÙe—­X¹r¥àÑ Z¾|ùY`–6é÷Ì°j€¿°~!êP(Ÿ‹/¾xçK.¹ä¾»ï¾ûAdlg^RxY°`ÁíQ»6é÷Ì°j€¿°Î:R\'Ê)¸;ÎŸ?qzë#]¿¡FU©wK›^zV\rĞØ\0sh:£´`_ûjÔãY–mÕ?¿aÕ\0\r/¦ûÅ_†ÇéÍ4uêÔ\rãà½*ªuV»öÁ°j€ÆıUÜ“F\"éMÊ•zxé­mÚ´†U4èÀ23^LOÓ	š”Ï_\'À,MgeÚ±†U4&Àdi6^ ‰ì×ÅûÑuL­ÏBV\r0öƒËô´’NĞÄüuÃK½VÄş÷‚6\r0†UŒEZ‰:\"óu‚fÈ²l³0÷`RÚÆ<V\r0†Ñ÷Ä‹è:A3Ä¾µç á¥·¦¶co«ƒjµúÖx½Z\'hR€YØO`y$Ú×Ö/ì=5…œ6şÂ°j€ÑÈ²ì\rñ\"ºD\'h´4Ê(\rŸ®¿MùºôvRlÿÉş¶ÃªF£Z­¾:^@¯´ÂŒ3ş>ö·•:ñW†UŒBWW×KâÅóN ²,{f\ZR=wîÜgèÆ_V\r0BÕjõyñâùg …ëUd^¨kõÄ°j€‘èîîŞ$^4×è-<Xÿ&]{¥k3¬\Z`dÒE„k-0—´ëĞéÁV\r0òÊšt&F\'hÑşvNZÂB\'ÖgX5À¤™R#Àl®´(À|-Ô{éD¿«ÁåÎ4\ZI\'hÑş67•NôÏ°j€áP–eYö* EûÛŞyÿ—NÚ#Ãª†ñß£BháşÖu¶N\Z`«Æ‹å5iM$ EûÛÔ4I\'†z†Uq@¹¢££ãİ:A‹ÌÖC\ZÃª†0Ò‚{:A+XiDaÏ°j€AÌ¹ñWŞ:A+XiD«ä¯¼³M,F‹C³õ†ÿûiX5À\0“Ó£fè-Üç¬‡4²~V\rĞÏ‹ãÉQ=:A÷9ë!¬_†Uôóâx|Ô¾:A÷9ë!aÕ\0ëL¾u¨NĞÂ}ÎzH#dX5Àú“´6Í‘:A‹÷¹¹:12†U¬}094…Ñ	Z¸ÏYit«è’ıâñ8 U¬‡4¦ŞV\rPÿk¸\'DÒ	Z¸ÏYilı3¬\Z Ïó™ñbxZºİİİ½y¼8nÿ~ÎĞ,ÖC\Zs€1¬\Zh//½[¢nàrolkT·nÑ,ÖCjH4¬\Zh»¿ŞÎ$¸¤ºeêÔ©êÍb=¤±3¬\Zh;õ³0k\n0ñ‚8[—hA¶ÒV\r´)Ç`Vuwwo¢C´ ÀXiì«ÚKıbİUı˜£u‡ë!5€aÕ@ÛIo­^M#t†ë!5®—†Uí#]¨k{L¼\0~WWháA×zHë¥aÕ@{‰\0SésñîÖ:BºÖCj Ãªv1¿ˆ¿Gt‚ë!5aÕ@Ûéèèøà.»ìò°NĞâ3ÖCj|O\r«ÚÊû£jQ;j­b=¤¦0¬\ZhÛEİul}+ÄĞª³ÖCjN_\r«Ú&¼ô†–„ZÅzHÍcX5ĞNáe¨û¡¡¬‡ÔÔ\0cX5ĞVá¥ïã«§<uFšy µR“V\r´[xéåí$Z`¬‡Ô$†Uí^ú†˜USœ‰¡yÆzHMdX5Ğá¥ïÿ[5Å™š`¬‡Ô\\†Um^úş×ÄĞŒ\0c=¤&3¬\Z˜,á%JŞmÊĞ§”×ı8×ÄĞŒ\0c=¤ÖôùÛQÿ©@™ÃË)Sšu÷”ABÌ@×ûùœ‰¡QVë!5YQ/Š#zıX–e§#@ÙÂK²[=”Ô	1}ÃKoÍ\\çó®âL9¸Z©IÒğôèí—\"¸ü)¶ÇÅv]Ê^\n\'}CL³Ÿãí$\ZÂzH7sæÌçG`ù|}\"»¯F½TW€2‡—¡BÌ3†^ú~£“ë!5NµZ}^ôò³õàrRggçËu˜,áe°óÛ„—uCŒkbë!]–eÏ­Ïº»*ê¿#Èüƒ®\0“1¼bF^z=ıvRZÓ&­oÓÓÓ³Ñ´iÓ·Ÿ¨¿‰ífñ×àsº»»7O¦SÜõ÷ç_ÔÕÕõ’¸ı²ô×bl_™Ş§àWÇí-cûÚØn•çùëÓ_êñ1oŒí?ÇıoŠûŞ»MlßÛ·§¡¢ïÛÿ\ZÛ÷¦·&â¾ÛÛÅÇ| şÏö±÷(îŸ·wí‡c»KÜ·kº#¶yl‹¸¯3nÏˆ›»Å¶;ê£q{÷ØöDíÏJŸÆ}ûÄíıâö±=0¶Å}‡ÄíOÄö“±ıTÜwxÔ‘õÌgê!.êõëí—ãcÛÇ×OùŸ˜†Ç}_O¤¨oFuj|ìi±=#¶gÆö;Qg¥kHâc¿·ÛÆöÇQçÆíŸÅö¼Ø^Û£ÄÇ^Û…±½4¶—G]õó4ÙYÔ/£®úUüŸkc{}Ô¯Ó’Ø.íM±½9êwQË¢n‹º=\rÑZµ\"ê®Hêgşu_ÔıQ«£şµ&êá¨GÒE¥QODÕ¬‡4réwª¾¥àrJü®¼JW€²Ù¼<N\Záÿ{F?g^~[¿$>‘BQ×JéàôPÔƒõƒV:xİÅ{Ó…õƒÛÊúÁîÎ¨?Ö‚é`xkÔï£nIËúAó7Q7Æÿ¿!Të×k¢×º‹êá+¢.«œF]·çÇv^ı ~^ÔOãöObû£úÁşi2µ¨ï¥0BA=œõ­\ZÒÁ¡>Šãätj>…‹2â¾êG~%…Fâ¾/Ö¯?ø\\=¬|&\rûH›jR¸‰Û‡ÆíƒSèIá\'îÛ?nï·g×GæÌŠûöˆÛÿõ±¢R˜Šûg¦IÉRÈJa+…®4\\ÜüH\nc)”Å};Åí#´}0…¶Şâş÷Çıï‹@·m\nw)äÅ}ï‰ÛïªÏòöãcß\Z·ßœBb\n‹qßÖiªÿ¸ıº&S¨Œû^“–é/ı:SøL×YÄí§PšÂi\n©é-tv hSˆMóDˆİ$noœBn\n»)(/#>ã²Yô{NúJ6=ºL†30Ã};g°30§ŒğL\Z•ôaO4O:›™‚oÔİ)dGpùG]&[ˆiÄ50Ã	1½k%¹š¤¾(ãAéŒe—ï¦³aº´cˆh¨t£1&µƒ&Jo·ÕßZ¼3]ç”®Ó BL£ƒ†šçe¨ybzm3Åè#hŠt|º@¼~aôÿ¤k‘th\'½£ƒú†Œİ¦=Úh83ñ¦Ï»«Cã¤‹›ÓÂ–õÚœ.¤Ö ]­;íßp2ØPé>NxK#²ê#ÎÒ(¼Ÿ¦‘`ºğ×QB}CÌÌ)Ã[ºïÇY>\0\ZhêÔ©Ö‡È§©Îàòt`mc1WxIóßÔ\'Hü}š§(ÍÃ£+\0!ÛM^ QÁeF}‚Æ‹ÓD‚ºĞœ0\"¼À¥™†‹§ÜTŸ%zª®\0Œ\\ïäsC½´ÍìÂXlÖØª¯%•–¹xŸ–\0ŒÍPgVÒã+„upùHZ3êi1Q-hlˆYİOˆéoş`ê‹i^—Miê@sCÌ}Â‹va„ÒêßõÒ¯‰3]G\0š¯÷ŒËÜ)V•†‘—iélK:ë’Î¾è@km/À5á†\\>®oI×¹¤ë]¦=1$\0–¦2âGt—FÕGı&0\\\0ÆÑôéÓ7ä¿èô/ÂÊ¿¥9\\Ò\\.ñ»RMs»è\nÀ8Ë²ì¹ñ¢|ŸNÀzÁå=iÖÜøı¸%Í¢›fÓÕ€	bæÌ™Ïç{t.ïŒß‰ÓzEiİ\"Á`ŠçÇ‹ô\n İ¥¡ÓÊĞi…è1»§£u`‚ŠëWDıA\'hãàòÖøøiÔí\\öH¶ë\nÀÄñ~u:U®´á¾ÿ¦Ø÷uG—½²,ÛXW\0J\"^´·J£+t‚vÑÙÙùÆ-?ˆZûş>Ó¦M{–®\0”Lç[§	¹t‚É.ÂÊ?EûûQDx¶®\0”T¼¿9êW:Á$.¯‹únìçwE”æ>Ò€’«¼¸J\'˜„ûök#¸œû÷İQ‡Î˜1ãot`’èèèxwš]\'˜,ò<MìÓßŠZ5g§vú[]˜dâ~jÔB ì²,{UìË§D­ŠsDggçst`’*ŠâıiÖQ ÄÁå•±ÿwšQ:öçOwwwo®+\0“\\µZı`üµú3 l:;;_¡åkõàòÙØ—Ÿ§+\0m\"ÂËÎq\0ø‘NP±¿¾4ê«)¸D}!­ç¥+\0m&şrıH„˜ïë]Z·+ö×ã\"´ü)êèø÷u MEx©¤92t‚‰jÆŒûè—ëÁå+qûEºĞæâ€0#êt`¢‰ ò‚Ø_¬—ã»ºº^¢+\0ô˜¦¡§:ÁD‘eÙßÅ>ù¹tK˜ÿŠ¿LW\0X÷¯Ü=â ñu`¼¥QDZª—¯Çöº@¿â@1;èĞ	ÆK–eÏ}pn}ºoDù]`PiUŞta¤NĞjiŠÿØ÷KSşEñÿEpyµ®\00,qà8$](©´J–e›Å~÷ÉúZE§Ç¿·Ô\0F$ÂË§Ò,¦:A³¥Õ S`ĞrWÔ·#¸l¥+\0ŒJıÚƒ#u‚f‰ òìÊÆ~¶\"ê¬¸ız]`¬æ?£æèÖİİ½I„•ıbÿº3êœ¸½µ®\0ĞEQ|),ë2mÚ´gÕG·ı1¶?Œú] ¡âàrl„˜ıu‚±Ê²lãØŸfEpùClÛ7ë\n\0M‘æ€I-ë£ÕÓÓ³QìGÿu[ìK?‹í6º@S¥OÓl¼:ÁHM:uÃúRË¢æE½]W\0h‰´R:éÃ•eÙ3#ôîûÍï¢D½KW\0hu€9=­H­eîÜ¹ÏˆàÒûËÍQ£şUW\0q@únç`°à’ö‘°4ê²mu€q¦ïGˆùˆNĞ\rbÿÈ\"´Üue—í´€	!L?ÚI\'X\'¸ìuCì‹ªÕêöZÀD0çÅjšNÄ¾°sÔµ±_,ú\00!E1ß[¤°uuÔ¯œ‘ ®K\"Äü›N´m€İ!ö«¢®ú¿q×º@Ì•æñhËàòşxŞ^¿@wWÁ€²˜_æyş6hit<ç—Gı&\rNC¤u€ÒIlV«Õ7éÄ¤.ïMoFı6óNÁ€R‹Ú¯ã€¶µNLÚàòîx/JÓşÇó<3- +\0”^Q7ÅAm+˜\\\"¬¼£¾Àâ²¸ıÿÒÂ‹ºÀ¤¸ßW«ÕWëÄ¤	.oKsûDİõ===é\n\0“1Àü!ê:Qúàò–xÏ­?Ÿ{fY¶±®\00™ÌŠ8Ø½X\'J\\ş%ê‡ñ<ş1jïiÓ¦=KW\0h‡\0sÏÌ™3Ÿ¯¥.[§…8ãù[µoww÷&º@;˜û;;;Ÿ£åeÙâ9û^:sæÀø÷³u€v0:–\"¸lÏÕw¢îŠàrğôéÓ7Õ\0Ú9À<jˆíÄU­V_ÏÑéQwGpùD™Ít\0¦R©éÂ„.¯çæÔ¨•Q‡í´ÓN«+\0ğ×\0ó°!·êùØ\"ê›Q«¢Œçæ¹º\0ë(Šâñ¿*¯ŒÀrr\Zõ™îîîÍu\0ş‹e<_¨ã\\^–çùÕƒËÆ¿ÿNW\0`è\0sGggçËu¢µººº^Áå„èÿŸbûÅ¢(^ +\00ü\0“V)~N´F•E¿­—cfÌ˜ñ÷º\0#? .I“£éDs¥·éR`©—cSÑ\0¥8 ş*êÍ:Ñi™†èïêÁå„ôÖ‘®\0ÀØÌ/âÀúh¬t1nº(·~qî×\\g\0\r0—Eño:Ñiøs\Z].\'§áÑº\00óò<ÿ€NŒMšK\'úxD}º4İº\0MİŸÄÁv\'4ÅôğSõ)ÿOMK\0è\n\04YQgÇ8Ó‰‘™1cÆß¤ÅÓ\"‹Qg¤Eu\0Z$|#ÄtéÄğLŸ>}Ó.GßîŠúN–e[é\n\0´>À¤ë5>¦ƒ‹ òìèÓQ+¢¾gî\0Gi¢(öÒ‰şuwwoeß¨åQ?èìì|£®\0À8‹ƒòWÒ™X[–eG_öúcÔ\"èı‹®\0ÀQÅçÓÅ¨:ñ”\"°ìõ‡¨s£7oÑ\0˜`â =7êHÁ¥g£s»G/n‹:/‚ËÛì\00AÅAû“qÀş\\»şüS§Nİ0ÂÊÿ‹,‹ºĞ²\n\0PqÀ>0]Ón?w–eÏŒŸ}füì·D]ÔÑÑñn{\0”D\Z”F\"µËÏ;wîÜgÄÏÛ¡å·Ö€’JsÀ¤¹`Ú!¸ÄÏ™Gı&êò.ÿîÙ€’J³ğ¦Ùx\'ñ¸Aü|»FİõóøyßïY€’Kë ¥õ&ipù¿Q×G]?ãm\0˜$ÒJÔQ?N·³,Û,noÛ—ùgŠ°2=~_E]mGÏ2\0”X\n(q@¿6ì·F­Šª\rPsËøóU«ÕÆ÷¾8ıŒQ;{Æ`’ˆüQƒ—T«»»»7/YpÙ>¾ïEZnˆÚ%îÚÀ3\r\0“Hım¢ƒ˜£Ëò³tttlßï•EQ,I×ò.\00‰ÅÿÂËšxìıûïsjÔeQKãû-ÒiÏ*\0Lrõ³0ë]“çù±<¸ükÔÂ¨›ÓğoÁ\0ÚL}ş—µLµZ}Ó\r.ïŠïw~lÛİÒ2\0A\0hSõI½æœ	\\ŞßãõQSM/zÖ\0 ÍÕ¯%é\r0S\'Ğ÷µM—ŸÅöö¨°‘g\0è~õèù^ŞÁå\'±½#¶³²,ÛØ3\0m.½“¦Ô¯Ïs~\ZÅAá±>gaîH×šD}>]#Óİİ½I+¾¯øZÿ_û¢şßÏìiÓ¦=Ë³\0m.-\rf× ğ»!&±[·Ò|1\'¥åFH>?œëU\"¬l®½‰º3\rínU`\0&°\"\"$|¢Z­şe„Áeİz4…’áŒøØƒêÿgÏA‚Ëëãñ³R@ŠÏûñXÏöl\0é¬Ë–®_7Œìµ×^µ“O>¹¶hÑ¢ÚòåËkkÖ¬©%i»råÊÚ5×\\S;í´Ójûï¿­ŸybÒ\ZC[LŞ‘&Ã«üÒuÏÂÄãÿ÷;êîøŞ™1cÆßx¦\0€§ƒDggçZÕ|ğÁO†“Ç{¬6\\×]w]mÎœ9ë­•Ôß\nÏõÉñnYçc÷ì¦N‹¯Œí\'ÓÇz–\0€µÂKµZ}°7DD©{î¹#\n.ëºà‚jİİİk½¥´nˆ‰ûN]÷ŒM„•Ûbû­ú¬¿‡Ç÷òÏ\0°–t¦#ÂËŸû¾]tóÍ7×\Zá¶Ûn«í³Ï>ë‰Ùº^ºº~&BÌOâûz®g\0XO}ˆôõ}ÃKº¦¥‘ÒçëbÒ51˜ŞÚßºJ}êV3è\0ıJ£ú¾mÔ¨3/ı‰Yçí¤CbŠ`µ»g\0XKšç¥ïPétÍK3¥kbF8ÛY\0`mi’º¾£yä‘Z³rÈ!}Ï°|Ë³\0\0[ıÚ—§gØMC¥[á†nXëm$C£€aKÃ™û^¸;–áÒ#Õw²»´v’g\0–úÂŒO†ˆo~ó›µV:óÌ3û˜Ï{6\0€á˜ó{CDZ •ÒÛU}ŞFZèÙ\0\0†`¾ÅŠ-\r0i^˜>æÏ\00Ü\0óhoˆè]˜±UÒ×ë;\\Ú³\07À< Æƒ\0\0Œ&À8\0”.À¸\0(]€1\n	\0(]€1\0P.><^3ñî·ß~O˜‰\0±´RºşÄZH\0@©D€8ºïjÔ­83gÎœ¾æ$Ï\00\"Y–½8BÄêŞ@qî¹ç65¼\\pÁ}ÃË£ñõ·ô,\0\0#Ö÷bŞÎÎÎÚÍ7ßÜ”ğrÛm·ÕvÛm·\'ú˜£u\0•îîîMò<¿¶ï½i–FÏû2{öìÇ{¿Fúzéëê>\00j(¶îûVR\n1:“Î¼ô\r/éë¤¯§ë\0À˜uttl×7Ä¤·“Ò51c¹°7]ó²ÎÛFFxÙQ·€¦…˜ŞÑI×]wİˆ‡J~øák­wT?ó\"¼\0\0—ŞŞé{MLß·•ÒŒ½‹/~rí¤Ş Ó6]ã’BNša·ï$u}¯yñ¶\0ĞTéÛúè¤5ë†‘VZñúhì\0-“æ‰ÉóüØ¾3ö³V¤IêŠ¢x.\0ã\"-;P_;é¨ú*Ö·ôX¦…ÓÚF–\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0hÿ•¹èÚƒ-É\0\0\0\0IEND®B`‚',1),('3',1,'baoxiao.png','1','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0;\0\0!\0\0\0¾Šğ\0\08\'IDATx^íœë[ÔÈ¾ï÷ÿ£k»]Û}ièæ\"w¹*(ÊM¹*rWDADåÒê¨¨{Öš/ãÚÏ_ÍñÑ7çÍ>Òy}¾‚²Ré„†êN:éïçÉãJª~Iª*õIU¥™õOÇ!ááŸôBHCc		4–0Ac		4–0Ac		4–0Ac		4–0Ac		4–0Ac		4–0Ac		4–0Ac		4–0Ac		4–0adì<		ú“#¡ÅÔØÉ{hl” ±Ñ‡ÆF	\Z}hl” ±Ñ‡ÆF	\Z}hl” ±Ñ‡ÆF	\Z}hl” ±Ñ‡ÆF	\Z}hl” ±Ñ‡ÆF‰ü2¶¤¤t`øúİ‡;ŸÿŒmeãÅÙ;ZLg÷•{ëÉ’Ò2-=‹xÜ¢¸8¾´¶åÜjêêõĞãQH\r\Z%²olİH\"~ºHOÍ€²òÓ6_%ßıc¯ÏŞÁ6oış“Ÿ´°©[+ˆÉ¤§[Ä	dám‚²©[Mí=4ÇxRƒÆF‰ìÛr·´e±´²«¸¨XÏòftr]°ûÊ5=ÃNæ=õÈxÜBEõßñ(¤¹1ÖÚ\ZgJÊ›aííûOĞ+*«ô‹ó—0IÆöôå/ÃØ+±uõÈ°áÛ÷70n½~¿¶½‹Z½ æ´ˆï)-+Ÿ˜YÜxñ·GÉwc7âñx†·ğ6¶¶®ÁÓ‹Z:RV6Ÿ®¨‡EEE(\'\"QH`|ú6æ2øâå>d•••#“ÍW¿bÖİĞÔ\"r3)¤94Vl™O’±dE„HÅÅi<o>Û69<DFqˆ­­½S†­mí.®>Ÿº58:9»´†ÈÕÍWñxBä\nßn.,?ØzıhçíğõY#eh|*Ã[xp»í7U±¿óö¬“)“swq‘éÅU¼;PkäÂL¬áEnïÕä¢ğÛ»ğÆÏ;o?â”H”Ä2+¤976óIrùéŠGÉ·Â1R3\rïÙ`¢$Õ­%PÁmí]âPø†\rã°ˆÄÛ2À^õ,[ˆ+,?~ŞÑÕ«n2 op°N¦;»¯ˆÃsç;p8rcN\\êDÊ•kj<†V9®^¹”V»…Ô ±QÂc­-“I2&«R0¶ />ùéïè©˜Çj1™÷TĞŞÕƒ`mN‹M£¤•‡1Ï[HçµM`DÅ¥e\nö¡N‡ââr†³Ş\ZIë%\"5Ãcû’w÷É”˜g!5hl”È/cèôıCcëÏş+™\ZÍÉ¾.ğî©pçÎŞypÇúÑE||¾Ô{Uä\nß ¨ı$[ˆ+`É]YU£njÌÌâÄÔÕ7bÿb_]ÙbÁ‰i0bÔ\r’Ë¯âÂØ³míò”–ÖIû¸ó,¤¾›Ù¬XnÌ,®&÷™ZQU½şì|˜[zˆiçğõ™9k)›uc=Ö±±Ôx1¹?ïÅ¿Ø¯oÜ›ß‚Õ§/QBÜBÛ®MÌˆ\0\ZK<È¹±™yrRY]ãÔãæÂ=$ªŸv$£“óÈºx¹O¦\\èì>‚±·ÈÄØ¢¢\",Œ1ÓÆ”ÿª3dpkeÃÛ´õ(¤946ói°Ö*+[5cÑ‰ÕD“«kêÄ!Ì™œO}•=¬±·ÈÄXputaƒÖ¿Ú/ÌÃIå;““õ(¤¹1öHÓ`¬<!gßàë¹ríúì­×ï7_ı*\r4mCOÅ Ö30|şâeD¶´îun!¦Äèî]½X>}ùëŒõ¸…¸Âêæ««#7Ôít…ígdÌÏ†ÕéÖîû’Ò½Ÿm]×“ï{cn	S€æsçÏw\\\Z¾~¦¡Idh¬G!5hl”È¾±Gß}¸ƒ^rÿëëöî¨•öïu/÷b¶)#ÑeEz<«;aËÍ…å¦–ÖäáyÜÂå[qcó9ûb‡“©ß~ïié1Ëg,°QBy:îEn†ÆÆÜ©Ac£Dö5?ôæÚºúòÓ˜ÓêÙv°„«¬ªÑ¾$Ç,©p	í‡Ù£áv‹¬§Ê‰­¬¬\\Ï;’ÆF‰ü2–ä\Z%hlô¡±Q‚ÆF\Z%hlô¡±Q‚ÆF\Z%hlô¡±Q‚ÆF\Z%hlô¡±Q‚ÆF\Z%hlô¡±QÂÔØV’÷ĞØ(aj,	ú“#¡ÅÈØH255¥\'’7ĞXïß¿ëI„ä\r4V‡Æ’|†ÆêĞX’ÏĞX\ZKò\Z«CcI>Ccuh,Égh¬%ùÕ¡±$Ÿ¡±:4–ä34V‡Æ’|†ÆêĞX’ÏĞX\ZKò\Z«CcI>Ccuh,Égh¬%ùÕ¡±$Ÿ¡±:4–ä34V‡Æ’|†ÆêĞX’ÏĞX\ZKò\Z«CcI>Ccuh,Égh¬%ùÕ¡±$Ÿ¡±:4–ä34V‡Æ’|†ÆêĞX’ÏĞX\ZKò\Z«CcI>Ccuh,Égh¬%ùÕ¡±$Ÿ¡±:4–ä34V‡Æ’|†ÆêĞX’ÏĞX\ZKò\Z«CcI>Ccuh,Égh¬N4ŒıNòıeÕ1iÍü!\Zµˆ*&O‡Æê˜´fşZD“§CcMOO———ËCÙšHD–LÏs¢Q‹Æ\ZÑÓÓóõë×ÙÙÙ“\'O³Z;8D\"²ôè|¥»»Û­ÈÒ£I ĞX#Nœ8ñåË4âçÏŸ;;;ÅşE\"²ôè|E­EWWvşñ„®5ennî»$êqùM4jQ|§±†$‰oß¾©‡HÔãò›hÔ¢øNcÍÙŞŞVû:õˆ0°µµ¥Ö‡zÉ¾ÓXsZ[[Õ¾C=\"D£‘ç;5çøñã?~;8Ô#Â\0ŠıáÃQì„´‘‡Æf‡±±1Ñ×±£ç…‡hÔ\"ÚĞØìpêÔ©?-°£ç…‡hÔ\"ÚĞØ¬±j¡§†ûz*ÉhlÖ¨µĞSÃF4ja\nÈØy’7èÏ†dLa#y\05Æ¿¡±&ĞXâ74Ö\ZKü†Æš@c‰ßĞXh,ñ\Zk=:•Õ56_\rNjéeå§n¿›ZĞÒó“©[+c7JJKõ’ï~ÇæÜwKqBcM ±Gçrß zçüİGZzó¹óHŸ¾}_K÷Fôu·M¶p†xŠ“æ³mŸÿ¼¶½[QY¥ç¥C½¸óFÎ\'4Ö\Z{tnßßpz‚­ÿÚ¸3QëÊÎ,5@İß|ı›z¢ŠvÍÓİ¯˜ë³wôŒt¸•Ó-Å	5Æ‘ÚºztÍ+×&JJJ×Ÿ½Û|õkYY¹Èºû(ùhçíéŠÊTúëß<Æ.·Ş¯îï¼ıèæ€›né1÷7…Ç–ö\nÎ}·\'4Ö\Z{Dæï­¯míÆãqìwõ ›OİŠíwÙÆ–Vì_ê½ŠıÉù{Ú¹gïwÛìçíá–å–óÌr¢;Kå¼ššÒİ?$ÚDƒÆšP¸Æ&î¾<pSã5Æn.ÔÕ7‰ıx\"±üøyÿĞXÌŞe‘¾²ñb`øº<KC\rÎd_CÕÆ¹éÑnYiÓLtÈ”3\rM[¯ß÷«¹\ZkõÚÔx\'ª™lúùî½ßm?[8Ë–vÓO³P³œñb§®¾ññóŸ_Ñ4Ö\Zëµ©ñN<ºµ†3Ò­¯;ãçªéŞ›~Î>Î\\-Å ‘Yeå§a\"åáö›İjº\n5Æzmj¼Õ\rMFêç§3Óm³Ÿ÷#^Oİç°¹ZŠ3@\"²&çï®?{ç)%%^¿îÒXh¬×¦Æ»áìµ,[€[ºŠ\ZS\\\\¼ùê×ûO^¤ÍuâÌÕRœEEEmí]3‹DVg÷¬ÒaÎ\'4Ö\Zëµ©ñnxôQ,À3mºjŒgçíÇ´¹NDî›zÊõÙ;Ëëç/^V³œaÎ\'4Ö\Zëµ©ñn8;º¶é\'(ˆ€Ù;?ÿÙy¢÷EÔôŠÊ*ìã\"is8sµg€DÍr†9SœĞXh¬×¦Æ»‘IÕhmïœ˜Y\\O¦Ö+/.õ\rÆã	5 “kª1MgÛ°ke#m®g®–â¨YÎ0™‚\ZİòÓÀğ„š+ ±&ĞX¯MwCôQïM;¥öLÃ½õg³Kk-­´,AÚ³4Ô˜áë³Øï½:’6×‰³„i7ı45Kİ{™RYUƒH»Şh¬	4ÖkSãİğèÜ±ƒrİÈä,Õ­×ï1%Æ:simëêèdõ”Wpæj)Î\0‰š%ö›ÏMÎß[O¾CÊÖî{¤””–;ß±›ê¹\ZkõÚÔx7<:wì \\‰óŞôs,ªkêÖ¶v·w?`bŒıËıƒpgçí§¥‡Ûmí]z´;·P))-C´,..>ÛÖ.ö§oßokï,**BÀĞø”e¸ûh\'íßTÓXh¬×¦Æ»áTË¹éç˜QRRŠQ´£«#Ûö›÷Ÿ¼8Ó°÷÷’LP±€Üxñ·;6¡±šåF&å¼¹°¼ùú7\\¶ÿÚøÙ¥ÅÕ§]½Ş?½¦…ÆšP¸Æfï¾î{4Æ§n=ùéïËëÏÆ§ocò)7\'‰D	\"\'çïêéÈE9İ ±&ĞX’‚Æ†\ZKü†Æš@c‰ßĞXh,ñ\Zk%~CcM ±Äoh¬	4–ø\r5Æ¿¡±&ĞXâ74Ö\ZKü†ÆšPXÆ¶’<€ÆšPXÆ’<A6$c\nÈØh055¥\'‘B‚Æ†“F\"€I ±`òÀH0é\046\0L‰\0&€Æ€É#À¤ĞØ\00y`$˜t\0\Z\0&ŒD\0“@cÀä‘`Òhl\0˜<0L:\0\r\0“F\"€I ±`òÀH0é\046\0L‰\0&€Æ€É#À¤ĞØ\00y`$˜t\0\Z\0&ŒD\0“@cÀä‘`Òhl\0˜<0L:\0\r\0“F\"€I ±`òÀH0é\046\0L‰\0&€Æ€É#À¤ĞØ\00y`$˜t\0\Z\0&ŒD\0“@cÀä‘`Òhl\0˜<0L:\0\r\0“F\"€I ±`òÀH0é\046\0L‰\0&€Æ€É#À¤ĞØ\00y`$˜t\0\Z\0&ŒD\0“@cÀä‘`Òhl\0˜<0L:\0\r\0“F\"€I ±`òÀH0é\046\0L‰\0&€Æ€É#À¤ĞØ\00y`$˜t\0\Z\0&ŒD\0“@cÀä‘`Òhl\0˜<0L:\0\r\0“F\"€I ±~0==]^^.åC\"²d:)hl¾ÓÓÓóõë×ÙÙÙ“\'O³vpˆDdéÑ$êĞØ|çÄ‰_¾|Ásúüùsgg§ØÁ¿HD–M¢\rsssß Q#Àw\Z›ÿ$‰oß¾©ºâ‰z)\0hl8ØŞŞVÅ¡A\n\ZZ[[Ucq¨GÂ€Æ†ƒãÇüøQèŠê¤0 ±¡allL‹=464œ:uêOìèy¤` ±abÕBO%…\rµz*)$3vÑû_h	ÒØ!¾@c4–„\Z+ ±$ĞX%á€Æ\nh,	4V@cI8 ±\ZKÂĞXh¬€Æ’p@cgìòãgr»::©ggîş¡‡Ûoºzôr$h¬ Œ-./­m9·šºz=Ô€‰™El“ó÷’ï~Ÿœ¿«gg{ëÏp‹»’zF–¨¬ªœ[ÙxñøùÏkÛ»Ëë/÷ëAtv_¹·,)-Ó3ò\Z+È#cã‰º8úßü½uu«©=£‡\Zsº¢2×Æ¶^¸ˆÂŸmk×3²Áù‹—·vß£\nËëÏ¦n¯ÜZÙ@»İò“çÉÔ­\\ÆúO~ÛØrîşÓçu\râ;8D¢=*\rÂXôr=#ø`lî8ÓĞ¼óöãÆ‹¿5m“‰ÅÅÅ\rMg•¨ƒ¡±A‘GÆVVW¯l$Û:ºÔD\"Yj¢ocÑ#gW1	l>w^&VTUc9ŠçÊÄòÓÃ×g1à O¯míâ,ø)snÆ^¼Ü‡[¨]¿¡©)H—)˜½_¹6ÄÍ×¿a{´óvh|JædÉmhÌ–U[WÄ‰éE5 eeã¹,gQQQÏÀ0\"·^¿”|7>}»¬ü´F¡ğj;8Áé·ï§^\\sæë³w**«DÖùK¢lO_ş‚ë ¡diÕU·GDõKJJe°\0ò#}`xBz”a¯fôvÀ]ÔvP¡±‚l\Z‹v{õqßàˆš(@\"²¼_çŞÆ‚3©±åáÎÑWĞ¥Ğ!pŠ:óÄ\Z]‰ĞŞŞ˜[‚Q”~\\ÅÂÍØŞ«#Ú[Z/ é2³P¤àE€;0|İN3Ö{©¼ºùjûÍGÕ@ìï¼ı„»L™œ»‹s§W{FnÌŞAîƒÍW¢Ö¥eåIk2,ƒÓ‚WÕâêÓñ©[ƒ£“³Kk8÷ÇSïµæ³m(6X„tŒ´â[[{§¼‚GúG‘UW¿7’ÔÕ7!½opLz”¬>}‰kªr–••ãù.=Ü–)*4V5cáÏÍ…»ãÓØQÚùG.²6W Œ]~ü¼£«WİÔ¼¶ƒ·5ö/÷b_³Ã;ºzd\nîˆñY	IqdcÑáĞÏ–]_+·[ C«Œíß´³ûŠ8<w¾‡#7ædÀ¥¾TMñ‚ˆí—gìæ‚ÈÂK°²ªFlr‰’¹ \rÎjk·Í}<fÅŞeÀ¤I^\rša\"n×ÚŞ©ŞÅ»¢Öı×Æe@wÿR.÷\rÊ\Z+Èš±ƒc7æî­%¶‡¤!€0=ca¬sÓÂæ¬·u÷•k˜kİy°©Úˆ,²fï<PÂÓã¦ÓÆÂL&1Œ¸2w»FTŒ±x1Éìo¾úUNì…Hêàƒ:\"\nìãe„ı«£{Í(\n,¶õgïä)\ZíÖYÚOMÆz—sÚT›¤Ú¤çÊ5ye¡œÛ·}­˜,lï~À¸-ğ4·vß§-OŒÆî“ecÕõ¤F†ÆŞ¾ÿD\ZbÓÂğ¤1ÑE$–©Ú‚GŒ‡ÕÄ´¸ét ±1k­‹É[ÒššbVì,¡Àí`fñArV‰±¯®l±ÀÃ0uƒäâSğù‹—?:¹×òÕ5uHÁö(ùV5­Ô?4†—×ë2ˆ³.õ^•1Oc½ËÇ“û#0æ½â©aÿÚÄ4ö±Î9°7–‘ÒÔÒ\Z³~¬Â>Rd®dÍØlÍŠ=Ö±„­l<G$BÚ.æÌ™üÑ‚›N™³<A…$ÈB?ÆºNÍ¸İ\"–šs^”=ÿb¿¾±EæŠtÒ¶k3ÈE$â±,”ñ¸$­¨ªÆ>.2·ô×¾>#&&™ë]ğpç\r¶V©°¤5 Ã·‡ÛoD@&eh:Û†”sKØHz~N£±‚¬Ëı—\'°eBê»ÎÔí5ëBgjüŞïU¸é„™Ò±Š“)­RviÆJà3ú(œ?\Z»İ\"f½¿0MÀÔ\ZÃşUgÈàÖJêsš[[YÓò_13×ŞVª±qõûö…ÎnÍ–XjˆKµ¡ú\rLâ]†˜°üø^(Iùé\nL:ğÚÂ´é\" Ã2àÕ€Õ\r=Ê–ôx¡ÓXA6åò×·ĞûBZÕ%¼ò1â¡i³e\'n:‰^%Vh1ë‡¢µ­ÔU7cÁàèdÒ.¹Àí‚«ÖYâ\\¬ÉÕ,1Úˆo<iÁx%\ZAíßª±3‹«ÀD@\"ÅpÚ‚‰xé¨‰‚Ë0>u«<¬É¹Tçï>‚ÀkÛ»ãÓ·E@†e“š¡ñ)ü{uÄuÅ£±ûdÙØXjª“æ/(hJƒ0vuóœº®Øûz¦¡y{÷Cê×ëİ_RRŠ·2æ]ÍÊ >i-q¡DÇ¥Ş+×0¬=Ó r+«k0sÆ†¾˜Lı	á8l´–R1K3Üã:6Ü&$ckëê¯ÏŞéîÂÒ±õB\'–Ÿşx9x&IkFm}kIıd\"Á¥Ö“ï’ÖtoLÏw\\Â‚ùLC“ˆÇâO ­?¯wõ\\éÃ{J\Z+|ÃtÓ{ƒ¨†e§-bRŠÑÅCuĞV-­{ËË LCù1ÃYk{âYÈ†Ê°©—ìîœˆ,´‰š¥AcÙ7öÈ¸}+nlNÙ>$~?*ØÇÃ†0ê z©oPDŠ\r}E~Ÿmœ›ú3Fgwÿæëß’VÿÃ\0‚Q\"©[WßøÄúÃ¹İ¾¿¡~Íäñ‡˜šjé1Ëg¬úàƒ<uTÿÂ	SbŒ´â—g±aQ-èŠÇãbm™´¤Âò\r•tØ³~!S/¢~´ó.C›õCšB|«ÇÛSüÕ$Şb\" ó2ˆïOŞs«İ\'ŒÍ.xyCT_›<@/¬ª®õXÅa¶\\][W]{FûÉ1»`,µîR‡ºèy˜jb‚%tÚµ(Ş€87“ât´UÚïü–Á›LÊ°°œzsÉáİ\r\Z+ˆ¬±$`F]3ù‹\Z+ ±$\0\ZšZ°öóaÌçüR£±ûĞX\0â—ó­×ï!m&ºÆhì>4–@qq±ó?ıñ†Æ\nh,	4V@cI8 ±\ZKÂĞXh¬€Æ’p@c4–„\Z+05¶•_ ±Sc	ñ\r½ÿ…–ÀŒÍg¦¦¦ô$’l7 ±i0i”B†íæ&Lc‰\r¶›˜42%6Øn>`ÒÈ4–Ø`»ù€I#ÓXbƒíæ&Lc‰\r¶›˜42%6Øn>`ÒÈ4–Ø`»ù€I#ÓXbƒíæ&&c¿ı|’l70iä«\'‘lÃFö“F¦±ÄÙL\Z™Æld0id\ZKl°‘}À¤‘i,±ÁFö“F¦±ÄÙL\Z™Æld0id\ZKl°‘}À¤‘i,±ÁFö“F¦±ÄÙL\Z™Æld0id\ZKl°‘}À¤‘i,±ÁFö“F¦±ÄÙL\Z™Æld0id\ZKl°‘}À¤‘i,±ÁFö“F¦±ÄÙL\Z™Æld0id\ZKl°‘}À¤‘i,±ÁFö“F¦±ÄÙL\Z™Æld0id\ZKl°‘}À¤‘i,±ÁFö“F¦±ÄÙL\Z™Æld0id\ZKl°‘}À¤‘i,±ÁFö“F¦±ÄÙL\Z™Æld0id\ZKl°‘}À¤‘i,±ÁFö“F¦±ÄÙL\Z™Æ:ÓÓÓåååòP62‘%ÓI1éÉ4¶ĞéîîşúõëìììÉ“\'YŒ\"Yz4É&=™Æ:\'NœøòåÚöóçÏ]]]bÿ\"Yz4É&=™Æ’csssß Q#Yâ»AO¦±äX\"‘øöí›ª+‘¨Ç‘,aÒ“i,I±µµ¥\Z‹C=‚d“LcIŠÖÖVÕXê${˜ôd\ZKR?~üÃ‡BWìàP ÙÃ¤\'ÓX²ÇØØ˜0;zÉ*&=™Æ’=N:õ§vô<’ULz2%?¸o¡§’lcÒ“i,ùA­…J²IO¦±>1O²ŠŞ¾¡Â¤\'ÓXŸ@\'‹‘,AcÃI=‡Æf\ZLê846‹ĞØp`RÏÀ¡±Y„Æ†“zÍ\"46˜Ô3phl¡±áÀ¤“·Æ&ßıMOµhji]X~<>}[Ïğ<ë°áR46˜Ô3prmlQQQIiiEUõ™†¦sç;.õ\rOÍ.­=J¾¹1«G+hÂ”•ŸnimÇ¹6_!}êÖÊéŠJ%|í,q˜vSNJO†a*46˜Ô3p²n,<Ü|ıÛÆOüüglëÉwkÛ»¢÷ßòÓì°îBg7ÖÏôLl«›¯ÇnÖÔÕëgî£i¦z$:É0L…Æ†“zNÖuO$2ïı£“s0¼ùlö«ªk±”XÆşÍX‘’ù¦«BcÃI=\'ëÆ:û·÷¦>>u+iMz±ßİ?„ı¹¥‡ò²Z°ÄyYìLTs3¡­½seãæñx\\Ïs@cÃI=G36q÷å›\ZŸ!™K‚å.\"Ÿüôw,€çî>ÄşÅË}±Œ¯ …¥=+m¢Jí™†É¹»bÆ>Üy“LMé_¤É«ĞØp`RÏÀÉ7cÁú³ÿBpSKëÎÛOPWnâ\nÎM;WKÌ$FSñ‡ÛoÆn.È”DIÉìÒ\ZNÙxñ7%tŒÆ†“zNŒuª•v;ìYj˜ıÔ=DVqq1†hy˜vÓÏ´hi½ğøùÏÓ‹«âtP\\_~üüÊµ‰‰éEœõ(ù.í7j\r&õœœ\Zëv˜6EÃã\nçŠ¬á	©\\†”•ŸÆzûÍGœ¾¶µ‹‰±HoïêAÊôíû¸àÂò:ögï<°Ÿú\ZLê895öÀM?MA\rÀ˜©º+Ãºzœ÷rnê¹#7fï¬maÿEÖğõ‘¾¸ú‡g\Z›±_QYuo=Ùzá¢z¢\n\r&õœœ\Zëv˜6E&ºmO_ş¢†©\'&%=Ã·V6Ô¬ÍW¿®l¼ûÎSÜ¨¬®ÙyûKÖx<ÑÚŞ‰³n.,ëA.ĞØp`RÏÀÉ+cUÕS`IÙÔÒZ][‡ıG;oE€óÜÑÉ9LVKJKe&±ØÙ|ı›Û)\\›˜I¦¦Ö×l½†ºå§+ôhl80©gàäÔØ7ı´X,cv:u{E`C%ÆOìß¾¿!bÜÎ)YÂŞ‡ÛoÔtï[KP†{ëÏD&Øz¶;46˜Ô3prd¬Æ’â‰ÄÜÒÚòú3ÌHÅ)HYZÛû#7Rüó¼šÌ¿ëî¼ıTWß¤¦gBqq|né!Î}úò×ÇÏÆ¥ôhl80©gàäÂX¡G&›zwî,?~.~>‘HûmíêõÕs%2KËÿáÎ1©v;EwÇzÓò³míUÕµX	cjáHKcÃI=\'Æ:ÉD˜á‰™™ÅTÅ¡<¥¦öLÒúìT\\\\¬e9‘Y÷Ÿü”úë‹DËQ¬EEzeU\rf¼Xââß’Ò2í—U÷ŒàFX<Ÿ®¨’‰Û1ŞBcñÅØ\ZLê8ùc¬†<eöÎƒdêç–ÿiÛÕÊOW$­¯Mb€½Ü7(Ò«kêF\'çá0²Ä¹bƒ™1ëUCÓÙáë3{vi­±ùœí¢µg\ZfWáíüİGmí]n?öÒØp`RÏÀÑŒ5Dõ!óM¿Š…Ìê¸Ô{oıYYY¹3KcàÖë÷Xvv÷ML/OİÒ$ÅfÅ }mb\Z2c(Æô[µóG\'W7_a: çYĞØp`RÏÀÉ®±Áâ6ôù\r&õœ(846˜Ô3phl¡±áÀ¤Cc³\r&õ\Z›Ehl80©gàĞØ,BcÃI=‡Æf\ZLê846‹ĞØp`RÏÀ¡±Y„Æ†“zÍ\"46˜Ô3pĞÉZI– ±áÀ¤3O²ŠŞ¾¡Â¤\'ÓXbcjjJO\"ÙÆ¤\'ÓXbƒì&Lc‰\r6²˜42%6ØÈ>`ÒÈ4–Ø`#û€I#ÓXbƒì&Lc‰\r6²˜42%6ØÈ>`ÒÈ4–Ø`#û€I#ÓXbƒì&Lc‰\r6²˜42%6ØÈ>`ÒÈ4–Ø`#û€I#ÓXbƒì&Lc‰\r6²˜42%6ØÈ>`ÒÈ4–Ø`#û€I#ÓXbƒì&Lc‰\r6²˜42%6ØÈ>`ÒÈ4–Ø`#û€I#ÓXbƒì&Lc‰\r6²˜42%6ØÈ>`ÒÈ4–Ø`#û€I#ÓXbƒì&Lc‰\r6²˜42%6ØÈ>`ÒÈ4–Ø`#û€I#ÓXbƒì&Lc‰\r6²˜42%6ØÈ>`ÒÈ4–Ø`#û€I#ÓXbƒì&Lc‰\r6²˜42%6ØÈ>`ÒÈ4–Ø`#û€I#ÓXbƒì&Lc‰\r6²˜42%6ØÈ>`ÒÈ4–Ø`#û€I#ÓXbƒì&Lcéééòòry(‰È’é$‹˜ôd\Z[èôôô|ıúuvvöäÉ“Ç¬FÆ‘ˆ,=šd“Lc\'N|ùòmûùóçÎÎN±ƒ‘ˆ,=šd“LcÉ±¹¹¹ï¨Ç‘,ñİ \'ÓXr,‘H|ûöMÕ‡HÔãH–0éÉ4–¤ØŞŞVÅ¡A²‡IO¦±$Ekk«j,õ’=Lz2%)?şñãG¡+vp¨GìaÒ“i,ÙcllL‹=d“LcÉ§NúÓ;zÉ*&=™Æ’¬Zè©$Û˜ôd\ZK~Pk¡§’lcÒ“#kì<!>¢÷?OÕ“5¢llŒ_ ±é9T=i,ñ\r\Z›CÕ“Æß ±é9T=i,ñ\r\Z›CÕ“Æß ±é9T=i,ñ\r\Z›CÕ“Æß ±é9T=i,ñ\r\Z›CÕ“Æß ±é9T=Ãhìòãgr»::©ggîş¡‡Ûoºzôr$hlzUÏì\Z[\\_ZÛrn5uõz¨3‹Ø&çï%ßı>9WÏÎ÷ÖŸáw%õŒ,QYU3:9·²ñâñóŸ×¶w–×/^î×ƒ<éì¾ro=YRZ¦gä%46=‡ªgv\'èâèó÷ÖÕ­¦öŒjÌéŠÊ\\Ûzá\"\n¶­]ÏÈç/^ŞÚ}*,¯?›º½rkeívÿÉOzœ\'S·Vp\Zë¤°Œml9wÿéóº†Fqˆ\"Ñ•a,z¹‘|06wœihŞyûqãÅßšÎ¶ÉÄâââ†¦³JÔÁĞX7\nÈØÊêê•d[G—šˆC$\"KMtâm,zäÌâ*&ÍçÎËÄŠªj,G1Âà\\™X~ºbøú,ôéµ­]œ?e®ÀÍØ‹—ûpµë74µ é2³÷+×&¸ùú7lvŞOÉ\\€,¹\rÙ²jëê‘81½¨&¤¬l<—å,**êFäÖë÷’ïÆ§o—•Ÿ–Áh\"^m\'8ıöıÔÀ‹+`Î|}öNEe•È:ßqI”íéË_p4”,­ºêö(ƒ¨~II©@~¤OˆC2ìµÃŒŞ¸‹Ú*46=‡ª§f,ØíÕÇ}ƒ#j¢\0‰Èò~{Î4¦Æ–‡;oD_A—B‡À)êÌSht$Bcx{cn	FaPúq7c{¯hli½€¤ËÌB‘‚:îÀğut;ÍXï¥òêæ«í7U±¿óöVì2erî.Î^\\í¹1{¹6_‰Z—–•\'­É°N^U‹«OÇ§n\rNÎ.­áÜ7O½×šÏ¶¡TØ`Ò1ÒŠClmíò\neèEV]ıŞ4JRWß„ô¾Á1qèQ°úô%®©ÊYVVç»ôp[¦¨ĞØôªª±ğçæÂİñéì(íü#YH›+Æ.?~ŞÑÕ«nj^ÛˆÁÛ\Zû—û±¯Ù‚á‰]=2wÄø¬„¤8²±èpègË®¯‰Û-Ğ¡ÕÆöoÚÙ}E;ßÃ‘s2àR_ª¦xAÄöË3vsAdá%XYU#69‚DI‰ÜĞgµµÛæ>³bï2`Ò$¯Í0·kmïTïâ]Qëşkã2 »)—ûeŠ\nMÏ¡ê©\Z;8vcîŞZ\"a{H*Ó3öÆ:7-lÎz[w_¹†¹Ö›ª˜Á\"köÎ%<=n:h,üÇdÃø+s·[`DÅ‹“LÁşæ«_åÄ^ˆ¤>¨#R0¡À>^FØ¿:º×Œ¢Àb[öN¢Ñn¥ıÔäa¬w0§MµÉ@ªMz®\\“WÊ¹}Û×Ê€ÉÂöîŒÛ2\0Osk÷}ÚòÄh¬‡ª§ÓXu=©‘¡±·ï?‘ƒ†Ø´0<iLt‰eª¶àã\0Æa51-n:hlÌZëbò–´¦¦˜;K(p»˜Y|ÜŸUâ_ì«+[,ğ0Œ#Fİ ¹ø|şâeÄNîµ|uMR°=J¾UE+õáåuÇú…bà¬K½We@ÌÓXï2ÄãñäşŒy¯xjØ¿61}¬óÅE,ÃÍ…e¤4µ´Æ¬«°™«AcÓs¨zæbVì± leã9\"±Ò†t1gÎäÜtÊÄØ˜å	ú+$Aú1Öuj®Àí±Ôœó¢ìñøûõ-2W,ğ “¶]›˜A.\"e¡ŒÀ%ilEU5öq‘¹¥‡¸şğõ11ÉÜXï2€‡;oà°µòL…%­¾=Ü~#2)CÓÙ6¤Ü˜[ÂşÀğDÒós\ZMÏ¡êéó—\'°eBê»ÎÔí5ëBgjüŞïU¸é„™Ò±Š“)­RviÆJà3ú(œ?\Z»İ\"f½¿0MÀÔ\ZÃşUgÈàÖJêsš[[YÓò_13×ŞVª±qõûö…ÎnÍ–XjˆKµ¡ú\rLâ]†˜°üø^(Iùé\nL:ğÚÂ´é\" Ã2àÕ€Õ\r=Ê–ôx¡ÓØôª~şº#Àóºb_H«º„W>F<ô!m¶ìÄM\'Ñ«Ä\n-fıP´¶•ú êf,LÚ%¸İBpÕ:Kœ‹5¹š%Fñ\'-¯D#¨ı[5vfq˜ˆC„¡N[0`\"/5Qp`Æ§naU‚‡59—ªàüİGxm{w|ú¶È°bR34>…¯¸®˜b4ÖCÕÓil,5ÕIóH´G¥A»ºù\nONİNWì}=ÓĞ¼½û!õëõî/))Å[ó®få	Ÿ´–¸P¢ãRoÏ•k˜@Öi¹•Õ5˜9cC_L¦ş„pG6ZK©˜¥nqî’Š±µuõ×gït÷aéØz¡ËÆOG¼¼…\0“Æ¤5£¶¾µ¤~2‘àRëÉwIkºˆ7&Šç;.aÁ|¦¡IÄã	ñ\'ÖŸ×»z®ô\rá=%¾a:Šé=†ATÃ²Ó1)Åhâ¡:h«–Ö½åÀe¦¡ü˜áÇ¬µ=ñ,dCeX†ÔKv÷NDÚDÍÒ ±é9T=Ó\Z{dÜ¾76§lG¿ŠìãaCuP½Ô7(\"Å†¾\"?‰Ï6ÎMı£³»óõoI«ÿa\0Á(‘TŒ­«o|bıáÜnßßP¿frøCLMµô˜å3V}ğA:ªá„)1FZñË³Ø°¨–?tÅãq±¶LZRay‰†J:l‰Y¿©Q?Úy—¡Íú!M!¾Õãí)şjo1yÄ÷\'ï¹UŒÆºq¨zf×Øì‚—7DõøµÉôÂªêZUfËÕµuÕµg´Ÿ³ÆRë.u¨‹g©&& XB§]‹â\rˆs3)!NG[¥ıÎ`¼É¤Ë©7—Şİ ±é9T=óÙX\n0£®™üE\nMÏ¡êIcÉÑhhjÁÚ[Ì‡1Ÿ?ğKaŒÆºq¨zÒXr4Ä/ç[¯ßCÚLtÑX7UO\ZKFqq±ó?ıñ†Æ¦çPõ¤±Ä7hlzUO\ZK|ƒÆ¦çPõ¤±Ä7hlzUO\ZK|ƒÆ¦çPõ¤±Ä7hlzUO\ZK|ƒÆ¦çPõD#¶â46=‡ªç<!>¢÷?OÕ“5\"kl>355¥\'‘ˆL»™ôd\Z\0‘©ˆÏD¦İL*Bc 2ñ™È´›IEhl\0D¦\">™v3©\r€ÈTÄg\"Ón&¡±™ŠøLdÚÍ¤\"46\0\"SŸ‰L»™T„Æ@d*â3‘i7“ŠĞØ\0ˆLE|&2ífR\Z\0‘©ˆÏD¦İL*Bc 2ñ™ïB¯[ÆĞØ\0ˆLEˆÿĞØ\0ˆLEˆÿĞØ\0ˆLEˆÿĞØ\0ˆLEˆÿĞØ\0ˆLEˆÿĞØ\0ˆLEˆÿĞØ\0ˆLEˆÿĞØ\0ˆLEˆÿĞØ\0ˆLEˆÿĞØ\0ˆLEˆÿĞØ\0ˆLEˆÿĞØ\0ˆLEˆÿĞØ\0ˆLEˆÿĞØ\0ˆLEˆÿĞØ\0ˆLEˆÿĞØ\0ˆLEˆÿĞØ\0ˆLEˆÿĞØ\0ˆLEˆÿĞØ\0ˆLEˆÿĞØ\0ˆLEˆÿĞØ\0ˆLEˆÿĞØ\0ˆLEˆÿĞØ\0ˆLEˆÿĞØ\0ˆLEˆÿĞØ\0ˆLEˆÿĞØ\0ˆLEˆÿĞØ\0ˆLEˆÿĞØ\0ˆLEˆÿĞØ\0ˆLEˆÿĞØ\0ˆLEˆÿĞØ\0ˆLEˆÿĞØ\0ˆLEˆÿĞØ\0ˆLEˆÿĞØÜòİ=Ì ±¹%Œe&ùÍ-a,3Éghln	c™I>CcsKËLò\Z›[ÂXf’ÏĞØÜÆ2“|†Ææ–0–™ä3ymìôôtyy¹<”½‰È’éyÅÌÌŒ[™‘%Ó	9\Zymlww÷×¯_gggO<yÌêıØÁ!‘¥Gç===(Şüüü_ÿú×cV™±ƒC$\"K&ääµ±\'Nœøòå:ıçÏŸ»ººÄşE\"²ôèü\0ûã?PÈüã—.];ø‰y[f\"òÚX077÷İõ¸|³\0½Äß¿#Q#äğä»±‰DâÛ·oj×Ç!õ¸|\"m™ãñ¸GÈáÉwcÁÖÖ–Úûq¨Gä›››j™q¨Gr$Lı?vôìlĞÚÚªö~êä¨üçÎSËŒC=\"Kä¨ü$o	±ÇÿğáƒèúØÁ¡a@Ê¯–ùıû÷Ù-³JÊOò–ÆÆÆDïÇgFîÊ?::*Ê<22¢çeÜ•Ÿä\'á0öÔ©SZ`GÏ3#wåÏ]™UrW~’Ÿ„ÃXpßBO5&§åÏQ™UrZ~’‡˜\Zëµzj~Sc¡§b@öíx÷ÿ¸ù°éíN\nƒœ\'9†Æ,46”ĞØ‚…Æ†\Z[°ĞØPBc\ZJhlÁBcC	-Xhl(¡±\r%4¶`¡±¡„Æ,…hlÑĞîïÿûÿ®\réáÆ,>[UR2W]ıº¾şsc#6ìà‰zœƒ¢¢ñµ?ÿ‚i›‰oš±¹¸ÅÑh^üãåŸ»ıEß—Æ,~Ûwúô§ÆÆ?šš´\r‰ÈÒ‚5r¡SŞ\ZÛ¿ı?Ÿh,ñ$çÆÂÉÿåpUnÈò–Vèôi{\\Ï0 ­±Ù½ÅÑ ±ä@rklU\"‘vtU7 Lé6Ô	3ÉOş1}î|ÿâîKk¨üôËîô9[§/*²r±\r¤\Z[tn—ıôËj³]$Ë®?äön!\nğç/·ÇÕxïBŠ7HÚíåâyy\Z[°äÖX,V¥™ÿİÔt³²²¦¤vş[‘aJo´á­SÜ’!Õ³í6ª#UÊ¥m¯I¯÷-púô/69­DëEcç-Ô\\ïBÒX’9¦ÆÎÚ9f7öu}½Ôr²²RérqÊ,„©Y*i™ªB†Tç¶†5éç!-àOÿ¾rÍéfÅ·WPåÑçÕâûãªU†T©dÀ…aVìlmLuş¿–¨Æş®L‰kí_†q(³¦f©¨“A!UÁöGH›ºoİ\"íˆª8MÓÆmïBJœ×qC\ZëlmÂa¬Û”5¾/ƒ:X¥1Ö¾\nMk¬Ç-âöU«/n¡	¿§ış}½)¡±ä@rkl¶fÅ:yËàeÀ¡ŒßŸö®9´«}s¢±Ä7rk¬o_ÜdH;+Öºİ\".¯c˜òÊş\np¦hxR¢}ö€Æ,¦Æ:¿|øÿë·ÂÏ=ÏËñğPÆÆüB“\nÖLÛû¼=Şì\"Û…ì]gÑöËPZøå©`15Ö‰jl<KA!S7í3¬‡bB«ûr;õ£¨÷—\'íš2lm{×9qu›g^H5Qİ´\0	İ)Xrnl<Ç¥˜‰EC«â·ĞO¿ü±6t^8|XcãûÃuÚÑXü¢£½\ZUHAóí/=œ\Z[°øalÜà¿ i¡±‹OÆ’ìBc\ZJhlÁBcC	-Xhl(¡±\r%4¶`¡±¡„Æ,46”ĞØ‚…Æ†\Z[°ĞØPBc\ZJhlÁ’c;I¡±ËÁÆî322rùòåÿ÷×#ì 3qóaÓÛ+v?^UUuéÒ%[¶È’x¤d÷¹Ş¹„Å!ŒùË_®]»&öÿå_ş¥££chhÿ8q)ıııÿú¯ÿŠÿüÏÿÄY±Xû§NB:vÓŞŞÓ/\\¸ğÏÿüÏâ\";sæLww·[\0î‚I îRYYé´)ÿñÿÑÛÛ{ñâE­¸o__ŸŒt¦;¯vLI”;iKUZZŠÇğğ0&ÅÅÅ\"‘8„±è¯µµµ]]]â°¥¥¥ººZû-Á Œ,„¡7CEì#‘ØinnÆŒ\ZÎ———755É‹ã![Ú€sçÎá\nÀÓ1¤´µµ¡`%%%gÏEJcc#â±SSS#/’6]\\M+¿ÓØ´¥‚®¢¦eeeâ}Zùõl922V †¹½rå\nDÒz\"daÔ…!±Ñ:‰xÌ«Y³kìË‹c•t\\½zUøŒRZ$AŠ9aÔÀÀ\0v0°‹û¢‰DBF:ÓE¥´òË[È´¥Â¥0ğÆãqÜW¤…V~=›DŒŒÕ“, 0:±Öc \r:14Ã¸‡™$şÅ„VL&/$µäQ/6\0£™ØÁeÕ`R„3(‰8;(ŞƒƒƒªNÎtq5­üòr\'m©pÌ5pˆ:bZ.A+¿M\"ÇÑ…\0PQë1Q1íÄøƒ\0ôé††9‹†Æb°RQ/6\0‰bşë_ÿê,	RÄ2ÊógLeET´tq5­üòr\'m©¸)V×Ğ3|D+¿M\"ÇÑÅº±¢¢Bë1X+bk<¬c1\nÕÕÕÉxGèåÈÅìZ$ªO€D¬Š11Æ³$HA$^¥¥¥r‘‰I¸\\gªhé\Z›¶T½½½XÁÂdñ	J$‚V~=›D£+¾cZˆqU®Eÿíßş\rñ§N:f-G­o¹2^|tíîî–‹aõâi`#®qogIÄõûúúp¢ü‹Ñıõ­Š–î¼Ú1%Qî¤-ªÖÓÓ3biE\"!>p°±¡#C\'=Õ=Ac1-_§3L\'$DDĞXB\"%$LĞXBÂ%$LĞXBÂ%$LĞXBÂ%$LĞXBÂ%$Lü&!§NG	.\0\0\0\0IEND®B`‚',0);

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

insert  into `ACT_HI_ACTINST`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TENANT_ID_`) values ('5002','myProcess_1:2:2504','5001','5001','_2',NULL,NULL,'StartEvent','startEvent',NULL,'2020-03-04 15:10:15.890','2020-03-04 15:10:15.928',38,''),('5005','myProcess_1:2:2504','5001','5001','_5','5006',NULL,'ç®¡ç†å‘˜å®¡æ‰¹','userTask','1','2020-03-04 15:10:15.930',NULL,NULL,''),('7502','myProcess_1:2:2504','7501','7501','_2',NULL,NULL,'StartEvent','startEvent',NULL,'2020-03-06 02:39:38.159','2020-03-06 02:39:38.177',18,''),('7505','myProcess_1:2:2504','7501','7501','_5','7506',NULL,'ç®¡ç†å‘˜å®¡æ‰¹','userTask','1','2020-03-06 02:39:38.179',NULL,NULL,'');

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

insert  into `ACT_HI_TASKINST`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`,`CATEGORY_`,`TENANT_ID_`) values ('5006','myProcess_1:2:2504','_5','5001','5001','ç®¡ç†å‘˜å®¡æ‰¹',NULL,NULL,NULL,'1','2020-03-04 15:10:15.935',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('7506','myProcess_1:2:2504','_5','7501','7501','ç®¡ç†å‘˜å®¡æ‰¹',NULL,NULL,NULL,'1','2020-03-06 02:39:38.182',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'');

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

insert  into `ACT_RE_PROCDEF`(`ID_`,`REV_`,`CATEGORY_`,`NAME_`,`KEY_`,`VERSION_`,`DEPLOYMENT_ID_`,`RESOURCE_NAME_`,`DGRM_RESOURCE_NAME_`,`DESCRIPTION_`,`HAS_START_FORM_KEY_`,`HAS_GRAPHICAL_NOTATION_`,`SUSPENSION_STATE_`,`TENANT_ID_`) values ('myProcess_1:1:4',1,'http://www.activiti.org/testm1583134321766','submit','myProcess_1',1,'1','baoxiao.bpmn','baoxiao.png',NULL,0,1,1,''),('myProcess_1:2:2504',1,'http://www.activiti.org/testm1583134321766','submit','myProcess_1',2,'2501','D:\\MSOA\\æ¯•ä¸šè®¾è®¡\\manager\\target\\classes\\baoxiao.bpmn','D:\\MSOA\\æ¯•ä¸šè®¾è®¡\\manager\\target\\classes\\baoxiao.myProcess_1.png',NULL,0,1,1,'');

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

insert  into `ACT_RU_TASK`(`ID_`,`REV_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`PROC_DEF_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`TASK_DEF_KEY_`,`OWNER_`,`ASSIGNEE_`,`DELEGATION_`,`PRIORITY_`,`CREATE_TIME_`,`DUE_DATE_`,`CATEGORY_`,`SUSPENSION_STATE_`,`TENANT_ID_`,`FORM_KEY_`) values ('5006',1,'5001','5001','myProcess_1:2:2504','ç®¡ç†å‘˜å®¡æ‰¹',NULL,NULL,'_5',NULL,'1',NULL,50,'2020-03-04 15:10:15.930',NULL,NULL,1,'',NULL),('7506',1,'7501','7501','myProcess_1:2:2504','ç®¡ç†å‘˜å®¡æ‰¹',NULL,NULL,'_5',NULL,'1',NULL,50,'2020-03-06 02:39:38.179',NULL,NULL,1,'',NULL);

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

insert  into `sys_permission`(`id`,`parentId`,`name`,`css`,`href`,`type`,`permission`,`sort`) values (1,0,'ç”¨æˆ·ç®¡ç†','fa-users','',1,'',1),(2,1,'ç”¨æˆ·æŸ¥è¯¢','fa-user','/api/getPage?pageName=user/user-list',1,'',2),(3,2,'æŸ¥è¯¢','','',2,'sys:user:query',100),(4,2,'æ–°å¢','','',2,'sys:user:add',100),(5,2,'åˆ é™¤',NULL,NULL,2,'sys:user:del',100),(6,1,'ä¿®æ”¹å¯†ç ','fa-pencil-square-o','/api/getPage?pageName=user/user-change-password',1,'sys:user:password',4),(7,0,'ç³»ç»Ÿè®¾ç½®','fa-gears','',1,'',5),(8,7,'èœå•','fa-cog','/api/getPage?pageName=permission/permission-list',1,'',6),(9,8,'æŸ¥è¯¢','','',2,'sys:menu:query',100),(10,8,'æ–°å¢','','',2,'sys:menu:add',100),(11,8,'åˆ é™¤','','',2,'sys:menu:del',100),(12,7,'è§’è‰²','fa-user-secret','/api/getPage?pageName=role/role-list',1,'',7),(13,12,'æŸ¥è¯¢','','',2,'sys:role:query',100),(14,12,'æ–°å¢','','',2,'sys:role:add',100),(15,12,'åˆ é™¤','','',2,'sys:role:del',100),(16,0,'æ–‡ä»¶ç®¡ç†','fa-folder-open','/api/getPage?pageName=file/file-list',1,'',8),(17,16,'æŸ¥è¯¢','','',2,'sys:file:query',100),(18,16,'åˆ é™¤','','',2,'sys:file:del',100),(19,0,'æ•°æ®æºç›‘æ§','fa-eye','druid/index.html',1,'',9),(20,0,'æ¥å£swagger','fa-file-pdf-o','swagger-ui.html',1,'',10),(21,0,'å­—æ®µç”Ÿæˆ','fa-wrench','/api/getPage?pageName=generate/edit',1,'generate:edit',11),(22,0,'æ—¥å¿—æŸ¥è¯¢','fa-reorder','/api/getPage?pageName=log/log-list',1,'sys:log:query',13),(23,8,'ä¿®æ”¹',NULL,NULL,2,'sys:menu:edit',100),(24,12,'ä¿®æ”¹',NULL,NULL,2,'sys:role:edit',100),(25,2,'ä¿®æ”¹',NULL,NULL,2,'sys:user:edit',100),(28,0,'æµç¨‹ç®¡ç†','','',1,'',14),(29,28,'ç”¨æˆ·ç”³è¯·','','/api/getPage?pageName=process/process-apply',1,'',15),(30,28,'ä»£åŠäº‹åŠ¡','','/api/getPage?pageName=task/task-list',1,'',16),(31,28,'æµç¨‹éƒ¨ç½²','','/api/getPage?pageName=process/process-add',1,'',17);

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

insert  into `sys_process`(`id`,`title`,`content`,`userId`,`username`,`createTime`,`flage`) values (1,'è¯·å‡ç”³è¯·','è‚šå­ç–¼',1,'ç®¡ç†å‘˜','2020-03-28 14:58:01',1),(2,'asdas',NULL,1,'ç®¡ç†å‘˜','2020-03-03 10:35:05',0),(3,'asdas',NULL,1,'ç®¡ç†å‘˜','2020-03-03 10:38:54',0),(4,'asdas','',1,'ç®¡ç†å‘˜','2020-03-03 10:52:58',0),(5,'è¯·å‡','å¾ˆéš¾æï¼',1,'ç®¡ç†å‘˜','2020-03-03 10:56:50',0),(6,'asdas','asdas',44,'é˜¿è¾¾','2020-03-04 05:00:50',0),(7,'asd','asdasd',1,'mama','2020-03-04 15:10:14',0),(8,'è¯·å‡','è‚šå­ç–¼...',1,'ç®¡ç†å‘˜','2020-03-06 02:31:45',0);

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

insert  into `sys_role`(`id`,`name`,`description`,`createTime`,`updateTime`) values (1,'ADMIN','ç®¡ç†å‘˜','2017-05-01 13:25:39','2020-03-06 01:55:55'),(2,'USER','æ™®é€šç”¨æˆ·','2017-08-01 21:47:31','2019-05-30 09:08:24'),(3,'TEACHER','','2019-03-27 02:10:23','2019-05-23 07:48:01'),(4,'test','test','2019-04-29 02:16:48','2019-05-22 09:51:26'),(5,'Moster','Moster','2020-02-26 09:32:04','2020-02-26 09:32:04'),(6,'aaaa','mama ','2020-02-29 12:30:22','2020-03-04 05:13:20');

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

insert  into `sys_user`(`id`,`username`,`password`,`nickname`,`headImgUrl`,`phone`,`telephone`,`email`,`birthday`,`sex`,`status`,`createTime`,`updateTime`) values (1,'admin','$2a$06$JlVBSJU9QvttHI1JMPu9kO3X3GN7i.mtMBC9Hd0Qq6khH9aDfz98q','ç®¡ç†å‘˜',NULL,NULL,'158784879852','12@qq.com',NULL,NULL,1,'2019-04-08 00:20:51','2019-04-08 00:20:51'),(2,'user','$2a$10$ILWAB4ZOoRr2pXqarliI6uAuL7Q/7dAMTpWO9p7dyVSHHO7zQMTeW','ç”¨æˆ·',NULL,NULL,'1111111111','11@qq.com','2019-03-31',NULL,1,'2019-04-09 06:44:50','2019-04-09 06:44:50'),(3,'alex','534b44a19bf18d20b71ecc4eb77c572f','è®²å¸ˆ',NULL,'','13245698712','alex@qq.com','2019-03-31',1,1,'2019-03-27 02:27:35','2019-04-09 07:57:17'),(18,'user1','96e79218965eb72c92a549dd5a330112','111',NULL,NULL,'123455432123','134@qq.com','2019-05-12',NULL,1,'2019-05-14 04:44:22','2019-05-14 04:44:22'),(26,'user2','96e79218965eb72c92a549dd5a330112','user2',NULL,NULL,'09876567890','aa@QQ.com','2019-05-12',NULL,1,'2019-05-15 02:22:21','2019-05-21 00:57:14'),(27,'user3','96e79218965eb72c92a549dd5a330112','user3',NULL,NULL,'44366758876586578','bb@qq.com','2019-05-14',NULL,1,'2019-05-15 02:23:51','2019-05-15 02:23:51'),(28,'user4','96e79218965eb72c92a549dd5a330112','user4',NULL,NULL,'2143323543456876','cc@qq.com','2019-04-30',NULL,1,'2019-05-15 02:24:22','2019-05-15 02:24:22'),(29,'user5','96e79218965eb72c92a549dd5a330112','user5',NULL,NULL,'1221344234565','dd@qq.com','2018-12-03',NULL,1,'2019-05-15 02:24:49','2019-05-15 02:24:49'),(30,'user6','96e79218965eb72c92a549dd5a330112','user6',NULL,NULL,'123213215135453','ee@qq.coom','2019-05-15',NULL,1,'2019-05-15 02:25:16','2019-05-21 03:08:26'),(32,'user7','96e79218965eb72c92a549dd5a330112','user7',NULL,NULL,'21345457980765','tt@qq.com','2019-05-20',NULL,1,'2019-05-15 06:16:32','2019-05-21 03:08:37'),(41,'user67','96e79218965eb72c92a549dd5a330112','user67',NULL,NULL,'123456324568','asdsa@qq.com','2019-05-14',NULL,1,'2019-05-16 08:39:11','2019-05-16 08:39:11'),(43,'alex-s','$2a$10$uO3EmAB8LgkreKnwiro1Ium2n28iHDJw66e4prCesSOu0NrNvmkhu',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'2019-05-29 06:07:53','2019-05-29 06:07:53'),(44,'mama','$2a$10$tKyEqO4gCCZTWDoto/zCXeoCCv6gz2pviG5HiVasjl0HOfJzeDaTy','mama',NULL,NULL,'1213060407229','363054104@qq.com','2019-11-04',NULL,1,'2020-02-29 12:32:13','2020-02-29 12:32:13');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
