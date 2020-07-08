package com.ruoyi.system.mapper;

import com.ruoyi.system.domain.BizDevice;
import com.ruoyi.system.domain.DataEnity;

import java.util.List;

/**
 * 设备 数据层
 * 
 * @author ruoyi
 * @date 2019-12-02
 */
public interface BizDeviceMapper 
{
	/**
     * 查询设备信息
     * 
     * @param deviceId 设备ID
     * @return 设备信息
     */
	public BizDevice selectBizDeviceById(Long deviceId);

	public BizDevice selectBizDeviceByNo(String deviceNo);

	public BizDevice selectBizDeviceByWork(Long workId);

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
     * 删除设备
     * 
     * @param deviceId 设备ID
     * @return 结果
     */
	public int deleteBizDeviceById(Long deviceId);
	
	/**
     * 批量删除设备
     * 
     * @param deviceIds 需要删除的数据ID
     * @return 结果
     */
	public int deleteBizDeviceByIds(String[] deviceIds);

	public List<DataEnity> getDeviceTotal();
}