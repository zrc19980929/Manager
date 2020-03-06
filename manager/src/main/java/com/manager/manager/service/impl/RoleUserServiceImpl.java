package com.manager.manager.service.impl;

import com.manager.manager.base.result.ResponseCode;
import com.manager.manager.base.result.Results;
import com.manager.manager.mapper.RoleUserMapper;
import com.manager.manager.model.SysRoleUser;
import com.manager.manager.service.RoleUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RoleUserServiceImpl implements RoleUserService {
    @Autowired
    RoleUserMapper roleUserMapper;
    @Override
    public Results getRoleUserByUserId(Integer userId) {
      SysRoleUser roleUser= roleUserMapper.getRoleUserByUserId(userId);
      if(roleUser!=null){
          return Results.success(roleUser);
      }else {
        return Results.success();}
    }
}
