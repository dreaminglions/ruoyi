package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 化验曲线表 biz_assay_curve
 * 
 * @author ruoyi
 * @date 2020-03-16
 */
public class BizAssayCurve extends BaseEntity
{
	private static final long serialVersionUID = 1L;
	
	/** 化验曲线ID */
	private Long curveId;
	/** 化验结果唯一ID（用于修改溯源） */
	private String reportId;
	/** 化验参数数据时间 */
	private String  curveTime;
	/** 总氮波长1 */
	private Float tnWave1;
	/** 总氮波长2 */
	private Float tnWave2;
	/** 总氮曲线K */
	private Float tnCurveK;
	/** 总氮曲线B */
	private Float tnCurveB;
	/** 总磷波长1 */
	private Float tpWave1;
	/** 总磷波长2 */
	private Float tpWave2;
	/** 总磷曲线K */
	private Float tpCurveK;
	/** 总磷曲线B */
	private Float tpCurveB;
	/** 氨氮波长1 */
	private Float nhWave1;
	/** 氨氮波长2 */
	private Float nhWave2;
	/** 氨氮曲线K */
	private Float nhCurveK;
	/** 氨氮曲线B */
	private Float nhCurveB;
	/** 高COD波长1 */
	private Float incodWave1;
	/** 高COD波长2 */
	private Float incodWave2;
	/** 高COD曲线K */
	private Float incodCurveK;
	/** 高COD曲线B */
	private Float incodCurveB;
	/** 低COD波长1 */
	private Float outcodWave1;
	/** 低COD波长2 */
	private Float outcodWave2;
	/** 低COD曲线K */
	private Float outcodCurveK;
	/** 低COD曲线B */
	private Float outcodCurveB;

	public void setCurveId(Long curveId)
	{
		this.curveId = curveId;
	}

	public Long getCurveId()
	{
		return curveId;
	}
	public void setReportId(String reportId)
	{
		this.reportId = reportId;
	}

	public String getReportId()
	{
		return reportId;
	}
	public void setCurveTime(String curveTime)
	{
		this.curveTime = curveTime;
	}

	public String getCurveTime()
	{
		return curveTime;
	}
	public void setTnWave1(Float tnWave1)
	{
		this.tnWave1 = tnWave1;
	}

	public Float getTnWave1()
	{
		return tnWave1;
	}
	public void setTnWave2(Float tnWave2)
	{
		this.tnWave2 = tnWave2;
	}

	public Float getTnWave2()
	{
		return tnWave2;
	}
	public void setTnCurveK(Float tnCurveK)
	{
		this.tnCurveK = tnCurveK;
	}

	public Float getTnCurveK()
	{
		return tnCurveK;
	}
	public void setTnCurveB(Float tnCurveB)
	{
		this.tnCurveB = tnCurveB;
	}

	public Float getTnCurveB()
	{
		return tnCurveB;
	}
	public void setTpWave1(Float tpWave1)
	{
		this.tpWave1 = tpWave1;
	}

	public Float getTpWave1()
	{
		return tpWave1;
	}
	public void setTpWave2(Float tpWave2)
	{
		this.tpWave2 = tpWave2;
	}

	public Float getTpWave2()
	{
		return tpWave2;
	}
	public void setTpCurveK(Float tpCurveK)
	{
		this.tpCurveK = tpCurveK;
	}

	public Float getTpCurveK()
	{
		return tpCurveK;
	}
	public void setTpCurveB(Float tpCurveB)
	{
		this.tpCurveB = tpCurveB;
	}

	public Float getTpCurveB()
	{
		return tpCurveB;
	}
	public void setNhWave1(Float nhWave1)
	{
		this.nhWave1 = nhWave1;
	}

	public Float getNhWave1()
	{
		return nhWave1;
	}
	public void setNhWave2(Float nhWave2)
	{
		this.nhWave2 = nhWave2;
	}

	public Float getNhWave2()
	{
		return nhWave2;
	}
	public void setNhCurveK(Float nhCurveK)
	{
		this.nhCurveK = nhCurveK;
	}

	public Float getNhCurveK()
	{
		return nhCurveK;
	}
	public void setNhCurveB(Float nhCurveB)
	{
		this.nhCurveB = nhCurveB;
	}

	public Float getNhCurveB()
	{
		return nhCurveB;
	}
	public void setIncodWave1(Float incodWave1)
	{
		this.incodWave1 = incodWave1;
	}

	public Float getIncodWave1()
	{
		return incodWave1;
	}
	public void setIncodWave2(Float incodWave2)
	{
		this.incodWave2 = incodWave2;
	}

	public Float getIncodWave2()
	{
		return incodWave2;
	}
	public void setIncodCurveK(Float incodCurveK)
	{
		this.incodCurveK = incodCurveK;
	}

	public Float getIncodCurveK()
	{
		return incodCurveK;
	}
	public void setIncodCurveB(Float incodCurveB)
	{
		this.incodCurveB = incodCurveB;
	}

	public Float getIncodCurveB()
	{
		return incodCurveB;
	}
	public void setOutcodWave1(Float outcodWave1)
	{
		this.outcodWave1 = outcodWave1;
	}

	public Float getOutcodWave1()
	{
		return outcodWave1;
	}
	public void setOutcodWave2(Float outcodWave2)
	{
		this.outcodWave2 = outcodWave2;
	}

	public Float getOutcodWave2()
	{
		return outcodWave2;
	}
	public void setOutcodCurveK(Float outcodCurveK)
	{
		this.outcodCurveK = outcodCurveK;
	}

	public Float getOutcodCurveK()
	{
		return outcodCurveK;
	}
	public void setOutcodCurveB(Float outcodCurveB)
	{
		this.outcodCurveB = outcodCurveB;
	}

	public Float getOutcodCurveB()
	{
		return outcodCurveB;
	}

	public String toString() {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
				.append("curveId", getCurveId())
				.append("reportId", getReportId())
				.append("curveTime", getCurveTime())
				.append("tnWave1", getTnWave1())
				.append("tnWave2", getTnWave2())
				.append("tnCurveK", getTnCurveK())
				.append("tnCurveB", getTnCurveB())
				.append("tpWave1", getTpWave1())
				.append("tpWave2", getTpWave2())
				.append("tpCurveK", getTpCurveK())
				.append("tpCurveB", getTpCurveB())
				.append("nhWave1", getNhWave1())
				.append("nhWave2", getNhWave2())
				.append("nhCurveK", getNhCurveK())
				.append("nhCurveB", getNhCurveB())
				.append("incodWave1", getIncodWave1())
				.append("incodWave2", getIncodWave2())
				.append("incodCurveK", getIncodCurveK())
				.append("incodCurveB", getIncodCurveB())
				.append("outcodWave1", getOutcodWave1())
				.append("outcodWave2", getOutcodWave2())
				.append("outcodCurveK", getOutcodCurveK())
				.append("outcodCurveB", getOutcodCurveB())
				.append("createTime", getCreateTime())
				.append("createBy", getCreateBy())
				.append("updateTime", getUpdateTime())
				.append("updateBy", getUpdateBy())
				.toString();
	}
}
