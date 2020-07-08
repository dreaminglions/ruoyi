package com.ruoyi.system.domain;

import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.annotation.Excel.Type;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.core.domain.BaseEntity;
import java.util.Date;

/**
 * 设备部件表 biz_device_unit
 * 
 * @author ruoyi
 * @date 2019-12-14
 */
public class BizDeviceUnit extends BaseEntity
{
	private static final long serialVersionUID = 1L;
	
	/** 部件ID */
	private Long unitId;
	/** 部件编号 */
	@Excel(name = "部件编号")
	private String unitNo;
	/** 部件名称 */
	@Excel(name = "部件名称")
	private String unitName;
	/** 部件SN */
	private String unitSn;
	/** 部件型号 */
	private String unitModel;
	/** 所属设备 */
	private Long unitDevice;
	/** 部件类型 */
	private String unitType;
	/** 部件数量 */
	@Excel(name = "部件数量")
	private Integer unitCount;
	/** 部件使用次数 */
	@Excel(name = "部件使用次数")
	private Integer unitNum;
	/** 部件厂家 */
	private String unitMaker;
	/** 部件状态（0：使用；1：停用） */
	private String unitStatus;
	/** 投入使用时间 */
	private String useTime;
	/** 上次维护时间 */
	private String lastRepairTime;
	/** 维护时间 */
	private String repairTime;
	/** 维护人 */
	private String repairBy;

	@Excel(name = "所属设备", targetAttr = "worksName", type = Type.EXPORT)
	private BizDevice device;


	private BizWaterWork works;

	public void setUnitId(Long unitId) 
	{
		this.unitId = unitId;
	}

	public Long getUnitId() 
	{
		return unitId;
	}
	public void setUnitNo(String unitNo) 
	{
		this.unitNo = unitNo;
	}

	public String getUnitNo() 
	{
		return unitNo;
	}
	public void setUnitName(String unitName) 
	{
		this.unitName = unitName;
	}

	public String getUnitName() 
	{
		return unitName;
	}
	public void setUnitSn(String unitSn) 
	{
		this.unitSn = unitSn;
	}

	public String getUnitSn() 
	{
		return unitSn;
	}
	public void setUnitModel(String unitModel) 
	{
		this.unitModel = unitModel;
	}

	public String getUnitModel() 
	{
		return unitModel;
	}
	public void setUnitDevice(Long unitDevice) 
	{
		this.unitDevice = unitDevice;
	}

	public Long getUnitDevice() 
	{
		return unitDevice;
	}
	public void setUnitType(String unitType) 
	{
		this.unitType = unitType;
	}

	public String getUnitType() 
	{
		return unitType;
	}
	public void setUnitCount(Integer unitCount) 
	{
		this.unitCount = unitCount;
	}

	public Integer getUnitCount() 
	{
		return unitCount;
	}
	public void setUnitMaker(String unitMaker) 
	{
		this.unitMaker = unitMaker;
	}

	public String getUnitMaker() 
	{
		return unitMaker;
	}
	public void setUnitStatus(String unitStatus) 
	{
		this.unitStatus = unitStatus;
	}

	public String getUnitStatus() 
	{
		return unitStatus;
	}
	public void setUseTime(String useTime)
	{
		this.useTime = useTime;
	}

	public String getUseTime()
	{
		return useTime;
	}
	public void setLastRepairTime(String lastRepairTime)
	{
		this.lastRepairTime = lastRepairTime;
	}

	public String getLastRepairTime()
	{
		return lastRepairTime;
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

	public Integer getUnitNum() {
		return unitNum;
	}

	public void setUnitNum(Integer unitNum) {
		this.unitNum = unitNum;
	}

	public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("unitId", getUnitId())
            .append("unitNo", getUnitNo())
            .append("unitName", getUnitName())
            .append("unitSn", getUnitSn())
            .append("unitModel", getUnitModel())
            .append("unitDevice", getUnitDevice())
            .append("unitType", getUnitType())
            .append("unitCount", getUnitCount())
			.append("unitNum", getUnitNum())
            .append("unitMaker", getUnitMaker())
            .append("unitStatus", getUnitStatus())
            .append("useTime", getUseTime())
            .append("lastRepairTime", getLastRepairTime())
            .append("repairTime", getRepairTime())
            .append("repairBy", getRepairBy())
            .append("createTime", getCreateTime())
            .append("createBy", getCreateBy())
            .append("updateTime", getUpdateTime())
            .append("updateBy", getUpdateBy())
			.append("device", getDevice())
            .toString();
    }
}
