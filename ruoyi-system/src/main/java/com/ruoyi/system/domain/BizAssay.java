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
	/** 版本名称 */
	private String version;
	/** 步进名称 */
	private String stepName;
	/** 总步进 */
	private String stepTotal;
	/** 当前步进 */
	private String stepNow;
	/** 步进信息1 */
	private String stepInfo1;
	/** 步进信息2 */
	private String stepInfo2;
	/** 步进信息3 */
	private String stepInfo3;

	private String assayStatus;

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

	public String getVersion() {
		return version;
	}

	public void setVersion(String version) {
		this.version = version;
	}

	public String getStepName() {
		return stepName;
	}

	public void setStepName(String stepName) {
		this.stepName = stepName;
	}

	public String getStepTotal() {
		return stepTotal;
	}

	public void setStepTotal(String stepTotal) {
		this.stepTotal = stepTotal;
	}

	public String getStepNow() {
		return stepNow;
	}

	public void setStepNow(String stepNow) {
		this.stepNow = stepNow;
	}

	public String getStepInfo1() {
		return stepInfo1;
	}

	public void setStepInfo1(String stepInfo1) {
		this.stepInfo1 = stepInfo1;
	}

	public String getStepInfo2() {
		return stepInfo2;
	}

	public void setStepInfo2(String stepInfo2) {
		this.stepInfo2 = stepInfo2;
	}

	public String getStepInfo3() {
		return stepInfo3;
	}

	public void setStepInfo3(String stepInfo3) {
		this.stepInfo3 = stepInfo3;
	}

	public String getAssayStatus() {
		return assayStatus;
	}

	public void setAssayStatus(String assayStatus) {
		this.assayStatus = assayStatus;
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
