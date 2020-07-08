package com.ruoyi.system.service;

import com.ruoyi.system.domain.BizAssayParameter;
import java.util.List;

/**
 * 化验校准曲线 服务层
 * 
 * @author ruoyi
 * @date 2020-06-03
 */
public interface IBizAssayParameterService 
{
	/**
     * 查询化验校准曲线信息
     * 
     * @param parameterId 化验校准曲线ID
     * @return 化验校准曲线信息
     */
	public BizAssayParameter selectBizAssayParameterById(Long parameterId);
	
	/**
     * 查询化验校准曲线列表
     * 
     * @param bizAssayParameter 化验校准曲线信息
     * @return 化验校准曲线集合
     */
	public List<BizAssayParameter> selectBizAssayParameterList(BizAssayParameter bizAssayParameter);
	
	/**
     * 新增化验校准曲线
     * 
     * @param bizAssayParameter 化验校准曲线信息
     * @return 结果
     */
	public int insertBizAssayParameter(BizAssayParameter bizAssayParameter);
	
	/**
     * 修改化验校准曲线
     * 
     * @param bizAssayParameter 化验校准曲线信息
     * @return 结果
     */
	public int updateBizAssayParameter(BizAssayParameter bizAssayParameter);
		
	/**
     * 删除化验校准曲线信息
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	public int deleteBizAssayParameterByIds(String ids);
	
}
