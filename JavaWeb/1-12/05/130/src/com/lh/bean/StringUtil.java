package com.lh.bean;

public class StringUtil {
	private int intArr[]; 		//整型数组
	private String str="";		//将数组转换后的字符串
	public StringUtil(){}		//默认构造方法
	/**返回字符串*/
	public String getStr() {
		for(int i=0;i<intArr.length;i++){	//循环整型数组
			str+=String.valueOf(intArr[i]);	//将每个数组元素转换为字符串并拼成字符串
			if(i<intArr.length-1){
				str+=",";					//每个字符串以","隔开
			}
		}
		return str;
	}
	/**给字符串赋值*/
	public void setStr(String str) {
		this.str = str;
		
	}
	/**返回数组*/
	public int[] getIntArr() {
		return intArr;
	}
	/**给数组赋值*/
	public void setIntArr(int[] intArr) {
		this.intArr = intArr;
	}
}
