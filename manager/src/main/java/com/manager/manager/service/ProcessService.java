package com.manager.manager.service;

import com.manager.manager.base.result.Results;
import com.manager.manager.dto.UserDto;
import com.manager.manager.model.SysProcess;

public interface ProcessService {

    //Results insertProcess( SysProcess process);

    Results<SysProcess> getAllUserByPage(Integer offset, Integer limit);

    void addAndStartProcess(SysProcess process);
}
