package com.lh.bean;

public class StringUtil {
	private String str; 				//需要计算长度的字符串
	private int strLength;				//字符串实际长度
	public String getStr() {
		return str;
	}
	public void setStr(String str) {
		this.str = str;
	}
	public int getStrLength() {
		char[] c =str.toCharArray();	//将字符串转换为字符数组
		int factualLength = 0; 			//用于保存每个字符的实际长度 
		for(int i=0;i<c.length;i++){
			factualLength =String.valueOf(c[i]).getBytes().length;//获得每个字符转换为字节数组后的长度
			if(factualLength==3){
				factualLength =2;		//每个汉字字符占2位
			}
			strLength+=factualLength;	//将每个字符的长度累加，结果就是字符串的总长度
		}
		return strLength;
	}
	public void setStrLength(int strLength) {
		this.strLength = strLength;
	}
}
