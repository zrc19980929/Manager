package com.manager.manager.dto;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.manager.manager.model.SysPermission;
import com.manager.manager.model.SysUser;
import lombok.Data;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.util.StringUtils;

import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;
/**
 * 继承了实体类SysUser之后又实现了UserDetails接口
 * 用来匹配权限和用户之间的关系，通过权限表的信息来让spring security来实现权限功能
 * */
@Data
public class LoginUser extends SysUser implements UserDetails {
    private List<SysPermission> permissions;
    @Override
    @JsonIgnore
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return permissions.parallelStream()
                .filter(p->!StringUtils.isEmpty(p.getPermission()))
                .map(p->new SimpleGrantedAuthority(p.getPermission()))
                .collect(Collectors.toSet());
    }

    
    @Override
    @JsonIgnore
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    @JsonIgnore
    public boolean isAccountNonLocked() {
        return getStatus()!=Status.LOCKED;
    }

    @Override
    @JsonIgnore
    public boolean isCredentialsNonExpired() {
        return true;
    }
    //之前没设置成true，一直处于未激活状态，所以导致无论如何的登录不进去，所以一定要记得激活！！
    @Override
    @JsonIgnore
    public boolean isEnabled() {
        return true;
    }
}
