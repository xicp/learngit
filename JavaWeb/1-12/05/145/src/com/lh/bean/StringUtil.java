package com.lh.bean;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class StringUtil {
	private String dateStr;								//日期字符串
	private Calendar calendar=null;						//将字符串转换后的Calendar对象
	public String getDateStr() {
		
		int year = calendar.get(calendar.YEAR);			//获得年
		int month = calendar.get(calendar.MONTH)+1;		//获得月
		int date = calendar.get(calendar.DAY_OF_MONTH);	//获得日
		dateStr = year+"-"+month+"-"+date;				//生成日期字符串，格式为：2008-8-8
		return dateStr;
	}
	public void setDateStr(String dateStr) {
		this.dateStr = dateStr;
	}
	public Calendar getCalendar() {
		return calendar;
	}
	public void setCalendar(Calendar calendar) {
		this.calendar = calendar;
	}
	
}
