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
public class BizAgentiaMake extends BaseEntity
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
	/** 接收设备 */
	private Long receiveDevice;
	/** 记录状态（0：正常配制；1：接收配制；2:拒绝配制；3：取消配制） */
	private String recordStatus;
	/** 药剂发送量 */
	private Float sendTotal;
	/** 药剂记录日期 */
	private String recordDate;
	/** 配置后药剂编号 */
	private String recAgentiaNo;
	/** 配置后药剂名称 */
	private String recAgentiaName;



	private BizAgentia bizAgentia;

	private BizWaterWork sendWork;
	private BizDevice recDevice;

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

	public String getRecAgentiaNo() {
		return recAgentiaNo;
	}

	public void setRecAgentiaNo(String recAgentiaNo) {
		this.recAgentiaNo = recAgentiaNo;
	}

	public String getRecAgentiaName() {
		return recAgentiaName;
	}

	public void setRecAgentiaName(String recAgentiaName) {
		this.recAgentiaName = recAgentiaName;
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


	public Long getReceiveDevice() {
		return receiveDevice;
	}

	public void setReceiveDevice(Long receiveDevice) {
		this.receiveDevice = receiveDevice;
	}

	public BizDevice getRecDevice() {
		return recDevice;
	}

	public void setRecDevice(BizDevice recDevice) {
		this.recDevice = recDevice;
	}

	public BizWaterWork getSendWork() {
		return sendWork;
	}

	public void setSendWork(BizWaterWork sendWork) {
		this.sendWork = sendWork;
	}


	public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("recordId", getRecordId())
            .append("recordNo", getRecordNo())
            .append("recordName", getRecordName())
            .append("agentiaId", getAgentiaId())
			.append("RecAgentiaNo", getRecAgentiaNo())
			.append("RecAgentiaName", getRecAgentiaName())
			.append("sendWorks", getSendWorks())
			.append("ReceiveDevice", getReceiveDevice())
            .append("recordStatus", getRecordStatus())
            .append("sendTotal", getSendTotal())
            .append("recordDate", getRecordDate())
            .append("createTime", getCreateTime())
            .append("createBy", getCreateBy())
            .append("updateTime", getUpdateTime())
            .append("updateBy", getUpdateBy())
            .toString();
    }
}
