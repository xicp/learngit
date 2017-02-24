package com.lh.bean;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class StringUtil {
	private String timeStr1;					//�����ַ���
	private String timeStr2;
	public String getTimeStr1() {
		Calendar c = Calendar.getInstance();	//������ʾ��ǰʱ���Calendar����
		int year = c.get(c.YEAR);				//��õ�ǰʱ�����
		int month =c.get(c.MONTH)+1;			//��õ�ǰʱ�����
		int date = c.get(c.DAY_OF_MONTH);		//��õ�ǰʱ�����
		int hour = c.get(c.HOUR_OF_DAY);		//��õ�ǰʱ���Сʱ
		int minute = c.get(c.MINUTE);			//��õ�ǰʱ��ķ���
		int second = c.get(c.SECOND);			//��õ�ǰʱ�����
		timeStr1 = year+"-"+month+"-"+date+" "+hour+":"+minute+":"+second;
		return timeStr1;
	}

	public void setTimeStr1(String timeStr1) {
		this.timeStr1 = timeStr1;
	}

	public String getTimeStr2() {
		Date date = new Date();					//������ʾ��ǰʱ���Date����
		
		//������ʽ������ʱ�����
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		timeStr2 = format.format(date);//��ʽ����ǰʱ���Date����
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
