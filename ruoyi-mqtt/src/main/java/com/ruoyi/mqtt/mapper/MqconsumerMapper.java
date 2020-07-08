package com.ruoyi.mqtt.mapper;

import com.ruoyi.mqtt.domain.Mqconsumer;
import com.ruoyi.mqtt.domain.Mqconsumer;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 消费者表 数据层
 * 
 * @author ruoyi
 */
public interface MqconsumerMapper
{
    /**
     * 根据条件分页查询字典数据
     * 
     * @param mqconsumer 字典数据信息
     * @return 字典数据集合信息
     */
    public List<Mqconsumer> selectMqconsumerList(Mqconsumer mqconsumer);

    public List<Mqconsumer> getAll();

    /**
     * 查询信息
     *
     * @param id ID
     * @return 信息
     */
    public Mqconsumer selectMqconsumerById(Long id);

    /**
     * 新增消费者信息
     *
     * @param mqconsumer 角色信息
     * @return 结果
     */
    public int insertMqconsumer(Mqconsumer mqconsumer);


    /**
     * 修改
     *
     * @param mqconsumer 信息
     * @return 结果
     */
    public int updateMqconsumer(Mqconsumer mqconsumer);

    /**
     * 批量删除
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteMqconsumerByIds(String[] ids);
}
