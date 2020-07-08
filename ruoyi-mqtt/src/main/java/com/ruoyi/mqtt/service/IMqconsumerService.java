package com.ruoyi.mqtt.service;

import com.ruoyi.mqtt.domain.Mqconsumer;
import java.util.List;

/**
 * 消费者 业务层
 * 
 * @author ruoyi
 */
public interface IMqconsumerService
{
    /**
     * 根据条件分页查询消费者数据
     *
     * @param mqconsumer 消费者数据信息
     * @return 消费者数据集合信息
     */
    public List<Mqconsumer> selectMqconsumerList(Mqconsumer mqconsumer);

    /**
     * 根据消费者数据ID查询信息
     * 
     * @param id 消费者数据ID
     * @return 消费者数据
     */
    public Mqconsumer selectMqconsumerById(Long id);

    /**
     * 批量删除消费者数据
     * 
     * @param ids 需要删除的数据
     * @return 结果
     */
    public int deleteMqconsumerByIds(String ids);

    /**
     * 新增保存消费者数据信息
     * 
     * @param mqconsumer 消费者数据信息
     * @return 结果
     */
    public int insertMqconsumer(Mqconsumer mqconsumer);

    /**
     * 修改保存消费者数据信息
     * 
     * @param mqconsumer 消费者数据信息
     * @return 结果
     */
    public int updateMqconsumer(Mqconsumer mqconsumer);
}
