package com.ruoyi.framework.web.service;

import com.ruoyi.framework.util.ShiroUtils;
import com.ruoyi.system.domain.*;
import com.ruoyi.system.service.IBizDeviceService;
import com.ruoyi.system.service.IBizWaterWorkService;
import com.ruoyi.system.service.IBizWorksService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * RuoYi首创 html调用 thymeleaf 实现设备读取
 * 
 * @author ruoyi
 */
@Service("bizWorks")
public class BizWorksService
{
    @Autowired
    private IBizWaterWorkService bizWaterWorkService;

    /**
     * 查询水厂列表
     * 
     *
     * @return 参数键值
     */
    public List<BizWaterWork> getBizWorks()
    {
        BizWaterWork bizWorks = new BizWaterWork();
        return bizWaterWorkService.selectBizWaterWorkList(bizWorks);
    }

    /**
     * 查询集团列表
     * @return 参数键值
     */
    public List<BizWaterWork> getOnlyGroup()
    {
        BizWaterWork bizWorks = new BizWaterWork();
//        bizWorks.setWorksType("0");
        bizWorks.setWorksType("2");
        return bizWaterWorkService.selectBizWaterWorkList(bizWorks);
    }

    /**
     * 查询水厂列表
     * @return 参数键值
     */
    public List<BizWaterWork> getOnlyWorks()
    {
        BizWaterWork bizWorks = new BizWaterWork();
        return bizWaterWorkService.selectOnlyWorkList(bizWorks);
    }

    /**
     * 根据水厂ID查询水厂名称
     *
     *
     * @return 参数键值
     */
    public String getWorksName(long bizDeviceId)
    {
        String worksName="";
        BizWaterWork bizWorks =bizWaterWorkService.selectBizWaterWorkById(bizDeviceId);
        if(bizWorks!=null){
            worksName = bizWorks.getWorksName();
        }
        return worksName;
    }

    /**
     * 查询集团列表
     * @return 参数键值
     */
    public List<BizWaterWork> getOnlyPlatform()
    {
        BizWaterWork bizWorks = new BizWaterWork();
//        bizWorks.setWorksType("0");
        bizWorks.setWorksType("1");
        return bizWaterWorkService.selectBizWaterWorkList(bizWorks);
    }

}
