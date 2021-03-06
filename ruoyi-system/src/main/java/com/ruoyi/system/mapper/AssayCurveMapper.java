package com.ruoyi.system.mapper;

import com.ruoyi.system.domain.AssayCurve;
import com.ruoyi.system.domain.AssayFault;

import java.util.List;

/**
 * 曲线 数据层
 * 
 * @author ruoyi
 * @date 2019-12-14
 */
public interface AssayCurveMapper
{
	/**
     * 查询曲线信息
     * 
     * @param curveId 曲线ID
     * @return 曲线信息
     */
	public AssayCurve selectAssayCurveById(Long curveId);
	
	/**
     * 查询曲线列表
     * 
     * @param assayCurve 曲线信息
     * @return 曲线集合
     */
	public List<AssayCurve> selectAssayCurveList(AssayCurve assayCurve);

	public AssayCurve selectAssayCurveByCurveNo(String curveNo);
	
	/**
     * 新增曲线
     * 
     * @param assayCurve 曲线信息
     * @return 结果
     */
	public int insertAssayCurve(AssayCurve assayCurve);
	
	/**
     * 修改曲线
     * 
     * @param assayCurve 曲线信息
     * @return 结果
     */
	public int updateAssayCurve(AssayCurve assayCurve);
	
	/**
     * 删除曲线
     * 
     * @param curveId 曲线ID
     * @return 结果
     */
	public int deleteAssayCurveById(Long curveId);
	
	/**
     * 批量删除曲线
     * 
     * @param curveIds 需要删除的数据ID
     * @return 结果
     */
	public int deleteAssayCurveByIds(String[] curveIds);


}