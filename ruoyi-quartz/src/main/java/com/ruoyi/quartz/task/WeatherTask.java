package com.ruoyi.quartz.task;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.ruoyi.system.domain.BizWeather;
import com.ruoyi.system.domain.WeatherEnity;
import com.ruoyi.system.service.IBizWaterWorkService;
import com.ruoyi.system.service.IBizWeatherService;
import com.ruoyi.system.service.ISysMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import com.ruoyi.system.service.ISysMenuService;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * 定时任务调度测试
 * 
 * @author ruoyi
 */
@Component("weatherTask")
public class WeatherTask
{

    @Autowired
    private ISysMenuService menuService;
    @Autowired
    private IBizWaterWorkService bizWaterWorkService;
    @Autowired
    private IBizWeatherService bizWeatherService;

    public void weatherParams(String params)
    {
        System.out.println("执行weather有参方法：" + params);
    }

    public void weatherNoParams()
    {
        System.out.println("执行weather无参方法");

        //查找水厂所在地区（精确到区）
        List<WeatherEnity> codeList = bizWaterWorkService.selectWorksCode();
        for(WeatherEnity list:codeList){
            //根据地区请求天气预报（早晚温度），写入数据
            String provincecode = list.getProvinceCode();
            String citycode = list.getCityCode();
            String areacode=list.getAreaCode();
            String url = "https://restapi.amap.com/v3/weather/weatherInfo?city="+areacode+"&key=deb0d67468ab2b3b4a4ea116406d93bb&extensions=all";
            JSONObject description = menuService.getWeather(url);
            System.out.println("天气："+description.toString());
            JSONObject  Object = JSONObject.parseObject(JSONArray.parseArray(description.getString("forecasts")).get(0).toString());
            JSONArray  casts = JSONArray.parseArray(Object.getString("casts"));
            if(!casts.isEmpty()){
                String  array = JSONArray.parseArray(Object.getString("casts")).get(0).toString();
                String daytemp = JSONObject.parseObject(array).getString("daytemp");
                String nighttemp = JSONObject.parseObject(array).getString("nighttemp");
                String daypower = JSONObject.parseObject(array).getString("daypower");
                String nightpower = JSONObject.parseObject(array).getString("nightpower");
                daypower = daypower.replace("≤","");
                nightpower = nightpower.replace("≤","");

                BizWeather weather = new BizWeather();
                weather.setWeatherProvince(provincecode);
                weather.setWeatherCity(citycode);
                weather.setWeatherArea(areacode);
                weather.setWeatherDaytemp(Float.valueOf(daytemp));
                weather.setWeatherNighttemp(Float.valueOf(nighttemp));
                weather.setWeatherDaypower(Integer.valueOf(daypower));
                weather.setWeatherNightpower(Integer.valueOf(nightpower));
                SimpleDateFormat format_date = new SimpleDateFormat("yyyy-MM-dd");
                weather.setWeatherDate(format_date.format(new Date()));
                bizWeatherService.insertBizWeather(weather);
            }
        }

    }
}
