package com.ruoyi.system.service.impl;

import java.util.List;

import com.ruoyi.system.domain.DataEnity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.BizWasteMapper;
import com.ruoyi.system.domain.BizWaste;
import com.ruoyi.system.service.IBizWasteService;
import com.ruoyi.common.core.text.Convert;

/**
 * 废液 服务层实现
 * 
 * @author ruoyi
 * @date 2020-03-03
 */
@Service
public class BizWasteServiceImpl implements IBizWasteService 
{
	@Autowired
	private BizWasteMapper bizWasteMapper;

	/**
     * 查询废液信息
     * 
     * @param wasteId 废液ID
     * @return 废液信息
     */
    @Override
	public BizWaste selectBizWasteById(Long wasteId)
	{
	    return bizWasteMapper.selectBizWasteById(wasteId);
	}
	
	/**
     * 查询废液列表
     * 
     * @param bizWaste 废液信息
     * @return 废液集合
     */
	@Override
	public List<BizWaste> selectBizWasteList(BizWaste bizWaste)
	{
	    return bizWasteMapper.selectBizWasteList(bizWaste);
	}
	
    /**
     * 新增废液
     * 
     * @param bizWaste 废液信息
     * @return 结果
     */
	@Override
	public int insertBizWaste(BizWaste bizWaste)
	{
	    return bizWasteMapper.insertBizWaste(bizWaste);
	}
	
	/**
     * 修改废液
     * 
     * @param bizWaste 废液信息
     * @return 结果
     */
	@Override
	public int updateBizWaste(BizWaste bizWaste)
	{
	    return bizWasteMapper.updateBizWaste(bizWaste);
	}

	/**
     * 删除废液对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	@Override
	public int deleteBizWasteByIds(String ids)
	{
		return bizWasteMapper.deleteBizWasteByIds(Convert.toStrArray(ids));
	}

	@Override
	public List<DataEnity> getWasteBar(String assayId, Long worksId,String month){
		return bizWasteMapper.getWasteBar(assayId,worksId,month);
	}
}
