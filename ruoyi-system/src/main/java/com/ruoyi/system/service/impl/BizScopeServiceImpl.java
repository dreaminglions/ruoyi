package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.BizScopeMapper;
import com.ruoyi.system.domain.BizScope;
import com.ruoyi.system.service.IBizScopeService;
import com.ruoyi.common.core.text.Convert;

/**
 * 化验范围 服务层实现
 * 
 * @author ruoyi
 * @date 2020-05-15
 */
@Service
public class BizScopeServiceImpl implements IBizScopeService 
{
	@Autowired
	private BizScopeMapper bizScopeMapper;

	/**
     * 查询化验范围信息
     * 
     * @param scopeId 化验范围ID
     * @return 化验范围信息
     */
    @Override
	public BizScope selectBizScopeById(Long scopeId)
	{
	    return bizScopeMapper.selectBizScopeById(scopeId);
	}

	@Override
	public BizScope selectBizScopeByWorks(Long scopeWorks)
	{
		return bizScopeMapper.selectBizScopeByWorks(scopeWorks);
	}
	
	/**
     * 查询化验范围列表
     * 
     * @param bizScope 化验范围信息
     * @return 化验范围集合
     */
	@Override
	public List<BizScope> selectBizScopeList(BizScope bizScope)
	{
	    return bizScopeMapper.selectBizScopeList(bizScope);
	}
	
    /**
     * 新增化验范围
     * 
     * @param bizScope 化验范围信息
     * @return 结果
     */
	@Override
	public int insertBizScope(BizScope bizScope)
	{
	    return bizScopeMapper.insertBizScope(bizScope);
	}
	
	/**
     * 修改化验范围
     * 
     * @param bizScope 化验范围信息
     * @return 结果
     */
	@Override
	public int updateBizScope(BizScope bizScope)
	{
	    return bizScopeMapper.updateBizScope(bizScope);
	}

	/**
     * 删除化验范围对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	@Override
	public int deleteBizScopeByIds(String ids)
	{
		return bizScopeMapper.deleteBizScopeByIds(Convert.toStrArray(ids));
	}
	
}
