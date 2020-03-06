package com.manager.manager.service.impl;

import com.manager.manager.service.ActivityBuildService;
import lombok.extern.slf4j.Slf4j;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.repository.Deployment;
import org.activiti.engine.repository.DeploymentBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Slf4j
@Service
public class ActivityBuildServiceImpl implements ActivityBuildService {
    @Autowired
    RepositoryService repositoryService;

    public void deployProcess(String processName){
       DeploymentBuilder builder = repositoryService.createDeployment();
        Deployment deploy = builder.name(processName).addClasspathResource("baoxiao.bpmn")
                .addClasspathResource("baoxiao.png").deploy();
        log.info("部署成功");
        log.info("ID:"+deploy.getId());
    }


}
