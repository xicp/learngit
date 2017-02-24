package com.count.stoptime;
import java.util.*;
public class StopTime {
	private int h=0;
	private int m=0;
	private int s=0;
	public StopTime(){}
	public void counttime(Date start){
		  Date end=new Date();
		  long howmuch=end.getTime()-start.getTime();
		  h=(int)(howmuch/1000/60/60);
		  howmuch=howmuch-h*60*60*1000;
		  m=(int)(howmuch/1000/60);
		  howmuch=howmuch-m*60*1000;
		  s=(int)(howmuch/1000);
	}
	public int getH(){
		return this.h;
	}
	public int getM(){
		return this.m;
	}
	public int getS(){
		return this.s;
	}

}
