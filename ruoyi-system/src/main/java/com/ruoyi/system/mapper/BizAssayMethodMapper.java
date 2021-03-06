package com.ruoyi.system.mapper;

import com.ruoyi.system.domain.BizAssayMethod;
import java.util.List;	

/**
 * 化验方法依据 数据层
 * 
 * @author ruoyi
 * @date 2020-06-03
 */
public interface BizAssayMethodMapper 
{
	/**
     * 查询化验方法依据信息
     * 
     * @param methodId 化验方法依据ID
     * @return 化验方法依据信息
     */
	public BizAssayMethod selectBizAssayMethodById(Long methodId);

	public BizAssayMethod selectBizAssayMethodByReportId(String reportId);
	
	/**
     * 查询化验方法依据列表
     * 
     * @param bizAssayMethod 化验方法依据信息
     * @return 化验方法依据集合
     */
	public List<BizAssayMethod> selectBizAssayMethodList(BizAssayMethod bizAssayMethod);
	
	/**
     * 新增化验方法依据
     * 
     * @param bizAssayMethod 化验方法依据信息
     * @return 结果
     */
	public int insertBizAssayMethod(BizAssayMethod bizAssayMethod);
	
	/**
     * 修改化验方法依据
     * 
     * @param bizAssayMethod 化验方法依据信息
     * @return 结果
     */
	public int updateBizAssayMethod(BizAssayMethod bizAssayMethod);
	
	/**
     * 删除化验方法依据
     * 
     * @param methodId 化验方法依据ID
     * @return 结果
     */
	public int deleteBizAssayMethodById(Long methodId);
	
	/**
     * 批量删除化验方法依据
     * 
     * @param methodIds 需要删除的数据ID
     * @return 结果
     */
	public int deleteBizAssayMethodByIds(String[] methodIds);
	
}