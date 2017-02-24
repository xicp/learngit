package com.lh.bean;

public class StringUtil {
	private String  str;		//要检查的字符串
	private boolean hasNum;		//是否包含数字
	private String othersStr;	//去掉数字后的字符串
	public String getOthersStr() {
		return othersStr;
	}
	public void setOthersStr(String othersStr) {
		this.othersStr = othersStr;
	}
	public String getStr() {
		return str;
	}
	public void setStr(String str) {
		this.str = str;
	}
	public boolean isHasNum() {
		char cArr[] = str.toCharArray();//将字符串转换为字符数组
		StringBuffer sbNum =new StringBuffer("");
		StringBuffer sbOthers =new StringBuffer("");
		for(int i=0;i<cArr.length;i++){
			//调用String类的hashCode()方法也能获得字符的ASCII码
			//int ascii = String.valueOf(cArr[i]).hashCode();
			int ascii = (int)cArr[i];//强制转换可以直接得到字符的ASCII码
			//数字的 ASCII码范围在48-57之间
			if(ascii>=48&&ascii<=57){
				sbNum.append(cArr[i]);//将每个数字添加到StringBuffer对象中
			}
			else{
				sbOthers.append(cArr[i]);
			}
		}
		this.setOthersStr(sbOthers.toString());
		if(!sbNum.toString().equals(""))
			hasNum=true;
		else
			hasNum=false;
		return hasNum;
	}
	public void setHasNum(boolean hasNum) {
		this.hasNum = hasNum;
	}
}
