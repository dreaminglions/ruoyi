package com.ruoyi.system.mapper;

import com.ruoyi.system.domain.BizAlert;
import com.ruoyi.system.domain.SysRoleMenu;

import java.util.List;

/**
 * 告警 数据层
 * 
 * @author ruoyi
 * @date 2019-12-14
 */
public interface BizAlertMapper 
{
	/**
     * 查询告警信息
     * 
     * @param alertId 告警ID
     * @return 告警信息
     */
	public BizAlert selectBizAlertById(Long alertId);
	
	/**
     * 查询告警列表
     * 
     * @param bizAlert 告警信息
     * @return 告警集合
     */
	public List<BizAlert> selectBizAlertList(BizAlert bizAlert);

	public List<BizAlert> selectBizAlertByReportId(String reportId);
	
	/**
     * 新增告警
     * 
     * @param bizAlert 告警信息
     * @return 结果
     */
	public int insertBizAlert(BizAlert bizAlert);
	
	/**
     * 修改告警
     * 
     * @param bizAlert 告警信息
     * @return 结果
     */
	public int updateBizAlert(BizAlert bizAlert);
	
	/**
     * 删除告警
     * 
     * @param alertId 告警ID
     * @return 结果
     */
	public int deleteBizAlertById(Long alertId);
	
	/**
     * 批量删除告警
     * 
     * @param alertIds 需要删除的数据ID
     * @return 结果
     */
	public int deleteBizAlertByIds(String[] alertIds);


	/**
	 * 批量新增告警信息
	 *
	 * @param alertList 角色菜单列表
	 * @return 结果
	 */
	public int batchAlert(List<BizAlert> alertList);
	
}