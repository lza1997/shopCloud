package com.lza.shopadmin.entity;

import lombok.Data;

@Data
public class DocEnRefEntity extends BaseEntity implements java.io.Serializable {
    private static final long serialVersionUID = 3742727878076387745L;
    /**id*/
    private Integer id;
    /**文档id*/
    private Integer docid;
    /**文档name**/
    private String docname;
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
    /**实体**/
    private DocEnEntity docen;

}