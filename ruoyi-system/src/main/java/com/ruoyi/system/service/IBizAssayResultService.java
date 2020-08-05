package com.ruoyi.system.service;

import com.ruoyi.system.domain.BizAssayResult;
import com.ruoyi.system.domain.DataEnity;
import com.ruoyi.system.domain.OutDataEnity;

import java.util.List;

/**
 * 化验结果 服务层
 * 
 * @author ruoyi
 * @date 2019-11-29
 */
public interface IBizAssayResultService 
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
     * 删除化验结果信息
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	public int deleteBizAssayResultByIds(String ids);

	public List<DataEnity> getAssayTotal();

	public List<BizAssayResult> getAssayByWorkTime(Long waterValue,String timeValue);

}
