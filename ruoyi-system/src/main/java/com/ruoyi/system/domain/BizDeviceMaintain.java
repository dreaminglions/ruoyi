package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 设备维护表 biz_device_maintain
 * 
 * @author ruoyi
 * @date 2019-12-16
 */
public class BizDeviceMaintain extends BaseEntity
{
	private static final long serialVersionUID = 1L;
	
	/** 设备维护id */
	private Long maintainId;
	/** 维护设备 */
	private Long maintainDevice;
	/** 所在水厂 */
	private Long maintainWorks;
	/** 所在城市 */
	private String maintainCity;
	/** 维护类型*/
	private String maintainType;
	/** 维护原因 */
	private String maintainReason;
	/** 维护结果 */
	private String maintainResult;
	/** 维护日期 */
	private String maintainDate;
	/** 负责人 */
	private String maintainUser;
	/** 联系电话 */
	private String maintainTel;


	private BizDevice device;

	private BizWaterWork works;

	public void setMaintainId(Long maintainId) 
	{
		this.maintainId = maintainId;
	}

	public Long getMaintainId() 
	{
		return maintainId;
	}
	public void setMaintainDevice(Long maintainDevice) 
	{
		this.maintainDevice = maintainDevice;
	}

	public Long getMaintainDevice() 
	{
		return maintainDevice;
	}
	public void setMaintainWorks(Long maintainWorks) 
	{
		this.maintainWorks = maintainWorks;
	}

	public Long getMaintainWorks() 
	{
		return maintainWorks;
	}
	public void setMaintainCity(String maintainCity) 
	{
		this.maintainCity = maintainCity;
	}

	public String getMaintainCity() 
	{
		return maintainCity;
	}
	public void setMaintainReason(String maintainReason) 
	{
		this.maintainReason = maintainReason;
	}

	public String getMaintainReason() 
	{
		return maintainReason;
	}
	public void setMaintainResult(String maintainResult) 
	{
		this.maintainResult = maintainResult;
	}

	public String getMaintainResult() 
	{
		return maintainResult;
	}
	public void setMaintainDate(String maintainDate) 
	{
		this.maintainDate = maintainDate;
	}

	public String getMaintainDate() 
	{
		return maintainDate;
	}
	public void setMaintainUser(String maintainUser) 
	{
		this.maintainUser = maintainUser;
	}

	public String getMaintainUser() 
	{
		return maintainUser;
	}
	public void setMaintainTel(String maintainTel) 
	{
		this.maintainTel = maintainTel;
	}

	public String getMaintainTel() 
	{
		return maintainTel;
	}


	public BizDevice getDevice() {
		return device;
	}

	public void setDevice(BizDevice device) {
		this.device = device;
	}

	public BizWaterWork getWorks() {
		return works;
	}

	public void setWorks(BizWaterWork works) {
		this.works = works;
	}

	public String getMaintainType() {
		return maintainType;
	}

	public void setMaintainType(String maintainType) {
		this.maintainType = maintainType;
	}

	public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("maintainId", getMaintainId())
            .append("maintainDevice", getMaintainDevice())
            .append("maintainWorks", getMaintainWorks())
            .append("maintainCity", getMaintainCity())
			.append("maintainType", getMaintainType())
            .append("maintainReason", getMaintainReason())
            .append("maintainResult", getMaintainResult())
            .append("maintainDate", getMaintainDate())
            .append("maintainUser", getMaintainUser())
            .append("maintainTel", getMaintainTel())
            .append("createTime", getCreateTime())
            .append("createBy", getCreateBy())
            .append("updateTime", getUpdateTime())
            .append("updateBy", getUpdateBy())
            .toString();
    }
}
