package com.ruoyi.system.domain;

import com.ruoyi.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 化验故障表 z_assay_fault
 * 
 * @author ruoyi
 * @date 2019-12-14
 */
public class AssayItem extends BaseEntity
{
	private static final long serialVersionUID = 1L;
	
	/** 化验项目编号*/
	private Long assayItem;
	/** 化验项目名称 */
	private String itemName;

	public Long getAssayItem() {
		return assayItem;
	}

	public void setAssayItem(Long assayItem) {
		this.assayItem = assayItem;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("assayItem", getAssayItem())
            .append("itemName", getItemName())
            .toString();
    }
}
