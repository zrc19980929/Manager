package com.manager.manager.service;

import com.manager.manager.base.result.Results;
import com.manager.manager.dto.RoleDto;
import com.manager.manager.model.SysRole;
import com.manager.manager.model.SysUser;
import org.springframework.ui.Model;

public interface RoleService {
    Results<SysRole> getAllRoles();

    Results<SysRole> getAllRolesPage(Integer offset, Integer limit);

    SysRole editRoleById(Integer id);

    Results<SysRole> getRolesByName(String roleName, Integer offset, Integer limit);

    Results<SysRole>  save(RoleDto roleDto);

    Results updateRole(RoleDto roleDto, Integer roleId);

    Results<SysRole> deleteRole(Integer id);
}
