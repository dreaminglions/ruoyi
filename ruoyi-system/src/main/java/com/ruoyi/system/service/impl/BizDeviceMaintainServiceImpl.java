package com.ruoyi.system.service.impl;

import java.util.List;

import com.ruoyi.system.domain.DataEnity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.BizDeviceMaintainMapper;
import com.ruoyi.system.domain.BizDeviceMaintain;
import com.ruoyi.system.service.IBizDeviceMaintainService;
import com.ruoyi.common.core.text.Convert;

/**
 * 设备维护 服务层实现
 * 
 * @author ruoyi
 * @date 2019-12-16
 */
@Service
public class BizDeviceMaintainServiceImpl implements IBizDeviceMaintainService 
{
	@Autowired
	private BizDeviceMaintainMapper bizDeviceMaintainMapper;

	/**
     * 查询设备维护信息
     * 
     * @param maintainId 设备维护ID
     * @return 设备维护信息
     */
    @Override
	public BizDeviceMaintain selectBizDeviceMaintainById(Long maintainId)
	{
	    return bizDeviceMaintainMapper.selectBizDeviceMaintainById(maintainId);
	}
	
	/**
     * 查询设备维护列表
     * 
     * @param bizDeviceMaintain 设备维护信息
     * @return 设备维护集合
     */
	@Override
	public List<BizDeviceMaintain> selectBizDeviceMaintainList(BizDeviceMaintain bizDeviceMaintain)
	{
	    return bizDeviceMaintainMapper.selectBizDeviceMaintainList(bizDeviceMaintain);
	}
	
    /**
     * 新增设备维护
     * 
     * @param bizDeviceMaintain 设备维护信息
     * @return 结果
     */
	@Override
	public int insertBizDeviceMaintain(BizDeviceMaintain bizDeviceMaintain)
	{
	    return bizDeviceMaintainMapper.insertBizDeviceMaintain(bizDeviceMaintain);
	}
	
	/**
     * 修改设备维护
     * 
     * @param bizDeviceMaintain 设备维护信息
     * @return 结果
     */
	@Override
	public int updateBizDeviceMaintain(BizDeviceMaintain bizDeviceMaintain)
	{
	    return bizDeviceMaintainMapper.updateBizDeviceMaintain(bizDeviceMaintain);
	}

	/**
     * 删除设备维护对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	@Override
	public int deleteBizDeviceMaintainByIds(String ids)
	{
		return bizDeviceMaintainMapper.deleteBizDeviceMaintainByIds(Convert.toStrArray(ids));
	}


	public List<DataEnity> getMaintainTotal(){
		return bizDeviceMaintainMapper.getMaintainTotal();

	}
}
