package com.manager.manager.service;

import com.manager.manager.base.result.Results;
import com.manager.manager.dto.UserDto;
import com.manager.manager.model.SysUser;

public interface UserService {
    SysUser getUser(String username);

    Results<SysUser> getAllUserByPage(Integer offset, Integer limit);

    Results save(UserDto userDto, Integer roleId);

    SysUser getUserByPhone(String tel);

    SysUser getUserById(Long id);

    Results<SysUser> updateUser(UserDto userDto, Integer roleId);

    int deleteUser(Long id);

    Results<SysUser> getUserByUserName(String username, Integer offset, Integer limit);

    Results changePassword(String username, String oldPassword, String newPassword);

    SysUser selectOne(SysUser prarmUser);

}
