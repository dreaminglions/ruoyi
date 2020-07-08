package com.ruoyi.system.service;

import com.ruoyi.system.domain.BizAgentiaRecord;
import com.ruoyi.system.domain.DataEnity;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 化验药剂记录 服务层
 * 
 * @author ruoyi
 * @date 2020-03-10
 */
public interface IBizAgentiaRecordService 
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
     * 删除化验药剂记录信息
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	public int deleteBizAgentiaRecordByIds(String ids);

	public List<DataEnity> getAgentiaTotal(String assayId, Long worksId);
	public List<DataEnity> getAgentiaMonthAvg(Long worksId,String timeValue);
}
