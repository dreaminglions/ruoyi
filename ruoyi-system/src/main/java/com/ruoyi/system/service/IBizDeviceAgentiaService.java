package com.ruoyi.system.service;

import com.ruoyi.system.domain.BizAgentia;
import com.ruoyi.system.domain.BizDeviceAgentia;

import java.util.List;

/**
 * 药剂 服务层
 * 
 * @author ruoyi
 * @date 2019-12-02
 */
public interface IBizDeviceAgentiaService
{
	/**
	 * 查询设备药剂信息
	 *
	 * @param agentiaId 药剂ID
	 * @return 药剂信息
	 */
	public BizDeviceAgentia selectDeviceAgentiaById(Long agentiaId);

	public List<BizAgentia> selectContrastList(BizAgentia bizAgentia);
	/**
	 * 查询设备药剂列表
	 *
	 * @param bizAgentia 药剂信息
	 * @return 药剂集合
	 */
	public List<BizDeviceAgentia>  selectDeviceAgentiaList(BizDeviceAgentia bizAgentia);
	
	/**
     * 新增药剂
     * 
     * @param bizAgentia 药剂信息
     * @return 结果
     */
	public int insertBizDeviceAgentia(BizDeviceAgentia bizAgentia);
	
	/**
     * 修改药剂
     * 
     * @param bizAgentia 药剂信息
     * @return 结果
     */
	public int updateBizAgentia(BizDeviceAgentia bizAgentia);
		
	/**
     * 删除药剂信息
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	public int deleteBizAgentiaByIds(String ids);
	
}
