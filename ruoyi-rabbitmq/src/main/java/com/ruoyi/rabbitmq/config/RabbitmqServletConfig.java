package com.ruoyi.rabbitmq.config;

import com.ruoyi.rabbitmq.listener.RabbitmqListener;
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
public class RabbitmqServletConfig implements WebMvcConfigurer{

    // 注册Listener
    @Bean
    public ServletListenerRegistrationBean myListener(){
        ServletListenerRegistrationBean<EventListener> servletListenerRegistrationBean = new ServletListenerRegistrationBean<>();
        servletListenerRegistrationBean.setListener(new RabbitmqListener());
        return servletListenerRegistrationBean;
    }
}
