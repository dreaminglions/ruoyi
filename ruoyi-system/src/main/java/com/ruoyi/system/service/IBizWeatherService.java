package com.ruoyi.system.service;

import com.ruoyi.system.domain.BizWeather;
import java.util.List;

/**
 * 天气 服务层
 * 
 * @author ruoyi
 * @date 2020-05-26
 */
public interface IBizWeatherService 
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
     * 删除天气信息
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	public int deleteBizWeatherByIds(String ids);

	public List<BizWeather> selectWeatherLine(String areacode,String startTime,String endTime);
}
