package com.ruoyi.system.service;

import com.ruoyi.system.domain.BizAssayScope;
import java.util.List;

/**
 * 化验数据范围 服务层
 * 
 * @author ruoyi
 * @date 2020-05-15
 */
public interface IBizAssayScopeService 
{
	/**
     * 查询化验数据范围信息
     * 
     * @param scopeId 化验数据范围ID
     * @return 化验数据范围信息
     */
	public BizAssayScope selectBizAssayScopeById(Long scopeId);
	
	/**
     * 查询化验数据范围列表
     * 
     * @param bizAssayScope 化验数据范围信息
     * @return 化验数据范围集合
     */
	public List<BizAssayScope> selectBizAssayScopeList(BizAssayScope bizAssayScope);
	
	/**
     * 新增化验数据范围
     * 
     * @param bizAssayScope 化验数据范围信息
     * @return 结果
     */
	public int insertBizAssayScope(BizAssayScope bizAssayScope);
	
	/**
     * 修改化验数据范围
     * 
     * @param bizAssayScope 化验数据范围信息
     * @return 结果
     */
	public int updateBizAssayScope(BizAssayScope bizAssayScope);
		
	/**
     * 删除化验数据范围信息
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	public int deleteBizAssayScopeByIds(String ids);
	
}
