package com.manager.manager.controller;

import com.manager.manager.base.result.PageTableRequest;
import com.manager.manager.base.result.ResponseCode;
import com.manager.manager.base.result.Results;
import com.manager.manager.dto.UserDto;
import com.manager.manager.model.SysUser;
import com.manager.manager.service.UserService;
import com.manager.manager.util.MD5;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.request.WebRequest;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

@Controller
@RequestMapping("user")
@Slf4j
public class UserController {

    @Autowired
    private UserService userService;
    @GetMapping("/{username}")
    @ResponseBody
    public SysUser user(@PathVariable String username){
        log.info("UserController.user():param(username=" +username+ ")");
        return userService.getUser(username);
    }

    @GetMapping("/list")
    @ResponseBody
    @PreAuthorize("hasAuthority('sys:user:query')")
    @ApiOperation(value = "分页获取用户信息", notes = "分页获取用户信息")//描述
    @ApiImplicitParam(name = "request", value = "分页查询实体类", required=false)
    public Results<SysUser> getUsers(PageTableRequest request){
        request.countOffset();
        /*ArrayList<SysUser> list=new ArrayList<SysUser>();
        list.add(userService.getUser("admin"));*/
        return userService.getAllUserByPage(request.getOffset(),request.getLimit());
    }

    @GetMapping("/add")
    @PreAuthorize("hasAuthority('sys:user:add')")
    @ApiOperation(value = "用户新增页面", notes = "跳转到新增用户信息页面")//描述
    public String addUser(Model model){
    model.addAttribute(new SysUser());
        return "user/user-add";
    }

    @PostMapping("/add")
    @ResponseBody
    @PreAuthorize("hasAuthority('sys:user:add')")
    @ApiOperation(value = "保存用户信息", notes = "保存新增的用户信息")//描述
    public Results<SysUser> saveUser(UserDto userDto,Integer roleId){
        SysUser sysUser=null;
        sysUser=userService.getUserByPhone(userDto.getTelephone());
        if (sysUser!=null&&!(sysUser.equals(sysUser.getId()))){
            return Results.failure(ResponseCode.PHONE_REPEAT.getCode(),ResponseCode.PHONE_REPEAT.getMessage());
        }
        userDto.setStatus(1);
       // userDto.setPassword(MD5.crypt(userDto.getPassword()));
        userDto.setPassword(new BCryptPasswordEncoder().encode(userDto.getPassword()));
        return userService.save(userDto,roleId);
    }

    String pattern="yyyy-MM-dd";
    @InitBinder
    public void InitBinder(WebDataBinder data, WebRequest request){
        data.registerCustomEditor(Date.class,new CustomDateEditor(new SimpleDateFormat(pattern),true));
    }

    @GetMapping("/edit")
    @ApiOperation(value = "用户编辑页面", notes = "跳转到用户信息编辑页面")//描述
    @ApiImplicitParam(name = "user", value = "用户实体类", dataType = "SysUser")
    public String editUser(Model model,SysUser sysUser){
        model.addAttribute(userService.getUserById(sysUser.getId()));
        return "user/user-edit";
    }

    @PostMapping("/edit")
    @ResponseBody
    @PreAuthorize("hasAuthority('sys:user:edit')")
    @ApiOperation(value = "保存用户信息", notes = "保存编辑完的用户信息")//描述
    public Results<SysUser> updateUser(UserDto userDto,Integer roleId){
        SysUser sysUser=null;
        /*sysUser=userService.getUserByPhone(userDto.getTelephone());
        if (sysUser!=null&&!(sysUser.equals(sysUser.getId()))){
            return Results.failure(ResponseCode.PHONE_REPEAT.getCode(),ResponseCode.PHONE_REPEAT.getMessage());
        }*/
        return userService.updateUser(userDto,roleId);
    }

    @GetMapping("/delete")
    @ResponseBody
    @PreAuthorize("hasAuthority('sys:user:del')")
    @ApiOperation(value = "删除用户信息", notes = "删除用户信息")//描述
    @ApiImplicitParam(name = "userDto", value = "用户实体类", required = true, dataType = "UserDto")
    public Results deleteUser(UserDto userDto){
        int count = userService.deleteUser(userDto.getId());
        if (count>0) {
            return Results.success();
        }else {
            return Results.failure();
        }
    }

    @GetMapping("/findUserByUserName")
    @ResponseBody
    @PreAuthorize("hasAuthority('sys:user:query')")
    @ApiOperation(value = "模糊查询用户信息", notes = "模糊搜索查询用户信息")//描述
    @ApiImplicitParams({
            @ApiImplicitParam(name = "username",value = "模糊搜索的用户名", required = true),
    })
    public Results<SysUser> findUserByUserName(PageTableRequest request,String username){
        request.countOffset();
        /*ArrayList<SysUser> list=new ArrayList<SysUser>();
        list.add(userService.getUser("admin"));*/
        return userService.getUserByUserName(username,request.getOffset(),request.getLimit());
    }
    @PostMapping("/changePassword")
    @ApiOperation(value = "修改密码")//描述
    @ResponseBody
    public Results<SysUser> changePassword(String username,String oldPassword,String newPassword){
        return userService.changePassword(username,oldPassword,newPassword);
    }
}
