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
    public ResultSet checkuser(){
    	String sql="select * from tb_newusercount where user_ip='"+this.userip+"'";
    	ResultSet rs=null;
    	try{
    		rs=db.search(sql);
    	    if(rs.next()){
    	    	this.times=rs.getInt("user_times")+1;
    	    	sql="update tb_newusercount set user_times="+this.times+" where user_ip='"+this.userip+"'";
    	    	db.dosql(sql);
    	    }
    	    else{
    	    	this.times=1;
    	    	sql="insert into tb_newusercount values('"+this.userip+"',1)";
    	    	db.dosql(sql);
    	    }
    	    rs=db.search("select * from tb_newusercount");
    	}catch(Exception e){e.printStackTrace();}
    	return rs;
    }
    public void dbclose(){
    	db.closed();
    }
}
