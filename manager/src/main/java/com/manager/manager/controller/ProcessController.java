package com.manager.manager.controller;

import com.manager.manager.base.result.PageTableRequest;
import com.manager.manager.base.result.Results;
import com.manager.manager.dto.LoginUser;
import com.manager.manager.dto.UserDto;
import com.manager.manager.model.SysProcess;
import com.manager.manager.model.SysUser;
import com.manager.manager.service.ProcessService;
import com.manager.manager.service.UserService;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.repository.Deployment;
import org.activiti.engine.repository.DeploymentBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;
import java.util.zip.ZipInputStream;
@Slf4j
@Controller
@RequestMapping("process")
public class ProcessController {


    @Autowired
    ProcessService processService;


    @GetMapping("/list")
    @ResponseBody
    public Results<SysProcess> getUsers(PageTableRequest request){
        request.countOffset();
        return processService.getAllUserByPage(request.getOffset(),request.getLimit());
    }

        @PostMapping("/apply")
        @ResponseBody
        public Results save(@RequestParam("username") String username, SysProcess process)  {
            System.out.println("111");
            LoginUser loginUser =(LoginUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
            if (loginUser instanceof UserDetails) {
                process.setUserId(loginUser.getId().intValue());
            }
            process.setUsername(username);
            process.setFlage(0);
            processService.addAndStartProcess(process);
            log.info("正在启动");
          return Results.success();
        }


}
