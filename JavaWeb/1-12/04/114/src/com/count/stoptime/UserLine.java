package com.count.stoptime;

import java.util.*;
import javax.servlet.http.HttpSessionBindingEvent;
public class UserLine implements javax.servlet.http.HttpSessionBindingListener{
	private String username;
	private String userip;
	private StopTime stoptime=new StopTime();
	public UserLine(){
		username="";
	}
	public void setUsername(String username){
		this.username=username;
	}
	public String getUsername(){
		return this.username;
	}
	public void setUserip(String userip){
		this.userip=userip;
	}
	public void valueBound(HttpSessionBindingEvent arg0){
		stoptime.setStart(new Date());
		System.out.println(this.userip+"于"+new Date().toLocaleString()+"上线！");
	}
	public void valueUnbound(HttpSessionBindingEvent arg0){
		stoptime.counttime(new Date());
		System.out.println(this.userip+"于"+new Date().toLocaleString()+"下线！");
		writetime();
	}
	public void writetime(){
		String starttime=stoptime.getStart();
		String endtime=stoptime.getEnd();
        String times=stoptime.getTimes();
        System.out.println("停留时间："+times);
		String sql="insert into tb_stoptime values('"+this.userip+"','"+starttime+"','"+endtime+"','"+times+"')";
		DB db=new DB();
		db.dosql(sql);
		db.closed();
	}
    
}
