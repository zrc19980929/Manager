package com.manager.manager.service.impl;

import com.manager.manager.base.result.Results;
import com.manager.manager.dto.LoginUser;
import com.manager.manager.dto.UserDto;
import com.manager.manager.mapper.ProcessMapper;
import com.manager.manager.mapper.UserMapper;
import com.manager.manager.model.SysProcess;
import com.manager.manager.model.SysUser;
import com.manager.manager.service.ProcessService;
import lombok.extern.slf4j.Slf4j;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
@Slf4j
public class ProcessServiceImpl implements ProcessService {
    @Autowired
    ProcessMapper processMapper;

    @Autowired
    UserMapper userMapper;

    @Autowired
    RuntimeService runtimeService;
    @Autowired
    TaskService taskService;

    @Override
    public Results<SysProcess> getAllUserByPage(Integer offset, Integer limit) {

        return Results.success(processMapper.countAllUser().intValue(),processMapper.getAllUserByPage(offset,limit));
    }
   /* @Override
    public Results insertProcess(UserDto userDto, SysProcess process) {
        processMapper.insertProcess(process);
        return null;
    }*/
    @Override
    public void addAndStartProcess(SysProcess process) {
        processMapper.insertProcess(process);
        Map<String, Object> map=new HashMap<>();
        map.put("soruceUserId",process.getUserId());
        String adminUserId="1";
        map.put("adminUserId",adminUserId);
        runtimeService.startProcessInstanceByKey("myProcess_1",map);
        log.info("启动成功");

    }
}
