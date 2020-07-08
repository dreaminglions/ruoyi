package com.ruoyi.system.mapper;

import com.ruoyi.system.domain.BizDeviceUnit;
import com.ruoyi.system.domain.DataEnity;

import java.util.List;

/**
 * 设备部件 数据层
 * 
 * @author ruoyi
 * @date 2019-12-14
 */
public interface BizDeviceUnitMapper 
{
	/**
     * 查询设备部件信息
     * 
     * @param unitId 设备部件ID
     * @return 设备部件信息
     */
	public BizDeviceUnit selectBizDeviceUnitById(Long unitId);
	
	/**
     * 查询设备部件列表
     * 
     * @param bizDeviceUnit 设备部件信息
     * @return 设备部件集合
     */
	public List<BizDeviceUnit> selectBizDeviceUnitList(BizDeviceUnit bizDeviceUnit);
	
	/**
     * 新增设备部件
     * 
     * @param bizDeviceUnit 设备部件信息
     * @return 结果
     */
	public int insertBizDeviceUnit(BizDeviceUnit bizDeviceUnit);
	
	/**
     * 修改设备部件
     * 
     * @param bizDeviceUnit 设备部件信息
     * @return 结果
     */
	public int updateBizDeviceUnit(BizDeviceUnit bizDeviceUnit);
	
	/**
     * 删除设备部件
     * 
     * @param unitId 设备部件ID
     * @return 结果
     */
	public int deleteBizDeviceUnitById(Long unitId);
	
	/**
     * 批量删除设备部件
     * 
     * @param unitIds 需要删除的数据ID
     * @return 结果
     */
	public int deleteBizDeviceUnitByIds(String[] unitIds);

	public List<DataEnity> getUnitNum(Long deviceId);
}