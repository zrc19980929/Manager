package com.manager.manager.mapper;

import com.manager.manager.base.result.Results;
import com.manager.manager.dto.RoleDto;
import com.manager.manager.model.SysRole;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface RoleMapper {
    @Select("select * from sys_role t")
    public List<SysRole> getAllRole();

    @Select("select count(*) from sys_role t ")
    Long getAllRolesCount();

    @Select("select * from sys_role t order by t.id limit #{startPosition},#{limit}")
    List<SysRole> getAllRolesPage(@Param("startPosition") Integer offset,@Param("limit") Integer limit);

    @Select("select * from sys_role t where t.id=#{id}")
    SysRole getRoleById(Integer id);

    @Select("select * from sys_role t where t.name=#{name}")
    List<SysRole> getRole(String name);

    @Select("select count(*) from sys_role t where t.name like '%${name}%'")
    Long getRoleByName(@Param("name")String roleName);

    @Select("select * from sys_role t where t.name like '%${name}%' limit #{startPosition},#{limit}")
    List<SysRole> getRoles(@Param("name")String roleName, @Param("startPosition")Integer offset, @Param("limit")Integer limit);

    @Options(useGeneratedKeys = true, keyProperty = "id")
    @Insert("insert into sys_role(name, description, createTime, updateTime) values(#{name}, #{description}, now(), now())")
    int saveRole(SysRole role);

    int update(RoleDto roleDto);

    @Delete("delete from sys_role where id=#{id}")
    int delete(Integer id);

    // int  saveRole(RoleDto roleDto);
}
