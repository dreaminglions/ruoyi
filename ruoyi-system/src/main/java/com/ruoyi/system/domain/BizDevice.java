package com.ruoyi.system.domain;

import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.annotation.Excel.Type;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.core.domain.BaseEntity;
import java.util.Date;

/**
 * 设备表 biz_device
 * 
 * @author ruoyi
 * @date 2019-12-02
 */
public class BizDevice extends BaseEntity
{
	private static final long serialVersionUID = 1L;
	
	/** 设备ID */
	private Long deviceId;
	/** 设备编号 */
	@Excel(name = "设备编号")
	private String deviceNo;
	/** 设备名称 */
	@Excel(name = "设备名称")
	private String deviceName;
	/** 设备SN */
	@Excel(name = "设备SN")
	private String deviceSn;
	/** 设备型号 */
	@Excel(name = "设备型号")
	private String deviceModel;
	/** 设备厂家 */
	@Excel(name = "设备厂家")
	private String deviceMaker;
	/** 所属水厂 */
	private Long deviceWorks;
	/** 维护人员 */
	@Excel(name = "维护人员")
	private String deviceMaintainer;
	/** 维护人员电话 */
	@Excel(name = "维护人员电话")
	private String deviceTel;
	/** 设备类型 */
	private String deviceType;
	/** 设备状态（0：使用；1：停用） */
	private String deviceStatus;
	/** 化验状态（0：在线；1：离线；2：化验中） */
	private String assayStatus;
	/** 维护时间 */
	private String repairTime;
	/** 维护人 */
	private String repairBy;
	/** 化验最后在线时间 */
	private String assayTime;

	@Excel(name = "所属水厂", targetAttr = "worksName", type = Type.EXPORT)
	private BizWaterWork works;

	public void setDeviceId(Long deviceId) 
	{
		this.deviceId = deviceId;
	}

	public Long getDeviceId() 
	{
		return deviceId;
	}
	public void setDeviceNo(String deviceNo) 
	{
		this.deviceNo = deviceNo;
	}

	public String getDeviceNo() 
	{
		return deviceNo;
	}
	public void setDeviceName(String deviceName) 
	{
		this.deviceName = deviceName;
	}

	public String getDeviceName() 
	{
		return deviceName;
	}
	public void setDeviceSn(String deviceSn) 
	{
		this.deviceSn = deviceSn;
	}

	public String getDeviceSn() 
	{
		return deviceSn;
	}
	public void setDeviceModel(String deviceModel) 
	{
		this.deviceModel = deviceModel;
	}

	public String getDeviceModel() 
	{
		return deviceModel;
	}
	public void setDeviceMaker(String deviceMaker) 
	{
		this.deviceMaker = deviceMaker;
	}

	public String getDeviceMaker() 
	{
		return deviceMaker;
	}
	public void setDeviceWorks(Long deviceWorks) 
	{
		this.deviceWorks = deviceWorks;
	}

	public Long getDeviceWorks() 
	{
		return deviceWorks;
	}
	public void setDeviceMaintainer(String deviceMaintainer) 
	{
		this.deviceMaintainer = deviceMaintainer;
	}

	public String getDeviceMaintainer() 
	{
		return deviceMaintainer;
	}
	public void setDeviceTel(String deviceTel) 
	{
		this.deviceTel = deviceTel;
	}

	public String getDeviceTel() 
	{
		return deviceTel;
	}
	public void setDeviceType(String deviceType) 
	{
		this.deviceType = deviceType;
	}

	public String getDeviceType() 
	{
		return deviceType;
	}
	public void setDeviceStatus(String deviceStatus) 
	{
		this.deviceStatus = deviceStatus;
	}

	public String getDeviceStatus() 
	{
		return deviceStatus;
	}

	public String getAssayStatus() {
		return assayStatus;
	}

	public void setAssayStatus(String assayStatus) {
		this.assayStatus = assayStatus;
	}

	public void setRepairTime(String repairTime)
	{
		this.repairTime = repairTime;
	}

	public String getRepairTime()
	{
		return repairTime;
	}
	public void setRepairBy(String repairBy) 
	{
		this.repairBy = repairBy;
	}

	public String getRepairBy() 
	{
		return repairBy;
	}

	public BizWaterWork getWorks() {
		return works;
	}

	public void setWorks(BizWaterWork works) {
		this.works = works;
	}

	public String getAssayTime() {
		return assayTime;
	}

	public void setAssayTime(String assayTime) {
		this.assayTime = assayTime;
	}

	public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("deviceId", getDeviceId())
            .append("deviceNo", getDeviceNo())
            .append("deviceName", getDeviceName())
            .append("deviceSn", getDeviceSn())
            .append("deviceModel", getDeviceModel())
            .append("deviceMaker", getDeviceMaker())
            .append("deviceWorks", getDeviceWorks())
            .append("deviceMaintainer", getDeviceMaintainer())
            .append("deviceTel", getDeviceTel())
            .append("deviceType", getDeviceType())
            .append("deviceStatus", getDeviceStatus())
			.append("assayStatus", getAssayStatus())
            .append("repairTime", getRepairTime())
			.append("assayTime", getAssayTime())
            .append("repairBy", getRepairBy())
            .append("createTime", getCreateTime())
            .append("createBy", getCreateBy())
            .append("updateTime", getUpdateTime())
            .append("updateBy", getUpdateBy())
			.append("works", getWorks())
            .toString();
    }
}
