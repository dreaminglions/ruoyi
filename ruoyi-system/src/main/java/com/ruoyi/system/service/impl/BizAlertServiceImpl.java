package com.ruoyi.system.service.impl;

import java.util.List;

import com.ruoyi.common.annotation.DataScope;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.BizAlertMapper;
import com.ruoyi.system.domain.BizAlert;
import com.ruoyi.system.service.IBizAlertService;
import com.ruoyi.common.core.text.Convert;

/**
 * 告警 服务层实现
 * 
 * @author ruoyi
 * @date 2019-12-14
 */
@Service
public class BizAlertServiceImpl implements IBizAlertService 
{
	@Autowired
	private BizAlertMapper bizAlertMapper;

	/**
     * 查询告警信息
     * 
     * @param alertId 告警ID
     * @return 告警信息
     */
    @Override
	public BizAlert selectBizAlertById(Long alertId)
	{
	    return bizAlertMapper.selectBizAlertById(alertId);
	}
	
	/**
     * 查询告警列表
     * 
     * @param bizAlert 告警信息
     * @return 告警集合
     */
	@Override
	@DataScope(tableAlias = "w")
	public List<BizAlert> selectBizAlertList(BizAlert bizAlert)
	{
	    return bizAlertMapper.selectBizAlertList(bizAlert);
	}

	@Override
	public List<BizAlert> selectBizAlertByReportId(String reportId)
	{
		return bizAlertMapper.selectBizAlertByReportId(reportId);
	}
    /**
     * 新增告警
     * 
     * @param bizAlert 告警信息
     * @return 结果
     */
	@Override
	public int insertBizAlert(BizAlert bizAlert)
	{
	    return bizAlertMapper.insertBizAlert(bizAlert);
	}
	
	/**
     * 修改告警
     * 
     * @param bizAlert 告警信息
     * @return 结果
     */
	@Override
	public int updateBizAlert(BizAlert bizAlert)
	{
	    return bizAlertMapper.updateBizAlert(bizAlert);
	}

	/**
     * 删除告警对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	@Override
	public int deleteBizAlertByIds(String ids)
	{
		return bizAlertMapper.deleteBizAlertByIds(Convert.toStrArray(ids));
	}
	
}
