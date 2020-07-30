package com.ruoyi.system.mapper;

import com.ruoyi.system.domain.AssayFault;
import com.ruoyi.system.domain.AssayFaultInfo;

import java.util.List;

/**
 * 故障 数据层
 * 
 * @author ruoyi
 * @date 2019-12-14
 */
public interface AssayFaultInfoMapper
{
	/**
     * 查询故障信息
     * 
     * @param infoId 故障ID
     * @return 故障信息
     */
	public AssayFaultInfo selectAssayFaultInfoById(Long infoId);
	
	/**
     * 查询故障列表
     * 
     * @param assayFaultInfo 故障信息
     * @return 故障集合
     */
	public List<AssayFaultInfo> selectAssayFaultInfoList(AssayFaultInfo assayFaultInfo);

	public List<AssayFaultInfo> selectAssayFaultInfoByFaultCode(String faultCode);
	
	/**
     * 新增故障
     * 
     * @param assayFaultInfo 故障信息
     * @return 结果
     */
	public int insertAssayFaultInfo(AssayFaultInfo assayFaultInfo);
	
	/**
     * 修改故障
     * 
     * @param assayFaultInfo 故障信息
     * @return 结果
     */
	public int updateAssayFaultInfo(AssayFaultInfo assayFaultInfo);
	
	/**
     * 删除故障
     * 
     * @param infoId 故障ID
     * @return 结果
     */
	public int deleteAssayFaultInfoById(Long infoId);

	/**
     * 批量删除故障
     * 
     * @param infoIds 需要删除的数据ID
     * @return 结果
     */
	public int deleteAssayFaultInfoByIds(String[] infoIds);


}