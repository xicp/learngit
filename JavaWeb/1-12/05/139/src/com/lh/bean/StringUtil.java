package com.lh.bean;

public class StringUtil {
	private String str;		//要判断的字符串
	private boolean hasEn;	//是否包含英文字符
	private String cnStr;	//去掉英文字母后的字符串
	public String getCnStr() {
		return cnStr;
	}
	public void setCnStr(String cnStr) {
		this.cnStr = cnStr;
	}
	public String getStr() {
		return str;
	}
	public void setStr(String str) {
		this.str = str;
	}
	public boolean isHasEn() {
		char cArr[] = str.toCharArray();//将字符串转换为字符数组
		StringBuffer sb =new StringBuffer("");
		StringBuffer sb2 =new StringBuffer("");
		for(int i=0;i<cArr.length;i++){
			//调用String类的hashCode()方法也能获得字符的ASCII码
			//int ascii = String.valueOf(cArr[i]).hashCode();
			int ascii = (int)cArr[i];//强制转换可以直接得到字符的ASCII码
			//英文字符的 ASCII码范围，大写字母A-Z的范围65-90，小写字母a-z的范围97-122
			if((ascii>=65&&ascii<=90)||(ascii>=97&&ascii<=122)){
				sb.append(cArr[i]);//将每个英文字母添加到StringBuffer对象中
			}
			else{
				sb2.append(cArr[i]);
			}
		}
		this.setCnStr(sb2.toString());
		if(!sb.toString().equals(""))//如果保存英文字母的字符串不为""，说明该字符串包含英文字母
			hasEn=true;
		else
			hasEn=false;
		return hasEn;
	}
	public void setHasEn(boolean hasEn) {
		this.hasEn = hasEn;
	}
	
}
