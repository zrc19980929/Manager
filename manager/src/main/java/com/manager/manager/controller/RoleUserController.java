package com.manager.manager.controller;

import com.manager.manager.base.result.Results;
import com.manager.manager.model.SysRoleUser;
import com.manager.manager.service.RoleUserService;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("roleuser")
@Slf4j
public class RoleUserController {
    @Autowired
    RoleUserService roleUserService;
    @PostMapping("/getRoleUserByUserId")
    @ResponseBody
    @ApiOperation(value = "获取当前用户角色", notes = "获取当前用户角色")//描述
    @ApiImplicitParam(name = "userId",value = "用户Id", required = true)
    public Results getRoleUserByUserId(Integer userId){

        return roleUserService.getRoleUserByUserId(userId);
    }
}
