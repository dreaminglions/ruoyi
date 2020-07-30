package com.ruoyi.system.service;

import com.ruoyi.system.domain.AssayFault;

import java.util.List;

/**
 * 故障 服务层
 * 
 * @author ruoyi
 * @date 2019-12-14
 */
public interface IAssayFaultService
{
	/**
     * 查询故障信息
     * 
     * @param faultId 故障ID
     * @return 故障信息
     */
	public AssayFault selectAssayFaultById(Long faultId);
	
	/**
     * 查询故障列表
     * 
     * @param assayFault 故障信息
     * @return 故障集合
     */
	public List<AssayFault> selectAssayFaultList(AssayFault assayFault);

	public List<AssayFault> selectAssayFaultByAssayNo(String assayNo);
	
	/**
     * 新增故障
     * 
     * @param assayFault 故障信息
     * @return 结果
     */
	public int insertAssayFault(AssayFault assayFault);
	
	/**
     * 修改故障
     * 
     * @param assayFault 故障信息
     * @return 结果
     */
	public int updateAssayFault(AssayFault assayFault);

	public int deleteAssayFaultById(Long faultId);
	/**
     * 删除故障信息
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	public int deleteAssayFaultByIds(String ids);
	
}
