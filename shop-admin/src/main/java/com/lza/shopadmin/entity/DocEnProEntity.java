package com.lza.shopadmin.entity;

import lombok.Data;


/**
 * @Title: Entity
 * @Description: 文档引用实体属性表
 * @author
 * @date lza 2018年9月19日 10:52:19
 * @version V1.0
 *
 */
@Data
public class DocEnProEntity extends BaseEntity implements java.io.Serializable {
    private static final long serialVersionUID = 7955178932037388854L;
    /**id*/
    private Integer id;
    /**属性名称*/
    private String name;
    /**数据类型*/
    private String type;
    /**实体id*/
    private Integer entityid;
    /**排序*/
    private Integer sort;
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
