package com.ruoyi.system.service.impl;

import java.util.List;

import com.ruoyi.system.domain.DataEnity;
import com.ruoyi.system.domain.OutDataEnity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.BizAssayResultMapper;
import com.ruoyi.system.domain.BizAssayResult;
import com.ruoyi.system.service.IBizAssayResultService;
import com.ruoyi.common.core.text.Convert;

/**
 * 化验结果 服务层实现
 * 
 * @author ruoyi
 * @date 2019-11-29
 */
@Service
public class BizAssayResultServiceImpl implements IBizAssayResultService 
{
	@Autowired
	private BizAssayResultMapper bizAssayResultMapper;

	/**
     * 查询化验结果信息
     * 
     * @param resultId 化验结果ID
     * @return 化验结果信息
     */
    @Override
	public BizAssayResult selectBizAssayResultById(Long resultId)
	{
	    return bizAssayResultMapper.selectBizAssayResultById(resultId);
	}

	public BizAssayResult selectBizAssayResultByReportId(String reportId)
	{
		return bizAssayResultMapper.selectBizAssayResultByReportId(reportId);
	}

	public BizAssayResult selectBizAssayResultByNo(String resultNo)
	{
		return bizAssayResultMapper.selectBizAssayResultByNo(resultNo);
	}
	
	/**
     * 查询化验结果列表
     * 
     * @param bizAssayResult 化验结果信息
     * @return 化验结果集合
     */
	@Override
	public List<BizAssayResult> selectBizAssayResultList(BizAssayResult bizAssayResult)
	{
	    return bizAssayResultMapper.selectBizAssayResultList(bizAssayResult);
	}
	
    /**
     * 新增化验结果
     * 
     * @param bizAssayResult 化验结果信息
     * @return 结果
     */
	@Override
	public int insertBizAssayResult(BizAssayResult bizAssayResult)
	{
	    return bizAssayResultMapper.insertBizAssayResult(bizAssayResult);
	}
	
	/**
     * 修改化验结果
     * 
     * @param bizAssayResult 化验结果信息
     * @return 结果
     */
	@Override
	public int updateBizAssayResult(BizAssayResult bizAssayResult)
	{
	    return bizAssayResultMapper.updateBizAssayResult(bizAssayResult);
	}

	/**
     * 删除化验结果对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	@Override
	public int deleteBizAssayResultByIds(String ids)
	{
		return bizAssayResultMapper.deleteBizAssayResultByIds(Convert.toStrArray(ids));
	}

	@Override
	public List<DataEnity> getAssayTotal(){
		return bizAssayResultMapper.getAssayTotal();
	}

	@Override
	public List<BizAssayResult> getAssayByWorkTime(Long waterValue,String timeValue){
		return bizAssayResultMapper.getAssayByWorkTime(waterValue,timeValue);
	};

	@Override
	public OutDataEnity getOuaData(Long workId, String startTime, String endTime){
		return bizAssayResultMapper.getOuaData( workId, startTime, endTime);
	};
}
