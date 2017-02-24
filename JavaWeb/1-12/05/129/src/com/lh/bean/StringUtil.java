package com.lh.bean;

public class StringUtil {
	private String str; 			//要分隔的字符串
	private String strArr[];		//分隔后的字符串数组
	private String listSeparator;	//分隔符号
	public StringUtil(){}			//默认构造方法
	public String getStr() {
		return str;
	}
	public void setStr(String str) {
		this.str = str;
	}
	/**返回分隔符*/
	public String getListSeparator() {
		return listSeparator;
	}
	/**设置分隔符*/
	public void setListSeparator(String listSeparator) {
		this.listSeparator = listSeparator;
	}
	/**返回字符串数组*/
	public String[] getStrArr() {			
		return str.split(listSeparator); //根据分隔符号分隔字符串为数组
	}
}
