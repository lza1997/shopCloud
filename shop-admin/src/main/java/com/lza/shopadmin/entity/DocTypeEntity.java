package com.lza.shopadmin.entity;

import java.util.Date;

import lombok.Data;
import lombok.ToString;


/**
 * @Title: Entity
 * @Description: 文档分类
 * @author
 * @date lza 2018年9月22日 10:52:19
 * @version V1.0
 *
 */
@Data
@ToString
public class DocTypeEntity implements java.io.Serializable {
    private static final long serialVersionUID = 165211643074841225L;
    /**id*/
    private Integer id;
    /**文档分类名称*/
    private String name;
    /**排序*/
    private Integer sort;
    /**描述*/
    private String description;
    /**状态*/
    private Integer status;
    /**添加时间*/
    private Date createdtime;
    /**添加人*/
    private String createdby;
    /**修改次数*/
    private Integer updatecount;
    /**修改时间*/
    private Date updatetime;
    /**修改人*/
    private String updateby;

}
