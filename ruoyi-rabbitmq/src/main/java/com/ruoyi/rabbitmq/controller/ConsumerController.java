package com.ruoyi.rabbitmq.controller;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.framework.util.ShiroUtils;
import com.ruoyi.rabbitmq.domain.Consumer;
import com.ruoyi.rabbitmq.service.IConsumerService;
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
@RequestMapping("/consumer/data")
public class ConsumerController extends BaseController {

    private String prefix = "consumer/data";

    @Autowired
    private IConsumerService consumerService;

    @RequiresPermissions("consumer:data:view")
    @GetMapping()
    public String data()
    {
        return prefix + "/data";
    }

    /**
     * 查询列表
     */
    @PostMapping("/list")
    @RequiresPermissions("consumer:data:list")
    @ResponseBody
    public TableDataInfo list(Consumer consumer)
    {
        startPage();
        List<Consumer> list = consumerService.selectConsumerList(consumer);
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
    @RequiresPermissions("consumer:data:add")
    @Log(title = "消费者管理", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Consumer consumer)
    {
        consumer.setCreateBy(ShiroUtils.getLoginName());
        ShiroUtils.clearCachedAuthorizationInfo();
        return toAjax(consumerService.insertConsumer(consumer));
    }

    /**
     * 修改
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        Consumer mqConsumer = consumerService.selectConsumerById(id);
        mmap.put("consumer", mqConsumer);
        return prefix + "/edit";
    }

    /**
     * 修改保存
     */
    @RequiresPermissions("consumer:data:edit")
    @Log(title = "", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(Consumer consumer)
    {
        return toAjax(consumerService.updateConsumer(consumer));
    }


    /**
     * 删除
     */
    @RequiresPermissions("consumer:data:remove")
    @Log(title = "", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(consumerService.deleteConsumerByIds(ids));
    }

}
