package com.ruoyi.system.mapper;

import com.ruoyi.system.domain.SysRoleWork;

import java.util.List;

/**
 * 角色与水厂关联表 数据层
 * 
 * @author ruoyi
 */
public interface SysRoleWorkMapper
{
    /**
     * 通过角色ID删除角色和水厂关联
     * 
     * @param roleId 角色ID
     * @return 结果
     */
    public int deleteRoleWorkByRoleId(Long roleId);

    /**
     * 批量删除角色水厂关联信息
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteRoleWork(Long[] ids);

    /**
     * 查询水厂使用数量
     * 
     * @param worksId 水厂ID
     * @return 结果
     */
    public int selectCountRoleWorkByWorksId(Long worksId);

    /**
     * 批量新增角色水厂信息
     * 
     * @param roleWorkList 角色水厂列表
     * @return 结果
     */
    public int batchRoleWork(List<SysRoleWork> roleWorkList);
}
