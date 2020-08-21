package com.ruoyi.system.service.impl;

import com.ruoyi.common.core.text.Convert;
import com.ruoyi.system.domain.BizAgentiaMake;
import com.ruoyi.system.mapper.BizAgentiaMakeMapper;
import com.ruoyi.system.service.IBizAgentiaMakeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 药剂下发记录 服务层实现
 *
 * @author ruoyi
 * @date 2020-03-10
 */
@Service
public class BizAgentiaMakeServiceImpl implements IBizAgentiaMakeService
{
	@Autowired
	private BizAgentiaMakeMapper bizAgentiaMakeMapper;

	/**
     * 查询药剂下发记录信息
     *
     * @param recordId 药剂下发记录ID
     * @return 药剂下发记录信息
     */
    @Override
	public BizAgentiaMake selectBizAgentiaMakeById(Long recordId)
	{
	    return bizAgentiaMakeMapper.selectBizAgentiaMakeById(recordId);
	}

	/**
     * 查询药剂下发记录列表
     *
     * @param bizAgentiaMake 药剂下发记录信息
     * @return 药剂下发记录集合
     */
	@Override
	public List<BizAgentiaMake> selectBizAgentiaMakeList(BizAgentiaMake bizAgentiaMake)
	{
	    return bizAgentiaMakeMapper.selectBizAgentiaMakeList(bizAgentiaMake);
	}

    /**
     * 新增药剂下发记录
     *
     * @param bizAgentiaMake 药剂下发记录信息
     * @return 结果
     */
	@Override
	public int insertBizAgentiaMake(BizAgentiaMake bizAgentiaMake)
	{
	    return bizAgentiaMakeMapper.insertBizAgentiaMake(bizAgentiaMake);
	}

	/**
     * 修改药剂下发记录
     *
     * @param bizAgentiaMake 药剂下发记录信息
     * @return 结果
     */
	@Override
	public int updateBizAgentiaMake(BizAgentiaMake bizAgentiaMake)
	{
	    return bizAgentiaMakeMapper.updateBizAgentiaMake(bizAgentiaMake);
	}

	/**
     * 删除药剂下发记录对象
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	@Override
	public int deleteBizAgentiaMakeByIds(String ids)
	{
		return bizAgentiaMakeMapper.deleteBizAgentiaMakeByIds(Convert.toStrArray(ids));
	}

}
