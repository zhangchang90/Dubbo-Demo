package com.zhang.crud.bean;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

public class Msg implements Serializable{
	//成功 code=100，失败code=200
	private Integer code;
	private String msg;
	private Map<String, Object> extend = new HashMap<String, Object>();
	
	public static Msg success() {
		Msg result = new Msg();
		result.setCode(100);
		result.setMsg("操作成功！");
		return result;
	}
	
	public static Msg fail() {
		Msg result = new Msg();
		result.setCode(200);
		result.setMsg("操作失败！");
		return result;
	}
	
	public Msg add(String key, Object value) {
		this.extend.put(key, value);
		return this;
	}


	
	public Integer getCode() {
		return code;
	}
	public void setCode(Integer code) {
		this.code = code;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public Map getExtend() {
		return extend;
	}
	public void setExtend(Map extend) {
		this.extend = extend;
	}
	
	
	
}
