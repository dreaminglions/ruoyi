package com.ruoyi.system.mapper;

import com.ruoyi.system.domain.*;
import com.ruoyi.system.domain.BizAssay;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 化验结果 数据层
 * 
 * @author ruoyi
 * @date 2019-11-29
 */
public interface BizAssayMapper
{
	/**
     * 查询化验结果信息
     *
     * @param assayId 化验结果ID
     * @return 化验结果信息
     */
	public BizAssay selectBizAssayById(Long assayId);

	public BizAssay selectBizAssayByAssayNo(String assayNo);


	/**
     * 查询化验结果列表
     *
     * @param bizAssay 化验结果信息
     * @return 化验结果集合
     */
	public List<BizAssay> selectBizAssayList(BizAssay bizAssay);

	/**
     * 新增化验结果
     *
     * @param bizAssay 化验结果信息
     * @return 结果
     */
	public int insertBizAssay(BizAssay bizAssay);

	/**
     * 修改化验结果
     *
     * @param bizAssay 化验结果信息
     * @return 结果
     */
	public int updateBizAssay(BizAssay bizAssay);

	/**
     * 删除化验结果
     *
     * @param assayId 化验结果ID
     * @return 结果
     */
	public int deleteBizAssayById(Long assayId);

	/**
     * 批量删除化验结果
     *
     * @param assayIds 需要删除的数据ID
     * @return 结果
     */
	public int deleteBizAssayByIds(String[] assayIds);

	public List<DataEnity> getAssayTotal();


	public List<BizAssay> getAssayByWorkTime(@Param(value="waterValue") Long waterValue,@Param(value="timeValue")  String timeValue);

}