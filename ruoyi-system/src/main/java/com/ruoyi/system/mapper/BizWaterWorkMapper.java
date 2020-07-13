package com.ruoyi.system.mapper;

import com.ruoyi.system.domain.BizWaterWork;
import com.ruoyi.system.domain.WeatherEnity;

import java.util.List;

/**
 * 水厂 数据层
 * 
 * @author ruoyi
 * @date 2020-02-24
 */
public interface BizWaterWorkMapper 
{
	/**
     * 查询水厂信息
     * 
     * @param worksId 水厂ID
     * @return 水厂信息
     */
	public BizWaterWork selectBizWaterWorkById(Long worksId);

	public BizWaterWork  selectBizWaterWorkByNo(String  worksNo);
	
	/**
     * 查询水厂列表
     * 
     * @param bizWaterWork 水厂信息
     * @return 水厂集合
     */
	public List<BizWaterWork> selectBizWaterWorkList(BizWaterWork bizWaterWork);

	/**
	 * 查询只符合水厂类型列表
	 *
	 * @param bizWaterWork 水厂信息
	 * @return 水厂集合
	 */
	public List<BizWaterWork> selectOnlyWorkList(BizWaterWork bizWaterWork);

	/**
     * 新增水厂
     * 
     * @param bizWaterWork 水厂信息
     * @return 结果
     */
	public int insertBizWaterWork(BizWaterWork bizWaterWork);
	
	/**
     * 修改水厂
     * 
     * @param bizWaterWork 水厂信息
     * @return 结果
     */
	public int updateBizWaterWork(BizWaterWork bizWaterWork);
	
	/**
     * 删除水厂
     * 
     * @param worksId 水厂ID
     * @return 结果
     */
	public int deleteBizWaterWorkById(Long worksId);
	
	/**
     * 批量删除水厂
     * 
     * @param worksIds 需要删除的数据ID
     * @return 结果
     */
	public int deleteBizWaterWorkByIds(String[] worksIds);

	/**
	 * 根据角色ID查询部门
	 *
	 * @param roleId 角色ID
	 * @return 部门列表
	 */
	public List<String> selectRoleWorkTree(Long roleId);

	public List<BizWaterWork> selectRoleWork(Long roleId);

	public List<WeatherEnity> selectWorksCode();
}