package com.ruoyi.rabbitmq.domain;

import com.ruoyi.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class Consumer extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 队列消费者ID */
    private Long  id;

    /** 消费者姓名 */
    private String name;

    /** 消费者exchangename */
    private String exchangename;

    /** 消费者ip */
    private String ip;

    /** 消费者username */
    private String username;

    /** 消费者pwd */
    private String pwd;

    /** 消费者routingkey */
    private String routingkey;

    /** 消费者virtualhosts */
    private String virtualhosts;

    /** 消费者port */
    private String port;

    /** 消费者status */
    private String status;

    public Long  getId() {
        return id;
    }

    public void setId(Long  id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getExchangename() {
        return exchangename;
    }

    public void setExchangename(String exchangename) {
        this.exchangename = exchangename;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public String getRoutingkey() {
        return routingkey;
    }

    public void setRoutingkey(String routingkey) {
        this.routingkey = routingkey;
    }

    public String getVirtualhosts() {
        return virtualhosts;
    }

    public void setVirtualhosts(String virtualhosts) {
        this.virtualhosts = virtualhosts;
    }

    public String getPort() {
        return port;
    }

    public void setPort(String port) {
        this.port = port;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("id", getId())
                .append("name", getName())
                .append("exchangename", getExchangename())
                .append("ip", getIp())
                .append("username", getUsername())
                .append("pwd", getPwd())
                .append("routingkey", getRoutingkey())
                .append("virtualhosts", getVirtualhosts())
                .append("port", getPort())
                .append("status", getStatus())
                .toString();
    }
}
