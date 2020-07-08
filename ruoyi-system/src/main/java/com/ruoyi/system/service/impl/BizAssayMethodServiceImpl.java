package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.BizAssayMethodMapper;
import com.ruoyi.system.domain.BizAssayMethod;
import com.ruoyi.system.service.IBizAssayMethodService;
import com.ruoyi.common.core.text.Convert;

/**
 * 化验方法依据 服务层实现
 * 
 * @author ruoyi
 * @date 2020-06-03
 */
@Service
public class BizAssayMethodServiceImpl implements IBizAssayMethodService 
{
	@Autowired
	private BizAssayMethodMapper bizAssayMethodMapper;

	/**
     * 查询化验方法依据信息
     * 
     * @param methodId 化验方法依据ID
     * @return 化验方法依据信息
     */
    @Override
	public BizAssayMethod selectBizAssayMethodById(Long methodId)
	{
	    return bizAssayMethodMapper.selectBizAssayMethodById(methodId);
	}

	@Override
	public BizAssayMethod selectBizAssayMethodByReportId(String reportId)
	{
		return bizAssayMethodMapper.selectBizAssayMethodByReportId(reportId);
	}
	
	/**
     * 查询化验方法依据列表
     * 
     * @param bizAssayMethod 化验方法依据信息
     * @return 化验方法依据集合
     */
	@Override
	public List<BizAssayMethod> selectBizAssayMethodList(BizAssayMethod bizAssayMethod)
	{
	    return bizAssayMethodMapper.selectBizAssayMethodList(bizAssayMethod);
	}
	
    /**
     * 新增化验方法依据
     * 
     * @param bizAssayMethod 化验方法依据信息
     * @return 结果
     */
	@Override
	public int insertBizAssayMethod(BizAssayMethod bizAssayMethod)
	{
	    return bizAssayMethodMapper.insertBizAssayMethod(bizAssayMethod);
	}
	
	/**
     * 修改化验方法依据
     * 
     * @param bizAssayMethod 化验方法依据信息
     * @return 结果
     */
	@Override
	public int updateBizAssayMethod(BizAssayMethod bizAssayMethod)
	{
	    return bizAssayMethodMapper.updateBizAssayMethod(bizAssayMethod);
	}

	/**
     * 删除化验方法依据对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	@Override
	public int deleteBizAssayMethodByIds(String ids)
	{
		return bizAssayMethodMapper.deleteBizAssayMethodByIds(Convert.toStrArray(ids));
	}
	
}
