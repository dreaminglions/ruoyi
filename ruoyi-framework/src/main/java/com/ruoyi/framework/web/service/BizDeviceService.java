package com.ruoyi.framework.web.service;

import com.ruoyi.common.annotation.DataScope;
import com.ruoyi.framework.util.ShiroUtils;
import com.ruoyi.framework.web.domain.server.Sys;
import com.ruoyi.system.domain.BizDevice;
import com.ruoyi.system.domain.SysDictData;
import com.ruoyi.system.domain.SysUser;
import com.ruoyi.system.service.IBizDeviceService;
import com.ruoyi.system.service.ISysDictDataService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * RuoYi首创 html调用 thymeleaf 实现设备读取
 * 
 * @author ruoyi
 */
@Service("bizDevice")
public class BizDeviceService
{
    @Autowired
    private IBizDeviceService bizDeviceService;

    /**
     * 根据字典类型查询字典数据信息
     * 
     *
     * @return 参数键值
     */
    public List<BizDevice> getBizDevice()
    {
        SysUser user = ShiroUtils.getSysUser();
        BizDevice bizDevice = new BizDevice();
        return bizDeviceService.selectBizDeviceList(bizDevice);
    }

    public List<BizDevice> getBizDeviceMaintain()
    {
        SysUser user = ShiroUtils.getSysUser();
        BizDevice bizDevice = new BizDevice();
        return bizDeviceService.selectBizDeviceMaintainList(bizDevice);
    }

    /**
     * 查询只符合设备类型列表
     *
     * @return 设备集合
     */
    public List<BizDevice> selectOnlydeviceList()
    {
        BizDevice bizDevice = new BizDevice();
        return bizDeviceService.selectOnlydeviceList(bizDevice);
    }


    public String getDeviceName(long bizDeviceId)
    {
        String deviceName="";
        BizDevice bizDevice =bizDeviceService.selectBizDeviceById(bizDeviceId);
        if(bizDevice!=null){
            deviceName = bizDevice.getDeviceName();
        }
        return deviceName;
    }

}
