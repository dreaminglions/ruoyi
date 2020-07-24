package com.ruoyi.system.service.impl;

import com.ruoyi.common.core.text.Convert;
import com.ruoyi.system.domain.AssayResult;
import com.ruoyi.system.domain.BizAssay;
import com.ruoyi.system.mapper.AssayResultMapper;
import com.ruoyi.system.mapper.BizAssayMapper;
import com.ruoyi.system.mapper.BizAssayResultMapper;
import com.ruoyi.system.service.IAssayResultService;
import com.ruoyi.system.service.IBizAssayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 化验结果 服务层实现
 * 
 * @author ruoyi
 * @date 2019-11-29
 */
@Service
public class AssayResultServiceImpl implements IAssayResultService
{
	@Autowired
	private AssayResultMapper assayResultMapper;

	/**
     * 查询化验结果信息
     * 
     * @param resultId 化验结果ID
     * @return 化验结果信息
     */
    @Override
	public AssayResult selectAssayResultById(Long resultId)
	{
	    return assayResultMapper.selectAssayResultById(resultId);
	}

	public AssayResult selectAssayResultByAssayNo(String assayNo)
	{
		return assayResultMapper.selectAssayResultByAssayNo(assayNo);
	}


	/**
     * 查询化验结果列表
     * 
     * @param assayResult 化验结果信息
     * @return 化验结果集合
     */
	@Override
	public List<AssayResult> selectAssayResultList(AssayResult assayResult)
	{
	    return assayResultMapper.selectAssayResultList(assayResult);
	}
	
    /**
     * 新增化验结果
     * 
     * @param assayResult 化验结果信息
     * @return 结果
     */
	@Override
	public int insertAssayResult(AssayResult assayResult)
	{
	    return assayResultMapper.insertAssayResult(assayResult);
	}
	
	/**
     * 修改化验结果
     * 
     * @param assayResult 化验结果信息
     * @return 结果
     */
	@Override
	public int updateAssayResult(AssayResult assayResult)
	{
	    return assayResultMapper.updateAssayResult(assayResult);
	}

	/**
     * 删除化验结果对象
     * 
     * @param resultIds 需要删除的数据ID
     * @return 结果
     */
	@Override
	public int deleteAssayResultByIds(String resultIds)
	{
		return assayResultMapper.deleteAssayResultByIds(Convert.toStrArray(resultIds));
	}
}
