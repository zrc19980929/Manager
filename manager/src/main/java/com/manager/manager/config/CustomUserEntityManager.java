package com.manager.manager.config;

import com.manager.manager.dto.LoginUser;
import com.manager.manager.mapper.RoleMapper;
import com.manager.manager.mapper.UserMapper;
import com.manager.manager.model.SysRole;
import com.manager.manager.model.SysUser;
import com.manager.manager.service.RoleService;
import com.manager.manager.service.UserService;
import com.manager.manager.util.ActivitiUserUtil;

import org.activiti.engine.identity.Group;
import org.activiti.engine.impl.persistence.entity.UserEntity;
import org.activiti.engine.impl.persistence.entity.UserEntityManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

@Component
public class CustomUserEntityManager extends UserEntityManager {
    @Autowired
    private UserMapper userMapper;

    @Autowired
    private RoleMapper roleMapper;

    @Override
    public UserEntity findUserById(String userId) {
         SysUser user = getUser(userId);
        return ActivitiUserUtil.toActivitiUser(user);
    }

    @Override
    public List<Group> findGroupsByUser(String roleId) {
        if (roleId==null)
            return null;
        List<SysRole> groupIds=roleMapper.getRole(roleId);
        List<Group> gs=ActivitiUserUtil.toActivitiGroups(groupIds);
        return gs;
    }
    private SysUser getUser(String userId) {
        SysUser user=new SysUser();
        LoginUser loginUser=(LoginUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (loginUser.getId().toString().equals(userId)){
            user.setId(loginUser.getId());
            user.setNickname(loginUser.getNickname());
            user.setEmail(loginUser.getEmail());
        }else {
        SysUser prarmUser=new SysUser();
        prarmUser.setId(Long.valueOf(userId));
        user=userMapper.getUserById(prarmUser.getId());
        }
        return user;
    }
}
