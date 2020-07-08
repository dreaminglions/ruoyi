package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.BizAssayScopeMapper;
import com.ruoyi.system.domain.BizAssayScope;
import com.ruoyi.system.service.IBizAssayScopeService;
import com.ruoyi.common.core.text.Convert;

/**
 * 化验数据范围 服务层实现
 * 
 * @author ruoyi
 * @date 2020-05-15
 */
@Service
public class BizAssayScopeServiceImpl implements IBizAssayScopeService 
{
	@Autowired
	private BizAssayScopeMapper bizAssayScopeMapper;

	/**
     * 查询化验数据范围信息
     * 
     * @param scopeId 化验数据范围ID
     * @return 化验数据范围信息
     */
    @Override
	public BizAssayScope selectBizAssayScopeById(Long scopeId)
	{
	    return bizAssayScopeMapper.selectBizAssayScopeById(scopeId);
	}
	
	/**
     * 查询化验数据范围列表
     * 
     * @param bizAssayScope 化验数据范围信息
     * @return 化验数据范围集合
     */
	@Override
	public List<BizAssayScope> selectBizAssayScopeList(BizAssayScope bizAssayScope)
	{
	    return bizAssayScopeMapper.selectBizAssayScopeList(bizAssayScope);
	}
	
    /**
     * 新增化验数据范围
     * 
     * @param bizAssayScope 化验数据范围信息
     * @return 结果
     */
	@Override
	public int insertBizAssayScope(BizAssayScope bizAssayScope)
	{
	    return bizAssayScopeMapper.insertBizAssayScope(bizAssayScope);
	}
	
	/**
     * 修改化验数据范围
     * 
     * @param bizAssayScope 化验数据范围信息
     * @return 结果
     */
	@Override
	public int updateBizAssayScope(BizAssayScope bizAssayScope)
	{
	    return bizAssayScopeMapper.updateBizAssayScope(bizAssayScope);
	}

	/**
     * 删除化验数据范围对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	@Override
	public int deleteBizAssayScopeByIds(String ids)
	{
		return bizAssayScopeMapper.deleteBizAssayScopeByIds(Convert.toStrArray(ids));
	}
	
}
