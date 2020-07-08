package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 告警表 biz_alert
 * 
 * @author ruoyi
 * @date 2019-12-14
 */
public class BizAlert extends BaseEntity
{
	private static final long serialVersionUID = 1L;
	
	/** 告警id */
	private Long alertId;
	/** 化验结果唯一ID（用于修改溯源） */
	private String reportId;
	/** 告警设备 */
	private Long alertDevice;
	/** 告警水厂 */
	private Long alertWorks;
	/** 告警内容 */
	private String alertContent;
	/** 告警类型 */
	private String alertType;
	/** 告警日期 */
	private String alertDate;
	/** 告警时间 */
	private String alertTime;

	private BizDevice device;

	private BizWaterWork works;

	public void setAlertId(Long alertId) 
	{
		this.alertId = alertId;
	}

	public Long getAlertId() 
	{
		return alertId;
	}
	public void setReportId(String reportId) 
	{
		this.reportId = reportId;
	}

	public String getReportId() 
	{
		return reportId;
	}
	public void setAlertDevice(Long alertDevice) 
	{
		this.alertDevice = alertDevice;
	}

	public Long getAlertDevice() 
	{
		return alertDevice;
	}
	public void setAlertWorks(Long alertWorks) 
	{
		this.alertWorks = alertWorks;
	}

	public Long getAlertWorks() 
	{
		return alertWorks;
	}
	public void setAlertContent(String alertContent) 
	{
		this.alertContent = alertContent;
	}

	public String getAlertContent() 
	{
		return alertContent;
	}
	public void setAlertType(String alertType) 
	{
		this.alertType = alertType;
	}

	public String getAlertType() 
	{
		return alertType;
	}
	public void setAlertDate(String alertDate) 
	{
		this.alertDate = alertDate;
	}

	public String getAlertDate() 
	{
		return alertDate;
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

	public String getAlertTime() {
		return alertTime;
	}

	public void setAlertTime(String alertTime) {
		this.alertTime = alertTime;
	}

	public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("alertId", getAlertId())
            .append("reportId", getReportId())
            .append("alertDevice", getAlertDevice())
            .append("alertWorks", getAlertWorks())
            .append("alertContent", getAlertContent())
            .append("alertType", getAlertType())
            .append("alertDate", getAlertDate())
			.append("alertTime", getAlertTime())
            .append("createTime", getCreateTime())
            .append("createBy", getCreateBy())
            .append("updateTime", getUpdateTime())
            .append("updateBy", getUpdateBy())
            .toString();
    }
}
