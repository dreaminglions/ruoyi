package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 天气表 biz_weather
 * 
 * @author ruoyi
 * @date 2020-05-26
 */
public class BizWeather extends BaseEntity
{
	private static final long serialVersionUID = 1L;
	
	/** 天气Id */
	private Long weatherId;
	/** 省份code */
	private String weatherProvince;
	/** 城市code */
	private String weatherCity;
	/** 地区code */
	private String weatherArea;
	/** 天气日期 */
	private String weatherDate;
	/** 白天温度 */
	private Float weatherDaytemp;
	/** 晚上温度 */
	private Float weatherNighttemp;
	/** 白天风力 */
	private int weatherDaypower;
	/** 晚上风力 */
	private int weatherNightpower;

	public void setWeatherId(Long weatherId) 
	{
		this.weatherId = weatherId;
	}

	public Long getWeatherId() 
	{
		return weatherId;
	}
	public void setWeatherProvince(String weatherProvince) 
	{
		this.weatherProvince = weatherProvince;
	}

	public String getWeatherProvince() 
	{
		return weatherProvince;
	}
	public void setWeatherCity(String weatherCity) 
	{
		this.weatherCity = weatherCity;
	}

	public String getWeatherCity() 
	{
		return weatherCity;
	}
	public void setWeatherArea(String weatherArea) 
	{
		this.weatherArea = weatherArea;
	}

	public String getWeatherArea() 
	{
		return weatherArea;
	}
	public void setWeatherDate(String weatherDate) 
	{
		this.weatherDate = weatherDate;
	}

	public String getWeatherDate() 
	{
		return weatherDate;
	}
	public void setWeatherDaytemp(Float weatherDaytemp) 
	{
		this.weatherDaytemp = weatherDaytemp;
	}

	public Float getWeatherDaytemp() 
	{
		return weatherDaytemp;
	}
	public void setWeatherNighttemp(Float weatherNighttemp) 
	{
		this.weatherNighttemp = weatherNighttemp;
	}

	public Float getWeatherNighttemp() 
	{
		return weatherNighttemp;
	}

	public int getWeatherDaypower() {
		return weatherDaypower;
	}

	public void setWeatherDaypower(int weatherDaypower) {
		this.weatherDaypower = weatherDaypower;
	}

	public int getWeatherNightpower() {
		return weatherNightpower;
	}

	public void setWeatherNightpower(int weatherNightpower) {
		this.weatherNightpower = weatherNightpower;
	}

	public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("weatherId", getWeatherId())
            .append("weatherProvince", getWeatherProvince())
            .append("weatherCity", getWeatherCity())
            .append("weatherArea", getWeatherArea())
            .append("weatherDate", getWeatherDate())
            .append("weatherDaytemp", getWeatherDaytemp())
            .append("weatherNighttemp", getWeatherNighttemp())
			.append("weatherDaypower", getWeatherDaypower())
			.append("weatherNightpower", getWeatherNightpower())
            .append("createTime", getCreateTime())
            .append("createBy", getCreateBy())
            .append("updateTime", getUpdateTime())
            .append("updateBy", getUpdateBy())
            .toString();
    }
}
