package com.ruoyi.system.domain;

/**
 * 药剂下发详情
 * */
public class BizDistributeDetail {
    private static final long serialVersionUID = 1L;
    /** 药剂详情Id*/
    private Long distributeDetailId;
    /** 药剂id*/
    private Long distributeAgentiaId;
    /** 药剂名称*/
    private String agentiaName;
    /** 药剂种类*/
    private String agentiaKind;
    /** 下发数量*/
    private String agentiaNum;
    /** 下发时间*/
    private String distributeTime;
    /** 下发药剂状态*/
    private String distributeStatus;

}
