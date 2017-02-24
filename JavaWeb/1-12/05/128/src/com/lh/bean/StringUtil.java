package com.lh.bean;

public class StringUtil {
	private String str;		//需要截取的源字符串
	public String getStr() {
		if(str.length()>50){//如果字符串的长度大于50，则从0开始截取到50，之后的以省略号代替
			return str.substring(0,50)+"...";
		}
		
		return str;
	}

	public void setStr(String str) {
		this.str = str;
	}
	
}
