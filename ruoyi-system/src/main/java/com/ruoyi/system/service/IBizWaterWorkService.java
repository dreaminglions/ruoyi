package com.ruoyi.system.service;

import com.ruoyi.common.core.domain.Ztree;
import com.ruoyi.system.domain.BizWaterWork;
import com.ruoyi.system.domain.SysRole;
import com.ruoyi.system.domain.SysUser;
import com.ruoyi.system.domain.WeatherEnity;

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
	public int deleteBizWaterWorkByIds(String ids);

	/**
	 * 查询水厂管理树
	 *
	 * @param bizWaterWork 水厂信息
	 * @return 所有水厂信息
	 */
	public List<Ztree> selectWorksTree(BizWaterWork bizWaterWork);

	/**
	 * 根据角色ID查询菜单
	 *
	 * @param role 角色对象
	 * @return 菜单列表
	 */
	public List<Ztree> roleWorkTreeData(SysRole role, SysUser user);

	public List<WeatherEnity> selectWorksCode();
}
