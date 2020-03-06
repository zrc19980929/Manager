package com.manager.manager.service.impl;

import com.manager.manager.base.result.Results;
import com.manager.manager.dto.UserDto;
import com.manager.manager.mapper.RoleUserMapper;
import com.manager.manager.mapper.UserMapper;
import com.manager.manager.model.SysRoleUser;
import com.manager.manager.model.SysUser;
import com.manager.manager.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.context.request.WebRequest;

import javax.xml.crypto.Data;
import java.text.SimpleDateFormat;
import java.util.Date;

@Service
@Transactional
public class UserServiceImpl implements UserService {
    @Autowired
    UserMapper  userMapper;
    @Autowired
    RoleUserMapper roleUserMapper;
    @Override
    public SysUser getUser(String username) {
        return  userMapper.getUser(username);

    }

    @Override
    public Results<SysUser> getAllUserByPage(Integer offset, Integer limit) {
        //count user
        return Results.success(userMapper.countAllUser().intValue(),userMapper.getAllUserByPage(offset,limit));
    }

    @Override
    public Results save(UserDto userDto, Integer roleId) {
        //存储user表

        if (roleId!=null){
            userMapper.save(userDto);
            //拿到权限 roleUser
            SysRoleUser sysRoleUser=new SysRoleUser();
            sysRoleUser.setRoleId(roleId);
            sysRoleUser.setUserId(userDto.getId().intValue());
            roleUserMapper.save(sysRoleUser);
            return Results.success();
        }
        return Results.failure();
    }

    @Override
    public SysUser getUserByPhone(String tel) {
        return userMapper.getUserPhone(tel);
    }

    @Override
    public SysUser getUserById(Long id) {
        return userMapper.getUserById(id);
    }

    @Override
    public Results<SysUser> updateUser(UserDto userDto, Integer roleId) {
        if (roleId!=null){//sys_user
            userMapper.updateUser(userDto);
            //sys_user_role
            SysRoleUser user=new SysRoleUser();
            user.setUserId(userDto.getId().intValue());
            user.setRoleId(roleId);
            if (roleUserMapper.getRoleUserByUserId(userDto.getId().intValue())!=null){
                roleUserMapper.updateSysRoleUser(user);
            }else {
                roleUserMapper.save(user);
            }
            return Results.success();
        }else {

        return Results.failure();
        }
    }

    @Override
    public int deleteUser(Long id) {
        //roleUser
        roleUserMapper.deleteRoleUserById(id.intValue());
        //user
        return userMapper.deleteUserById(id.intValue());
    }

    @Override
    public Results<SysUser> getUserByUserName(String username, Integer offset, Integer limit) {
        return Results.success(userMapper.getUserByUserName(username).intValue(),userMapper.getUserByUserNameByPage(username,offset,limit));
    }

    @Override
    public Results changePassword(String username, String oldPassword, String newPassword) {
        SysUser user = userMapper.getUser(username);
        if (user==null){
            return Results.failure(1,"用户不存在");
        }
        if (!new BCryptPasswordEncoder().encode(oldPassword).equals(user.getPassword())){

            return Results.failure(1,"旧密码输入错误");
        }
        userMapper.changePassword(user.getId(),new BCryptPasswordEncoder().encode(newPassword));
    return Results.success();
    }

    @Override
    public SysUser selectOne(SysUser prarmUser) {
        return userMapper.selectOne(prarmUser);
    }
}
