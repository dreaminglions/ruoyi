package com.ruoyi.system.service;

import com.ruoyi.system.domain.BizAgentiaMake;

import java.util.List;

/**
 * 药剂下发记录 服务层
 * 
 * @author ruoyi
 * @date 2020-03-10
 */
public interface IBizAgentiaMakeService
{
	/**
     * 查询药剂下发记录信息
     *
     * @param recordId 药剂下发记录ID
     * @return 药剂下发记录信息
     */
	public BizAgentiaMake selectBizAgentiaMakeById(Long recordId);

	/**
     * 查询药剂下发记录列表
     *
     * @param bizAgentiaMake 药剂下发记录信息
     * @return 药剂下发记录集合
     */
	public List<BizAgentiaMake> selectBizAgentiaMakeList(BizAgentiaMake bizAgentiaMake);

	/**
     * 新增药剂下发记录
     *
     * @param bizAgentiaMake 药剂下发记录信息
     * @return 结果
     */
	public int insertBizAgentiaMake(BizAgentiaMake bizAgentiaMake);

	/**
     * 修改药剂下发记录
     *
     * @param bizAgentiaMake 药剂下发记录信息
     * @return 结果
     */
	public int updateBizAgentiaMake(BizAgentiaMake bizAgentiaMake);

	/**
     * 删除药剂下发记录信息
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	public int deleteBizAgentiaMakeByIds(String ids);

}
