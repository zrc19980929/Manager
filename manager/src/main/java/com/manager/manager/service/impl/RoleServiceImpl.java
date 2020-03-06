package com.manager.manager.service.impl;

import com.manager.manager.base.result.ResponseCode;
import com.manager.manager.base.result.Results;
import com.manager.manager.dto.RoleDto;
import com.manager.manager.mapper.RoleMapper;
import com.manager.manager.mapper.RolePermissionMapper;
import com.manager.manager.mapper.RoleUserMapper;
import com.manager.manager.model.SysRole;
import com.manager.manager.model.SysRoleUser;
import com.manager.manager.model.SysUser;
import com.manager.manager.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.List;

@Service
public class RoleServiceImpl implements RoleService {
    @Autowired
   private RoleMapper roleMapper;
    @Autowired
    RolePermissionMapper rolePermissionMapper;
    @Autowired
    RoleUserMapper roleUserMapper;
    @Override
    public Results<SysRole> getAllRoles() {
        return Results.success(50,roleMapper.getAllRole());
    }

    @Override
    public Results<SysRole> getAllRolesPage(Integer offset, Integer limit) {
        return Results.success(roleMapper.getAllRolesCount().intValue(),roleMapper.getAllRolesPage(offset,limit));
    }

    @Override
    public SysRole editRoleById(Integer id) {
        return roleMapper.getRoleById(id);
    }

    @Override
    public Results updateRole( RoleDto roleDto, Integer roleId) {
       List<Long> permissionIds=roleDto.getPermissionIds();
       permissionIds.remove(0L);
       //1.更新角色前要删除该角色之前的所有权限
        rolePermissionMapper.deleteRolePermisson(roleDto.getId());
        //2.判断该角色是否有被赋予权限值 有就添加
        if (!CollectionUtils.isEmpty(permissionIds)){
            rolePermissionMapper.save(roleDto.getId(),permissionIds);
        }
        //3、更新角色表
        int countData = roleMapper.update(roleDto);

        if(countData > 0){
            return Results.success();
        }else{
            return Results.failure();
        }
    }

    @Override
    public Results<SysRole> getRolesByName(String roleName, Integer offset, Integer limit) {
        return Results.success(roleMapper.getRoleByName(roleName).intValue(),roleMapper.getRoles(roleName,offset,limit));
    }

    @Override
    public Results<SysRole> save(RoleDto roleDto) {
        //1、先保存角色
        roleMapper.saveRole(roleDto);
        List<Long> permissionIds = roleDto.getPermissionIds();
        //移除0,permission id是从1开始
        permissionIds.remove(0L);
        //2、保存角色对应的所有权限
        if (!CollectionUtils.isEmpty(permissionIds)){
            rolePermissionMapper.save(roleDto.getId(),permissionIds);
        }
        return Results.success();
    }

    @Override
    public Results<SysRole> deleteRole(Integer id) {
        List<SysRoleUser> datas= roleUserMapper.listAllSysRoleUserByRoleId(id);
        if (datas.size()<=0){
            roleMapper.delete(id);
            return Results.success();
        }
        return Results.failure(ResponseCode.USERNAME_REPEAT.USER_ROLE_NO_CLEAR.getCode(),ResponseCode.USERNAME_REPEAT.USER_ROLE_NO_CLEAR.getMessage());
    }
}
