package com.yr.lize.pojo;

public class ResponseResult {
	private Integer code;
	private String msg;
	private Integer count;
	private Object data;
	private Object data2;
	
	public Object getData2() {
		return data2;
	}
	public void setData2(Object data2) {
		this.data2 = data2;
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
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	public Object getData() {
		return data;
	}
	public void setData(Object data) {
		this.data = data;
	}
	
	
}
