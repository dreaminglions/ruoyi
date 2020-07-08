package com.ruoyi.framework.web.service;

import com.ruoyi.framework.util.ShiroUtils;
import com.ruoyi.system.domain.BizDevice;
import com.ruoyi.system.domain.Region;
import com.ruoyi.system.domain.SysUser;
import com.ruoyi.system.service.IBizDeviceService;
import com.ruoyi.system.service.IRegionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * RuoYi首创 html调用 thymeleaf 实现设备读取
 * 
 * @author ruoyi
 */
@Service("sysRegion")
public class RegionService
{
    @Autowired
    private IRegionService regionService;



    public List<Region> selectByParentCode(String parentCode)
    {
        return regionService.selectByParentCode(parentCode);
    }

}
