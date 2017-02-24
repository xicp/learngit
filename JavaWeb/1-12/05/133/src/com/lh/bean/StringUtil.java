package com.lh.bean;

import java.text.NumberFormat;

public class StringUtil {
	private int intValue;			//将要格式化的整型值
	private String formatStr;		//格式化后的字符串
	private int minimumDigit;		//格式化后字符串的最少位数
	public StringUtil(){}		 	//默认的构造方法
	public int getMinimumDigit() {
		return minimumDigit;
	}
	public void setMinimumDigit(int minimumDigit) {
		this.minimumDigit = minimumDigit;
	}
	public int getIntValue() {
		return intValue;
	}
	public void setIntValue(int intValue) {
		this.intValue = intValue;
	}
	public String getFormatStr() {
		NumberFormat nf =NumberFormat.getInstance();//获取常规数值格式对象
		nf.setMinimumIntegerDigits(minimumDigit);	//设置格式化数字的整数部分最少位数，如果位数不够用0补齐
		return nf.format(intValue);//返回格式化的字符串并把字符串中的","替换掉
	}
	public void setFormatStr(String formatStr) {
		this.formatStr = formatStr;
	}
	public static void main(String [] args){
		StringUtil s = new StringUtil();
		s.setIntValue(1234567890);
		s.setMinimumDigit(10);
		System.out.println(s.getFormatStr());
		
	}
}
