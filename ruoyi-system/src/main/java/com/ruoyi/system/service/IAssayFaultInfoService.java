package com.ruoyi.system.service;

import com.ruoyi.system.domain.AssayFault;
import com.ruoyi.system.domain.AssayFaultInfo;

import java.util.List;

/**
 * 故障 服务层
 * 
 * @author ruoyi
 * @date 2019-12-14
 */
public interface IAssayFaultInfoService
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


	public int deleteAssayFaultInfoById(Long infoId);
	/**
     * 删除故障信息
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	public int deleteAssayFaultInfoByIds(String ids);
	
}
