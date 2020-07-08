package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.BizResultAlterMapper;
import com.ruoyi.system.domain.BizResultAlter;
import com.ruoyi.system.service.IBizResultAlterService;
import com.ruoyi.common.core.text.Convert;

/**
 * 化验结果修改 服务层实现
 * 
 * @author ruoyi
 * @date 2019-12-16
 */
@Service
public class BizResultAlterServiceImpl implements IBizResultAlterService 
{
	@Autowired
	private BizResultAlterMapper bizResultAlterMapper;

	/**
     * 查询化验结果修改信息
     * 
     * @param alterId 化验结果修改ID
     * @return 化验结果修改信息
     */
    @Override
	public BizResultAlter selectBizResultAlterById(Long alterId)
	{
	    return bizResultAlterMapper.selectBizResultAlterById(alterId);
	}
	
	/**
     * 查询化验结果修改列表
     * 
     * @param bizResultAlter 化验结果修改信息
     * @return 化验结果修改集合
     */
	@Override
	public List<BizResultAlter> selectBizResultAlterList(BizResultAlter bizResultAlter)
	{
	    return bizResultAlterMapper.selectBizResultAlterList(bizResultAlter);
	}
	
    /**
     * 新增化验结果修改
     * 
     * @param bizResultAlter 化验结果修改信息
     * @return 结果
     */
	@Override
	public int insertBizResultAlter(BizResultAlter bizResultAlter)
	{
	    return bizResultAlterMapper.insertBizResultAlter(bizResultAlter);
	}
	
	/**
     * 修改化验结果修改
     * 
     * @param bizResultAlter 化验结果修改信息
     * @return 结果
     */
	@Override
	public int updateBizResultAlter(BizResultAlter bizResultAlter)
	{
	    return bizResultAlterMapper.updateBizResultAlter(bizResultAlter);
	}

	/**
     * 删除化验结果修改对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	@Override
	public int deleteBizResultAlterByIds(String ids)
	{
		return bizResultAlterMapper.deleteBizResultAlterByIds(Convert.toStrArray(ids));
	}
	
}
