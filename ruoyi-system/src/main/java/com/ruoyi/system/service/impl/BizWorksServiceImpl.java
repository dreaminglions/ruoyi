package com.ruoyi.system.service.impl;

import java.util.List;

import com.ruoyi.common.annotation.DataScope;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.BizWorksMapper;
import com.ruoyi.system.domain.BizWorks;
import com.ruoyi.system.service.IBizWorksService;
import com.ruoyi.common.core.text.Convert;

/**
 * 水厂 服务层实现
 * 
 * @author ruoyi
 * @date 2019-12-02
 */
@Service
public class BizWorksServiceImpl implements IBizWorksService 
{
	@Autowired
	private BizWorksMapper bizWorksMapper;

	/**
     * 查询水厂信息
     * 
     * @param worksId 水厂ID
     * @return 水厂信息
     */
    @Override
	public BizWorks selectBizWorksById(Long worksId)
	{
	    return bizWorksMapper.selectBizWorksById(worksId);
	}
	
	/**
     * 查询水厂列表
     * 
     * @param bizWorks 水厂信息
     * @return 水厂集合
     */
	@Override
	public List<BizWorks> selectBizWorksList(BizWorks bizWorks)
	{
	    return bizWorksMapper.selectBizWorksList(bizWorks);
	}
	
    /**
     * 新增水厂
     * 
     * @param bizWorks 水厂信息
     * @return 结果
     */
	@Override
	public int insertBizWorks(BizWorks bizWorks)
	{
	    return bizWorksMapper.insertBizWorks(bizWorks);
	}
	
	/**
     * 修改水厂
     * 
     * @param bizWorks 水厂信息
     * @return 结果
     */
	@Override
	public int updateBizWorks(BizWorks bizWorks)
	{
	    return bizWorksMapper.updateBizWorks(bizWorks);
	}

	/**
     * 删除水厂对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	@Override
	public int deleteBizWorksByIds(String ids)
	{
		return bizWorksMapper.deleteBizWorksByIds(Convert.toStrArray(ids));
	}
	
}
