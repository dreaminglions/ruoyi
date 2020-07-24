package com.ruoyi.system.domain;

import com.ruoyi.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 化验结果表 z_assay
 * 
 * @author ruoyi
 * @date 2019-12-14
 */
public class BizAssay extends BaseEntity
{
	private static final long serialVersionUID = 1L;
	
	/** 化验结果ID */
	private Long assayId;
	/** 化验结果唯一编号 */
	private String assayNo;
	/** 化验设备 */
	private String deviceNo;
	/** 化验类型 */
	private String assayType;
	/** 化验日期 */
	private String assayDate;
	/** 化验开始时间 */
	private String beginTime;
	/** 化验结束时间 */
	private String endTime;
	/** 化验大流程 */
	private String assayBigprocess;
	/** 化验小流程 */
	private String assaySmallprocess;
	/** 化验人员 */
	private String assayBy;

	private BizDevice device;

	public Long getAssayId() {
		return assayId;
	}

	public void setAssayId(Long assayId) {
		this.assayId = assayId;
	}

	public String getAssayNo() {
		return assayNo;
	}

	public void setAssayNo(String assayNo) {
		this.assayNo = assayNo;
	}

	public String getDeviceNo() {
		return deviceNo;
	}

	public void setDeviceNo(String deviceNo) {
		this.deviceNo = deviceNo;
	}

	public String getAssayType() {
		return assayType;
	}

	public void setAssayType(String assayType) {
		this.assayType = assayType;
	}

	public String getAssayDate() {
		return assayDate;
	}

	public void setAssayDate(String assayDate) {
		this.assayDate = assayDate;
	}

	public String getBeginTime() {
		return beginTime;
	}

	public void setBeginTime(String beginTime) {
		this.beginTime = beginTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public String getAssayBigprocess() {
		return assayBigprocess;
	}

	public void setAssayBigprocess(String assayBigprocess) {
		this.assayBigprocess = assayBigprocess;
	}

	public String getAssaySmallprocess() {
		return assaySmallprocess;
	}

	public void setAssaySmallprocess(String assaySmallprocess) {
		this.assaySmallprocess = assaySmallprocess;
	}

	public String getAssayBy() {
		return assayBy;
	}

	public void setAssayBy(String assayBy) {
		this.assayBy = assayBy;
	}

	public BizDevice getDevice() {
		return device;
	}

	public void setDevice(BizDevice device) {
		this.device = device;
	}

	public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("assayId", getAssayId())
            .append("assayNo", getAssayNo())
            .append("deviceNo", getDeviceNo())
            .append("assayType", getAssayType())
            .append("assayDate", getAssayDate())
            .append("beginTime", getBeginTime())
            .append("endTime", getEndTime())
			.append("assayBigprocess", getAssayBigprocess())
			.append("assaySmallprocess", getAssaySmallprocess())
			.append("assayBy", getAssayBy())
            .append("createTime", getCreateTime())
            .append("createBy", getCreateBy())
            .append("updateTime", getUpdateTime())
            .append("updateBy", getUpdateBy())
            .toString();
    }
}
