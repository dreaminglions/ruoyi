package com.ruoyi.system.domain;

import com.ruoyi.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 化验结果表 biz_assay_result
 * 
 * @author ruoyi
 * @date 2019-12-14
 */
public class AssayResult extends BaseEntity
{
	private static final long serialVersionUID = 1L;
	
	/** 化验结果ID */
	private Long resultId;
	/** 化验结果唯一编号 */
	private String assayNo;
	/** 结果编号 */
	private String resultNo;
	/** 样品编号 */
	private String sampleNo;
	/** 样品体积 */
	private float sampleVolume;
	/** 设备编号 */
	private String deviceNo;
	/** 化验项目 */
	private String assayItem;
	/** 化验项目名称 */
	private String itemName;
	/** 化验浓度值 */
	private float resultConcentration;
	/** 化验化验ABS值（吸光度） */
	private float resultAbs;
	/** 化验结果日期 */
	private String resultDate;
	/** 化验结果时间*/
	private String resultTime;
	/** 曲线k0 */
	private float curveK0;
	/** 曲线k1 */
	private float curveK1;
	/** 曲线唯一ID */
	private Long curveId;

	/** j_1901_s0_1 */
	private Float j_1901_s0_1;

	public AssaySample assaySample;


	public Long getResultId() {
		return resultId;
	}

	public void setResultId(Long resultId) {
		this.resultId = resultId;
	}

	public String getAssayNo() {
		return assayNo;
	}

	public void setAssayNo(String assayNo) {
		this.assayNo = assayNo;
	}

	public String getResultNo() {
		return resultNo;
	}

	public void setResultNo(String resultNo) {
		this.resultNo = resultNo;
	}

	public String getSampleNo() {
		return sampleNo;
	}

	public void setSampleNo(String sampleNo) {
		this.sampleNo = sampleNo;
	}

	public float getSampleVolume() {
		return sampleVolume;
	}

	public void setSampleVolume(float sampleVolume) {
		this.sampleVolume = sampleVolume;
	}

	public String getDeviceNo() {
		return deviceNo;
	}

	public void setDeviceNo(String deviceNo) {
		this.deviceNo = deviceNo;
	}

	public String getAssayItem() {
		return assayItem;
	}

	public void setAssayItem(String assayItem) {
		this.assayItem = assayItem;
	}

	public float getResultConcentration() {
		return resultConcentration;
	}

	public void setResultConcentration(float resultConcentration) {
		this.resultConcentration = resultConcentration;
	}

	public float getResultAbs() {
		return resultAbs;
	}

	public void setResultAbs(float resultAbs) {
		this.resultAbs = resultAbs;
	}

	public String getResultDate() {
		return resultDate;
	}

	public void setResultDate(String resultDate) {
		this.resultDate = resultDate;
	}

	public String getResultTime() {
		return resultTime;
	}

	public void setResultTime(String resultTime) {
		this.resultTime = resultTime;
	}

	public float getCurveK0() {
		return curveK0;
	}

	public void setCurveK0(float curveK0) {
		this.curveK0 = curveK0;
	}

	public float getCurveK1() {
		return curveK1;
	}

	public void setCurveK1(float curveK1) {
		this.curveK1 = curveK1;
	}

	public Long getCurveId() {
		return curveId;
	}

	public void setCurveId(Long curveId) {
		this.curveId = curveId;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public AssaySample getAssaySample() {
		return assaySample;
	}

	public void setAssaySample(AssaySample assaySample) {
		this.assaySample = assaySample;
	}

	public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("resultId", getResultId())
			.append("assayNo", getAssayNo())
			.append("resultNo", getResultNo())
			.append("sampleNo", getSampleNo())
			.append("sampleVolume", getSampleVolume())
			.append("deviceNo", getDeviceNo())
			.append("assayItem", getAssayItem())
			.append("itemName", getItemName())
			.append("resultConcentration", getResultConcentration())
			.append("resultAbs", getResultAbs())
			.append("resultDate", getResultDate())
			.append("resultTime", getResultTime())
			.append("curveK0", getCurveK0())
			.append("curveK1", getCurveK1())
			.append("curveId", getCurveId())
			.append("createTime", getCreateTime())
            .append("createBy", getCreateBy())
            .append("updateTime", getUpdateTime())
            .append("updateBy", getUpdateBy())
            .toString();
    }
}
