package com.manager.manager.service;

import com.alibaba.fastjson.JSONArray;
import com.manager.manager.base.result.Results;
import com.manager.manager.model.SysPermission;

public interface PermissionService {
    Results<JSONArray> listAllPermission();

    Results<SysPermission> listByRoleId(Integer intValue);

    Results<SysPermission> getMenuAll();

    Results<SysPermission> save(SysPermission sysPermission);

    SysPermission getSysPermissionById(Integer id);

    Results update(SysPermission sysPermission);

    Results delete(Integer id);

    Results menu(Long userId);
}
