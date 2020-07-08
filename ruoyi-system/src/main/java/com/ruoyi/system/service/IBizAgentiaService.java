package com.ruoyi.system.service;

import com.ruoyi.system.domain.BizAgentia;
import java.util.List;

/**
 * 药剂 服务层
 * 
 * @author ruoyi
 * @date 2019-12-02
 */
public interface IBizAgentiaService 
{
	/**
     * 查询集团/水厂药剂信息
     * 
     * @param agentiaId 药剂ID
     * @return 药剂信息
     */
	public BizAgentia selectBizAgentiaById(Long agentiaId);

	/**
	 * 查询设备药剂信息
	 *
	 * @param agentiaId 药剂ID
	 * @return 药剂信息
	 */
	public BizAgentia selectDeviceAgentiaById(Long agentiaId);
	
	/**
     * 查询集团/水厂药剂列表
     * 
     * @param bizAgentia 药剂信息
     * @return 药剂集合
     */
	public List<BizAgentia> selectBizAgentiaList(BizAgentia bizAgentia);

	public List<BizAgentia> selectContrastList(BizAgentia bizAgentia);
	/**
	 * 查询设备药剂列表
	 *
	 * @param bizAgentia 药剂信息
	 * @return 药剂集合
	 */
	public List<BizAgentia>  selectDeviceAgentiaList(BizAgentia bizAgentia);
	
	/**
     * 新增药剂
     * 
     * @param bizAgentia 药剂信息
     * @return 结果
     */
	public int insertBizAgentia(BizAgentia bizAgentia);
	
	/**
     * 修改药剂
     * 
     * @param bizAgentia 药剂信息
     * @return 结果
     */
	public int updateBizAgentia(BizAgentia bizAgentia);
		
	/**
     * 删除药剂信息
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	public int deleteBizAgentiaByIds(String ids);
	
}
