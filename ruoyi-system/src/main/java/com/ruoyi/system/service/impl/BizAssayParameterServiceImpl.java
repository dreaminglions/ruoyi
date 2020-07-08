package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.BizAssayParameterMapper;
import com.ruoyi.system.domain.BizAssayParameter;
import com.ruoyi.system.service.IBizAssayParameterService;
import com.ruoyi.common.core.text.Convert;

/**
 * 化验校准曲线 服务层实现
 * 
 * @author ruoyi
 * @date 2020-06-03
 */
@Service
public class BizAssayParameterServiceImpl implements IBizAssayParameterService 
{
	@Autowired
	private BizAssayParameterMapper bizAssayParameterMapper;

	/**
     * 查询化验校准曲线信息
     * 
     * @param parameterId 化验校准曲线ID
     * @return 化验校准曲线信息
     */
    @Override
	public BizAssayParameter selectBizAssayParameterById(Long parameterId)
	{
	    return bizAssayParameterMapper.selectBizAssayParameterById(parameterId);
	}
	
	/**
     * 查询化验校准曲线列表
     * 
     * @param bizAssayParameter 化验校准曲线信息
     * @return 化验校准曲线集合
     */
	@Override
	public List<BizAssayParameter> selectBizAssayParameterList(BizAssayParameter bizAssayParameter)
	{
	    return bizAssayParameterMapper.selectBizAssayParameterList(bizAssayParameter);
	}
	
    /**
     * 新增化验校准曲线
     * 
     * @param bizAssayParameter 化验校准曲线信息
     * @return 结果
     */
	@Override
	public int insertBizAssayParameter(BizAssayParameter bizAssayParameter)
	{
	    return bizAssayParameterMapper.insertBizAssayParameter(bizAssayParameter);
	}
	
	/**
     * 修改化验校准曲线
     * 
     * @param bizAssayParameter 化验校准曲线信息
     * @return 结果
     */
	@Override
	public int updateBizAssayParameter(BizAssayParameter bizAssayParameter)
	{
	    return bizAssayParameterMapper.updateBizAssayParameter(bizAssayParameter);
	}

	/**
     * 删除化验校准曲线对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	@Override
	public int deleteBizAssayParameterByIds(String ids)
	{
		return bizAssayParameterMapper.deleteBizAssayParameterByIds(Convert.toStrArray(ids));
	}
	
}
