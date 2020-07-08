package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.BizOrderMapper;
import com.ruoyi.system.domain.BizOrder;
import com.ruoyi.system.service.IBizOrderService;
import com.ruoyi.common.core.text.Convert;

/**
 * 化验单据 服务层实现
 * 
 * @author ruoyi
 * @date 2019-12-16
 */
@Service
public class BizOrderServiceImpl implements IBizOrderService 
{
	@Autowired
	private BizOrderMapper bizOrderMapper;

	/**
     * 查询化验单据信息
     * 
     * @param orderId 化验单据ID
     * @return 化验单据信息
     */
    @Override
	public BizOrder selectBizOrderById(Long orderId)
	{
	    return bizOrderMapper.selectBizOrderById(orderId);
	}
	
	/**
     * 查询化验单据列表
     * 
     * @param bizOrder 化验单据信息
     * @return 化验单据集合
     */
	@Override
	public List<BizOrder> selectBizOrderList(BizOrder bizOrder)
	{
	    return bizOrderMapper.selectBizOrderList(bizOrder);
	}
	
    /**
     * 新增化验单据
     * 
     * @param bizOrder 化验单据信息
     * @return 结果
     */
	@Override
	public int insertBizOrder(BizOrder bizOrder)
	{
	    return bizOrderMapper.insertBizOrder(bizOrder);
	}
	
	/**
     * 修改化验单据
     * 
     * @param bizOrder 化验单据信息
     * @return 结果
     */
	@Override
	public int updateBizOrder(BizOrder bizOrder)
	{
	    return bizOrderMapper.updateBizOrder(bizOrder);
	}

	/**
     * 删除化验单据对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	@Override
	public int deleteBizOrderByIds(String ids)
	{
		return bizOrderMapper.deleteBizOrderByIds(Convert.toStrArray(ids));
	}
	
}
