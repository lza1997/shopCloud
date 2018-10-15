package com.lza.entiry;

import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.Timestamp;

import lombok.Data;
import lombok.ToString;

/**
 * 项目名称：shop-entity
 * 类名称：Member
 * 类描述：会员实体类
 * 下午1:17:51 修改备注：
 *
 */
@Data
@ToString
public class Member  implements Serializable{

    /**
     *
     */
    private static final long serialVersionUID = 2906447779118672379L;
    private Integer memberId;
    private String memberName;//会员名称
    private String memberTruename;//真实姓名
    private String memberAvatar;//会员头像
    private Integer memberSex;//会员性别
    private Long memberBirthday;//会员生日
    private Timestamp memberBirthdaystr;//会员生日
    private String memberPasswd;//密码
    private String memberEmail;//邮箱
    private String memberQq;//QQ
    private String memberWw;//阿里旺旺
    private Integer memberLoginNum;//登录次数
    //private Long createtime;//会员注册时间
    private Long memberLoginTime;//当前登录时间
    private Long memberOldLoginTime;//上次登录时间
    private Timestamp memberOldLoginTimestr;
    private String memberLoginIp;//当前登录ip
    private String memberOldLoginIp;//当前登录ip
    private String memberOpenid;//qq互联id
    private String memberInfo;//qq账号相关信息

    private Integer memberRankPoints;//会员等级积分
    private Integer memberConsumePoints;//会员消费积分
    private BigDecimal availablePredeposit;//预存款可用金额
    private BigDecimal freezePredeposit;//预存款冻结金额
    private Integer informAllow;//是否允许举报(1可以/2不可以)
    private Integer isBuy;//会员是否有购买权限 1为开启 0为关闭
    private Integer isAllowtalk;//会员是否有咨询和发送站内信的权限 1为开启 0为关闭
    private Integer memberState;//会员的开启状态 1为开启 0为关闭
    private Integer memberCredit;//会员信用
    private Integer memberSnsvisitnum;//sns空间访问次数
    private Integer memberAreaid;//地区ID
    private Integer memberCityid;//城市ID
    private Integer memberProvinceid;//省份ID
    private String memberAreainfo;//地区内容
    private String memberPrivacy;//隐私设定
    private String signCode;// 登录类型：1、qq 2､sina 3、weixin
    private Integer signCodeState;
    private String orderString; // 排序
    private String status; // 状态查询

    private String count;//sql 返回的count 记录数

    private String yesCount;//昨天总数

    private String todayCount;//今天总数

    private String hour;//小时

    private String starttime;//开始日期

    private String endtime;//结束如期

    private String newPasswd;//
    private String memberMobile;//手机号

    private int noPayOrder;//未付款订单数量

    private int noReceiveOrder;//未确认收货数量

    private int noEvaluationOrder;//未评论订单数量

    private int noFilledOrder;//未发货订单数量

    /**
     * 收藏的商品的数量
     */
    private Integer favGoodsCount;
    /**
     * 收藏的店铺的数量
     */
    private Integer favStoreCount;

    private Integer memberGradeId;//会员等级

    private String memberType;//用户类型

}
