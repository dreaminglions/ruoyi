package com.ruoyi.system.service.impl;

import java.util.List;

import com.ruoyi.system.domain.DataEnity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.BizDeviceUnitMapper;
import com.ruoyi.system.domain.BizDeviceUnit;
import com.ruoyi.system.service.IBizDeviceUnitService;
import com.ruoyi.common.core.text.Convert;

/**
 * 设备部件 服务层实现
 * 
 * @author ruoyi
 * @date 2019-12-14
 */
@Service
public class BizDeviceUnitServiceImpl implements IBizDeviceUnitService 
{
	@Autowired
	private BizDeviceUnitMapper bizDeviceUnitMapper;

	/**
     * 查询设备部件信息
     * 
     * @param unitId 设备部件ID
     * @return 设备部件信息
     */
    @Override
	public BizDeviceUnit selectBizDeviceUnitById(Long unitId)
	{
	    return bizDeviceUnitMapper.selectBizDeviceUnitById(unitId);
	}
	
	/**
     * 查询设备部件列表
     * 
     * @param bizDeviceUnit 设备部件信息
     * @return 设备部件集合
     */
	@Override
	public List<BizDeviceUnit> selectBizDeviceUnitList(BizDeviceUnit bizDeviceUnit)
	{
	    return bizDeviceUnitMapper.selectBizDeviceUnitList(bizDeviceUnit);
	}
	
    /**
     * 新增设备部件
     * 
     * @param bizDeviceUnit 设备部件信息
     * @return 结果
     */
	@Override
	public int insertBizDeviceUnit(BizDeviceUnit bizDeviceUnit)
	{
	    return bizDeviceUnitMapper.insertBizDeviceUnit(bizDeviceUnit);
	}
	
	/**
     * 修改设备部件
     * 
     * @param bizDeviceUnit 设备部件信息
     * @return 结果
     */
	@Override
	public int updateBizDeviceUnit(BizDeviceUnit bizDeviceUnit)
	{
	    return bizDeviceUnitMapper.updateBizDeviceUnit(bizDeviceUnit);
	}

	/**
     * 删除设备部件对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	@Override
	public int deleteBizDeviceUnitByIds(String ids)
	{
		return bizDeviceUnitMapper.deleteBizDeviceUnitByIds(Convert.toStrArray(ids));
	}

	@Override
	public List<DataEnity> getUnitNum(Long deviceId){
		return bizDeviceUnitMapper.getUnitNum(deviceId);
	}
	
}
