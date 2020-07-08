package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 药剂名称对照表 biz_agentia_contrast
 * 
 * @author ruoyi
 * @date 2020-04-22
 */
public class BizAgentiaContrast extends BaseEntity
{
	private static final long serialVersionUID = 1L;
	
	/** 药剂对照id */
	private Long contrastId;
	/** 设备id */
	private Long contrastDevice;
	/** 药剂id */
	private Long contrastAgentia;
	/** 对照药剂名称 */
	private String contrastName;

	private BizAgentia agentia;

	private BizDevice device;

	public void setContrastId(Long contrastId) 
	{
		this.contrastId = contrastId;
	}

	public Long getContrastId() 
	{
		return contrastId;
	}
	public void setContrastDevice(Long contrastDevice) 
	{
		this.contrastDevice = contrastDevice;
	}

	public Long getContrastDevice() 
	{
		return contrastDevice;
	}
	public void setContrastAgentia(Long contrastAgentia) 
	{
		this.contrastAgentia = contrastAgentia;
	}

	public Long getContrastAgentia() 
	{
		return contrastAgentia;
	}
	public void setContrastName(String contrastName) 
	{
		this.contrastName = contrastName;
	}

	public String getContrastName() 
	{
		return contrastName;
	}

	public BizAgentia getAgentia() {
		return agentia;
	}

	public void setAgentia(BizAgentia agentia) {
		this.agentia = agentia;
	}

	public BizDevice getDevice() {
		return device;
	}

	public void setDevice(BizDevice device) {
		this.device = device;
	}

	public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("contrastId", getContrastId())
            .append("contrastDevice", getContrastDevice())
            .append("contrastAgentia", getContrastAgentia())
            .append("contrastName", getContrastName())
            .append("createTime", getCreateTime())
            .append("createBy", getCreateBy())
            .append("updateTime", getUpdateTime())
            .append("updateBy", getUpdateBy())
            .toString();
    }
}
