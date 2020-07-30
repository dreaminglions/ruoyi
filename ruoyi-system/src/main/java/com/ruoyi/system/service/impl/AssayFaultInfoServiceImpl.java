package com.ruoyi.system.service.impl;

import com.ruoyi.common.core.text.Convert;
import com.ruoyi.system.domain.AssayFault;
import com.ruoyi.system.domain.AssayFaultInfo;
import com.ruoyi.system.mapper.AssayFaultInfoMapper;
import com.ruoyi.system.mapper.AssayFaultMapper;
import com.ruoyi.system.service.IAssayFaultInfoService;
import com.ruoyi.system.service.IAssayFaultService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 故障 服务层实现
 * 
 * @author ruoyi
 * @date 2019-12-14
 */
@Service
public class AssayFaultInfoServiceImpl implements IAssayFaultInfoService
{
	@Autowired
	private AssayFaultInfoMapper assayFaultMapper;

	/**
     * 查询故障信息
     * 
     * @param faultId 故障ID
     * @return 故障信息
     */
    @Override
	public AssayFaultInfo selectAssayFaultInfoById(Long faultId)
	{
	    return assayFaultMapper.selectAssayFaultInfoById(faultId);
	}
	
	/**
     * 查询故障列表
     * 
     * @param AssayFaultInfo 故障信息
     * @return 故障集合
     */
	@Override
	public List<AssayFaultInfo> selectAssayFaultInfoList(AssayFaultInfo AssayFaultInfo)
	{
	    return assayFaultMapper.selectAssayFaultInfoList(AssayFaultInfo);
	}

	@Override
	public List<AssayFaultInfo> selectAssayFaultInfoByFaultCode(String faultCode)
	{
		return assayFaultMapper.selectAssayFaultInfoByFaultCode(faultCode);
	}
    /**
     * 新增故障
     * 
     * @param AssayFaultInfo 故障信息
     * @return 结果
     */
	@Override
	public int insertAssayFaultInfo(AssayFaultInfo AssayFaultInfo)
	{
	    return assayFaultMapper.insertAssayFaultInfo(AssayFaultInfo);
	}
	
	/**
     * 修改故障
     * 
     * @param AssayFaultInfo 故障信息
     * @return 结果
     */
	@Override
	public int updateAssayFaultInfo(AssayFaultInfo AssayFaultInfo)
	{
	    return assayFaultMapper.updateAssayFaultInfo(AssayFaultInfo);
	}


	public int deleteAssayFaultInfoById(Long infoId)
	{
		return assayFaultMapper.deleteAssayFaultInfoById(infoId);
	}

	/**
     * 删除故障对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	@Override
	public int deleteAssayFaultInfoByIds(String ids)
	{
		return assayFaultMapper.deleteAssayFaultInfoByIds(Convert.toStrArray(ids));
	}
	
}
