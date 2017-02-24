package com.count.Online;

import java.sql.*;
public class CountOnline {
	private String userip;
	private String nowdate;
	private int times;
	private DB db=new DB();
	public CountOnline(){}
	public void setUserip(String userip){
		this.userip=userip;
	}
	public String getUserip(){
		return this.userip;
	}
	public void setNowdate(String nowdate){
		this.nowdate=nowdate;
	}
	public String getNowdate(){
		return this.nowdate;
	}
	public void setTimes(int times){
		this.times=times;
	}
	public int getTimes(){
		return this.times;
	}
    public ResultSet adduser(){
    	ResultSet rs=null;
    	String sql="insert into tb_IPcount values("+this.times+",'"+this.userip+"','"+this.nowdate+"')";
    	try{
    		db.dosql(sql);
    	    rs=db.search("select * from tb_IPcount");
    	}catch(Exception e){e.printStackTrace();}
    	return rs;
    }
    public void dbclose(){
    	db.closed();
    }
}
