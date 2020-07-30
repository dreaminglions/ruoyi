package com.ruoyi.system.service.impl;

import com.ruoyi.common.annotation.DataScope;
import com.ruoyi.common.core.text.Convert;
import com.ruoyi.system.domain.AssayFault;
import com.ruoyi.system.mapper.AssayFaultMapper;
import com.ruoyi.system.service.IAssayFaultService;
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
public class AssayFaultServiceImpl implements IAssayFaultService
{
	@Autowired
	private AssayFaultMapper assayFaultMapper;

	/**
     * 查询故障信息
     * 
     * @param faultId 故障ID
     * @return 故障信息
     */
    @Override
	public AssayFault selectAssayFaultById(Long faultId)
	{
	    return assayFaultMapper.selectAssayFaultById(faultId);
	}
	
	/**
     * 查询故障列表
     * 
     * @param AssayFault 故障信息
     * @return 故障集合
     */
	@Override
	public List<AssayFault> selectAssayFaultList(AssayFault AssayFault)
	{
	    return assayFaultMapper.selectAssayFaultList(AssayFault);
	}

	@Override
	public List<AssayFault> selectAssayFaultByAssayNo(String assayNo)
	{
		return assayFaultMapper.selectAssayFaultByAssayNo(assayNo);
	}
    /**
     * 新增故障
     * 
     * @param AssayFault 故障信息
     * @return 结果
     */
	@Override
	public int insertAssayFault(AssayFault AssayFault)
	{
	    return assayFaultMapper.insertAssayFault(AssayFault);
	}
	
	/**
     * 修改故障
     * 
     * @param AssayFault 故障信息
     * @return 结果
     */
	@Override
	public int updateAssayFault(AssayFault AssayFault)
	{
	    return assayFaultMapper.updateAssayFault(AssayFault);
	}


	public int deleteAssayFaultById(Long faultId){
		return assayFaultMapper.deleteAssayFaultById(faultId);
	}
	/**
     * 删除故障对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	@Override
	public int deleteAssayFaultByIds(String ids)
	{
		return assayFaultMapper.deleteAssayFaultByIds(Convert.toStrArray(ids));
	}
	
}
