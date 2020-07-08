package com.ruoyi.system.service;

import com.ruoyi.system.domain.BizAgentiaContrast;
import java.util.List;

/**
 * 药剂名称对照 服务层
 * 
 * @author ruoyi
 * @date 2020-04-22
 */
public interface IBizAgentiaContrastService 
{
	/**
     * 查询药剂名称对照信息
     * 
     * @param contrastId 药剂名称对照ID
     * @return 药剂名称对照信息
     */
	public BizAgentiaContrast selectBizAgentiaContrastById(Long contrastId);
	
	/**
     * 查询药剂名称对照列表
     * 
     * @param bizAgentiaContrast 药剂名称对照信息
     * @return 药剂名称对照集合
     */
	public List<BizAgentiaContrast> selectBizAgentiaContrastList(BizAgentiaContrast bizAgentiaContrast);
	
	/**
     * 新增药剂名称对照
     * 
     * @param bizAgentiaContrast 药剂名称对照信息
     * @return 结果
     */
	public int insertBizAgentiaContrast(BizAgentiaContrast bizAgentiaContrast);
	
	/**
     * 修改药剂名称对照
     * 
     * @param bizAgentiaContrast 药剂名称对照信息
     * @return 结果
     */
	public int updateBizAgentiaContrast(BizAgentiaContrast bizAgentiaContrast);
		
	/**
     * 删除药剂名称对照信息
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	public int deleteBizAgentiaContrastByIds(String ids);
	
}
