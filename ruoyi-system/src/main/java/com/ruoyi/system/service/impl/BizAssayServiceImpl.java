package com.ruoyi.system.service.impl;

import com.ruoyi.common.core.text.Convert;
import com.ruoyi.system.domain.BizAssay;
import com.ruoyi.system.domain.BizAssayResult;
import com.ruoyi.system.domain.DataEnity;
import com.ruoyi.system.domain.OutDataEnity;
import com.ruoyi.system.mapper.BizAssayMapper;
import com.ruoyi.system.service.IBizAssayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 化验结果 服务层实现
 * 
 * @author ruoyi
 * @date 2019-11-29
 */
@Service
public class BizAssayServiceImpl implements IBizAssayService
{
	@Autowired
	private BizAssayMapper bizAssayMapper;

	/**
     * 查询化验结果信息
     * 
     * @param assayId 化验结果ID
     * @return 化验结果信息
     */
    @Override
	public BizAssay selectBizAssayById(Long assayId)
	{
	    return bizAssayMapper.selectBizAssayById(assayId);
	}

	public BizAssay selectBizAssayByAssayNo(String assayNo)
	{
		return bizAssayMapper.selectBizAssayByAssayNo(assayNo);
	}


	/**
     * 查询化验结果列表
     * 
     * @param bizAssay 化验结果信息
     * @return 化验结果集合
     */
	@Override
	public List<BizAssay> selectBizAssayList(BizAssay bizAssay)
	{
	    return bizAssayMapper.selectBizAssayList(bizAssay);
	}
	
    /**
     * 新增化验结果
     * 
     * @param bizAssay 化验结果信息
     * @return 结果
     */
	@Override
	public int insertBizAssay(BizAssay bizAssay)
	{
	    return bizAssayMapper.insertBizAssay(bizAssay);
	}
	
	/**
     * 修改化验结果
     * 
     * @param bizAssay 化验结果信息
     * @return 结果
     */
	@Override
	public int updateBizAssay(BizAssay bizAssay)
	{
	    return bizAssayMapper.updateBizAssay(bizAssay);
	}

	/**
     * 删除化验结果对象
     * 
     * @param assayIds 需要删除的数据ID
     * @return 结果
     */
	@Override
	public int deleteBizAssayByIds(String assayIds)
	{
		return bizAssayMapper.deleteBizAssayByIds(Convert.toStrArray(assayIds));
	}

	@Override
	public List<DataEnity> getAssayTotal(){
		return bizAssayMapper.getAssayTotal();
	}

	@Override
	public List<BizAssay> getAssayByWorkTime(Long waterValue, String timeValue){
		return bizAssayMapper.getAssayByWorkTime(waterValue,timeValue);
	};
}
