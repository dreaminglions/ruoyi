package com.ruoyi.system.domain;

import com.ruoyi.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 化验药剂记录表 biz_agentia_record
 * 
 * @author ruoyi
 * @date 2020-03-10
 */
public class BizAgentiaSend extends BaseEntity
{
	private static final long serialVersionUID = 1L;
	
	/** 记录ID */
	private Long recordId;
	/** 记录编号 */
	private String recordNo;
	/** 记录名称 */
	private String recordName;
	/** 所属药剂 */
	private Long agentiaId;
	/** 发送水厂 */
	private Long sendWorks;
	/** 接收水厂 */
	private Long receiveWorks;
	/** 记录状态（0：正常下发；1：接收成功；2:拒绝接收） */
	private String recordStatus;
	/** 记录状态（1：平台下发；2：集团下发） */
	private String sendType;
	/** 药剂发送量 */
	private Float sendTotal;
	/** 药剂记录日期 */
	private String recordDate;

	private BizAgentia bizAgentia;

	private BizWaterWork sendWork;
	private BizWaterWork receiveWork;

	public void setRecordId(Long recordId) 
	{
		this.recordId = recordId;
	}

	public Long getRecordId() 
	{
		return recordId;
	}
	public void setRecordNo(String recordNo) 
	{
		this.recordNo = recordNo;
	}

	public String getRecordNo() 
	{
		return recordNo;
	}
	public void setRecordName(String recordName) 
	{
		this.recordName = recordName;
	}

	public String getRecordName() 
	{
		return recordName;
	}
	public void setAgentiaId(Long agentiaId) 
	{
		this.agentiaId = agentiaId;
	}

	public Long getAgentiaId() {
		return agentiaId;
	}

	public Long getSendWorks() {
		return sendWorks;
	}

	public void setSendWorks(Long sendWorks) {
		this.sendWorks = sendWorks;
	}

	public Long getReceiveWorks() {
		return receiveWorks;
	}

	public void setReceiveWorks(Long receiveWorks) {
		this.receiveWorks = receiveWorks;
	}

	public String getRecordStatus() {
		return recordStatus;
	}

	public void setRecordStatus(String recordStatus) {
		this.recordStatus = recordStatus;
	}

	public Float getSendTotal() {
		return sendTotal;
	}

	public void setSendTotal(Float sendTotal) {
		this.sendTotal = sendTotal;
	}

	public String getRecordDate() {
		return recordDate;
	}

	public void setRecordDate(String recordDate) {
		this.recordDate = recordDate;
	}

	public BizAgentia getBizAgentia() {
		return bizAgentia;
	}

	public void setBizAgentia(BizAgentia bizAgentia) {
		this.bizAgentia = bizAgentia;
	}


	public BizWaterWork getReceiveWork() {
		return receiveWork;
	}

	public void setReceiveWork(BizWaterWork receiveWork) {
		this.receiveWork = receiveWork;
	}

	public BizWaterWork getSendWork() {
		return sendWork;
	}

	public void setSendWork(BizWaterWork sendWork) {
		this.sendWork = sendWork;
	}

	public String getSendType() {
		return sendType;
	}

	public void setSendType(String sendType) {
		this.sendType = sendType;
	}

	public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("recordId", getRecordId())
            .append("recordNo", getRecordNo())
            .append("recordName", getRecordName())
            .append("agentiaId", getAgentiaId())
			.append("sendWorks", getSendWorks())
			.append("ReceiveWorks", getReceiveWorks())
            .append("recordStatus", getRecordStatus())
			.append("sendType", getSendType())
            .append("sendTotal", getSendTotal())
            .append("recordDate", getRecordDate())
            .append("createTime", getCreateTime())
            .append("createBy", getCreateBy())
            .append("updateTime", getUpdateTime())
            .append("updateBy", getUpdateBy())
            .toString();
    }
}
