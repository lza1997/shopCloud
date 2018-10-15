package com.lza.shopadmin.entity;
import java.util.Date;

import lombok.Data;
import lombok.ToString;
@Data
@ToString
public class DocEntity extends BaseEntity implements java.io.Serializable {
    private static final long serialVersionUID = 6918827258223648580L;
    /** id */
    private Integer id;
    /** name */
    private String name;
    /** 标签 */
    private String tag;
    /** 标签试一试demo */
    private String tagDemo;
    /**api地址**/
    private String apiAddress;
    /** 返回示例 */
    private String returnExampleValue;
    private Integer pid;
    private Integer typeid;
    /** 排序 */
    private Integer sort;
    /** 描述 */
    private String description;
    /** 状态 */
    private Integer status;
    /** 添加人 */
    private String createdby;
    /** 修改次数 */
    private Integer updatecount;
    /** 修改人 */
    private String updateby;
}