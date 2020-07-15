package com.ruoyi.system.mapper;

import com.ruoyi.system.domain.BizAreaWater;

import java.util.List;

/**
 * 区域水厂 数据层
 * 
 * @author ruoyi
 * @date 2019-12-02
 */
public interface BizAreaWaterMapper
{

	/**
     * 查询区域水厂关系列表
     * 
     * @param areaWater 区域水厂信息
     * @return 区域水厂集合
     */
	public List<BizAreaWater> selectBizAreaWaterList(BizAreaWater areaWater);

	/**
	 * 根据区域ID查询区域水厂信息
	 *
	 * @param areaId 区域水厂ID
	 * @return 区域水厂集合
	 */
	public List<Long> selectAreaWaterByArea(Long areaId);
	
	/**
     * 批量插入区域水厂
     * 
     * @param areaWaterList 区域水厂集合
     * @return 结果
     */
	public int batchInsertBizAreaWater(List<BizAreaWater> areaWaterList);
	

	/**
     * 删除区域水厂
     * 
     * @param areaId 区域中心ID
     * @return 结果
     */
	public int deleteByAreaId(Long areaId);

	/**
	 * 删除水厂
	 *
	 * @param waterId 水厂ID
	 * @return 结果
	 */
	public int deleteByWaterId(Long waterId);
	

}