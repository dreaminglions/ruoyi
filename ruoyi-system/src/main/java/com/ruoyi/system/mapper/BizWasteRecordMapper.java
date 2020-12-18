package com.ruoyi.system.mapper;

import com.ruoyi.system.domain.BizAgentiaRecord;
import com.ruoyi.system.domain.BizWasteRecord;
import com.ruoyi.system.domain.DataEnity;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 化验废液记录 数据层
 * 
 * @author ruoyi
 * @date 2020-03-10
 */
public interface BizWasteRecordMapper
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
     * 删除化验废液记录
     *
     * @param recordId 化验废液记录ID
     * @return 结果
     */
	public int deleteBizWasteRecordById(Long recordId);

	/**
     * 批量删除化验废液记录
     *
     * @param recordIds 需要删除的数据ID
     * @return 结果
     */
	public int deleteBizWasteRecordByIds(String[] recordIds);

	public List<DataEnity> getWasteTotal(@Param(value = "assayId") String assayId, @Param(value = "worksId") Long worksId);
	public List<DataEnity> getWasteMonthAvg(@Param(value = "worksId") Long worksId, @Param(value = "month") String timeValue);
}