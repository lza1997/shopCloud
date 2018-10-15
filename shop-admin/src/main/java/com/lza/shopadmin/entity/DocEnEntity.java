package com.lza.shopadmin.entity;

import lombok.Data;

/**
 * @Title: Entity
 * @Description: 文档引用实体表
 * @author
 * @date lza 2018年4月22日 10:52:19
 * @version V1.0
 *
 */
@Data
public class DocEnEntity extends BaseEntity implements java.io.Serializable {
    private static final long serialVersionUID = -3074095455072179193L;
    /**id*/
    private Integer id;
    /**实体名*/
    private String name;
    /**实体代码*/
    private String code;
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

