package com.ruoyi.system.service;

import com.ruoyi.system.domain.AssaySample;

import java.util.List;

/**
 * 化验样品 服务层
 * 
 * @author ruoyi
 * @date 2019-11-29
 */
public interface IAssaySampleService
{
	/**
     * 查询化验样品信息
     *
     * @param sampleId 化验样品ID
     * @return 化验样品信息
     */
	public AssaySample selectAssaySampleById(Long sampleId);

	public AssaySample selectAssaySampleByAssayNo(String assayNo);

	/**
     * 查询化验样品列表
     *
     * @param assaySample 化验样品信息
     * @return 化验样品集合
     */
	public List<AssaySample> selectAssaySampleList(AssaySample assaySample);

	/**
     * 新增化验样品
     *
     * @param assaySample 化验样品信息
     * @return 样品
     */
	public int insertAssaySample(AssaySample assaySample);

	/**
     * 修改化验样品
     *
     * @param assaySample 化验样品信息
     * @return 样品
     */
	public int updateAssaySample(AssaySample assaySample);

	/**
     * 删除化验样品信息
     *
     * @param sampleIds 需要删除的数据ID
     * @return 样品
     */
	public int deleteAssaySampleByIds(String sampleIds);

	public int deleteByAssaySample(String assayNo,String sampleNo);

	public List<AssaySample> getSampleByAssayno(String assayNo);
}
