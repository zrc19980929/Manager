package com.manager.manager.util;

import com.manager.manager.model.SysRole;
import com.manager.manager.model.SysUser;
import org.activiti.engine.identity.Group;
import org.activiti.engine.impl.persistence.entity.GroupEntity;
import org.activiti.engine.impl.persistence.entity.UserEntity;

import java.util.ArrayList;
import java.util.List;

public class ActivitiUserUtil {
    public static UserEntity toActivitiUser(SysUser bUser){
        UserEntity userEntity = new UserEntity();
        userEntity.setId(bUser.getId().toString());
        userEntity.setFirstName(bUser.getUsername());
        userEntity.setLastName(bUser.getNickname());
        userEntity.setEmail(bUser.getEmail());
        userEntity.setRevision(1);
        return userEntity;
    }

    public static List<Group> toActivitiGroups(List<SysRole> sysRoles) {
        List<Group> groups = new ArrayList<>();
        for (SysRole sysRole : sysRoles) {
            GroupEntity groupEntity = toActivitiGroup(sysRole);
            groups.add(groupEntity);
        }
        return groups;
    }

    private static GroupEntity toActivitiGroup(SysRole sysRole) {
        GroupEntity groupEntity = new GroupEntity();
        groupEntity.setRevision(1);
        groupEntity.setType("assignment");
        groupEntity.setId(sysRole.getId().toString());
        groupEntity.setName(sysRole.getName());
        return groupEntity;
    }
}
