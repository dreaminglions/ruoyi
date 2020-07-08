package com.ruoyi.mqtt.service.impl;

import com.ruoyi.common.core.text.Convert;
import com.ruoyi.mqtt.domain.Mqconsumer;
import com.ruoyi.mqtt.mapper.MqconsumerMapper;
import com.ruoyi.mqtt.service.IMqconsumerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 消费者 业务层处理
 * 
 * @author ruoyi
 */
@Service
public class MqconsumerServiceImpl implements IMqconsumerService
{
    @Autowired
    private MqconsumerMapper mqconsumerMapper;

    @Override
    public List<Mqconsumer> selectMqconsumerList(Mqconsumer mqconsumer) {
        return mqconsumerMapper.selectMqconsumerList(mqconsumer);
    }

    @Override
    public Mqconsumer selectMqconsumerById(Long id) {
        return mqconsumerMapper.selectMqconsumerById(id);
    }

    @Override
    public int deleteMqconsumerByIds(String ids) {
        return mqconsumerMapper.deleteMqconsumerByIds(Convert.toStrArray(ids));
    }

    @Override
    public int insertMqconsumer(Mqconsumer mqconsumer) {
        return mqconsumerMapper.insertMqconsumer(mqconsumer);
    }

    @Override
    public int updateMqconsumer(Mqconsumer mqconsumer) {
        return mqconsumerMapper.updateMqconsumer(mqconsumer);
    }
}
