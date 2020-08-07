package com.ruoyi.system.domain;

/**
 * 药剂下发
 * */
public class BizAgeniaDistribute {
    private static final long serialVersionUID = 1L;

    /** 下发ID */
    private Long distributeId;
    /** 下发编号 */
    private String distributeNo;
    /** 下发详情Id*/
    private Long distributeDetailId;
    /** 下发名称*/
    private String distributeName;
    /** 下发起始 */
    private String distributeFrom;
    /** 下发终点*/
    private String distributeTo;
    /** 下发时间*/
    private String distributeTime;
    /** 下发状态*/
    private int distributeStatus;
    /** 接收确认时间*/
    private String confirmTime;

}
