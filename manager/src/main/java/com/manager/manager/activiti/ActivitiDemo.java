/*
package com.manager.manager.activiti;

import org.activiti.engine.ProcessEngine;
import org.activiti.engine.ProcessEngines;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.repository.Deployment;
import org.activiti.engine.repository.DeploymentBuilder;
import org.activiti.engine.runtime.ProcessInstance;

public class ActivitiDemo {


    public void buildProcess(){
        ProcessEngine processEngine= ProcessEngines.getDefaultProcessEngine();
        RepositoryService service1=processEngine.getRepositoryService();
        DeploymentBuilder builder=service1.createDeployment();
        Deployment deployment=builder.name("提出申请")
                .addClasspathResource("baoxiao.bpmn").addClasspathResource("baoxiao.png").deploy();
    }
    public void startProcess(){
        ProcessEngine processEngine= ProcessEngines.getDefaultProcessEngine();
        RuntimeService service=processEngine.getRuntimeService();
        ProcessInstance instance=service.startProcessInstanceByKey("myProcess_1");

    }
}
*/
