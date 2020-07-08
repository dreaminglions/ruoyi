package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.BizAgentiaContrastMapper;
import com.ruoyi.system.domain.BizAgentiaContrast;
import com.ruoyi.system.service.IBizAgentiaContrastService;
import com.ruoyi.common.core.text.Convert;

/**
 * 药剂名称对照 服务层实现
 * 
 * @author ruoyi
 * @date 2020-04-22
 */
@Service
public class BizAgentiaContrastServiceImpl implements IBizAgentiaContrastService 
{
	@Autowired
	private BizAgentiaContrastMapper bizAgentiaContrastMapper;

	/**
     * 查询药剂名称对照信息
     * 
     * @param contrastId 药剂名称对照ID
     * @return 药剂名称对照信息
     */
    @Override
	public BizAgentiaContrast selectBizAgentiaContrastById(Long contrastId)
	{
	    return bizAgentiaContrastMapper.selectBizAgentiaContrastById(contrastId);
	}
	
	/**
     * 查询药剂名称对照列表
     * 
     * @param bizAgentiaContrast 药剂名称对照信息
     * @return 药剂名称对照集合
     */
	@Override
	public List<BizAgentiaContrast> selectBizAgentiaContrastList(BizAgentiaContrast bizAgentiaContrast)
	{
	    return bizAgentiaContrastMapper.selectBizAgentiaContrastList(bizAgentiaContrast);
	}
	
    /**
     * 新增药剂名称对照
     * 
     * @param bizAgentiaContrast 药剂名称对照信息
     * @return 结果
     */
	@Override
	public int insertBizAgentiaContrast(BizAgentiaContrast bizAgentiaContrast)
	{
	    return bizAgentiaContrastMapper.insertBizAgentiaContrast(bizAgentiaContrast);
	}
	
	/**
     * 修改药剂名称对照
     * 
     * @param bizAgentiaContrast 药剂名称对照信息
     * @return 结果
     */
	@Override
	public int updateBizAgentiaContrast(BizAgentiaContrast bizAgentiaContrast)
	{
	    return bizAgentiaContrastMapper.updateBizAgentiaContrast(bizAgentiaContrast);
	}

	/**
     * 删除药剂名称对照对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	@Override
	public int deleteBizAgentiaContrastByIds(String ids)
	{
		return bizAgentiaContrastMapper.deleteBizAgentiaContrastByIds(Convert.toStrArray(ids));
	}
	
}
