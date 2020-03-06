package com.manager.manager.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.Date;
@Data
public class SysProcess {
    private Integer  id;
    private String title;
    private String content;
    private Integer userId;
    private String username;
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date createTime =new Date();;
    private Integer flage;
}
