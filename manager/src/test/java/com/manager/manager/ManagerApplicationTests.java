package com.manager.manager;

import com.manager.manager.dto.LoginUser;
import com.manager.manager.dto.UserDto;
import org.activiti.engine.ProcessEngine;
import org.activiti.engine.ProcessEngines;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.TaskService;
import org.activiti.engine.impl.cfg.StandaloneProcessEngineConfiguration;
import org.activiti.engine.task.Task;
import org.activiti.spring.boot.SecurityAutoConfiguration;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

@SpringBootTest
class ManagerApplicationTests {
    @Autowired
    TaskService taskService;

    @Test
    void contextLoads() {
        LoginUser loginUser =(LoginUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        List<Task> list = taskService.createTaskQuery().taskAssignee(loginUser.getId().toString()).list();
        System.out.println(loginUser.getId().toString());
        for (Task task:list){
            System.out.println(task);
        }
    }

}
