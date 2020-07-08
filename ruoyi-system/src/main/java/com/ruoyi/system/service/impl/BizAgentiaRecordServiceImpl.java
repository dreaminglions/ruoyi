package com.ruoyi.system.service.impl;

import java.util.List;

import com.ruoyi.system.domain.DataEnity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.BizAgentiaRecordMapper;
import com.ruoyi.system.domain.BizAgentiaRecord;
import com.ruoyi.system.service.IBizAgentiaRecordService;
import com.ruoyi.common.core.text.Convert;

/**
 * 化验药剂记录 服务层实现
 * 
 * @author ruoyi
 * @date 2020-03-10
 */
@Service
public class BizAgentiaRecordServiceImpl implements IBizAgentiaRecordService 
{
	@Autowired
	private BizAgentiaRecordMapper bizAgentiaRecordMapper;

	/**
     * 查询化验药剂记录信息
     * 
     * @param recordId 化验药剂记录ID
     * @return 化验药剂记录信息
     */
    @Override
	public BizAgentiaRecord selectBizAgentiaRecordById(Long recordId)
	{
	    return bizAgentiaRecordMapper.selectBizAgentiaRecordById(recordId);
	}
	
	/**
     * 查询化验药剂记录列表
     * 
     * @param bizAgentiaRecord 化验药剂记录信息
     * @return 化验药剂记录集合
     */
	@Override
	public List<BizAgentiaRecord> selectBizAgentiaRecordList(BizAgentiaRecord bizAgentiaRecord)
	{
	    return bizAgentiaRecordMapper.selectBizAgentiaRecordList(bizAgentiaRecord);
	}
	
    /**
     * 新增化验药剂记录
     * 
     * @param bizAgentiaRecord 化验药剂记录信息
     * @return 结果
     */
	@Override
	public int insertBizAgentiaRecord(BizAgentiaRecord bizAgentiaRecord)
	{
	    return bizAgentiaRecordMapper.insertBizAgentiaRecord(bizAgentiaRecord);
	}
	
	/**
     * 修改化验药剂记录
     * 
     * @param bizAgentiaRecord 化验药剂记录信息
     * @return 结果
     */
	@Override
	public int updateBizAgentiaRecord(BizAgentiaRecord bizAgentiaRecord)
	{
	    return bizAgentiaRecordMapper.updateBizAgentiaRecord(bizAgentiaRecord);
	}

	/**
     * 删除化验药剂记录对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	@Override
	public int deleteBizAgentiaRecordByIds(String ids)
	{
		return bizAgentiaRecordMapper.deleteBizAgentiaRecordByIds(Convert.toStrArray(ids));
	}

	public List<DataEnity> getAgentiaTotal(String assayId, Long worksId)
	{
		return bizAgentiaRecordMapper.getAgentiaTotal(assayId,worksId);
	}
	public List<DataEnity> getAgentiaMonthAvg(Long worksId,String timeValue)
	{
		return bizAgentiaRecordMapper.getAgentiaMonthAvg(worksId,timeValue);
	}
	
}
