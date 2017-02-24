package com.lh.bean;

public class StringUtil {
	private int intValue=0;		//转换前的int值
	private String strValue1;	//转换后的字符串1值
	private String strValue2;	//转换后的字符串2值
	private String strValue3;	//转换后的字符串3值
	public StringUtil(){}		//默认构造方法
	public int getIntValue() {
		return intValue;
	}
	public void setIntValue(int intValue) {
		this.intValue = intValue;
	}
	public String getStrValue1() {
		return String.valueOf(intValue);//使用String类的valueOf方法转换
	}
	public void setStrValue1(String strValue1) {
		this.strValue1 = strValue1;
	}
	public String getStrValue2() {
		return Integer.toString(intValue);//使用Integer类的toString方法转换
	}
	public void setStrValue2(String strValue2) {
		this.strValue2 = strValue2;
	}
	public String getStrValue3() {
		return Integer.valueOf(intValue).toString(); //使用Integer类的valueOf方法，然后再使用toString方法
	}
	public void setStrValue3(String strValue3) {
		this.strValue3 = strValue3;
	}
	
}
