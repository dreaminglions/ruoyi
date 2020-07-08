package com.ruoyi.system.service;

import com.ruoyi.system.domain.BizWorks;
import java.util.List;

/**
 * 水厂 服务层
 * 
 * @author ruoyi
 * @date 2019-12-02
 */
public interface IBizWorksService 
{
	/**
     * 查询水厂信息
     * 
     * @param worksId 水厂ID
     * @return 水厂信息
     */
	public BizWorks selectBizWorksById(Long worksId);
	
	/**
     * 查询水厂列表
     * 
     * @param bizWorks 水厂信息
     * @return 水厂集合
     */
	public List<BizWorks> selectBizWorksList(BizWorks bizWorks);
	
	/**
     * 新增水厂
     * 
     * @param bizWorks 水厂信息
     * @return 结果
     */
	public int insertBizWorks(BizWorks bizWorks);
	
	/**
     * 修改水厂
     * 
     * @param bizWorks 水厂信息
     * @return 结果
     */
	public int updateBizWorks(BizWorks bizWorks);
		
	/**
     * 删除水厂信息
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	public int deleteBizWorksByIds(String ids);
	
}
