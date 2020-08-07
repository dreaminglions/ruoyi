package com.ruoyi.system.service.impl;

import com.ruoyi.common.core.text.Convert;
import com.ruoyi.system.domain.AssayCurve;
import com.ruoyi.system.mapper.AssayCurveMapper;
import com.ruoyi.system.service.IAssayCurveService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 曲线 服务层实现
 * 
 * @author ruoyi
 * @date 2019-12-14
 */
@Service
public class AssayCurveServiceImpl implements IAssayCurveService
{
	@Autowired
	private AssayCurveMapper assayCurveMapper;

	/**
     * 查询曲线信息
     * 
     * @param curveId 曲线ID
     * @return 曲线信息
     */
    @Override
	public AssayCurve selectAssayCurveById(Long curveId)
	{
	    return assayCurveMapper.selectAssayCurveById(curveId);
	}
	
	/**
     * 查询曲线列表
     * 
     * @param assayCurve 曲线信息
     * @return 曲线集合
     */
	@Override
	public List<AssayCurve> selectAssayCurveList(AssayCurve assayCurve)
	{
	    return assayCurveMapper.selectAssayCurveList(assayCurve);
	}

	@Override
	public AssayCurve selectAssayCurveByCurveNo(String assayNo)
	{
		return assayCurveMapper.selectAssayCurveByCurveNo(assayNo);
	}
    /**
     * 新增曲线
     * 
     * @param assayCurve 曲线信息
     * @return 结果
     */
	@Override
	public int insertAssayCurve(AssayCurve assayCurve)
	{
	    return assayCurveMapper.insertAssayCurve(assayCurve);
	}
	
	/**
     * 修改曲线
     * 
     * @param assayCurve 曲线信息
     * @return 结果
     */
	@Override
	public int updateAssayCurve(AssayCurve assayCurve)
	{
	    return assayCurveMapper.updateAssayCurve(assayCurve);
	}


	public int deleteAssayCurveById(Long curveId){
		return assayCurveMapper.deleteAssayCurveById(curveId);
	}
	/**
     * 删除曲线对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	@Override
	public int deleteAssayCurveByIds(String ids)
	{
		return assayCurveMapper.deleteAssayCurveByIds(Convert.toStrArray(ids));
	}
	
}
