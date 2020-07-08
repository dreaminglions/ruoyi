package com.ruoyi.mqtt.controller;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.framework.util.ShiroUtils;
import com.ruoyi.mqtt.domain.Mqconsumer;
import com.ruoyi.mqtt.service.IMqconsumerService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 队列消费者信息
 *
 * @author ruoyi
 */
@Controller
@RequestMapping("/mqconsumer/data")
public class MqconsumerController extends BaseController {

    private String prefix = "mqconsumer/data";

    @Autowired
    private IMqconsumerService mqconsumerService;

    @RequiresPermissions("mqconsumer:data:view")
    @GetMapping()
    public String data()
    {
        return prefix + "/data";
    }

    /**
     * 查询列表
     */
    @PostMapping("/list")
    @RequiresPermissions("mqconsumer:data:list")
    @ResponseBody
    public TableDataInfo list(Mqconsumer consumer)
    {
        startPage();
        List<Mqconsumer> list = mqconsumerService.selectMqconsumerList(consumer);
        return getDataTable(list);
    }

    /**
     * 新增消费者
     */
    @GetMapping("/add")
    public String add(ModelMap mmap)
    {
        return prefix + "/add";
    }

    /**
     * 新增消费者
     */
    @RequiresPermissions("mqconsumer:data:add")
    @Log(title = "消费者管理", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Mqconsumer consumer)
    {
        consumer.setCreateBy(ShiroUtils.getLoginName());
        ShiroUtils.clearCachedAuthorizationInfo();
        return toAjax(mqconsumerService.insertMqconsumer(consumer));
    }

    /**
     * 修改
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        Mqconsumer mqConsumer = mqconsumerService.selectMqconsumerById(id);
        mmap.put("consumer", mqConsumer);
        return prefix + "/edit";
    }

    /**
     * 修改保存
     */
    @RequiresPermissions("mqconsumer:data:edit")
    @Log(title = "", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(Mqconsumer consumer)
    {
        return toAjax(mqconsumerService.updateMqconsumer(consumer));
    }


    /**
     * 删除
     */
    @RequiresPermissions("mqconsumer:data:remove")
    @Log(title = "", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(mqconsumerService.deleteMqconsumerByIds(ids));
    }

}
