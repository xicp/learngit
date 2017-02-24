package com.lh.bean;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class StringUtil {
	private String name;	//用户名
	private String pwd ;	//密码
	private String cue;		//HTML提示信息
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getCue() {
		//如果用户名或密码为null或""
		if((name==null||name.equals(""))||(pwd==null||pwd.equals(""))){
			cue= "请输入用户名或密码！";
		}else{//如果用户名和密码不为空
			if(name.equals("mr")&&pwd.equals("123")){
				cue= "登录成功！";
			}else{
				cue= "登录失败！ <b>用户名</b>或<b>密码</b>不正确！";
			}
		}
		return cue;
	}
	public void setCue(String cue) {
		this.cue = cue;
	}
}
