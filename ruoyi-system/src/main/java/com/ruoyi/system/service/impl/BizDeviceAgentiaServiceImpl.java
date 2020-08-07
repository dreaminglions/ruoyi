package com.ruoyi.system.service.impl;

import com.ruoyi.common.annotation.DataScope;
import com.ruoyi.common.core.text.Convert;
import com.ruoyi.system.domain.BizAgentia;
import com.ruoyi.system.domain.BizDeviceAgentia;
import com.ruoyi.system.mapper.BizAgentiaMapper;
import com.ruoyi.system.mapper.BizDeviceAgentiaMapper;
import com.ruoyi.system.service.IBizDeviceAgentiaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 药剂 服务层实现
 * 
 * @author ruoyi
 * @date 2019-12-02
 */
@Service
public class BizDeviceAgentiaServiceImpl implements IBizDeviceAgentiaService
{
	@Autowired
	private BizDeviceAgentiaMapper bizAgentiaMapper;

	/**
	 * 查询设备药剂信息
	 *
	 * @param agentiaId 药剂ID
	 * @return 药剂信息
	 */
	public BizDeviceAgentia selectDeviceAgentiaById(Long agentiaId)
	{
		return bizAgentiaMapper.selectDeviceAgentiaById(agentiaId);
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
	public List<BizDeviceAgentia>  selectDeviceAgentiaList(BizDeviceAgentia bizAgentia)
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
	public int insertBizDeviceAgentia(BizDeviceAgentia bizAgentia)
	{
	    return bizAgentiaMapper.insertBizDeviceAgentia(bizAgentia);
	}
	
	/**
     * 修改药剂
     * 
     * @param bizAgentia 药剂信息
     * @return 结果
     */
	@Override
	public int updateBizAgentia(BizDeviceAgentia bizAgentia)
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
