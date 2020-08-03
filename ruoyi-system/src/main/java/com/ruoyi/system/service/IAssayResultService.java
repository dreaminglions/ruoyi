package com.ruoyi.system.service;

import com.ruoyi.system.domain.AssayResult;
import com.ruoyi.system.domain.BizAssay;

import java.util.List;

/**
 * 化验结果 服务层
 * 
 * @author ruoyi
 * @date 2019-11-29
 */
public interface IAssayResultService
{
	/**
     * 查询化验结果信息
     *
     * @param resultId 化验结果ID
     * @return 化验结果信息
     */
	public AssayResult selectAssayResultById(Long resultId);

	public List<AssayResult> selectAssayResultByAssayNo(String assayNo);

	/**
     * 查询化验结果列表
     *
     * @param assayResult 化验结果信息
     * @return 化验结果集合
     */
	public List<AssayResult> selectAssayResultList(AssayResult assayResult);

	/**
     * 新增化验结果
     *
     * @param assayResult 化验结果信息
     * @return 结果
     */
	public int insertAssayResult(AssayResult assayResult);

	/**
     * 修改化验结果
     *
     * @param assayResult 化验结果信息
     * @return 结果
     */
	public int updateAssayResult(AssayResult assayResult);

	/**
     * 删除化验结果信息
     *
     * @param resultIds 需要删除的数据ID
     * @return 结果
     */
	public int deleteAssayResultByIds(String resultIds);

}
