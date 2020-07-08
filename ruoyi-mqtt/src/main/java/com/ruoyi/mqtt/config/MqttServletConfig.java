package com.ruoyi.mqtt.config;

import com.ruoyi.mqtt.listener.MqttListener;
import com.ruoyi.mqtt.listener.MqttListener;
import org.springframework.boot.web.servlet.ServletListenerRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.util.EventListener;

/**
 * 通用配置
 *
 * @author ruoyi
 */
@Configuration
public class MqttServletConfig implements WebMvcConfigurer{

    // 注册Listener
    @Bean
    public ServletListenerRegistrationBean mqttListener(){
        ServletListenerRegistrationBean<EventListener> servletListenerRegistrationBean = new ServletListenerRegistrationBean<>();
        servletListenerRegistrationBean.setListener(new MqttListener());
        return servletListenerRegistrationBean;
    }
}
