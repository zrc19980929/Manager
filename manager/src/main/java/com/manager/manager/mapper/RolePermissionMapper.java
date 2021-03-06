package com.manager.manager.mapper;

import com.manager.manager.dto.RoleDto;
import com.manager.manager.model.SysRoleUser;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface RolePermissionMapper {

    int save(@Param("roleId") Integer id, @Param("permissionIds") List<Long> permissionIds);

    @Delete("delete from sys_role_permission where roleId=#{roleId}")
    int  deleteRolePermisson(Integer id);

}
