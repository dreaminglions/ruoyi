package com.ruoyi.system.mapper;

import com.ruoyi.system.domain.BizWeather;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 天气 数据层
 * 
 * @author ruoyi
 * @date 2020-05-26
 */
public interface BizWeatherMapper 
{
	/**
     * 查询天气信息
     * 
     * @param weatherId 天气ID
     * @return 天气信息
     */
	public BizWeather selectBizWeatherById(Long weatherId);
	
	/**
     * 查询天气列表
     * 
     * @param bizWeather 天气信息
     * @return 天气集合
     */
	public List<BizWeather> selectBizWeatherList(BizWeather bizWeather);
	
	/**
     * 新增天气
     * 
     * @param bizWeather 天气信息
     * @return 结果
     */
	public int insertBizWeather(BizWeather bizWeather);
	
	/**
     * 修改天气
     * 
     * @param bizWeather 天气信息
     * @return 结果
     */
	public int updateBizWeather(BizWeather bizWeather);
	
	/**
     * 删除天气
     * 
     * @param weatherId 天气ID
     * @return 结果
     */
	public int deleteBizWeatherById(Long weatherId);
	
	/**
     * 批量删除天气
     * 
     * @param weatherIds 需要删除的数据ID
     * @return 结果
     */
	public int deleteBizWeatherByIds(String[] weatherIds);

	public List<BizWeather> selectWeatherLine(@Param(value="areacode") String areacode, @Param(value="startTime") String startTime, @Param(value="endTime") String endTime);
}