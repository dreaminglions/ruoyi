package com.ruoyi.system.service;

import com.ruoyi.system.domain.BizWaste;
import com.ruoyi.system.domain.DataEnity;

import java.util.List;

/**
 * 废液 服务层
 * 
 * @author ruoyi
 * @date 2020-03-03
 */
public interface IBizWasteService 
{
	/**
     * 查询废液信息
     * 
     * @param wasteId 废液ID
     * @return 废液信息
     */
	public BizWaste selectBizWasteById(Long wasteId);
	
	/**
     * 查询废液列表
     * 
     * @param bizWaste 废液信息
     * @return 废液集合
     */
	public List<BizWaste> selectBizWasteList(BizWaste bizWaste);
	
	/**
     * 新增废液
     * 
     * @param bizWaste 废液信息
     * @return 结果
     */
	public int insertBizWaste(BizWaste bizWaste);
	
	/**
     * 修改废液
     * 
     * @param bizWaste 废液信息
     * @return 结果
     */
	public int updateBizWaste(BizWaste bizWaste);
		
	/**
     * 删除废液信息
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	public int deleteBizWasteByIds(String ids);

	public List<DataEnity> getWasteBar(String assayId, Long worksId,String month);
}
