package com.lh.bean;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class StringUtil {
	private String dateStr;						//�����ַ���
	private Calendar calendar=null;				//���ַ���ת�����Calendar����
	public String getDateStr() {
		return dateStr;
	}
	public void setDateStr(String dateStr) {
		this.dateStr = dateStr;
	}
	public Calendar getCalendar() {
		Date date =null;						//����һ��Date���͵Ķ���
		SimpleDateFormat format = null;			//������ʽ�����ڵĶ���
		if(dateStr!=null){
			format = new SimpleDateFormat("yyyy-MM-dd");//�������ڵĸ�ʽ������
		
			calendar = Calendar.getInstance();	//����һ��Calendar���͵Ķ���
			try {								//forma.parse()�������׳��쳣
				date = format.parse(dateStr);	//���������ַ���������Date����
				calendar.setTime(date);			//ʹ��Date�������ô�Calendar�����ʱ��
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
