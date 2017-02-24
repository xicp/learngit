package com.lh.bean;

public class StringUtil {
	private int intValue1;
	private int intValue2;
	private String strValue;
	public StringUtil(){}//默认构造方法
	public int getIntValue1() {
		return Integer.parseInt(strValue);//使用Integer类的parseInt方法转换
	}
	public int getIntValue2() {
		return Integer.valueOf(strValue);//使用Integer 类的valueOf方法转换
	}
	
	public String getStrValue() {
		return strValue;
	}
	public void setStrValue(String strValue) {
		this.strValue = strValue;
	}
}
