package com.ruoyi.system.service.impl;

import java.util.List;

import com.ruoyi.common.annotation.DataScope;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.BizAgentiaMapper;
import com.ruoyi.system.domain.BizAgentia;
import com.ruoyi.system.service.IBizAgentiaService;
import com.ruoyi.common.core.text.Convert;

/**
 * 药剂 服务层实现
 * 
 * @author ruoyi
 * @date 2019-12-02
 */
@Service
public class BizAgentiaServiceImpl implements IBizAgentiaService 
{
	@Autowired
	private BizAgentiaMapper bizAgentiaMapper;

	/**
     * 查询集团/水厂药剂信息
     * 
     * @param agentiaId 药剂ID
     * @return 药剂信息
     */
    @Override
	public BizAgentia selectBizAgentiaById(Long agentiaId)
	{
	    return bizAgentiaMapper.selectBizAgentiaById(agentiaId);
	}

	/**
	 * 查询设备药剂信息
	 *
	 * @param agentiaId 药剂ID
	 * @return 药剂信息
	 */
	public BizAgentia selectDeviceAgentiaById(Long agentiaId)
	{
		return bizAgentiaMapper.selectDeviceAgentiaById(agentiaId);
	}
	
	/**
     * 查询药剂列表
     * 
     * @param bizAgentia 药剂信息
     * @return 药剂集合
     */
	@Override
	@DataScope(tableAlias = "w")
	public List<BizAgentia> selectBizAgentiaList(BizAgentia bizAgentia)
	{
	    return bizAgentiaMapper.selectBizAgentiaList(bizAgentia);
	}

	public List<BizAgentia> selectContrastList(BizAgentia bizAgentia)
	{
		return bizAgentiaMapper.selectContrastList(bizAgentia);
	}

	/**
	 * 查询设备药剂列表
	 *
	 * @param bizAgentia 药剂信息
	 * @return 药剂集合
	 */
	@Override
	@DataScope(tableAlias = "w")
	public List<BizAgentia>  selectDeviceAgentiaList(BizAgentia bizAgentia)
	{
		return bizAgentiaMapper.selectDeviceAgentiaList(bizAgentia);
	}
	
    /**
     * 新增药剂
     * 
     * @param bizAgentia 药剂信息
     * @return 结果
     */
	@Override
	public int insertBizAgentia(BizAgentia bizAgentia)
	{
	    return bizAgentiaMapper.insertBizAgentia(bizAgentia);
	}
	
	/**
     * 修改药剂
     * 
     * @param bizAgentia 药剂信息
     * @return 结果
     */
	@Override
	public int updateBizAgentia(BizAgentia bizAgentia)
	{
	    return bizAgentiaMapper.updateBizAgentia(bizAgentia);
	}

	/**
     * 删除药剂对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	@Override
	public int deleteBizAgentiaByIds(String ids)
	{
		return bizAgentiaMapper.deleteBizAgentiaByIds(Convert.toStrArray(ids));
	}
	
}
