package com.dmsv.vo;

public class LoginVo {

	private String username;
	private String password;
	private String reDirectPath;
	private String message;
	
	public String getReDirectPath() {
		return reDirectPath;
	}
	public void setReDirectPath(String reDirectPath) {
		this.reDirectPath = reDirectPath;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
}
