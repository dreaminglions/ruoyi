package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 化验药剂记录表 biz_agentia_record
 * 
 * @author ruoyi
 * @date 2020-03-10
 */
public class BizAgentiaRecord extends BaseEntity
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
	/** 所属设备 */
	private Long recordDevice;
	/** 化验水厂 */
	private Long recordWorks;
	/** 记录类型 */
	private String recordType;
	/** 记录状态（0：正常；1：无效） */
	private String recordStatus;
	/** 化验唯一ID */
	private String assayId ;
	/** 记录前药剂累计使用量 */
	private Float beforeTotal;
	/** 记录前药剂剩余量 */
	private Float beforeRemain;
	/** 记录后药剂累计使用量 */
	private Float afterTotal;
	/** 记录后药剂剩余量 */
	private Float afterRemain;
	/** 药剂变化量 */
	private Float agentiaChange;
	/** 药剂记录日期 */
	private String recordDate;

	private BizAgentia bizAgentia;

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

	public Long getAgentiaId() 
	{
		return agentiaId;
	}
	public void setRecordType(String recordType) 
	{
		this.recordType = recordType;
	}

	public String getRecordType() 
	{
		return recordType;
	}
	public void setRecordStatus(String recordStatus) 
	{
		this.recordStatus = recordStatus;
	}

	public String getRecordStatus() 
	{
		return recordStatus;
	}
	public void setBeforeTotal(Float beforeTotal) 
	{
		this.beforeTotal = beforeTotal;
	}

	public Float getBeforeTotal() 
	{
		return beforeTotal;
	}
	public void setBeforeRemain(Float beforeRemain) 
	{
		this.beforeRemain = beforeRemain;
	}

	public Float getBeforeRemain() 
	{
		return beforeRemain;
	}
	public void setAfterTotal(Float afterTotal) 
	{
		this.afterTotal = afterTotal;
	}

	public Float getAfterTotal() 
	{
		return afterTotal;
	}
	public void setAfterRemain(Float afterRemain) 
	{
		this.afterRemain = afterRemain;
	}

	public Float getAfterRemain() 
	{
		return afterRemain;
	}
	public void setAgentiaChange(Float agentiaChange) 
	{
		this.agentiaChange = agentiaChange;
	}

	public Float getAgentiaChange() 
	{
		return agentiaChange;
	}
	public void setRecordDate(String recordDate) 
	{
		this.recordDate = recordDate;
	}

	public String getRecordDate() 
	{
		return recordDate;
	}

	public String getAssayId() {
		return assayId;
	}

	public void setAssayId(String assayId) {
		this.assayId = assayId;
	}

	public BizAgentia getBizAgentia() {
		return bizAgentia;
	}

	public void setBizAgentia(BizAgentia bizAgentia) {
		this.bizAgentia = bizAgentia;
	}

	public Long getRecordDevice() {
		return recordDevice;
	}

	public void setRecordDevice(Long recordDevice) {
		this.recordDevice = recordDevice;
	}

	public Long getRecordWorks() {
		return recordWorks;
	}

	public void setRecordWorks(Long recordWorks) {
		this.recordWorks = recordWorks;
	}

	public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("recordId", getRecordId())
            .append("recordNo", getRecordNo())
            .append("recordName", getRecordName())
            .append("agentiaId", getAgentiaId())
			.append("recordDevice", getRecordDevice())
			.append("recordWorks", getRecordWorks())
            .append("recordType", getRecordType())
            .append("recordStatus", getRecordStatus())
			.append("assayId", getAssayId())
            .append("beforeTotal", getBeforeTotal())
            .append("beforeRemain", getBeforeRemain())
            .append("afterTotal", getAfterTotal())
            .append("afterRemain", getAfterRemain())
            .append("agentiaChange", getAgentiaChange())
            .append("recordDate", getRecordDate())
            .append("createTime", getCreateTime())
            .append("createBy", getCreateBy())
            .append("updateTime", getUpdateTime())
            .append("updateBy", getUpdateBy())
            .toString();
    }
}
