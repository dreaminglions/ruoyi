package com.ruoyi.system.mapper;

import com.ruoyi.system.domain.BizAssayCurve;

import java.util.List;

/**
 * 化验曲线 数据层
 * 
 * @author ruoyi
 * @date 2020-03-16
 */
public interface BizAssayCurveMapper 
{
	/**
     * 查询化验曲线信息
     * 
     * @param curveId 化验曲线ID
     * @return 化验曲线信息
     */
	public BizAssayCurve selectBizAssayCurveById(Long curveId);

	public BizAssayCurve selectBizAssayCurveByNo(String orderno);
	
	/**
     * 查询化验曲线列表
     * 
     * @param bizAssayCurve 化验曲线信息
     * @return 化验曲线集合
     */
	public List<BizAssayCurve> selectBizAssayCurveList(BizAssayCurve bizAssayCurve);
	
	/**
     * 新增化验曲线
     * 
     * @param bizAssayCurve 化验曲线信息
     * @return 结果
     */
	public int insertBizAssayCurve(BizAssayCurve bizAssayCurve);
	
	/**
     * 修改化验曲线
     * 
     * @param bizAssayCurve 化验曲线信息
     * @return 结果
     */
	public int updateBizAssayCurve(BizAssayCurve bizAssayCurve);
	
	/**
     * 删除化验曲线
     * 
     * @param curveId 化验曲线ID
     * @return 结果
     */
	public int deleteBizAssayCurveById(Long curveId);
	
	/**
     * 批量删除化验曲线
     * 
     * @param curveIds 需要删除的数据ID
     * @return 结果
     */
	public int deleteBizAssayCurveByIds(String[] curveIds);
	
}