package com.ruoyi.netty.config;

import com.ruoyi.netty.listener.NettyListener;
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
public class NettyServletConfig implements WebMvcConfigurer{

    // 注册Listener
//    @Bean
//    public ServletListenerRegistrationBean nettyListener(){
//        ServletListenerRegistrationBean<EventListener> servletListenerRegistrationBean = new ServletListenerRegistrationBean<>();
//        servletListenerRegistrationBean.setListener(new NettyListener());
//        return servletListenerRegistrationBean;
//    }
}
