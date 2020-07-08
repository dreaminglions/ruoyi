package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.core.domain.BaseEntity;
import java.util.Date;

/**
 * 化验结果表 biz_assay_result
 * 
 * @author ruoyi
 * @date 2019-12-14
 */
public class BizAssayResult extends BaseEntity
{
	private static final long serialVersionUID = 1L;
	
	/** 化验结果ID */
	private Long resultId;
	/** 化验结果编号 */
	private String resultNo;
	/** 化验结果唯一ID（用于修改溯源） */
	private String reportId;
	/** 化验设备 */
	private Long resultDevice;
	/** 化验水厂 */
	private Long resultWorks;
	/** 化验类型 */
	private String resultType;
	/** 送检日期 */
	private String assayDate;
	/** 化验开始时间 */
	private String beginTime;
	/** 化验结束时间 */
	private String endTime;
	/** 化验方法id */
	private Long resultMethod;
	/** 化验参数id */
	private Long resultParameter;
	/** 化验曲线id */
	private Long resultCurve;
	/** 化验范围id */
	private Long resultScope;
	/** 入水COD数值 */
	private Float inCod;
	/** 高CODABS值 */
	private Float incodAbs;
	/** 入水总磷（TP）数值 */
	private Float inTp;
	/** 入水总磷ABS值 */
	private Float intpAbs;
	/** 入水总氮（TN）数值 */
	private Float inTn;
	/** 入水总氮ABS值 */
	private Float intnAbs;
	/** 入水氨氮（NH3）COD数值 */
	private Float inNh3;
	/** 入水氨氮单波ABS值 */
	private Float innhAbs;
	/** 出水COD数值(低COD浓度值) */
	private Float outCod;
	/** 低COD单波ABS值 */
	private Float outcodAbs;
	/** 出水总磷（TP）数值 */
	private Float outTp;
	/** 出水总磷单波ABS值 */
	private Float outtpAbs;
	/** 出水总氮（TN）数值 */
	private Float outTn;
	/** 出水总氮单波ABS值 */
	private Float outtnAbs;
	/** 出水氨氮（NH3）COD数值 */
	private Float outNh3;
	/** 出水氨氮单波ABS值 */
	private Float outnhAbs;
	/** 化验节点 */
	private String resultNode;
	/** 设备大流程 */
	private String resultBigprocess;
	/** 设备小流程 */
	private String resultSmallprocess;
	/** 化验状态（0：有效；1：无效） */
	private String resultStatus;
	/** 告警状态（0：无告警；1：有告警） */
	private String resultAlert;
	/** 故障状态（0：无告警；1：有告警） */
	private String resultFault;
	/** 化验日期 */
	private String resultDate;
	/** 化验人员 */
	private String repairBy;

	private BizDevice device;

	private BizWaterWork works;

	public void setResultId(Long resultId) 
	{
		this.resultId = resultId;
	}

	public Long getResultId() 
	{
		return resultId;
	}
	public void setResultNo(String resultNo) 
	{
		this.resultNo = resultNo;
	}

	public String getResultNo() 
	{
		return resultNo;
	}
	public void setReportId(String reportId) 
	{
		this.reportId = reportId;
	}

	public String getReportId() 
	{
		return reportId;
	}
	public void setResultDevice(Long resultDevice) 
	{
		this.resultDevice = resultDevice;
	}

	public Long getResultDevice() 
	{
		return resultDevice;
	}
	public void setResultWorks(Long resultWorks) 
	{
		this.resultWorks = resultWorks;
	}

	public Long getResultWorks() 
	{
		return resultWorks;
	}
	public void setResultType(String resultType) 
	{
		this.resultType = resultType;
	}

	public String getResultType() 
	{
		return resultType;
	}
	public void setAssayDate(String assayDate) 
	{
		this.assayDate = assayDate;
	}

	public String getAssayDate() 
	{
		return assayDate;
	}
	public void setBeginTime(String beginTime)
	{
		this.beginTime = beginTime;
	}

	public String getBeginTime()
	{
		return beginTime;
	}
	public void setEndTime(String endTime)
	{
		this.endTime = endTime;
	}

	public String getEndTime()
	{
		return endTime;
	}
	public void setResultMethod(Long resultMethod) 
	{
		this.resultMethod = resultMethod;
	}

	public Long getResultMethod() 
	{
		return resultMethod;
	}
	public void setResultParameter(Long resultParameter) 
	{
		this.resultParameter = resultParameter;
	}

	public Long getResultParameter() 
	{
		return resultParameter;
	}
	public void setResultCurve(Long resultCurve) 
	{
		this.resultCurve = resultCurve;
	}

	public Long getResultCurve() 
	{
		return resultCurve;
	}
	public void setResultScope(Long resultScope) 
	{
		this.resultScope = resultScope;
	}

	public Long getResultScope() 
	{
		return resultScope;
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
	public void setResultStatus(String resultStatus) 
	{
		this.resultStatus = resultStatus;
	}

	public String getResultStatus() 
	{
		return resultStatus;
	}
	public void setResultAlert(String resultAlert) 
	{
		this.resultAlert = resultAlert;
	}

	public String getResultAlert() 
	{
		return resultAlert;
	}
	public void setResultDate(String resultDate) 
	{
		this.resultDate = resultDate;
	}

	public String getResultDate() 
	{
		return resultDate;
	}

	public Float getIncodAbs() {
		return incodAbs;
	}

	public void setIncodAbs(Float incodAbs) {
		this.incodAbs = incodAbs;
	}

	public Float getIntpAbs() {
		return intpAbs;
	}

	public void setIntpAbs(Float intpAbs) {
		this.intpAbs = intpAbs;
	}

	public Float getIntnAbs() {
		return intnAbs;
	}

	public void setIntnAbs(Float intnAbs) {
		this.intnAbs = intnAbs;
	}

	public Float getInnhAbs() {
		return innhAbs;
	}

	public void setInnhAbs(Float innhAbs) {
		this.innhAbs = innhAbs;
	}

	public Float getOutcodAbs() {
		return outcodAbs;
	}

	public void setOutcodAbs(Float outcodAbs) {
		this.outcodAbs = outcodAbs;
	}

	public Float getOuttpAbs() {
		return outtpAbs;
	}

	public void setOuttpAbs(Float outtpAbs) {
		this.outtpAbs = outtpAbs;
	}

	public Float getOuttnAbs() {
		return outtnAbs;
	}

	public void setOuttnAbs(Float outtnAbs) {
		this.outtnAbs = outtnAbs;
	}

	public Float getOutnhAbs() {
		return outnhAbs;
	}

	public void setOutnhAbs(Float outnhAbs) {
		this.outnhAbs = outnhAbs;
	}

	public String getResultNode() {
		return resultNode;
	}

	public void setResultNode(String resultNode) {
		this.resultNode = resultNode;
	}

	public String getResultBigprocess() {
		return resultBigprocess;
	}

	public void setResultBigprocess(String resultBigprocess) {
		this.resultBigprocess = resultBigprocess;
	}

	public String getResultSmallprocess() {
		return resultSmallprocess;
	}

	public void setResultSmallprocess(String resultSmallprocess) {
		this.resultSmallprocess = resultSmallprocess;
	}

	public String getResultFault() {
		return resultFault;
	}

	public void setResultFault(String resultFault) {
		this.resultFault = resultFault;
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


	public String getRepairBy() {
		return repairBy;
	}

	public void setRepairBy(String repairBy) {
		this.repairBy = repairBy;
	}

	public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("resultId", getResultId())
            .append("resultNo", getResultNo())
            .append("reportId", getReportId())
            .append("resultDevice", getResultDevice())
            .append("resultWorks", getResultWorks())
            .append("resultType", getResultType())
            .append("assayDate", getAssayDate())
            .append("beginTime", getBeginTime())
            .append("endTime", getEndTime())
            .append("resultMethod", getResultMethod())
            .append("resultParameter", getResultParameter())
            .append("resultCurve", getResultCurve())
            .append("resultScope", getResultScope())
				.append("inCod", getInCod())
				.append("incodAbs", getIncodAbs())
				.append("inTp", getInTp())
				.append("intpAbs", getIntpAbs())
				.append("inTn", getInTn())
				.append("intnAbs", getIntnAbs())
				.append("inNh3", getInNh3())
				.append("innhAbs", getInnhAbs())
				.append("outCod", getOutCod())
				.append("outcodAbs", getOutcodAbs())
				.append("outTp", getOutTp())
				.append("outtpAbs", getOuttpAbs())
				.append("outTn", getOutTn())
				.append("outtnAbs", getOuttnAbs())
				.append("outNh3", getOutNh3())
				.append("outnhAbs", getOutnhAbs())
				.append("resultNode", getResultNode())
				.append("resultBigprocess", getResultBigprocess())
				.append("resultSmallprocess", getResultSmallprocess())
				.append("resultStatus", getResultStatus())
				.append("resultAlert", getResultAlert())
				.append("resultFault", getResultFault())
				.append("resultDate", getResultDate())
				.append("repairBy", getRepairBy())
            .append("createTime", getCreateTime())
            .append("createBy", getCreateBy())
            .append("updateTime", getUpdateTime())
            .append("updateBy", getUpdateBy())
            .toString();
    }
}
