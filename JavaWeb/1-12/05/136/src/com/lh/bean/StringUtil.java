package com.lh.bean;

public class StringUtil {
	private String sourceStr;	//源字符串
	private String targetStr;	//过滤后的字符串
	public StringUtil(){}		//默认的构造方法
	public String getSourceStr() {
		return sourceStr;
	}
	public void setSourceStr(String sourceStr) {
		this.sourceStr = sourceStr;
	}
	public String getTargetStr() {
		if(sourceStr==null){						//如果源字符串为NULL
			sourceStr="";
		}
		sourceStr = sourceStr.replaceAll(" ", "");	//如果源字符串中包含空格则替换
		targetStr = sourceStr;
		return targetStr;
	}
	public void setTargetStr(String targetStr) {
		this.targetStr = targetStr;
	}
}
