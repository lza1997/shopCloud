package com.lza.shopadmin.entity;

import java.util.Date;

import lombok.Data;
import lombok.ToString;


/**
 * @Title: Entity
 * @Description: 返回结果
 * @author
 * @date lza 2018年4月22日 10:52:19
 * @version V1.0
 *
 */
@Data
@ToString
public class DocReturnValueEntity extends BaseEntity implements java.io.Serializable {
    private static final long serialVersionUID = -5733189978795744422L;
    /**链接id*/
    private Integer id;
    /**文档id*/
    private Integer docid;
    /**名称*/
    private String name;
    /**类型*/
    private String type;
    /**实体编码*/
    private String code;
    /**是否必须*/
    private Integer isrequired;
    /**默认值*/
    private String defaultValue;
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

    private String typename;

    private String requiredvalue;

    private Integer docEntityId;



}
