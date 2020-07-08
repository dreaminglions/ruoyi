package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 化验方法依据表 biz_assay_method
 * 
 * @author ruoyi
 * @date 2020-06-03
 */
public class BizAssayMethod extends BaseEntity
{
	private static final long serialVersionUID = 1L;
	
	/** 化验方法id */
	private Long methodId;
	/** 化验结果唯一ID（用于修改溯源） */
	private String reportId;
	/** cod方法依据名称 */
	private String codName;
	/** tp方法依据名称 */
	private String tpName;
	/** tn方法依据名称 */
	private String tnName;
	/** nh方法依据名称 */
	private String nhName;
	/** cod高量程波长 */
	private Integer codWave1;
	/** cod低量程波长 */
	private Integer codWave2;
	/** cod光程 */
	private Integer codOptical;
	/** tp波长 */
	private Integer tpWave1;
	/** tp光程 */
	private Integer tpOptical;
	/** tn波长 */
	private Integer tnWave1;
	/** tn光程 */
	private Integer tnOptical;
	/** nh波长 */
	private Integer nhWave1;
	/** nh光程 */
	private Integer nhOptical;

	public void setMethodId(Long methodId) 
	{
		this.methodId = methodId;
	}

	public Long getMethodId() 
	{
		return methodId;
	}
	public void setReportId(String reportId) 
	{
		this.reportId = reportId;
	}

	public String getReportId() 
	{
		return reportId;
	}
	public void setCodName(String codName) 
	{
		this.codName = codName;
	}

	public String getCodName() 
	{
		return codName;
	}
	public void setTpName(String tpName) 
	{
		this.tpName = tpName;
	}

	public String getTpName() 
	{
		return tpName;
	}
	public void setTnName(String tnName) 
	{
		this.tnName = tnName;
	}

	public String getTnName() 
	{
		return tnName;
	}
	public void setNhName(String nhName) 
	{
		this.nhName = nhName;
	}

	public String getNhName() 
	{
		return nhName;
	}
	public void setCodWave1(Integer codWave1) 
	{
		this.codWave1 = codWave1;
	}

	public Integer getCodWave1() 
	{
		return codWave1;
	}
	public void setCodWave2(Integer codWave2) 
	{
		this.codWave2 = codWave2;
	}

	public Integer getCodWave2() 
	{
		return codWave2;
	}
	public void setCodOptical(Integer codOptical) 
	{
		this.codOptical = codOptical;
	}

	public Integer getCodOptical() 
	{
		return codOptical;
	}
	public void setTpWave1(Integer tpWave1) 
	{
		this.tpWave1 = tpWave1;
	}

	public Integer getTpWave1() 
	{
		return tpWave1;
	}
	public void setTpOptical(Integer tpOptical) 
	{
		this.tpOptical = tpOptical;
	}

	public Integer getTpOptical() 
	{
		return tpOptical;
	}
	public void setTnWave1(Integer tnWave1) 
	{
		this.tnWave1 = tnWave1;
	}

	public Integer getTnWave1() 
	{
		return tnWave1;
	}
	public void setTnOptical(Integer tnOptical) 
	{
		this.tnOptical = tnOptical;
	}

	public Integer getTnOptical() 
	{
		return tnOptical;
	}
	public void setNhWave1(Integer nhWave1) 
	{
		this.nhWave1 = nhWave1;
	}

	public Integer getNhWave1() 
	{
		return nhWave1;
	}
	public void setNhOptical(Integer nhOptical) 
	{
		this.nhOptical = nhOptical;
	}

	public Integer getNhOptical() 
	{
		return nhOptical;
	}

    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("methodId", getMethodId())
            .append("reportId", getReportId())
            .append("codName", getCodName())
            .append("tpName", getTpName())
            .append("tnName", getTnName())
            .append("nhName", getNhName())
            .append("codWave1", getCodWave1())
            .append("codWave2", getCodWave2())
            .append("codOptical", getCodOptical())
            .append("tpWave1", getTpWave1())
            .append("tpOptical", getTpOptical())
            .append("tnWave1", getTnWave1())
            .append("tnOptical", getTnOptical())
            .append("nhWave1", getNhWave1())
            .append("nhOptical", getNhOptical())
            .append("createTime", getCreateTime())
            .append("createBy", getCreateBy())
            .append("updateTime", getUpdateTime())
            .append("updateBy", getUpdateBy())
            .toString();
    }
}
