package com.ruoyi.rabbitmq.mapper;

import com.ruoyi.rabbitmq.domain.Consumer;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 消费者表 数据层
 * 
 * @author ruoyi
 */
public interface ConsumerMapper
{
    /**
     * 根据条件分页查询字典数据
     * 
     * @param consumer 字典数据信息
     * @return 字典数据集合信息
     */
    public List<Consumer> selectConsumerList(Consumer consumer);

    public List<Consumer> getAll();

    /**
     * 查询信息
     *
     * @param id ID
     * @return 信息
     */
    public Consumer selectConsumerById(Long id);

    /**
     * 新增消费者信息
     *
     * @param consumer 角色信息
     * @return 结果
     */
    public int insertConsumer(Consumer consumer);

    /**
     * 插入信息
     *
     * @param message 用户名
     * @return
     */
    public int insertMessage(@Param("message") String message);

    public String findMessage();

    /**
     * 插入信息
     *
     * @param message 用户名
     * @return
     */
    public int insertAlert(@Param("message") String message);

    /**
     * 修改
     *
     * @param mqConsumer 信息
     * @return 结果
     */
    public int updateConsumer(Consumer mqConsumer);

    /**
     * 批量删除
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteConsumerByIds(String[] ids);
}
