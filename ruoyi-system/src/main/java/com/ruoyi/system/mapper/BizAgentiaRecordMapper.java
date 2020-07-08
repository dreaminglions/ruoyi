package com.ruoyi.system.mapper;

import com.ruoyi.system.domain.BizAgentiaRecord;
import com.ruoyi.system.domain.DataEnity;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 化验药剂记录 数据层
 * 
 * @author ruoyi
 * @date 2020-03-10
 */
public interface BizAgentiaRecordMapper 
{
	/**
     * 查询化验药剂记录信息
     * 
     * @param recordId 化验药剂记录ID
     * @return 化验药剂记录信息
     */
	public BizAgentiaRecord selectBizAgentiaRecordById(Long recordId);
	
	/**
     * 查询化验药剂记录列表
     * 
     * @param bizAgentiaRecord 化验药剂记录信息
     * @return 化验药剂记录集合
     */
	public List<BizAgentiaRecord> selectBizAgentiaRecordList(BizAgentiaRecord bizAgentiaRecord);
	
	/**
     * 新增化验药剂记录
     * 
     * @param bizAgentiaRecord 化验药剂记录信息
     * @return 结果
     */
	public int insertBizAgentiaRecord(BizAgentiaRecord bizAgentiaRecord);
	
	/**
     * 修改化验药剂记录
     * 
     * @param bizAgentiaRecord 化验药剂记录信息
     * @return 结果
     */
	public int updateBizAgentiaRecord(BizAgentiaRecord bizAgentiaRecord);
	
	/**
     * 删除化验药剂记录
     * 
     * @param recordId 化验药剂记录ID
     * @return 结果
     */
	public int deleteBizAgentiaRecordById(Long recordId);
	
	/**
     * 批量删除化验药剂记录
     * 
     * @param recordIds 需要删除的数据ID
     * @return 结果
     */
	public int deleteBizAgentiaRecordByIds(String[] recordIds);

	public List<DataEnity> getAgentiaTotal(@Param(value="assayId") String assayId, @Param(value="worksId")  Long worksId);
	public List<DataEnity> getAgentiaMonthAvg(@Param(value="worksId") Long worksId,@Param(value="month") String timeValue);
}