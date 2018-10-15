package com.lza.shopadmin.entity;

import java.io.Serializable;
import java.sql.Timestamp;

import lombok.Data;
import lombok.ToString;

import com.fasterxml.jackson.annotation.JsonIgnore;
//import com.rt.core.common.DateUtils;
//import com.rt.core.common.JDBCConstants;

@Data
@ToString
public class BaseEntity  implements Serializable {

    /**
     * 创建时间-数据库字段
     */
    private Long createTime;
    /**
     * 修改时间-数据库字段
     */
    private Long updateTime;
    /**
     * 开始时间-数据库字段
     */
    private Long startTime;
    /**
     * 结束时间-数据库字段
     */
    private Long endTime;
    /**
     * 创建时间－页面字段
     */
    private Timestamp createTimeStr;
    /**
     * 修改时间－页面字段
     */
    private Timestamp updateTimeStr;
    /**
     * 开始时间－页面字段
     */
    private Timestamp startTimeStr;
    /**
     * 结束时间－页面字段
     */
    private Timestamp endTimeStr;
    /**
     * 0:未删除;1.已删除
     */
    private int isDel;

//    public void setCreateTime(Long createTime) {
//        this.createTime = createTime;
//        if (null != createTime) {
//            createTimeStr = DateUtils.getTimestampByLong(createTime);
//        }
//    }
//
//    public void setUpdateTime(Long updateTime) {
//        this.updateTime = updateTime;
//        if (null != updateTime) {
//            updateTimeStr = DateUtils.getTimestampByLong(updateTime);
//        }
//    }

//    public void setStartTime(Long startTime) {
//        this.startTime = startTime;
//        if (null != startTime) {
//            this.startTimeStr = DateUtils.getTimestampByLong(startTime);
//        }
//    }
//
//    public void setEndTime(Long endTime) {
//        this.endTime = endTime;
//        if (null != endTime) {
//            this.endTimeStr = DateUtils.getTimestampByLong(endTime);
//        }
//    }

//    /**
//     * 获取数据库名称
//     */
//    @JsonIgnore
//    public String getDbName() {
//        return JDBCConstants.JDBC_TYPE;
//    }

    /* 删除标记（0：正常；1：删除；2：审核；） */
    /**
     * 正常
     */
    public static final Integer DEL_FLAG_NORMAL = 0;
    /**
     * 删除
     */
    public static final Integer DEL_FLAG_DELETE = 1;
    /**
     * 审核
     */
    public static final Integer DEL_FLAG_AUDIT = 2;
}
