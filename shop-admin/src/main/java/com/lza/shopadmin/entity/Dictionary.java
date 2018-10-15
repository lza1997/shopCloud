package com.lza.shopadmin.entity;
import java.io.Serializable;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class Dictionary implements Serializable{

    private static final long serialVersionUID = -8426339414555997935L;

    /**
     * 字典id
     */
    private Integer dictionaryId;
    /**
     * 字典组id
     */
    private Integer groupId;
    /**
     * 字典编码
     */
    private String dictionaryCode;
    /**
     * 字典名称
     */
    private String dictionaryName;

    /**
     * 字典值
     */
    private String dictionaryValue;
}