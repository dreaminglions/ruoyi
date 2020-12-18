package com.ruoyi.system.service;

import com.ruoyi.system.domain.BizAgentiaRecord;
import com.ruoyi.system.domain.BizWasteRecord;
import com.ruoyi.system.domain.DataEnity;

import java.util.List;

/**
 * 化验废液记录 服务层
 * 
 * @author ruoyi
 * @date 2020-03-10
 */
public interface IBizWasteRecordService
{
	/**
     * 查询化验废液记录信息
     *
     * @param recordId 化验废液记录ID
     * @return 化验废液记录信息
     */
	public BizWasteRecord selectBizWasteRecordById(Long recordId);

	/**
     * 查询化验废液记录列表
     *
     * @param bizWasteRecord 化验废液记录信息
     * @return 化验废液记录集合
     */
	public List<BizWasteRecord> selectBizWasteRecordList(BizWasteRecord bizWasteRecord);

	/**
     * 新增化验废液记录
     *
     * @param bizWasteRecord 化验废液记录信息
     * @return 结果
     */
	public int insertBizWasteRecord(BizWasteRecord bizWasteRecord);

	/**
     * 修改化验废液记录
     *
     * @param bizWasteRecord 化验废液记录信息
     * @return 结果
     */
	public int updateBizWasteRecord(BizWasteRecord bizWasteRecord);

	/**
     * 删除化验废液记录信息
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	public int deleteBizWasteRecordByIds(String ids);

	public List<DataEnity> getWasteTotal(String assayId, Long worksId);
	public List<DataEnity> getWasteMonthAvg(Long worksId, String timeValue);
}
