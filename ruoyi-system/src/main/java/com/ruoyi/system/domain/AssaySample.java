package com.ruoyi.system.domain;

import com.ruoyi.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 化验结果表 z_assay
 * 
 * @author ruoyi
 * @date 2019-12-14
 */
public class AssaySample extends BaseEntity
{
	private static final long serialVersionUID = 1L;
	
	/** 化验样品ID */
	private Long sampleId;
	/** 化验结果唯一编号 */
	private String assayNo;
	/** 化验水厂 */
	private String workNo;
	/** 样品编号 */
	private String sampleNo;
	/** 样品名称 */
	private String sampleName;
	/** 样品体积 */
	private String sampleVolume;


	private BizWaterWork work;

	public Long getSampleId() {
		return sampleId;
	}

	public void setSampleId(Long sampleId) {
		this.sampleId = sampleId;
	}

	public String getAssayNo() {
		return assayNo;
	}

	public void setAssayNo(String assayNo) {
		this.assayNo = assayNo;
	}

	public String getWorkNo() {
		return workNo;
	}

	public void setWorkNo(String workNo) {
		this.workNo = workNo;
	}

	public String getSampleNo() {
		return sampleNo;
	}

	public void setSampleNo(String sampleNo) {
		this.sampleNo = sampleNo;
	}

	public String getSampleName() {
		return sampleName;
	}

	public void setSampleName(String sampleName) {
		this.sampleName = sampleName;
	}

	public String getSampleVolume() {
		return sampleVolume;
	}

	public void setSampleVolume(String sampleVolume) {
		this.sampleVolume = sampleVolume;
	}

	public BizWaterWork getWork() {
		return work;
	}

	public void setWork(BizWaterWork work) {
		this.work = work;
	}

	public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("sampleId", getSampleId())
            .append("assayNo", getAssayNo())
            .append("workNo", getWorkNo())
            .append("sampleNo", getSampleNo())
            .append("sampleName", getSampleName())
            .append("sampleVolume", getSampleVolume())
            .append("createTime", getCreateTime())
            .append("createBy", getCreateBy())
            .append("updateTime", getUpdateTime())
            .append("updateBy", getUpdateBy())
            .toString();
    }
}
