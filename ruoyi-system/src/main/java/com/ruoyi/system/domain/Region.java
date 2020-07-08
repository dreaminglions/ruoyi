package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 地区（省市区）表 sys_region
 * 
 * @author ruoyi
 * @date 2019-12-14
 */
public class Region extends BaseEntity
{
	private static final long serialVersionUID = 1L;
	
	/** 主键 */
	private Long regionId;
	/** 地区代码 */
	private String regionCod;
	/** 地区名称 */
	private String regionName;
	/** 父级地区 */
	private Long parentId;
	/** 地区等级 */
	private Integer regionLevel;
	/** 排序 */
	private Integer regionSort;
	/** 英文名称 */
	private String nameEn;
	/** 国家 */
	private String regionNation;

	public void setRegionId(Long regionId) 
	{
		this.regionId = regionId;
	}

	public Long getRegionId() 
	{
		return regionId;
	}
	public void setRegionCod(String regionCod) 
	{
		this.regionCod = regionCod;
	}

	public String getRegionCod() 
	{
		return regionCod;
	}
	public void setRegionName(String regionName) 
	{
		this.regionName = regionName;
	}

	public String getRegionName() 
	{
		return regionName;
	}
	public void setParentId(Long parentId) 
	{
		this.parentId = parentId;
	}

	public Long getParentId() 
	{
		return parentId;
	}
	public void setRegionLevel(Integer regionLevel) 
	{
		this.regionLevel = regionLevel;
	}

	public Integer getRegionLevel() 
	{
		return regionLevel;
	}
	public void setRegionSort(Integer regionSort) 
	{
		this.regionSort = regionSort;
	}

	public Integer getRegionSort() 
	{
		return regionSort;
	}
	public void setNameEn(String nameEn) 
	{
		this.nameEn = nameEn;
	}

	public String getNameEn() 
	{
		return nameEn;
	}
	public void setRegionNation(String regionNation) 
	{
		this.regionNation = regionNation;
	}

	public String getRegionNation() 
	{
		return regionNation;
	}

    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("regionId", getRegionId())
            .append("regionCod", getRegionCod())
            .append("regionName", getRegionName())
            .append("parentId", getParentId())
            .append("regionLevel", getRegionLevel())
            .append("regionSort", getRegionSort())
            .append("nameEn", getNameEn())
            .append("regionNation", getRegionNation())
            .toString();
    }
}
