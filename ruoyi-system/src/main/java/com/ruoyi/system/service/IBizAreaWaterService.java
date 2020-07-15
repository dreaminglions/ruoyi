package com.ruoyi.system.service;

import com.ruoyi.system.domain.BizAreaWater;

import java.util.List;

/**
 * 设备 服务层
 * 
 * @author ruoyi
 * @date 2019-12-02
 */
public interface IBizAreaWaterService
{
	/**
	 * 查询区域水厂列表
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
	 * @param areaId 区域ID
	 * @param waterIds 水厂IDS
	 * @return 结果
	 */
	public int batchInsertBizAreaWater(Long areaId,String waterIds);


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
