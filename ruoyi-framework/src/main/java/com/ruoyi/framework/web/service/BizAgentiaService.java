package com.ruoyi.framework.web.service;

import com.ruoyi.framework.util.ShiroUtils;
import com.ruoyi.system.domain.BizAgentia;
import com.ruoyi.system.domain.BizDevice;
import com.ruoyi.system.domain.SysRole;
import com.ruoyi.system.domain.SysUser;
import com.ruoyi.system.service.IBizAgentiaService;
import com.ruoyi.system.service.IBizDeviceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * RuoYi首创 html调用 thymeleaf 实现设备读取
 * 
 * @author ruoyi
 */
@Service("bizAgentia")
public class BizAgentiaService
{
    @Autowired
    private IBizAgentiaService bizAgentiaService;

    /**
     * 根据字典类型查询字典数据信息
     * 
     *
     * @return 参数键值
     */
    public List<BizAgentia> getBizAgentia()
    {
        BizAgentia bizAgentia = new BizAgentia();
        return bizAgentiaService.selectBizAgentiaList(bizAgentia);
    }

    public List<BizAgentia> getAgentiaByType(String AgentiaType)
    {
        BizAgentia bizAgentia = new BizAgentia();
        SysRole role = ShiroUtils.getSysUser().getRole();
        String dataScope = role.getDataScope();
        bizAgentia.setAgentiaType(AgentiaType);
        List<BizAgentia> list = new ArrayList<BizAgentia>();
//        if ("1".equals(dataScope)){
            list = bizAgentiaService.selectBizAgentiaList(bizAgentia);
//        }
        return list;
    }

    public String getAgentiaName(long agentiaId)
    {
        String agentiaName="";
        BizAgentia bizAgentia =bizAgentiaService.selectDeviceAgentiaById(agentiaId);
        if(bizAgentia!=null){
            agentiaName = bizAgentia.getAgentiaName();
        }
        return agentiaName;
    }

}
