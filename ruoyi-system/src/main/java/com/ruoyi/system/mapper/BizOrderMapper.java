package com.ruoyi.system.mapper;

import com.ruoyi.system.domain.BizOrder;
import java.util.List;	

/**
 * 化验单据 数据层
 * 
 * @author ruoyi
 * @date 2019-12-16
 */
public interface BizOrderMapper 
{
	/**
     * 查询化验单据信息
     * 
     * @param orderId 化验单据ID
     * @return 化验单据信息
     */
	public BizOrder selectBizOrderById(Long orderId);

	public BizOrder selectOrderResultByNo(String orderNo);
	
	/**
     * 查询化验单据列表
     * 
     * @param bizOrder 化验单据信息
     * @return 化验单据集合
     */
	public List<BizOrder> selectBizOrderList(BizOrder bizOrder);
	
	/**
     * 新增化验单据
     * 
     * @param bizOrder 化验单据信息
     * @return 结果
     */
	public int insertBizOrder(BizOrder bizOrder);
	
	/**
     * 修改化验单据
     * 
     * @param bizOrder 化验单据信息
     * @return 结果
     */
	public int updateBizOrder(BizOrder bizOrder);
	
	/**
     * 删除化验单据
     * 
     * @param orderId 化验单据ID
     * @return 结果
     */
	public int deleteBizOrderById(Long orderId);
	
	/**
     * 批量删除化验单据
     * 
     * @param orderIds 需要删除的数据ID
     * @return 结果
     */
	public int deleteBizOrderByIds(String[] orderIds);
	
}