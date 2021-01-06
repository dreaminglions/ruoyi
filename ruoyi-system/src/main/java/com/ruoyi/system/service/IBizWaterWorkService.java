package com.ruoyi.system.service;

import com.ruoyi.common.core.domain.Ztree;
import com.ruoyi.system.domain.*;

import java.util.List;

/**
 * 水厂 服务层
 * 
 * @author ruoyi
 * @date 2020-02-24
 */
public interface IBizWaterWorkService 
{
	/**
     * 查询水厂信息
     * 
     * @param worksId 水厂ID
     * @return 水厂信息
     */
	public BizWaterWork selectBizWaterWorkById(Long worksId);
	
	/**
     * 查询水厂列表(集团+水厂)
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
     * 删除水厂信息
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	public int deleteBizWaterWorkByIds(Long ids);

	/**
	 * 查询水厂管理树
	 *
	 * @param bizWaterWork 水厂信息
	 * @return 所有水厂信息
	 */
	public List<Ztree> selectWorksTree(BizWaterWork bizWaterWork);

	/**
	 * 查询区域水厂管理树
	 *
	 * @param areaId 区域ID
	 * @return 所有机构树信息
	 */
	public List<Ztree> selectAreaWaterTree(Long areaId);

	/**
	 * 根据角色ID查询菜单
	 *
	 * @param role 角色对象
	 * @return 菜单列表
	 */
	public List<Ztree> roleWorkTreeData(SysRole role, SysUser user);

	public List<WeatherEnity> selectWorksCode();

	public List<DataEnity> selectProvWork();
}
