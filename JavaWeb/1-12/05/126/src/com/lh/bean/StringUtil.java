package com.lh.bean;

public class StringUtil {
	private String str;									//要替换的字符串
	public void setStr(String str){
		this.str = str;
	}
	public String getStr(){
		return replace(str);
	}
	/**
	 * 替换字符串的方法
	 * @param str：源字符串
	 * @return 替换后的字符串
	 */
	public String replace(String str){
		String newStr1="";
		String newStr2="";
		newStr1 = str.replaceAll(" ", "&nbsp;");		//替换字符串中的空格为"&nbsp"
		newStr2 = newStr1.replaceAll("\r\n", "<br>");	//替换换行符为"<br>"
		return newStr2;									//返回替换后的字符串
	}
}
