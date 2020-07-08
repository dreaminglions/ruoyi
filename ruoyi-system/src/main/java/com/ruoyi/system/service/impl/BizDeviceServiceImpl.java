package com.ruoyi.system.service.impl;

import java.util.List;

import com.ruoyi.common.annotation.DataScope;
import com.ruoyi.system.domain.DataEnity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.BizDeviceMapper;
import com.ruoyi.system.domain.BizDevice;
import com.ruoyi.system.service.IBizDeviceService;
import com.ruoyi.common.core.text.Convert;

/**
 * 设备 服务层实现
 * 
 * @author ruoyi
 * @date 2019-12-02
 */
@Service
public class BizDeviceServiceImpl implements IBizDeviceService 
{
	@Autowired
	private BizDeviceMapper bizDeviceMapper;

	/**
     * 查询设备信息
     * 
     * @param deviceId 设备ID
     * @return 设备信息
     */
    @Override
	public BizDevice selectBizDeviceById(Long deviceId)
	{
	    return bizDeviceMapper.selectBizDeviceById(deviceId);
	}

	@Override
	public BizDevice selectBizDeviceByWork(Long workId)
	{
		return bizDeviceMapper.selectBizDeviceByWork(workId);
	}
	/**
     * 查询设备列表
     * 
     * @param bizDevice 设备信息
     * @return 设备集合
     */
	@Override
	@DataScope(tableAlias = "w")
	public List<BizDevice> selectBizDeviceList(BizDevice bizDevice)
	{
	    return bizDeviceMapper.selectBizDeviceList(bizDevice);
	}

	/**
	 * 查询只符合设备类型列表
	 *
	 * @param bizDevice 设备信息
	 * @return 设备集合
	 */
	@Override
	@DataScope(tableAlias = "w")
	public List<BizDevice> selectOnlydeviceList(BizDevice bizDevice)
	{
		return bizDeviceMapper.selectOnlydeviceList(bizDevice);
	}

	/**
	 * 查询可以维护的设备列表
	 *
	 * @param bizDevice 设备信息
	 * @return 设备集合
	 */
	@DataScope(tableAlias = "w")
	public List<BizDevice> selectBizDeviceMaintainList(BizDevice bizDevice)
	{
		return bizDeviceMapper.selectBizDeviceMaintainList(bizDevice);
	}
	
    /**
     * 新增设备
     * 
     * @param bizDevice 设备信息
     * @return 结果
     */
	@Override
	public int insertBizDevice(BizDevice bizDevice)
	{
	    return bizDeviceMapper.insertBizDevice(bizDevice);
	}
	
	/**
     * 修改设备
     * 
     * @param bizDevice 设备信息
     * @return 结果
     */
	@Override
	public int updateBizDevice(BizDevice bizDevice)
	{
	    return bizDeviceMapper.updateBizDevice(bizDevice);
	}

	/**
     * 删除设备对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	@Override
	public int deleteBizDeviceByIds(String ids)
	{
		return bizDeviceMapper.deleteBizDeviceByIds(Convert.toStrArray(ids));
	}

	@Override
	public List<DataEnity> getDeviceTotal(){
		return bizDeviceMapper.getDeviceTotal();
	};
}
