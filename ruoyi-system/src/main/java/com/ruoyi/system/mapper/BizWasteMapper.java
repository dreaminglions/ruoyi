package com.ruoyi.system.mapper;

import com.ruoyi.system.domain.BizWaste;
import com.ruoyi.system.domain.DataEnity;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 废液 数据层
 * 
 * @author ruoyi
 * @date 2020-03-03
 */
public interface BizWasteMapper 
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
     * 删除废液
     * 
     * @param wasteId 废液ID
     * @return 结果
     */
	public int deleteBizWasteById(Long wasteId);
	
	/**
     * 批量删除废液
     * 
     * @param wasteIds 需要删除的数据ID
     * @return 结果
     */
	public int deleteBizWasteByIds(String[] wasteIds);

	public List<DataEnity> getWasteBar(@Param(value="assayId") String assayId, @Param(value="worksId")  Long worksId,@Param(value="month")  String month);
}