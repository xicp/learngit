package com.lh.bean;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class StringUtil {
	private String dateStr1;	//��һ�������ַ���
	private String dateStr2;	//�ڶ��������ַ���
	private int minus;			//�������ڵĲ�
	public String getDateStr1() {
		return dateStr1;
	}
	public void setDateStr1(String dateStr1) {
		this.dateStr1 = dateStr1;
	}
	public String getDateStr2() {
		return dateStr2;
	}
	public void setDateStr2(String dateStr2) {
		this.dateStr2 = dateStr2;
	}
	public int getMinus() {
		Calendar c1 = this.getCalendar(dateStr1);	//���ݵ�һ�������ַ������Calendar����
		Calendar c2 = this.getCalendar(dateStr2);	//���ݵڶ��������ַ������Calendar����
		long t1 = c1.getTimeInMillis();				//��ô˶����ʱ��ֵ���Ժ���Ϊ��λ
		long t2 = c2.getTimeInMillis();				//��ô˶����ʱ��ֵ���Ժ���Ϊ��λ
		long t = 1000*60*60*24;						//1000����*60��*60����*24Сʱ
		minus =  (int)((t2-t1)/t);					//�������������������
		return minus;
	}
	public void setMinus(int minus) {
		this.minus = minus;
	}
	public Calendar getCalendar(String dateStr) {
		Date date =null;						//����һ��Date���͵Ķ���
		SimpleDateFormat format = null;			//������ʽ�����ڵĶ���
		Calendar calendar = null;
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
}
