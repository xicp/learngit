package com.lh.bean;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class StringUtil {
	private String dateStr;								//�����ַ���
	private Calendar calendar=null;						//���ַ���ת�����Calendar����
	public String getDateStr() {
		
		int year = calendar.get(calendar.YEAR);			//�����
		int month = calendar.get(calendar.MONTH)+1;		//�����
		int date = calendar.get(calendar.DAY_OF_MONTH);	//�����
		dateStr = year+"-"+month+"-"+date;				//���������ַ�������ʽΪ��2008-8-8
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
