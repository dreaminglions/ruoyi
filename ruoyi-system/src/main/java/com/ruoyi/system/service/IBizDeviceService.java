package com.ruoyi.system.service;

import com.ruoyi.system.domain.BizDevice;
import com.ruoyi.system.domain.BizWaterWork;
import com.ruoyi.system.domain.DataEnity;

import java.util.List;

/**
 * 设备 服务层
 * 
 * @author ruoyi
 * @date 2019-12-02
 */
public interface IBizDeviceService 
{
	/**
     * 查询设备信息
     * 
     * @param deviceId 设备ID
     * @return 设备信息
     */
	public BizDevice selectBizDeviceById(Long deviceId);

	public BizDevice selectBizDeviceByWork(Long workId);

	/**
	 * 查询只符合设备类型列表
	 *
	 * @param bizDevice 设备信息
	 * @return 设备集合
	 */
	public List<BizDevice> selectOnlydeviceList(BizDevice bizDevice);
	
	/**
     * 查询设备列表
     * 
     * @param bizDevice 设备信息
     * @return 设备集合
     */
	public List<BizDevice> selectBizDeviceList(BizDevice bizDevice);

	/**
	 * 查询可以维护的设备列表
	 *
	 * @param bizDevice 设备信息
	 * @return 设备集合
	 */
	public List<BizDevice> selectBizDeviceMaintainList(BizDevice bizDevice);
	
	/**
     * 新增设备
     * 
     * @param bizDevice 设备信息
     * @return 结果
     */
	public int insertBizDevice(BizDevice bizDevice);
	
	/**
     * 修改设备
     * 
     * @param bizDevice 设备信息
     * @return 结果
     */
	public int updateBizDevice(BizDevice bizDevice);
		
	/**
     * 删除设备信息
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	public int deleteBizDeviceByIds(String ids);

	public List<DataEnity> getDeviceTotal();
}
