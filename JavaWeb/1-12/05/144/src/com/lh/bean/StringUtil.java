package com.lh.bean;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class StringUtil {
	private String dateStr;						//日期字符串
	private Calendar calendar=null;				//将字符串转换后的Calendar对象
	public String getDateStr() {
		return dateStr;
	}
	public void setDateStr(String dateStr) {
		this.dateStr = dateStr;
	}
	public Calendar getCalendar() {
		Date date =null;						//声明一个Date类型的对象
		SimpleDateFormat format = null;			//声明格式化日期的对象
		if(dateStr!=null){
			format = new SimpleDateFormat("yyyy-MM-dd");//创建日期的格式化类型
		
			calendar = Calendar.getInstance();	//创建一个Calendar类型的对象
			try {								//forma.parse()方法会抛出异常
				date = format.parse(dateStr);	//解析日期字符串，生成Date对象
				calendar.setTime(date);			//使用Date对象设置此Calendar对象的时间
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		return calendar;
	}
	public void setCalendar(Calendar calendar) {
		this.calendar = calendar;
	}
	public static void main(String [] args){
		
		Date date =new Date();
		String d = null;
		SimpleDateFormat format = new SimpleDateFormat("yyyy.mm.dd hh:mm:ss");
		d= format.format(date);
		System.out.println(d);
	}
}
