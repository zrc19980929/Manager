package com.manager.manager.mapper;

import com.manager.manager.dto.UserDto;
import com.manager.manager.model.SysUser;

import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import java.util.List;

@Component
@Mapper
public interface UserMapper {

    public int updateUser(SysUser user);

    @Select("select * from sys_user t where t.username=#{username}")
    public SysUser getUser(String username);

    @Select("select * from sys_user t order by t.id limit #{startPosition},#{limit}")
    List<SysUser> getAllUserByPage(@Param("startPosition") Integer startPosition, @Param("limit") Integer limit);

    @Select("select count(*) from sys_user t")
    public Long countAllUser();

    @Options(useGeneratedKeys = true, keyProperty = "id")
    @Insert("insert into sys_user(username,password,nickname,headImgUrl,phone,telephone,email,birthday,sex,status,createTime,updateTime) values(#{username},#{password},#{nickname},#{headImgUrl},#{phone},#{telephone},#{email},#{birthday},#{sex},#{status},now(),now())")
    int save(SysUser user);

    @Select("select * from sys_user t where t.telephone=#{telephone}")
    SysUser getUserPhone(String tel);

    @Select("select * from sys_user t where t.id=#{id}")
    SysUser getUserById(Long id);

    @Delete("delete from sys_user  where id=#{id}")
    int deleteUserById(int id);

    @Select("select count(*) from sys_user t where t.username like '%${username}%'")
    Long getUserByUserName(@Param("username") String username);

    @Select("select * from sys_user t where t.username like '%${username}%' limit #{startPosition},#{limit}")
    List<SysUser> getUserByUserNameByPage(@Param("username") String username, @Param("startPosition") Integer offset, @Param("limit") Integer limit);

    @Update("update sys_user t set t.password=#{password} where t.id = #{id}")
    int changePassword(@Param("id")Long id, @Param("password")String password);

    @Select("select * from sys_user")
    SysUser selectOne(SysUser prarmUser);
}
