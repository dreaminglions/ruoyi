package com.ruoyi.system.mapper;

import com.ruoyi.system.domain.BizScope;
import java.util.List;	

/**
 * 化验范围 数据层
 * 
 * @author ruoyi
 * @date 2020-05-15
 */
public interface BizScopeMapper 
{
	/**
     * 查询化验范围信息
     * 
     * @param scopeId 化验范围ID
     * @return 化验范围信息
     */
	public BizScope selectBizScopeById(Long scopeId);

	public BizScope selectBizScopeByWorks(Long scopeWorks);
	
	/**
     * 查询化验范围列表
     * 
     * @param bizScope 化验范围信息
     * @return 化验范围集合
     */
	public List<BizScope> selectBizScopeList(BizScope bizScope);
	
	/**
     * 新增化验范围
     * 
     * @param bizScope 化验范围信息
     * @return 结果
     */
	public int insertBizScope(BizScope bizScope);
	
	/**
     * 修改化验范围
     * 
     * @param bizScope 化验范围信息
     * @return 结果
     */
	public int updateBizScope(BizScope bizScope);
	
	/**
     * 删除化验范围
     * 
     * @param scopeId 化验范围ID
     * @return 结果
     */
	public int deleteBizScopeById(Long scopeId);
	
	/**
     * 批量删除化验范围
     * 
     * @param scopeIds 需要删除的数据ID
     * @return 结果
     */
	public int deleteBizScopeByIds(String[] scopeIds);
	
}