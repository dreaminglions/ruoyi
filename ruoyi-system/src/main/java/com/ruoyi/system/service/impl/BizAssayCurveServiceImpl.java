package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.BizAssayCurveMapper;
import com.ruoyi.system.domain.BizAssayCurve;
import com.ruoyi.system.service.IBizAssayCurveService;
import com.ruoyi.common.core.text.Convert;

/**
 * 化验曲线 服务层实现
 * 
 * @author ruoyi
 * @date 2020-03-16
 */
@Service
public class BizAssayCurveServiceImpl implements IBizAssayCurveService 
{
	@Autowired
	private BizAssayCurveMapper bizAssayCurveMapper;

	/**
     * 查询化验曲线信息
     * 
     * @param curveId 化验曲线ID
     * @return 化验曲线信息
     */
    @Override
	public BizAssayCurve selectBizAssayCurveById(Long curveId)
	{
	    return bizAssayCurveMapper.selectBizAssayCurveById(curveId);
	}
	
	/**
     * 查询化验曲线列表
     * 
     * @param bizAssayCurve 化验曲线信息
     * @return 化验曲线集合
     */
	@Override
	public List<BizAssayCurve> selectBizAssayCurveList(BizAssayCurve bizAssayCurve)
	{
	    return bizAssayCurveMapper.selectBizAssayCurveList(bizAssayCurve);
	}
	
    /**
     * 新增化验曲线
     * 
     * @param bizAssayCurve 化验曲线信息
     * @return 结果
     */
	@Override
	public int insertBizAssayCurve(BizAssayCurve bizAssayCurve)
	{
	    return bizAssayCurveMapper.insertBizAssayCurve(bizAssayCurve);
	}
	
	/**
     * 修改化验曲线
     * 
     * @param bizAssayCurve 化验曲线信息
     * @return 结果
     */
	@Override
	public int updateBizAssayCurve(BizAssayCurve bizAssayCurve)
	{
	    return bizAssayCurveMapper.updateBizAssayCurve(bizAssayCurve);
	}

	/**
     * 删除化验曲线对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	@Override
	public int deleteBizAssayCurveByIds(String ids)
	{
		return bizAssayCurveMapper.deleteBizAssayCurveByIds(Convert.toStrArray(ids));
	}
	
}
