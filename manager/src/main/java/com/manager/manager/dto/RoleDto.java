package com.manager.manager.dto;

import com.manager.manager.model.SysRole;
import lombok.Data;

import java.util.List;

@Data
public class RoleDto extends SysRole {

    private List<Long> permissionIds;
}
