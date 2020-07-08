package com.ruoyi.system.domain;

import com.ruoyi.common.annotation.Excel;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.core.domain.BaseEntity;
import java.util.Date;

/**
 * 药剂表 biz_agentia
 * 
 * @author ruoyi
 * @date 2019-12-14
 */
public class BizAgentia extends BaseEntity
{
	private static final long serialVersionUID = 1L;
	
	/** 药剂ID */
	private Long agentiaId;
	/** 药剂编号 */
	private String agentiaNo;
	/** 部件名称 */
	@Excel(name = "药剂名称")
	private String agentiaName;
	/** 所属设备 */
	private Long agentiaBelong;
	/** 药剂总量 */
	@Excel(name = "药剂累计总量")
	private Float agentiaTotal;
	/** 药剂剩余量 */
	@Excel(name = "药剂剩余量")
	private Float agentiaRemain;
	/** 药剂告警量 */
	private Float agentiaAlert;
	/** 药剂类型 */
	private String agentiaType;
	/** 药剂分类 */
	@Excel(name = "药剂分类", readConverterExp = "0=易制毒化学品,1=易制爆化学品,2=危险化学品")
	private String agentiaKind;
	/** 药剂厂家 */
	private String agentiaMaker;
	/** 药剂状态（0：使用；1：停用） */
	private String agentiaStatus;
	/** 投入使用时间 */
	private String useTime;
	/** 上次维护时间 */
	private String lastRepairTime;
	/** 维护时间 */
	private String repairTime;
	/** 维护人 */
	private String repairBy;

	private BizDevice device;

	private BizWaterWork works;

	public void setAgentiaId(Long agentiaId) 
	{
		this.agentiaId = agentiaId;
	}

	public Long getAgentiaId() 
	{
		return agentiaId;
	}
	public void setAgentiaNo(String agentiaNo) 
	{
		this.agentiaNo = agentiaNo;
	}

	public String getAgentiaNo() 
	{
		return agentiaNo;
	}
	public void setAgentiaName(String agentiaName) 
	{
		this.agentiaName = agentiaName;
	}

	public String getAgentiaName() 
	{
		return agentiaName;
	}

	public void setAgentiaTotal(Float agentiaTotal) 
	{
		this.agentiaTotal = agentiaTotal;
	}

	public Float getAgentiaTotal() 
	{
		return agentiaTotal;
	}
	public void setAgentiaRemain(Float agentiaRemain) 
	{
		this.agentiaRemain = agentiaRemain;
	}

	public Float getAgentiaRemain() 
	{
		return agentiaRemain;
	}
	public void setAgentiaAlert(Float agentiaAlert) 
	{
		this.agentiaAlert = agentiaAlert;
	}

	public Float getAgentiaAlert() 
	{
		return agentiaAlert;
	}
	public void setAgentiaType(String agentiaType) 
	{
		this.agentiaType = agentiaType;
	}

	public String getAgentiaType() 
	{
		return agentiaType;
	}
	public void setAgentiaMaker(String agentiaMaker) 
	{
		this.agentiaMaker = agentiaMaker;
	}

	public String getAgentiaMaker() 
	{
		return agentiaMaker;
	}
	public void setAgentiaStatus(String agentiaStatus) 
	{
		this.agentiaStatus = agentiaStatus;
	}

	public String getAgentiaStatus() 
	{
		return agentiaStatus;
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

	public Long getAgentiaBelong() {
		return agentiaBelong;
	}

	public void setAgentiaBelong(Long agentiaBelong) {
		this.agentiaBelong = agentiaBelong;
	}

	public String getAgentiaKind() {
		return agentiaKind;
	}

	public void setAgentiaKind(String agentiaKind) {
		this.agentiaKind = agentiaKind;
	}

	public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("agentiaId", getAgentiaId())
            .append("agentiaNo", getAgentiaNo())
            .append("agentiaName", getAgentiaName())
            .append("agentiaBelong", getAgentiaBelong())
            .append("agentiaTotal", getAgentiaTotal())
            .append("agentiaRemain", getAgentiaRemain())
            .append("agentiaAlert", getAgentiaAlert())
            .append("agentiaType", getAgentiaType())
			.append("agentiaKind", getAgentiaKind())
            .append("agentiaMaker", getAgentiaMaker())
            .append("agentiaStatus", getAgentiaStatus())
            .append("useTime", getUseTime())
            .append("lastRepairTime", getLastRepairTime())
            .append("repairTime", getRepairTime())
            .append("repairBy", getRepairBy())
            .append("createTime", getCreateTime())
            .append("createBy", getCreateBy())
            .append("updateTime", getUpdateTime())
            .append("updateBy", getUpdateBy())
            .toString();
    }
}
