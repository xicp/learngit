package com.lh.bean;

import java.util.Calendar;
import java.util.Date;

public class StringUtil {
	private String dateStr;	//用户输入的日期
	private boolean today;	//判断是否为今天
	private String cue;		//提示信息
	public StringUtil(){}
	public String getDateStr() {
		return dateStr;
	}
	public void setDateStr(String dateStr) {
		dateStr = dateStr.replaceAll(" ","");	//替换日期中的空格为""
		this.dateStr = dateStr;
	}
	public boolean isToday() {
		String dateArr[] = dateStr.split("-");	//将日期字符串分解为数组
		int year =Integer.parseInt(dateArr[0]);
		int month =Integer.parseInt(dateArr[1]);		
		int date = Integer.parseInt(dateArr[2]);
		Calendar now = Calendar.getInstance();	//获得系统当前时间的Calendar对象
		int nowYear = now.get(now.YEAR);		//获得当前时间的年
		int nowMonth = now.get(now.MONTH)+1;	//获得当前时间的月
		int nowDate = now.get(now.DAY_OF_MONTH);//获得当前时间的日
		if(year==nowYear&&month==nowMonth&&date==nowDate){//如果年月日的值都相同
			cue="输入的日期为当前日期！";
			today=true;
		}else{
			cue="输入的日期不是当前日期！";
			today=false;
		}
		return today;
	}
	public String getCue() {
		return cue;
	}
	public void setCue(String cue) {
		this.cue = cue;
	}
	public void setToday(boolean today) {
		this.today = today;
	}
}
