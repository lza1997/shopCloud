package com.lza.shopadmin.entity;

import java.io.Serializable;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class DictionaryGroup implements Serializable{

    private static final long serialVersionUID = -8426339414555997935L;
    /**
     * 字典组id
     */
    private Integer groupId;
    /**
     * 字典组编码
     */
    private String groupCode;
    /**
     * 字典组名称
     */
    private String groupName;
}
