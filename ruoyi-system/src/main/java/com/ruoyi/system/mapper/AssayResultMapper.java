package com.ruoyi.system.mapper;

import com.ruoyi.system.domain.AssayItem;
import com.ruoyi.system.domain.AssayResult;
import com.ruoyi.system.domain.BizAssay;
import com.ruoyi.system.domain.OutDataEnity;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 化验结果 数据层
 * 
 * @author ruoyi
 * @date 2019-11-29
 */
public interface AssayResultMapper
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
     * 删除化验结果
     *
     * @param assayId 化验结果ID
     * @return 结果
     */
	public int deleteAssayResultById(Long assayId);

	/**
     * 批量删除化验结果
     *
     * @param resultIds 需要删除的数据ID
     * @return 结果
     */
	public int deleteAssayResultByIds(String[] resultIds);

	public OutDataEnity getOuaData(@Param(value="workId") Long workId, @Param(value="startTime") String startTime, @Param(value="endTime") String endTime);

	public List<AssayItem> selectItemByAssayNo(String assayNo);

	public List<String> selectTypeByAssayNo(String assayNo);
}