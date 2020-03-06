package com.manager.manager.controller.api;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("${api-url}")
public class ApiController {
    @RequestMapping("/getPage")//通过这个链接传进来一个pageName的html文件的文件名，来加载文件内容
    public ModelAndView getPage(ModelAndView modelAndView,String pageName){
        modelAndView.setViewName(pageName);
        return  modelAndView;
    }
}
