package com.lh.bean;

import java.util.Calendar;
import java.util.Date;

public class StringUtil {
	private String numStr;	//要判断的字符串
	private boolean number;	//判断结果
	private String cue ;	//提示信息
	public String getCue() {
		return cue;
	}
	public void setCue(String cue) {
		this.cue = cue;
	}
	public String getNumStr() {
		return numStr;
	}
	public void setNumStr(String numStr) {
		numStr= numStr.replaceAll(" ", "");		//去掉字符串中的空格
		this.numStr = numStr;
	}
	public boolean isNumber() {
		char cArr[]= numStr.toCharArray();		//将字符串转换为字符数组
		StringBuffer sb = new StringBuffer("");	//创建动态字符串对象
		for(int i=0;i<cArr.length;i++){
			int ascii = (int)cArr[i];			//将字符强制转换为int值，该值为字符的ASCII码
			if(ascii>=48&&ascii<=57){			//数字0-9的ASCII码范围在48-57之间
				sb.append(cArr[i]);				//条件满足，将字符添加在StringBuffer字符串末尾
			}
		}
		if(sb.length()==cArr.length){			//如果StringBuffer字符串的长度等于字符数组的长度
			number=true;						//该字符串为数字
			this.setCue("您输入的是数字！");
		}
		else{
			number=false;
			this.setCue("您输入的不是数字！");
		}
		return number;
	}
	public void setNumber(boolean number) {
		this.number = number;
	}
}
