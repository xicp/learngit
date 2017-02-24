package com.lh.bean;

public class StringUtil {
	private String sourceStr;								//源字符串			
	private String shortPhonetic="";						//获得汉字的拼音简码字符串	
	public String getSourceStr() {
		return sourceStr;
	}
	public void setSourceStr(String sourceStr) {
		this.sourceStr = sourceStr;
	}
	public String getShortPhonetic() {
		char cArr[] = sourceStr.toCharArray();				//将字符串转换为数组
		byte b[] ;								
		String sp = "";										//该变量用于在循环中保存单个字的拼音首字母
		for(int i=0;i<cArr.length;i++){
			b =String.valueOf(cArr[i]).getBytes();
			if(b.length>1){									//如果字符串字节长度大于1，则为汉字
				int code = 256*(b[0]+256)+(b[1]+256);		//根据字节值获得汉字的Unicode编码
				/**以下代码根据汉字的编码范围指定汉字的首字母*/
				if (code >= 45217 && code <= 45252) {		
					sp="A";
				} else if (code >= 45253 && code <= 45760) {
					sp="B";
				} else if (code >= 45761 && code <= 46317) {
					sp="C";
				} else if (code >= 46318 && code <= 46825) {
					sp="D";
				} else if (code >= 46826 && code <= 47009) {
					sp="E";
				} else if (code >= 47010 && code <= 47296) {
					sp="F";
				} else if (code >= 47297 && code <= 47613) {
					sp="G";
				} else if (code >= 47614 && code <= 48118) {
					sp="H";
				} else if (code >= 48119 && code <= 49061) {
					sp="J";
				} else if (code >= 49062 && code <= 49323) {
					sp="K";
				} else if (code >= 49324 && code <= 49895) {
					sp="L";
				} else if (code >= 49896 && code <= 50370) {
					sp="M";
				} else if (code >= 50371 && code <= 50613) {
					sp="N";
				} else if (code >= 50614 && code <= 50621) {
					sp="O";
				} else if (code >= 50622 && code <= 50905) {
					sp="P";
				} else if (code >= 50906 && code <= 51386) {
					sp="Q";
				} else if (code >= 51387 && code <= 51445) {
					sp="R";
				} else if (code >= 51446 && code <= 52217) {
					sp="S";
				} else if (code >= 52218 && code <= 52697) {
					sp="T";
				} else if (code >= 52698 && code <= 52979) {
					sp="W";
				} else if (code >= 52980 && code <= 53640) {
					sp="X";
				} else if (code >= 53689 && code <= 54480) {
					sp="Y";
				} else if (code >= 54481 && code <= 62289) {
					sp="Z";
				}
			}
			else{							//如果为英文字母，直接返回字母本身
				sp=String.valueOf(cArr[i]);
			}
			shortPhonetic +=sp;				//将转换后的每个汉字拼音简码连接成一个字符串
		}
		return shortPhonetic;
	}
}
