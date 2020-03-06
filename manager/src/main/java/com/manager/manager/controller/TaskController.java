package com.manager.manager.controller;

import com.manager.manager.base.result.Results;
import com.manager.manager.dto.LoginUser;
import lombok.extern.slf4j.Slf4j;
import org.activiti.engine.TaskService;
import org.activiti.engine.task.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.management.Query;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;
@Slf4j
@Controller
@RequestMapping("task")
public class TaskController {
    @Autowired
    TaskService taskService;
    @RequestMapping("/list")
    @ResponseBody
    public Results listById(ModelAndView modelAndView ){

        LoginUser loginUser=(LoginUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

        if (loginUser instanceof UserDetails) {
            List<Task> list = taskService.createTaskQuery().taskAssignee("管理员").list();
          /*  log.info("id= "+loginUser.getId().toString());
            if(list!=null&&list.size()>0){
            for (Task task:list){
                System.out.println(task.getId());
                System.out.println(task.getName());
                System.out.println(task.getAssignee());
            }
            }*/
            modelAndView.addObject("list",list);
        }
    return Results.success();
    }
}
