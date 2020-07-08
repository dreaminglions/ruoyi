package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.core.domain.BaseEntity;
import java.util.Date;

/**
 * 化验结果修改表 biz_result_alter
 * 
 * @author ruoyi
 * @date 2019-12-16
 */
public class BizResultAlter extends BaseEntity
{
	private static final long serialVersionUID = 1L;
	
	/** 修改ID */
	private Long alterId;
	/** 修改编号 */
	private String alterNo;
	/** 化验结果唯一ID（用于修改溯源） */
	private String reportId;
	/** 修改设备 */
	private Long alterDevice;
	/** 修改水厂 */
	private Long alterWorks;
	/** 入水COD数值 */
	private Float inCod;
	/** 入水总磷（TP）数值 */
	private Float inTp;
	/** 入水总氮（TN）数值 */
	private Float inTn;
	/** 入水氨氮（NH3）COD数值 */
	private Float inNh3;
	/** 出水COD数值 */
	private Float outCod;
	/** 出水总磷（TP）数值 */
	private Float outTp;
	/** 出水总氮（TN）数值 */
	private Float outTn;
	/** 出水氨氮（NH3）COD数值 */
	private Float outNh3;
	/** 修改日期 */
	private String alterDate;
	/** 修改时间 */
	private String alterTime;


	private BizDevice device;

	private BizWaterWork works;

	public void setAlterId(Long alterId) 
	{
		this.alterId = alterId;
	}

	public Long getAlterId() 
	{
		return alterId;
	}
	public void setAlterNo(String alterNo) 
	{
		this.alterNo = alterNo;
	}

	public String getAlterNo() 
	{
		return alterNo;
	}
	public void setReportId(String reportId) 
	{
		this.reportId = reportId;
	}

	public String getReportId() 
	{
		return reportId;
	}
	public void setAlterDevice(Long alterDevice) 
	{
		this.alterDevice = alterDevice;
	}

	public Long getAlterDevice() 
	{
		return alterDevice;
	}
	public void setAlterWorks(Long alterWorks) 
	{
		this.alterWorks = alterWorks;
	}

	public Long getAlterWorks() 
	{
		return alterWorks;
	}
	public void setInCod(Float inCod) 
	{
		this.inCod = inCod;
	}

	public Float getInCod() 
	{
		return inCod;
	}
	public void setInTp(Float inTp) 
	{
		this.inTp = inTp;
	}

	public Float getInTp() 
	{
		return inTp;
	}
	public void setInTn(Float inTn) 
	{
		this.inTn = inTn;
	}

	public Float getInTn() 
	{
		return inTn;
	}
	public void setInNh3(Float inNh3) 
	{
		this.inNh3 = inNh3;
	}

	public Float getInNh3() 
	{
		return inNh3;
	}
	public void setOutCod(Float outCod) 
	{
		this.outCod = outCod;
	}

	public Float getOutCod() 
	{
		return outCod;
	}
	public void setOutTp(Float outTp) 
	{
		this.outTp = outTp;
	}

	public Float getOutTp() 
	{
		return outTp;
	}
	public void setOutTn(Float outTn) 
	{
		this.outTn = outTn;
	}

	public Float getOutTn() 
	{
		return outTn;
	}
	public void setOutNh3(Float outNh3) 
	{
		this.outNh3 = outNh3;
	}

	public Float getOutNh3() 
	{
		return outNh3;
	}
	public void setAlterDate(String alterDate) 
	{
		this.alterDate = alterDate;
	}

	public String getAlterDate() 
	{
		return alterDate;
	}
	public void setAlterTime(String alterTime)
	{
		this.alterTime = alterTime;
	}

	public String getAlterTime()
	{
		return alterTime;
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


	public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("alterId", getAlterId())
            .append("alterNo", getAlterNo())
            .append("reportId", getReportId())
            .append("alterDevice", getAlterDevice())
            .append("alterWorks", getAlterWorks())
            .append("inCod", getInCod())
            .append("inTp", getInTp())
            .append("inTn", getInTn())
            .append("inNh3", getInNh3())
            .append("outCod", getOutCod())
            .append("outTp", getOutTp())
            .append("outTn", getOutTn())
            .append("outNh3", getOutNh3())
            .append("alterDate", getAlterDate())
            .append("alterTime", getAlterTime())
            .append("createTime", getCreateTime())
            .append("createBy", getCreateBy())
            .append("updateTime", getUpdateTime())
            .append("updateBy", getUpdateBy())
            .toString();
    }
}
