package com.ruoyi.system.domain;

import com.ruoyi.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 化验故障表 z_assay_fault
 * 
 * @author ruoyi
 * @date 2019-12-14
 */
public class AssayFault extends BaseEntity
{
	private static final long serialVersionUID = 1L;
	
	/** 故障id */
	private Long faultId;
	/** 化验结果唯一编号 */
	private String assayNo;
	/** 故障设备编号 */
	private String deviceNo;
	/** 故障时间 */
	private String faultTime;
	/** 故障代码 */
	private String faultCode;
	/** 化验大流程 */
	private String assayBigprocess;
	/** 化验小流程 */
	private String assaySmallprocess;
	/** 试管信息 */
	private String testTubeInfo;

	private BizDevice device;

	private AssayFaultInfo faultInfo;

	public Long getFaultId() {
		return faultId;
	}

	public void setFaultId(Long faultId) {
		this.faultId = faultId;
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

	public String getFaultTime() {
		return faultTime;
	}

	public void setFaultTime(String faultTime) {
		this.faultTime = faultTime;
	}

	public String getFaultCode() {
		return faultCode;
	}

	public void setFaultCode(String faultCode) {
		this.faultCode = faultCode;
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

	public String getTestTubeInfo() {
		return testTubeInfo;
	}

	public void setTestTubeInfo(String testTubeInfo) {
		this.testTubeInfo = testTubeInfo;
	}

	public BizDevice getDevice() {
		return device;
	}

	public void setDevice(BizDevice device) {
		this.device = device;
	}

	public AssayFaultInfo getFaultInfo() {
		return faultInfo;
	}

	public void setFaultInfo(AssayFaultInfo faultInfo) {
		this.faultInfo = faultInfo;
	}

	public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("faultId", getFaultId())
            .append("assayNo", getAssayNo())
            .append("deviceNo", getDeviceNo())
            .append("faultTime", getFaultTime())
            .append("faultCode", getFaultCode())
            .append("assayBigprocess", getAssayBigprocess())
            .append("assaySmallprocess", getAssaySmallprocess())
			.append("testTubeInfo", getTestTubeInfo())
            .append("createTime", getCreateTime())
            .append("createBy", getCreateBy())
            .append("updateTime", getUpdateTime())
            .append("updateBy", getUpdateBy())
            .toString();
    }
}
