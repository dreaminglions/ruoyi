package com.ruoyi.system.service;

import com.ruoyi.system.domain.BizDeviceMaintain;
import com.ruoyi.system.domain.DataEnity;

import java.util.List;

/**
 * 设备维护 服务层
 * 
 * @author ruoyi
 * @date 2019-12-16
 */
public interface IBizDeviceMaintainService 
{
	/**
     * 查询设备维护信息
     * 
     * @param maintainId 设备维护ID
     * @return 设备维护信息
     */
	public BizDeviceMaintain selectBizDeviceMaintainById(Long maintainId);
	
	/**
     * 查询设备维护列表
     * 
     * @param bizDeviceMaintain 设备维护信息
     * @return 设备维护集合
     */
	public List<BizDeviceMaintain> selectBizDeviceMaintainList(BizDeviceMaintain bizDeviceMaintain);
	
	/**
     * 新增设备维护
     * 
     * @param bizDeviceMaintain 设备维护信息
     * @return 结果
     */
	public int insertBizDeviceMaintain(BizDeviceMaintain bizDeviceMaintain);
	
	/**
     * 修改设备维护
     * 
     * @param bizDeviceMaintain 设备维护信息
     * @return 结果
     */
	public int updateBizDeviceMaintain(BizDeviceMaintain bizDeviceMaintain);
		
	/**
     * 删除设备维护信息
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	public int deleteBizDeviceMaintainByIds(String ids);

	public List<DataEnity> getMaintainTotal();
	
}
