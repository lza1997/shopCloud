package com.lza.shopadmin.entity;

import lombok.Data;


/**
 * @Title: Entity
 * @Description: 标签及api输入参数
 * @author lza
 * @date  2018年4月22日 10:52:19
 * @version V1.0
 *
 */
@Data
public class DocParamEntity extends BaseEntity implements java.io.Serializable {
    private static final long serialVersionUID = -3605373958564141496L;
    /**id*/
    private Integer id;
    /**文档id*/
    private Integer docid;
    /**名称*/
    private String name;
    /**类型*/
    private Integer type;
    /**是否必须*/
    private String isrequired;
    /**示例值*/
    private String exampleValue;
    /**默认值*/
    private String defalutValue;
    /**描述*/
    private String description;
    /**状态*/
    private Integer status;
    /**添加人*/
    private String createdby;
    /**修改次数*/
    private Integer updatecount;
    /**修改人*/
    private String updateby;

}

