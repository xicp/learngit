package com.lh.bean;

public class StringUtil {
	private String sourceStr;	//源字符串
	private String targetStr;	//替换后的字符串
	public String getSourceStr() {
		return sourceStr;
	}
	public void setSourceStr(String sourceStr) {
		this.sourceStr = sourceStr;
	}
	public String getTargetStr() {
		sourceStr = sourceStr.replaceAll("&", "&amp;");	//过滤字符&
		sourceStr = sourceStr.replaceAll(";", "");		//过滤字符;
		sourceStr = sourceStr.replaceAll("'", "");		//过滤字符'
		sourceStr = sourceStr.replaceAll("<", "&lt;");	//过滤字符<
		sourceStr = sourceStr.replaceAll(">", "&gt");	//过滤字符>
		sourceStr = sourceStr.replaceAll("/", "");		//过滤字符/
		sourceStr = sourceStr.replaceAll("%", "");		//过滤字符%
		sourceStr = sourceStr.replaceAll("=", "");		//过滤字符=
		targetStr = sourceStr;
		return targetStr;
	}
	public void setTargetStr(String targetStr) {
		this.targetStr = targetStr;
	}
}
