package com.ruoyi.system.domain;

import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 区域水厂表 biz_area_water
 * 
 * @author admin
 * @date 2020-02-24
 */
public class BizAreaWater extends BaseEntity
{
	private static final long serialVersionUID = 1L;
	
	/** 区域中心ID */
	private Long areaId;
	/** 水厂ID */
	private Long waterId;

	public Long getAreaId() {
		return areaId;
	}

	public void setAreaId(Long areaId) {
		this.areaId = areaId;
	}

	public Long getWaterId() {
		return waterId;
	}

	public void setWaterId(Long waterId) {
		this.waterId = waterId;
	}
}
