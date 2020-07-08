package com.ruoyi.system.service;

import com.ruoyi.system.domain.Region;
import java.util.List;

/**
 * 地区（省市区） 服务层
 * 
 * @author ruoyi
 * @date 2019-12-14
 */
public interface IRegionService 
{
	/**
     * 查询地区（省市区）信息
     * 
     * @param regionId 地区（省市区）ID
     * @return 地区（省市区）信息
     */
	public Region selectRegionById(Long regionId);
	
	/**
     * 查询地区（省市区）列表
     * 
     * @param region 地区（省市区）信息
     * @return 地区（省市区）集合
     */
	public List<Region> selectRegionList(Region region);

	public List<Region> selectByParentCode(String parentCode);
	
	/**
     * 新增地区（省市区）
     * 
     * @param region 地区（省市区）信息
     * @return 结果
     */
	public int insertRegion(Region region);
	
	/**
     * 修改地区（省市区）
     * 
     * @param region 地区（省市区）信息
     * @return 结果
     */
	public int updateRegion(Region region);
		
	/**
     * 删除地区（省市区）信息
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	public int deleteRegionByIds(String ids);
	
}
