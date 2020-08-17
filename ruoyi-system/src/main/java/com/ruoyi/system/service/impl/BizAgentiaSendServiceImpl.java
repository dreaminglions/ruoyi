package com.ruoyi.system.service.impl;

import com.ruoyi.common.core.text.Convert;
import com.ruoyi.system.domain.BizAgentiaSend;
import com.ruoyi.system.domain.DataEnity;
import com.ruoyi.system.mapper.BizAgentiaSendMapper;
import com.ruoyi.system.service.IBizAgentiaSendService;
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
public class BizAgentiaSendServiceImpl implements IBizAgentiaSendService
{
	@Autowired
	private BizAgentiaSendMapper bizAgentiaSendMapper;

	/**
     * 查询药剂下发记录信息
     *
     * @param recordId 药剂下发记录ID
     * @return 药剂下发记录信息
     */
    @Override
	public BizAgentiaSend selectBizAgentiaSendById(Long recordId)
	{
	    return bizAgentiaSendMapper.selectBizAgentiaSendById(recordId);
	}

	/**
     * 查询药剂下发记录列表
     *
     * @param bizAgentiaSend 药剂下发记录信息
     * @return 药剂下发记录集合
     */
	@Override
	public List<BizAgentiaSend> selectBizAgentiaSendList(BizAgentiaSend bizAgentiaSend)
	{
	    return bizAgentiaSendMapper.selectBizAgentiaSendList(bizAgentiaSend);
	}

    /**
     * 新增药剂下发记录
     *
     * @param bizAgentiaSend 药剂下发记录信息
     * @return 结果
     */
	@Override
	public int insertBizAgentiaSend(BizAgentiaSend bizAgentiaSend)
	{
	    return bizAgentiaSendMapper.insertBizAgentiaSend(bizAgentiaSend);
	}

	/**
     * 修改药剂下发记录
     *
     * @param bizAgentiaSend 药剂下发记录信息
     * @return 结果
     */
	@Override
	public int updateBizAgentiaSend(BizAgentiaSend bizAgentiaSend)
	{
	    return bizAgentiaSendMapper.updateBizAgentiaSend(bizAgentiaSend);
	}

	/**
     * 删除药剂下发记录对象
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	@Override
	public int deleteBizAgentiaSendByIds(String ids)
	{
		return bizAgentiaSendMapper.deleteBizAgentiaSendByIds(Convert.toStrArray(ids));
	}

}
