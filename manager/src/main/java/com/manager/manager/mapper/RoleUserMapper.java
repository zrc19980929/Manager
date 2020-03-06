package com.manager.manager.mapper;

import com.manager.manager.model.SysRoleUser;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface RoleUserMapper {

    @Insert("insert into sys_role_user(userId,roleId) values(#{userId},#{roleId})")
    void save(SysRoleUser sysRoleUser);

    @Select("select * from sys_role_user t where userId=#{userId}")
    SysRoleUser getRoleUserByUserId(Integer userId);

    int updateSysRoleUser(SysRoleUser user);

    @Delete("delete from sys_role_user  where userId=#{userId}")
    int deleteRoleUserById(int userId);

    @Select("select * from sys_role_user t where roleId=#{roleId}")
    List<SysRoleUser> listAllSysRoleUserByRoleId(Integer id);
}
