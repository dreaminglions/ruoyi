package com.ruoyi.system.domain;

import com.ruoyi.common.annotation.Excel;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 水厂表 biz_water_work
 * 
 * @author ruoyi
 * @date 2020-02-24
 */
public class BizWaterWork extends BaseEntity
{
	private static final long serialVersionUID = 1L;
	
	/** 水厂ID */
	private Long worksId;
	/** 水厂编号 */
	@Excel(name = "水厂编号")
	private String worksNo;
	/** 父部门id */
	private Long parentId;
	/** 祖级列表 */
	private String ancestors;
	/** 水厂名称 */
	@Excel(name = "水厂名称")
	private String worksName;
	/** 显示顺序 */
	private Integer orderNum;
	/** 省 */
	private String worksProvince;
	/** 市 */
	private String worksCity;
	/** 区 */
	private String worksArea;
	/** 经度 */
	private String worksLongitude;
	/** 纬度 */
	private String worksLatitude;
	/** 详细地址 */
	private String worksAddress;
	/** 设备数量 */
	private Integer worksCount;
	/** 水厂类型（0：管理上级；1：集团水厂；2：临时水厂） */
	@Excel(name = "水厂类型", readConverterExp = "0=管理上级,1=集团水厂,2=临时水厂")
	private String worksType;
	/** 是否为区域中心（0：是；1：否） */
	private String worksCenter;
	/** 水厂所属集团 */
	private Long worksBelong;
	/** 水厂状态（0：使用；1：停用） */
	private String worksStatus;
	/** 水厂联系人 */
	@Excel(name = "水厂联系人")
	private String worksMaintainer;
	/** 联系电话 */
	@Excel(name = "联系电话")
	private String worksTel;
	/** 父部门名称 */
	private String parentName;

	public String getWorksLongitude() {
		return worksLongitude;
	}

	public void setWorksLongitude(String worksLongitude) {
		this.worksLongitude = worksLongitude;
	}

	public String getWorksLatitude() {
		return worksLatitude;
	}

	public void setWorksLatitude(String worksLatitude) {
		this.worksLatitude = worksLatitude;
	}

	public void setWorksId(Long worksId)
	{
		this.worksId = worksId;
	}

	public Long getWorksId() 
	{
		return worksId;
	}
	public void setWorksNo(String worksNo) 
	{
		this.worksNo = worksNo;
	}

	public String getWorksNo() 
	{
		return worksNo;
	}
	public void setParentId(Long parentId) 
	{
		this.parentId = parentId;
	}

	public Long getParentId() 
	{
		return parentId;
	}
	public void setAncestors(String ancestors) 
	{
		this.ancestors = ancestors;
	}

	public String getAncestors() 
	{
		return ancestors;
	}
	public void setWorksName(String worksName) 
	{
		this.worksName = worksName;
	}

	public String getWorksName() 
	{
		return worksName;
	}
	public void setOrderNum(Integer orderNum) 
	{
		this.orderNum = orderNum;
	}

	public Integer getOrderNum() 
	{
		return orderNum;
	}
	public void setWorksProvince(String worksProvince) 
	{
		this.worksProvince = worksProvince;
	}

	public String getWorksProvince() 
	{
		return worksProvince;
	}
	public void setWorksCity(String worksCity) 
	{
		this.worksCity = worksCity;
	}

	public String getWorksCity() 
	{
		return worksCity;
	}
	public void setWorksArea(String worksArea) 
	{
		this.worksArea = worksArea;
	}

	public String getWorksArea() 
	{
		return worksArea;
	}
	public void setWorksAddress(String worksAddress) 
	{
		this.worksAddress = worksAddress;
	}

	public String getWorksAddress() 
	{
		return worksAddress;
	}
	public void setWorksCount(Integer worksCount) 
	{
		this.worksCount = worksCount;
	}

	public Integer getWorksCount() 
	{
		return worksCount;
	}
	public void setWorksType(String worksType) 
	{
		this.worksType = worksType;
	}

	public String getWorksType() 
	{
		return worksType;
	}
	public void setWorksBelong(Long worksBelong) 
	{
		this.worksBelong = worksBelong;
	}

	public Long getWorksBelong() 
	{
		return worksBelong;
	}
	public void setWorksStatus(String worksStatus) 
	{
		this.worksStatus = worksStatus;
	}

	public String getWorksStatus() 
	{
		return worksStatus;
	}
	public void setWorksMaintainer(String worksMaintainer) 
	{
		this.worksMaintainer = worksMaintainer;
	}

	public String getWorksMaintainer() 
	{
		return worksMaintainer;
	}
	public void setWorksTel(String worksTel) 
	{
		this.worksTel = worksTel;
	}

	public String getWorksTel() 
	{
		return worksTel;
	}


	public String getParentName()
	{
		return parentName;
	}

	public void setParentName(String parentName)
	{
		this.parentName = parentName;
	}

	public String getWorksCenter() {
		return worksCenter;
	}

	public void setWorksCenter(String worksCenter) {
		this.worksCenter = worksCenter;
	}

	public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("worksId", getWorksId())
            .append("worksNo", getWorksNo())
            .append("parentId", getParentId())
            .append("ancestors", getAncestors())
            .append("worksName", getWorksName())
            .append("orderNum", getOrderNum())
            .append("worksProvince", getWorksProvince())
            .append("worksCity", getWorksCity())
            .append("worksArea", getWorksArea())
			.append("worksLongitude", getWorksLongitude())
			.append("worksLatitude", getWorksLatitude())
            .append("worksAddress", getWorksAddress())
            .append("worksCount", getWorksCount())
            .append("worksType", getWorksType())
            .append("worksBelong", getWorksBelong())
            .append("worksStatus", getWorksStatus())
			.append("worksCenter", getWorksCenter())
            .append("worksMaintainer", getWorksMaintainer())
            .append("worksTel", getWorksTel())
            .append("createTime", getCreateTime())
            .append("createBy", getCreateBy())
            .append("updateTime", getUpdateTime())
            .append("updateBy", getUpdateBy())
            .toString();
    }
}
