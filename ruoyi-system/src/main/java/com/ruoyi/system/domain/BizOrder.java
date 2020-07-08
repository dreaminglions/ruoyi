package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.core.domain.BaseEntity;
import java.util.Date;

/**
 * 化验单据表 biz_order
 * 
 * @author ruoyi
 * @date 2019-12-16
 */
public class BizOrder extends BaseEntity
{
	private static final long serialVersionUID = 1L;
	
	/** 化验单据id */
	private Long orderId;
	/** 化验单据编号 */
	private String orderNo;
	/** 化验结果唯一ID（用于修改溯源） */
	private String reportId;
	/** 化验设备 */
	private Long orderDevice;
	/** 化验水厂 */
	private Long orderWorks;
	/** 化验开始时间 */
	private String beginTime;
	/** 化验结束时间 */
	private String endTime;
	/** 化验日期 */
	private String orderDate;
	/** 负责人 */
	private String orderMaintainer;
	/** 联系方式 */
	private String orderTel;
	/** 化验结果（0：合格；1：不合格） */
	private String orderResult;


	private BizDevice device;

	private BizWaterWork works;

	public void setOrderId(Long orderId) 
	{
		this.orderId = orderId;
	}

	public Long getOrderId() 
	{
		return orderId;
	}
	public void setOrderNo(String orderNo) 
	{
		this.orderNo = orderNo;
	}

	public String getOrderNo() 
	{
		return orderNo;
	}
	public void setReportId(String reportId) 
	{
		this.reportId = reportId;
	}

	public String getReportId() 
	{
		return reportId;
	}
	public void setOrderDevice(Long orderDevice) 
	{
		this.orderDevice = orderDevice;
	}

	public Long getOrderDevice() 
	{
		return orderDevice;
	}
	public void setOrderWorks(Long orderWorks) 
	{
		this.orderWorks = orderWorks;
	}

	public Long getOrderWorks() 
	{
		return orderWorks;
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
	public void setOrderDate(String orderDate) 
	{
		this.orderDate = orderDate;
	}

	public String getOrderDate() 
	{
		return orderDate;
	}
	public void setOrderMaintainer(String orderMaintainer) 
	{
		this.orderMaintainer = orderMaintainer;
	}

	public String getOrderMaintainer() 
	{
		return orderMaintainer;
	}
	public void setOrderTel(String orderTel) 
	{
		this.orderTel = orderTel;
	}

	public String getOrderTel() 
	{
		return orderTel;
	}
	public void setOrderResult(String orderResult) 
	{
		this.orderResult = orderResult;
	}

	public String getOrderResult() 
	{
		return orderResult;
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
            .append("orderId", getOrderId())
            .append("orderNo", getOrderNo())
            .append("reportId", getReportId())
            .append("orderDevice", getOrderDevice())
            .append("orderWorks", getOrderWorks())
            .append("beginTime", getBeginTime())
            .append("endTime", getEndTime())
            .append("orderDate", getOrderDate())
            .append("orderMaintainer", getOrderMaintainer())
            .append("orderTel", getOrderTel())
            .append("orderResult", getOrderResult())
            .append("createTime", getCreateTime())
            .append("createBy", getCreateBy())
            .append("updateTime", getUpdateTime())
            .append("updateBy", getUpdateBy())
            .toString();
    }
}
