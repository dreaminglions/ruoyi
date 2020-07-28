package com.ruoyi.system.service.impl;

import com.ruoyi.common.core.text.Convert;
import com.ruoyi.system.domain.AssaySample;
import com.ruoyi.system.mapper.AssaySampleMapper;
import com.ruoyi.system.service.IAssaySampleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 化验样品 服务层实现
 * 
 * @author ruoyi
 * @date 2019-11-29
 */
@Service
public class AssaySampleServiceImpl implements IAssaySampleService
{
	@Autowired
	private AssaySampleMapper assaySampleMapper;

	/**
     * 查询化验样品信息
     * 
     * @param sampleId 化验样品ID
     * @return 化验样品信息
     */
    @Override
	public AssaySample selectAssaySampleById(Long sampleId)
	{
	    return assaySampleMapper.selectAssaySampleById(sampleId);
	}

	public AssaySample selectAssaySampleByAssayNo(String assayNo)
	{
		return assaySampleMapper.selectAssaySampleByAssayNo(assayNo);
	}


	/**
     * 查询化验样品列表
     * 
     * @param assaySample 化验样品信息
     * @return 化验样品集合
     */
	@Override
	public List<AssaySample> selectAssaySampleList(AssaySample assaySample)
	{
	    return assaySampleMapper.selectAssaySampleList(assaySample);
	}
	
    /**
     * 新增化验样品
     * 
     * @param assaySample 化验样品信息
     * @return 样品
     */
	@Override
	public int insertAssaySample(AssaySample assaySample)
	{
	    return assaySampleMapper.insertAssaySample(assaySample);
	}
	
	/**
     * 修改化验样品
     * 
     * @param assaySample 化验样品信息
     * @return 样品
     */
	@Override
	public int updateAssaySample(AssaySample assaySample)
	{
	    return assaySampleMapper.updateAssaySample(assaySample);
	}

	/**
     * 删除化验样品对象
     * 
     * @param sampleIds 需要删除的数据ID
     * @return 样品
     */
	@Override
	public int deleteAssaySampleByIds(String sampleIds)
	{
		return assaySampleMapper.deleteAssaySampleByIds(Convert.toStrArray(sampleIds));
	}

	@Override
	public int deleteByAssaySample(String assayNo,String sampleNo)
	{
		return assaySampleMapper.deleteByAssaySample(assayNo,sampleNo);
	}

	@Override
	public List<AssaySample> getSampleByAssayno(String assayNo)
	{
		return assaySampleMapper.getSampleByAssayno(assayNo);
	}
}
