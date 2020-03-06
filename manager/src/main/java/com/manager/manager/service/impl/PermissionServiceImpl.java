package com.manager.manager.service.impl;

import com.alibaba.fastjson.JSONArray;
import com.manager.manager.base.result.Results;
import com.manager.manager.mapper.PermissionMapper;
import com.manager.manager.model.SysPermission;
import com.manager.manager.service.PermissionService;
import com.manager.manager.util.TreeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class PermissionServiceImpl implements PermissionService {
    @Autowired
    PermissionMapper permissionMapper;

    @Override
    public Results<JSONArray> listAllPermission() {
        List data = permissionMapper.findAll();
        JSONArray jsonArray = new JSONArray();
        TreeUtils.setPermissionsTree(0, data, jsonArray);
        return Results.success(jsonArray);
    }

    @Override
    public Results<SysPermission> listByRoleId(Integer RoleId) {
        List<SysPermission> datas = permissionMapper.listByRoleId(RoleId);
        return Results.success(0, datas);
    }

    @Override
    public Results<SysPermission> getMenuAll() {
        return Results.success(0, permissionMapper.findAll());
    }

    @Override
    public Results<SysPermission> save(SysPermission sysPermission) {
        return (permissionMapper.save(sysPermission) > 0) ? Results.success() : Results.failure();
    }

    @Override
    public SysPermission getSysPermissionById(Integer id) {
        return permissionMapper.getSysPermissionById(id);
    }

    @Override
    public Results update(SysPermission sysPermission) {
        return (permissionMapper.update(sysPermission) > 0) ? Results.success() : Results.failure();
    }

    @Override
    public Results delete(Integer id) {
        permissionMapper.deleteById(id);
        permissionMapper.deleteByParenId(id);
        return Results.success();
    }

    @Override
    public Results menu(Long userId) {
        List<SysPermission> data = permissionMapper.listByUserId(userId);
        data=data.stream().filter(p->p.getType().equals(1)).collect(Collectors.toList());
        JSONArray jsonArray = new JSONArray();
        TreeUtils.setPermissionsTree(0, data, jsonArray);
        return Results.success(jsonArray);
    }
}
