package com.lh.bean;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class StringUtil {
	private String timeStr1;					//日期字符串
	private String timeStr2;
	public String getTimeStr1() {
		Calendar c = Calendar.getInstance();	//创建表示当前时间的Calendar对象
		int year = c.get(c.YEAR);				//获得当前时间的年
		int month =c.get(c.MONTH)+1;			//获得当前时间的月
		int date = c.get(c.DAY_OF_MONTH);		//获得当前时间的日
		int hour = c.get(c.HOUR_OF_DAY);		//获得当前时间的小时
		int minute = c.get(c.MINUTE);			//获得当前时间的分钟
		int second = c.get(c.SECOND);			//获得当前时间的秒
		timeStr1 = year+"-"+month+"-"+date+" "+hour+":"+minute+":"+second;
		return timeStr1;
	}

	public void setTimeStr1(String timeStr1) {
		this.timeStr1 = timeStr1;
	}

	public String getTimeStr2() {
		Date date = new Date();					//创建表示当前时间的Date对象
		
		//创建格式化日期时间对象
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		timeStr2 = format.format(date);//格式化当前时间的Date对象
		return timeStr2;
	}

	public void setTimeStr2(String timeStr2) {
		this.timeStr2 = timeStr2;
	}

	public static void main(String [] args){
		Date d = new Date();
		StringUtil s = new StringUtil();
		
	}
}
