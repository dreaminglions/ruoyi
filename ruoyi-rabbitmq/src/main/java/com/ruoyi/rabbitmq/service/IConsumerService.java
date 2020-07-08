package com.ruoyi.rabbitmq.service;

import com.ruoyi.rabbitmq.domain.Consumer;

import java.util.List;

/**
 * 消费者 业务层
 * 
 * @author ruoyi
 */
public interface IConsumerService
{
    /**
     * 根据条件分页查询消费者数据
     *
     * @param consumer 消费者数据信息
     * @return 消费者数据集合信息
     */
    public List<Consumer> selectConsumerList(Consumer consumer);

    /**
     * 根据消费者数据ID查询信息
     * 
     * @param id 消费者数据ID
     * @return 消费者数据
     */
    public Consumer selectConsumerById(Long id);

    /**
     * 批量删除消费者数据
     * 
     * @param ids 需要删除的数据
     * @return 结果
     */
    public int deleteConsumerByIds(String ids);

    /**
     * 新增保存消费者数据信息
     * 
     * @param consumer 消费者数据信息
     * @return 结果
     */
    public int insertConsumer(Consumer consumer);

    /**
     * 修改保存消费者数据信息
     * 
     * @param consumer 消费者数据信息
     * @return 结果
     */
    public int updateConsumer(Consumer consumer);
}
