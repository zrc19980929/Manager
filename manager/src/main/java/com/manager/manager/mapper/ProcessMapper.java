package com.manager.manager.mapper;

import com.manager.manager.model.SysProcess;
import com.manager.manager.model.SysUser;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface ProcessMapper {

    @Options(useGeneratedKeys = true, keyProperty = "id")
    @Insert("insert into sys_process(title,content,userId,username,createTime,flage) values(#{title},#{content},#{userId},#{username},now(),#{flage})")
    int insertProcess(SysProcess process);

    @Select("select count(*) from sys_process t")
    Long countAllUser();

    @Select("select * from sys_process t order by t.id limit #{startPosition},#{limit}")
    List<SysProcess> getAllUserByPage(@Param("startPosition")Integer offset, @Param("limit") Integer limit);

}
