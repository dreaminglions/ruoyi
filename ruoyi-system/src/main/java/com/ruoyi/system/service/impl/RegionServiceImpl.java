package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.RegionMapper;
import com.ruoyi.system.domain.Region;
import com.ruoyi.system.service.IRegionService;
import com.ruoyi.common.core.text.Convert;

/**
 * 地区（省市区） 服务层实现
 * 
 * @author ruoyi
 * @date 2019-12-14
 */
@Service
public class RegionServiceImpl implements IRegionService 
{
	@Autowired
	private RegionMapper regionMapper;

	/**
     * 查询地区（省市区）信息
     * 
     * @param regionId 地区（省市区）ID
     * @return 地区（省市区）信息
     */
    @Override
	public Region selectRegionById(Long regionId)
	{
	    return regionMapper.selectRegionById(regionId);
	}
	
	/**
     * 查询地区（省市区）列表
     * 
     * @param region 地区（省市区）信息
     * @return 地区（省市区）集合
     */
	@Override
	public List<Region> selectRegionList(Region region)
	{
	    return regionMapper.selectRegionList(region);
	}

	@Override
	public List<Region> selectByParentCode(String parentCode){
		return regionMapper.selectByParentCode(parentCode);
	}
	
    /**
     * 新增地区（省市区）
     * 
     * @param region 地区（省市区）信息
     * @return 结果
     */
	@Override
	public int insertRegion(Region region)
	{
	    return regionMapper.insertRegion(region);
	}
	
	/**
     * 修改地区（省市区）
     * 
     * @param region 地区（省市区）信息
     * @return 结果
     */
	@Override
	public int updateRegion(Region region)
	{
	    return regionMapper.updateRegion(region);
	}

	/**
     * 删除地区（省市区）对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	@Override
	public int deleteRegionByIds(String ids)
	{
		return regionMapper.deleteRegionByIds(Convert.toStrArray(ids));
	}
	
}
