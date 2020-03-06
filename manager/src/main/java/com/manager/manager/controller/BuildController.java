package com.manager.manager.controller;

import com.manager.manager.base.result.Results;
import com.manager.manager.service.ActivityBuildService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("build")
public class BuildController {

    @Autowired
    ActivityBuildService activityBuildService;
    @RequestMapping("/add")
    @ResponseBody
    public Results build(String processName){
        activityBuildService.deployProcess(processName);
        return Results.success();
    }
}
