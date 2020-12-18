package com.ruoyi.system.service.impl;

import com.ruoyi.common.core.text.Convert;
import com.ruoyi.system.domain.BizAgentiaRecord;
import com.ruoyi.system.domain.BizWasteRecord;
import com.ruoyi.system.domain.DataEnity;
import com.ruoyi.system.mapper.BizAgentiaRecordMapper;
import com.ruoyi.system.mapper.BizWasteRecordMapper;
import com.ruoyi.system.service.IBizAgentiaRecordService;
import com.ruoyi.system.service.IBizWasteRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 化验废液记录 服务层实现
 * 
 * @author ruoyi
 * @date 2020-03-10
 */
@Service
public class BizWasteRecordServiceImpl implements IBizWasteRecordService
{
	@Autowired
	private BizWasteRecordMapper bizWasteRecordMapper;

	/**
     * 查询化验废液记录信息
     * 
     * @param recordId 化验废液记录ID
     * @return 化验废液记录信息
     */
    @Override
	public BizWasteRecord selectBizWasteRecordById(Long recordId)
	{
	    return bizWasteRecordMapper.selectBizWasteRecordById(recordId);
	}
	
	/**
     * 查询化验废液记录列表
     * 
     * @param bizWasteRecord 化验废液记录信息
     * @return 化验废液记录集合
     */
	@Override
	public List<BizWasteRecord> selectBizWasteRecordList(BizWasteRecord bizWasteRecord)
	{
	    return bizWasteRecordMapper.selectBizWasteRecordList(bizWasteRecord);
	}
	
    /**
     * 新增化验废液记录
     * 
     * @param bizWasteRecord 化验废液记录信息
     * @return 结果
     */
	@Override
	public int insertBizWasteRecord(BizWasteRecord bizWasteRecord)
	{
	    return bizWasteRecordMapper.insertBizWasteRecord(bizWasteRecord);
	}
	
	/**
     * 修改化验废液记录
     * 
     * @param bizWasteRecord 化验废液记录信息
     * @return 结果
     */
	@Override
	public int updateBizWasteRecord(BizWasteRecord bizWasteRecord)
	{
	    return bizWasteRecordMapper.updateBizWasteRecord(bizWasteRecord);
	}

	/**
     * 删除化验废液记录对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	@Override
	public int deleteBizWasteRecordByIds(String ids)
	{
		return bizWasteRecordMapper.deleteBizWasteRecordByIds(Convert.toStrArray(ids));
	}

	@Override
	public List<DataEnity> getWasteTotal(String assayId, Long worksId)
	{
		return bizWasteRecordMapper.getWasteTotal(assayId,worksId);
	}

	@Override
	public List<DataEnity> getWasteMonthAvg(Long worksId,String timeValue)
	{
		return bizWasteRecordMapper.getWasteMonthAvg(worksId,timeValue);
	}
	
}
