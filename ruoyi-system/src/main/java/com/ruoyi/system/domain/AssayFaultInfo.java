package com.ruoyi.system.domain;

import com.ruoyi.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 故障信息表 biz_fault_info
 * 
 * @author ruoyi
 * @date 2019-12-14
 */
public class AssayFaultInfo extends BaseEntity
{
	private static final long serialVersionUID = 1L;

	private Long infoId;
	/** 故障code */
	private String faultCode;
	/** 故障信息 */
	private String faultInfo;
	/** 故障解决办法 */
	private String faultSolution;

	public Long getInfoId() {
		return infoId;
	}

	public void setInfoId(Long infoId) {
		this.infoId = infoId;
	}

	public String getFaultCode() {
		return faultCode;
	}

	public void setFaultCode(String faultCode) {
		this.faultCode = faultCode;
	}

	public String getFaultInfo() {
		return faultInfo;
	}

	public void setFaultInfo(String faultInfo) {
		this.faultInfo = faultInfo;
	}

	public String getFaultSolution() {
		return faultSolution;
	}

	public void setFaultSolution(String faultSolution) {
		this.faultSolution = faultSolution;
	}

	public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("infoId", getInfoId())
            .append("faultCode", getFaultCode())
            .append("faultInfo", getFaultInfo())
            .append("faultSolution", getFaultSolution())
            .append("createTime", getCreateTime())
            .append("createBy", getCreateBy())
            .append("updateTime", getUpdateTime())
            .append("updateBy", getUpdateBy())
            .toString();
    }
}
