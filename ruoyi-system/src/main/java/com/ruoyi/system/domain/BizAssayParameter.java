package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.core.domain.BaseEntity;
import java.util.Date;

/**
 * 化验校准曲线表 biz_assay_parameter
 * 
 * @author ruoyi
 * @date 2020-06-03
 */
public class BizAssayParameter extends BaseEntity
{
	private static final long serialVersionUID = 1L;
	
	/** 化验校准曲线id */
	private Long parameterId;
	/** 化验结果唯一ID（用于修改溯源） */
	private String reportId;
	/**  */
	private Date parameterTime;
	/** 化验校准曲线类型（1：cod；2：tp；3：tn；4：nh） */
	private String parameterType;
	/** 校准曲线-质量1 */
	private Float ug1;
	/** 校准曲线-吸光度1 */
	private Float od1;
	/** 校准曲线-质量2 */
	private Float ug2;
	/** 校准曲线-吸光度2 */
	private Float od2;
	/** 校准曲线-质量3 */
	private Float ug3;
	/** 校准曲线-吸光度3 */
	private Float od3;
	/** 校准曲线-质量4 */
	private Float ug4;
	/** 校准曲线-吸光度4 */
	private Float od4;
	/** 校准曲线-质量5 */
	private Float ug5;
	/** 校准曲线-吸光度5 */
	private Float od5;
	/** 校准曲线-质量6 */
	private Float ug6;
	/** 校准曲线-吸光度6 */
	private Float od6;
	/** 校准曲线-质量7 */
	private Float ug7;
	/** 校准曲线-吸光度7 */
	private Float od7;
	/** 校准曲线参数-b */
	private Float curveB;
	/** 校准曲线参数-a */
	private Float curveA;
	/** 校准曲线参数-r */
	private Float curveR;

	public void setParameterId(Long parameterId) 
	{
		this.parameterId = parameterId;
	}

	public Long getParameterId() 
	{
		return parameterId;
	}
	public void setReportId(String reportId) 
	{
		this.reportId = reportId;
	}

	public String getReportId() 
	{
		return reportId;
	}
	public void setParameterTime(Date parameterTime) 
	{
		this.parameterTime = parameterTime;
	}

	public Date getParameterTime() 
	{
		return parameterTime;
	}
	public void setParameterType(String parameterType) 
	{
		this.parameterType = parameterType;
	}

	public String getParameterType() 
	{
		return parameterType;
	}
	public void setUg1(Float ug1) 
	{
		this.ug1 = ug1;
	}

	public Float getUg1() 
	{
		return ug1;
	}
	public void setOd1(Float od1) 
	{
		this.od1 = od1;
	}

	public Float getOd1() 
	{
		return od1;
	}
	public void setUg2(Float ug2) 
	{
		this.ug2 = ug2;
	}

	public Float getUg2() 
	{
		return ug2;
	}
	public void setOd2(Float od2) 
	{
		this.od2 = od2;
	}

	public Float getOd2() 
	{
		return od2;
	}
	public void setUg3(Float ug3) 
	{
		this.ug3 = ug3;
	}

	public Float getUg3() 
	{
		return ug3;
	}
	public void setOd3(Float od3) 
	{
		this.od3 = od3;
	}

	public Float getOd3() 
	{
		return od3;
	}
	public void setUg4(Float ug4) 
	{
		this.ug4 = ug4;
	}

	public Float getUg4() 
	{
		return ug4;
	}
	public void setOd4(Float od4) 
	{
		this.od4 = od4;
	}

	public Float getOd4() 
	{
		return od4;
	}
	public void setUg5(Float ug5) 
	{
		this.ug5 = ug5;
	}

	public Float getUg5() 
	{
		return ug5;
	}
	public void setOd5(Float od5) 
	{
		this.od5 = od5;
	}

	public Float getOd5() 
	{
		return od5;
	}
	public void setUg6(Float ug6) 
	{
		this.ug6 = ug6;
	}

	public Float getUg6() 
	{
		return ug6;
	}
	public void setOd6(Float od6) 
	{
		this.od6 = od6;
	}

	public Float getOd6() 
	{
		return od6;
	}
	public void setUg7(Float ug7) 
	{
		this.ug7 = ug7;
	}

	public Float getUg7() 
	{
		return ug7;
	}
	public void setOd7(Float od7) 
	{
		this.od7 = od7;
	}

	public Float getOd7() 
	{
		return od7;
	}
	public void setCurveB(Float curveB) 
	{
		this.curveB = curveB;
	}

	public Float getCurveB() 
	{
		return curveB;
	}
	public void setCurveA(Float curveA) 
	{
		this.curveA = curveA;
	}

	public Float getCurveA() 
	{
		return curveA;
	}
	public void setCurveR(Float curveR) 
	{
		this.curveR = curveR;
	}

	public Float getCurveR() 
	{
		return curveR;
	}

    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("parameterId", getParameterId())
            .append("reportId", getReportId())
            .append("parameterTime", getParameterTime())
            .append("parameterType", getParameterType())
            .append("ug1", getUg1())
            .append("od1", getOd1())
            .append("ug2", getUg2())
            .append("od2", getOd2())
            .append("ug3", getUg3())
            .append("od3", getOd3())
            .append("ug4", getUg4())
            .append("od4", getOd4())
            .append("ug5", getUg5())
            .append("od5", getOd5())
            .append("ug6", getUg6())
            .append("od6", getOd6())
            .append("ug7", getUg7())
            .append("od7", getOd7())
            .append("curveB", getCurveB())
            .append("curveA", getCurveA())
            .append("curveR", getCurveR())
            .append("createTime", getCreateTime())
            .append("createBy", getCreateBy())
            .append("updateTime", getUpdateTime())
            .append("updateBy", getUpdateBy())
            .toString();
    }
}
