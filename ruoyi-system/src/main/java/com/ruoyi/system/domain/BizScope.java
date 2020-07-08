package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 化验范围表 biz_scope
 * 
 * @author ruoyi
 * @date 2020-05-15
 */
public class BizScope extends BaseEntity
{
	private static final long serialVersionUID = 1L;
	
	/** 化验范围ID */
	private Long scopeId;
	/** 化验范围编号 */
	private String scopeNo;
	/** 化验水厂id */
	private String scopeWorks;
	/** 入水COD最小值 */
	private Float inCodMin;
	/** 入水COD最大值 */
	private Float inCodMax;
	/** 入水总磷（TP）最小值 */
	private Float inTpMin;
	/** 入水总磷（TP）最大值 */
	private Float inTpMax;
	/** 入水总氮（TN）最小值 */
	private Float inTnMin;
	/** 入水氨氮（NH3）最小值 */
	private Float inNh3Min;
	/** 入水氨氮（NH3）最大值 */
	private Float inNh3Max;
	/** 入水总氮（TN）最大值 */
	private Float inTnMax;
	/** 出水COD最小值 */
	private Float outCodMin;
	/** 出水COD最大值 */
	private Float outCodMax;
	/** 出水总磷（TP）最小值 */
	private Float outTpMin;
	/** 出水总磷（TP）最大值 */
	private Float outTpMax;
	/** 出水总氮（TN）最小值 */
	private Float outTnMin;
	/** 出水氨氮（NH3）最小值 */
	private Float outNh3Min;
	/** 出水氨氮（NH3）最大值 */
	private Float outNh3Max;
	/** 出水总氮（TN）最大值 */
	private Float outTnMax;

	public void setScopeId(Long scopeId) 
	{
		this.scopeId = scopeId;
	}

	public Long getScopeId() 
	{
		return scopeId;
	}
	public void setScopeNo(String scopeNo) 
	{
		this.scopeNo = scopeNo;
	}

	public String getScopeNo() 
	{
		return scopeNo;
	}
	public void setInCodMin(Float inCodMin) 
	{
		this.inCodMin = inCodMin;
	}

	public Float getInCodMin() 
	{
		return inCodMin;
	}
	public void setInCodMax(Float inCodMax) 
	{
		this.inCodMax = inCodMax;
	}

	public Float getInCodMax() 
	{
		return inCodMax;
	}
	public void setInTpMin(Float inTpMin) 
	{
		this.inTpMin = inTpMin;
	}

	public Float getInTpMin() 
	{
		return inTpMin;
	}
	public void setInTpMax(Float inTpMax) 
	{
		this.inTpMax = inTpMax;
	}

	public Float getInTpMax() 
	{
		return inTpMax;
	}
	public void setInTnMin(Float inTnMin) 
	{
		this.inTnMin = inTnMin;
	}

	public Float getInTnMin() 
	{
		return inTnMin;
	}
	public void setInNh3Min(Float inNh3Min) 
	{
		this.inNh3Min = inNh3Min;
	}

	public Float getInNh3Min() 
	{
		return inNh3Min;
	}
	public void setInNh3Max(Float inNh3Max) 
	{
		this.inNh3Max = inNh3Max;
	}

	public Float getInNh3Max() 
	{
		return inNh3Max;
	}
	public void setInTnMax(Float inTnMax) 
	{
		this.inTnMax = inTnMax;
	}

	public Float getInTnMax() 
	{
		return inTnMax;
	}
	public void setOutCodMin(Float outCodMin) 
	{
		this.outCodMin = outCodMin;
	}

	public Float getOutCodMin() 
	{
		return outCodMin;
	}
	public void setOutCodMax(Float outCodMax) 
	{
		this.outCodMax = outCodMax;
	}

	public Float getOutCodMax() 
	{
		return outCodMax;
	}
	public void setOutTpMin(Float outTpMin) 
	{
		this.outTpMin = outTpMin;
	}

	public Float getOutTpMin() 
	{
		return outTpMin;
	}
	public void setOutTpMax(Float outTpMax) 
	{
		this.outTpMax = outTpMax;
	}

	public Float getOutTpMax() 
	{
		return outTpMax;
	}
	public void setOutTnMin(Float outTnMin) 
	{
		this.outTnMin = outTnMin;
	}

	public Float getOutTnMin() 
	{
		return outTnMin;
	}
	public void setOutNh3Min(Float outNh3Min) 
	{
		this.outNh3Min = outNh3Min;
	}

	public Float getOutNh3Min() 
	{
		return outNh3Min;
	}
	public void setOutNh3Max(Float outNh3Max) 
	{
		this.outNh3Max = outNh3Max;
	}

	public Float getOutNh3Max() 
	{
		return outNh3Max;
	}
	public void setOutTnMax(Float outTnMax) 
	{
		this.outTnMax = outTnMax;
	}

	public Float getOutTnMax() 
	{
		return outTnMax;
	}

	public String getScopeWorks() {
		return scopeWorks;
	}

	public void setScopeWorks(String scopeWorks) {
		this.scopeWorks = scopeWorks;
	}

	public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("scopeId", getScopeId())
            .append("scopeNo", getScopeNo())
			.append("scopeWorks", getScopeWorks())
            .append("inCodMin", getInCodMin())
            .append("inCodMax", getInCodMax())
            .append("inTpMin", getInTpMin())
            .append("inTpMax", getInTpMax())
            .append("inTnMin", getInTnMin())
            .append("inNh3Min", getInNh3Min())
            .append("inNh3Max", getInNh3Max())
            .append("inTnMax", getInTnMax())
            .append("outCodMin", getOutCodMin())
            .append("outCodMax", getOutCodMax())
            .append("outTpMin", getOutTpMin())
            .append("outTpMax", getOutTpMax())
            .append("outTnMin", getOutTnMin())
            .append("outNh3Min", getOutNh3Min())
            .append("outNh3Max", getOutNh3Max())
            .append("outTnMax", getOutTnMax())
            .append("createTime", getCreateTime())
            .append("createBy", getCreateBy())
            .append("updateTime", getUpdateTime())
            .append("updateBy", getUpdateBy())
            .toString();
    }
}
