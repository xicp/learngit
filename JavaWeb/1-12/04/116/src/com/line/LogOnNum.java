package com.line;

import javax.servlet.http.HttpSession;
public class LogOnNum {
	private String username;
	private String backstr="";
    private OnLine on=new OnLine();
	
    public LogOnNum(){}
	public void setUsername(String username){
		this.username=username;
	}
	public String getUsername(){
		return this.username;
	}
    public boolean checkuser(HttpSession session){
    	boolean mark=true;
    	if(this.username==null||this.username.equals("")){
    		this.backstr="<li>请输入<b>用户名！</b></li><br>";
    		mark=false;
    	}
    	if(mark){
    		on.setUsername(this.username);
    		session.setAttribute("onlineuser",on);
    		mark=on.getMark();
    		if(!mark)
    			this.backstr="该用户已在线！";
    	}
        return mark;    	
    }
    public String getBackstr(){
    	return this.backstr;
    }
}
