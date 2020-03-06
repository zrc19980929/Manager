package com.manager.manager.config;

import com.manager.manager.service.impl.CustomUserEntityManagerFactory;
import org.activiti.engine.impl.interceptor.SessionFactory;
import org.activiti.spring.SpringProcessEngineConfiguration;
import org.activiti.spring.boot.ProcessEngineConfigurationConfigurer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;

import java.util.ArrayList;
import java.util.List;

@Configuration
public class ActivitiConfiguration  implements ProcessEngineConfigurationConfigurer {
    @Autowired
    private CustomUserEntityManagerFactory customUserEntityManagerFactory;
    @Override
    public void configure(SpringProcessEngineConfiguration springProcessEngineConfiguration) {
        List<SessionFactory> customSessionFactories = new ArrayList<>();
        customSessionFactories.add(customUserEntityManagerFactory);
        springProcessEngineConfiguration.setCustomSessionFactories(customSessionFactories);

    }
}
