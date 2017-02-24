package com.lh.bean;

public class StringUtil {
	private String startStr ;	//指定开头的字符串
	private String str;			//被判断的字符串
	private boolean check;		//判断结果
	public String getStartStr() {
		return startStr;
	}
	public void setStartStr(String startStr) {
		this.startStr = startStr;
	}
	public String getStr() {
		return str;
	}
	public void setStr(String str) {
		this.str = str;
	}
	public boolean isCheck() {
		//使用startsWith方法判断字符串是否以制定字符开头，如果是则返回ture，否则返回false
		return str.startsWith(startStr);
	}
}
