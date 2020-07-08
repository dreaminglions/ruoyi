package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 角色和水厂关联 sys_role_work
 * 
 * @author ruoyi
 */
public class SysRoleWork
{
    /** 角色ID */
    private Long roleId;
    
    /** 部门ID */
    private Long worksId;

    public Long getRoleId()
    {
        return roleId;
    }

    public void setRoleId(Long roleId)
    {
        this.roleId = roleId;
    }

    public Long getWorksId()
    {
        return worksId;
    }

    public void setWorksId(Long worksId)
    {
        this.worksId = worksId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("roleId", getRoleId())
            .append("worksId", getWorksId())
            .toString();
    }
}
