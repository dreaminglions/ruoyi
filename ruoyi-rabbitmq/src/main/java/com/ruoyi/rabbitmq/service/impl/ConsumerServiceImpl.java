package com.ruoyi.rabbitmq.service.impl;

import com.ruoyi.common.core.text.Convert;
import com.ruoyi.rabbitmq.domain.Consumer;
import com.ruoyi.rabbitmq.mapper.ConsumerMapper;
import com.ruoyi.rabbitmq.service.IConsumerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 消费者 业务层处理
 * 
 * @author ruoyi
 */
@Service
public class ConsumerServiceImpl implements IConsumerService
{
    @Autowired
    private ConsumerMapper consumerMapper;

    @Override
    public List<Consumer> selectConsumerList(Consumer consumer) {
        return consumerMapper.selectConsumerList(consumer);
    }

    @Override
    public Consumer selectConsumerById(Long id) {
        return consumerMapper.selectConsumerById(id);
    }

    @Override
    public int deleteConsumerByIds(String ids) {
        return consumerMapper.deleteConsumerByIds(Convert.toStrArray(ids));
    }

    @Override
    public int insertConsumer(Consumer consumer) {
        return consumerMapper.insertConsumer(consumer);
    }

    @Override
    public int updateConsumer(Consumer consumer) {
        return consumerMapper.updateConsumer(consumer);
    }
}
