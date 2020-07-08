package com.ruoyi.rabbitmq.domain;



/**
 * 
 * @ClassName MQProduct.java
 * @author yutao
 *
 */

public class Producer  {
	private Integer id;
	private String mcno;
	private String name;
	private String ip;
	private String username;
	private String pwd;
	private String exchangeName;
	private String routingKey;
	private String virtualhosts;
	private String port;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getMcno() {
		return mcno;
	}
	public void setMcno(String mcno) {
		this.mcno = mcno;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public String getExchangeName() {
		return exchangeName;
	}
	public void setExchangeName(String exchangeName) {
		this.exchangeName = exchangeName;
	}
	public String getRoutingKey() {
		return routingKey;
	}
	public void setRoutingKey(String routingKey) {
		this.routingKey = routingKey;
	}
	public String getVirtualhosts() {
		return virtualhosts;
	}
	public String getPort() {
		return port;
	}
	public void setVirtualhosts(String virtualhosts) {
		this.virtualhosts = virtualhosts;
	}
	public void setPort(String port) {
		this.port = port;
	}
	
}
