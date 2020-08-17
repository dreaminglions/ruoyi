package com.ruoyi.system.mapper;

import com.ruoyi.system.domain.BizAgentiaSend;
import com.ruoyi.system.domain.BizAgentiaSend;
import com.ruoyi.system.domain.DataEnity;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 药剂下发记录 数据层
 * 
 * @author ruoyi
 * @date 2020-03-10
 */
public interface BizAgentiaSendMapper
{
	/**
     * 查询药剂下发记录信息
     *
     * @param recordId 药剂下发记录ID
     * @return 药剂下发记录信息
     */
	public BizAgentiaSend selectBizAgentiaSendById(Long recordId);

	/**
     * 查询药剂下发记录列表
     *
     * @param bizAgentiaSend 药剂下发记录信息
     * @return 药剂下发记录集合
     */
	public List<BizAgentiaSend> selectBizAgentiaSendList(BizAgentiaSend bizAgentiaSend);

	/**
     * 新增药剂下发记录
     *
     * @param bizAgentiaSend 药剂下发记录信息
     * @return 结果
     */
	public int insertBizAgentiaSend(BizAgentiaSend bizAgentiaSend);

	/**
     * 修改药剂下发记录
     *
     * @param bizAgentiaSend 药剂下发记录信息
     * @return 结果
     */
	public int updateBizAgentiaSend(BizAgentiaSend bizAgentiaSend);

	/**
     * 删除药剂下发记录
     *
     * @param recordId 药剂下发记录ID
     * @return 结果
     */
	public int deleteBizAgentiaSendById(Long recordId);

	/**
     * 批量删除药剂下发记录
     *
     * @param recordIds 需要删除的数据ID
     * @return 结果
     */
	public int deleteBizAgentiaSendByIds(String[] recordIds);

}