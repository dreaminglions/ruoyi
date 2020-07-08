package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.core.domain.BaseEntity;
import java.util.Date;

/**
 * 废液表 biz_waste
 * 
 * @author ruoyi
 * @date 2020-03-03
 */
public class BizWaste extends BaseEntity
{
	private static final long serialVersionUID = 1L;
	
	/** 废液ID */
	private Long wasteId;
	/** 废液编号 */
	private String wasteNo;
	/** 废液名称 */
	private String wasteName;
	/** 废液类型 */
	private String wasteType;
	/** 产生设备 */
	private Long wasteDevice;
	/** 所属水厂 */
	private Long wasteWorks;
	/** 化验唯一ID */
	private String assayId ;
	/** 废液状态（0：有效；1：无效） */
	private String wasteStatus;
	/** 废液总量 */
	private Float wasteTotal;
	/** 处理时间 */
	private String repairTime;
	/** 维护人 */
	private String repairBy;

	private BizDevice device;

	private BizWaterWork works;

	public void setWasteId(Long wasteId) 
	{
		this.wasteId = wasteId;
	}

	public Long getWasteId() 
	{
		return wasteId;
	}
	public void setWasteNo(String wasteNo) 
	{
		this.wasteNo = wasteNo;
	}

	public String getWasteNo() 
	{
		return wasteNo;
	}
	public void setWasteName(String wasteName) 
	{
		this.wasteName = wasteName;
	}

	public String getWasteName() 
	{
		return wasteName;
	}
	public void setWasteType(String wasteType) 
	{
		this.wasteType = wasteType;
	}

	public String getWasteType() 
	{
		return wasteType;
	}
	public void setWasteDevice(Long wasteDevice) 
	{
		this.wasteDevice = wasteDevice;
	}

	public Long getWasteDevice() 
	{
		return wasteDevice;
	}
	public void setWasteWorks(Long wasteWorks) 
	{
		this.wasteWorks = wasteWorks;
	}

	public Long getWasteWorks() 
	{
		return wasteWorks;
	}
	public void setWasteStatus(String wasteStatus) 
	{
		this.wasteStatus = wasteStatus;
	}

	public String getWasteStatus() 
	{
		return wasteStatus;
	}
	public void setWasteTotal(Float wasteTotal) 
	{
		this.wasteTotal = wasteTotal;
	}

	public Float getWasteTotal() 
	{
		return wasteTotal;
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

	public String getAssayId() {
		return assayId;
	}

	public void setAssayId(String assayId) {
		this.assayId = assayId;
	}


	public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("wasteId", getWasteId())
            .append("wasteNo", getWasteNo())
            .append("wasteName", getWasteName())
            .append("wasteType", getWasteType())
            .append("wasteDevice", getWasteDevice())
            .append("wasteWorks", getWasteWorks())
			.append("assayId", getAssayId())
            .append("wasteStatus", getWasteStatus())
            .append("wasteTotal", getWasteTotal())
            .append("repairTime", getRepairTime())
            .append("repairBy", getRepairBy())
            .append("createTime", getCreateTime())
            .append("createBy", getCreateBy())
            .append("updateTime", getUpdateTime())
            .append("updateBy", getUpdateBy())
            .toString();
    }
}
