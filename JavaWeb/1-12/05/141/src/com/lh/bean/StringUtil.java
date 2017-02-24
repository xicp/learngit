package com.lh.bean;

import java.util.Calendar;
import java.util.Date;

public class StringUtil {
	private String dateStr;	//�û����������
	private boolean today;	//�ж��Ƿ�Ϊ����
	private String cue;		//��ʾ��Ϣ
	public StringUtil(){}
	public String getDateStr() {
		return dateStr;
	}
	public void setDateStr(String dateStr) {
		dateStr = dateStr.replaceAll(" ","");	//�滻�����еĿո�Ϊ""
		this.dateStr = dateStr;
	}
	public boolean isToday() {
		String dateArr[] = dateStr.split("-");	//�������ַ����ֽ�Ϊ����
		int year =Integer.parseInt(dateArr[0]);
		int month =Integer.parseInt(dateArr[1]);		
		int date = Integer.parseInt(dateArr[2]);
		Calendar now = Calendar.getInstance();	//���ϵͳ��ǰʱ���Calendar����
		int nowYear = now.get(now.YEAR);		//��õ�ǰʱ�����
		int nowMonth = now.get(now.MONTH)+1;	//��õ�ǰʱ�����
		int nowDate = now.get(now.DAY_OF_MONTH);//��õ�ǰʱ�����
		if(year==nowYear&&month==nowMonth&&date==nowDate){//��������յ�ֵ����ͬ
			cue="���������Ϊ��ǰ���ڣ�";
			today=true;
		}else{
			cue="��������ڲ��ǵ�ǰ���ڣ�";
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
