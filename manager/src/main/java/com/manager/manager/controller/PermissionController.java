package com.manager.manager.controller;

import com.alibaba.fastjson.JSONArray;
import com.manager.manager.base.result.Results;
import com.manager.manager.dto.RoleDto;
import com.manager.manager.model.SysPermission;
import com.manager.manager.service.PermissionService;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("permission")
@Slf4j
public class PermissionController {
    @Autowired
    PermissionService permissionService;

    @GetMapping("/listAllPermission")
    @ResponseBody
    @PreAuthorize("hasAuthority('sys:menu:query')")
    @ApiOperation(value = "获取所有权限值", notes = "获取所有菜单的权限值")//描述
    public Results<JSONArray> listAllPermission(){
        return permissionService.listAllPermission();
    }


    @GetMapping("/listAllPermissionByRoleId")
    @ResponseBody
    @ApiOperation(value = "获取角色权限", notes = "根据角色Id去查询拥有的权限")//描述
    public Results<SysPermission> listAllPermissionByRoleId(RoleDto roleDto){
        return permissionService.listByRoleId(roleDto.getId().intValue());
    }
    @GetMapping("/menuAll")
    @ResponseBody
    @PreAuthorize("hasAuthority('sys:menu:query')")
    @ApiOperation(value = "获取所有权限值", notes = "获取所有菜单的权限值")//描述
    public Results getMenuAll(){
        return permissionService.getMenuAll();
    }

    @GetMapping("/add")
    @ApiOperation(value = "新增页面", notes = "跳转到菜单信息新增页面")//描述
    public String addPermission(Model model){
        model.addAttribute("sysPermission",new SysPermission());
        return "permission/permission-add";
    }
    @PostMapping("/add")
    @ResponseBody
    @PreAuthorize("hasAuthority('sys:menu:add')")
    @ApiOperation(value = "添加菜单", notes = "保存用户新增的菜单信息")//描述
    @ApiImplicitParam(name = "sysPermission", value = "菜单权限实体sysPermission", required = true, dataType = "SysPermission")
    public Results<SysPermission> addSavePermission(@RequestBody SysPermission sysPermission){
        return permissionService.save(sysPermission);
    }

    @GetMapping("/edit")
    @ApiOperation(value = "编辑页面", notes = "跳转到菜单信息编辑页面")//描述
    public String editPermission(Model model,SysPermission sysPermission){
        model.addAttribute("sysPermission",permissionService.getSysPermissionById(sysPermission.getId()));
        return "permission/permission-add";
    }
    @PostMapping("/edit")
    @ResponseBody
    @PreAuthorize("hasAuthority('sys:menu:edit')")
    @ApiOperation(value = "更新菜单信息", notes = "保存用户编辑完的菜单信息")//描述
    @ApiImplicitParam(name = "sysPermission", value = "菜单权限实体sysPermission", required = true, dataType = "SysPermission")
    public Results updatePermission(@RequestBody SysPermission sysPermission){
        return permissionService.update(sysPermission);
    }

    @GetMapping("/delete")
    @ResponseBody
    @PreAuthorize("hasAuthority('sys:menu:del')")
    @ApiOperation(value = "删除菜单", notes = "根据菜单Id去删除菜单")//描述
    public Results deletePermission( SysPermission sysPermission){
        return permissionService.delete(sysPermission.getId());
    }
    @GetMapping("/menu")
    @ResponseBody
    @ApiOperation(value = "获取菜单", notes = "获取用户所属角色下能显示的菜单")//描述
    @ApiImplicitParam(name = "userId", value = "userId", required = true, dataType = "Long")
    public Results<SysPermission> getMenu( Long userId){
        return permissionService.menu(userId);
    }

}
