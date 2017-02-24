package com.lh.bean;

public class StringUtil {
	private long longValue;		//要分位的数字
	private int digit;			//分位位数
	private String formatStr;	//分位后的字符串
	public StringUtil(){}		//默认的构造方法
	public long getLongValue() {
		return longValue;
	}
	public void setLongValue(long longValue) {
		this.longValue = longValue;
	}
	public int getDigit() {
		return digit;
	}
	public void setDigit(int digit) {
		this.digit = digit;
	}
	public String getFormatStr() {
		//将long类型的值转换为可动态修改的StringBuffer对象
		StringBuffer sb = new StringBuffer(String.valueOf(longValue));
		sb =sb.reverse();			//将字符串反转
		int l = sb.length();
		if(digit==0){				//如果分位位数为0，设置字符串的长度为分位位数
			digit=l;
		}
		int count = 0;
		/**计算出插入的分为符个数*/
		if(l%digit==0)
			count=l/digit-1;
		else
			count=l/digit;
		for(int i= 0;i<count;i++){
			sb =sb.insert((i+1)*digit+i ,",");//插入分位符
		}
		return sb.reverse().toString();
	}
	public void setFormatStr(String formatStr) {
		this.formatStr = formatStr;
	}
}
