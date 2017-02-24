package com.count.stoptime;
import java.util.*;
import java.text.*;
public class StopTime {
	private int h=0;
	private int m=0;
	private int s=0;
	private Date start=null;
	private Date end=null;
	private SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
	public StopTime(){}
	public void setStart(Date start){
		this.start=start;
	}
	public void counttime(Date end){
		 this.end=end;
		 long howmuch=this.end.getTime()-start.getTime();
		 h=(int)(howmuch/1000/60/60);
		 howmuch=howmuch-h*60*60*1000;
		 m=(int)(howmuch/1000/60);
		 howmuch=howmuch-m*60*1000;
		 s=(int)(howmuch/1000);
	}
	public String getTimes(){
		String times=this.h+"–° ±"+this.m+"∑÷"+this.s+"√Î";
		return times;
	}
	public String getStart(){
		return format.format(start);
	}
	public String getEnd(){
		return format.format(end);
	}

}
