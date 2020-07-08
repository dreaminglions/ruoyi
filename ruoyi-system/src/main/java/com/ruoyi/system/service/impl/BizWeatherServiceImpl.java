package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.BizWeatherMapper;
import com.ruoyi.system.domain.BizWeather;
import com.ruoyi.system.service.IBizWeatherService;
import com.ruoyi.common.core.text.Convert;

/**
 * 天气 服务层实现
 * 
 * @author ruoyi
 * @date 2020-05-26
 */
@Service
public class BizWeatherServiceImpl implements IBizWeatherService 
{
	@Autowired
	private BizWeatherMapper bizWeatherMapper;

	/**
     * 查询天气信息
     * 
     * @param weatherId 天气ID
     * @return 天气信息
     */
    @Override
	public BizWeather selectBizWeatherById(Long weatherId)
	{
	    return bizWeatherMapper.selectBizWeatherById(weatherId);
	}
	
	/**
     * 查询天气列表
     * 
     * @param bizWeather 天气信息
     * @return 天气集合
     */
	@Override
	public List<BizWeather> selectBizWeatherList(BizWeather bizWeather)
	{
	    return bizWeatherMapper.selectBizWeatherList(bizWeather);
	}
	
    /**
     * 新增天气
     * 
     * @param bizWeather 天气信息
     * @return 结果
     */
	@Override
	public int insertBizWeather(BizWeather bizWeather)
	{
	    return bizWeatherMapper.insertBizWeather(bizWeather);
	}
	
	/**
     * 修改天气
     * 
     * @param bizWeather 天气信息
     * @return 结果
     */
	@Override
	public int updateBizWeather(BizWeather bizWeather)
	{
	    return bizWeatherMapper.updateBizWeather(bizWeather);
	}

	/**
     * 删除天气对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	@Override
	public int deleteBizWeatherByIds(String ids)
	{
		return bizWeatherMapper.deleteBizWeatherByIds(Convert.toStrArray(ids));
	}

	public List<BizWeather> selectWeatherLine(String areacode,String startTime,String endTime){
		return bizWeatherMapper.selectWeatherLine(areacode,startTime,endTime);
	}
}
