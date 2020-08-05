package com.ruoyi.system.mapper;

import com.ruoyi.system.domain.BizAssayResult;
import com.ruoyi.system.domain.DataEnity;
import com.ruoyi.system.domain.OutDataEnity;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 化验结果 数据层
 * 
 * @author ruoyi
 * @date 2019-11-29
 */
public interface BizAssayResultMapper 
{
	/**
     * 查询化验结果信息
     * 
     * @param resultId 化验结果ID
     * @return 化验结果信息
     */
	public BizAssayResult selectBizAssayResultById(Long resultId);

	public BizAssayResult selectBizAssayResultByReportId(String reportId);

	public BizAssayResult selectBizAssayResultByNo(String resultNo);
	
	/**
     * 查询化验结果列表
     * 
     * @param bizAssayResult 化验结果信息
     * @return 化验结果集合
     */
	public List<BizAssayResult> selectBizAssayResultList(BizAssayResult bizAssayResult);
	
	/**
     * 新增化验结果
     * 
     * @param bizAssayResult 化验结果信息
     * @return 结果
     */
	public int insertBizAssayResult(BizAssayResult bizAssayResult);
	
	/**
     * 修改化验结果
     * 
     * @param bizAssayResult 化验结果信息
     * @return 结果
     */
	public int updateBizAssayResult(BizAssayResult bizAssayResult);
	
	/**
     * 删除化验结果
     * 
     * @param resultId 化验结果ID
     * @return 结果
     */
	public int deleteBizAssayResultById(Long resultId);
	
	/**
     * 批量删除化验结果
     * 
     * @param resultIds 需要删除的数据ID
     * @return 结果
     */
	public int deleteBizAssayResultByIds(String[] resultIds);

	public List<DataEnity> getAssayTotal();

	public List<BizAssayResult> getAssayByWorkTime(@Param(value="waterValue") Long waterValue,@Param(value="timeValue")  String timeValue);

}