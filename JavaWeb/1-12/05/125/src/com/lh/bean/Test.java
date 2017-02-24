package com.lh.bean;

import java.util.Calendar;
import java.util.Date;

public class Test {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		
		Test t= new Test();
		//System.out.println(t.getNumStr(115, 4));
		
		String str = "asdf";
		String s="科技";
		int fromIndex=0;
		if(str.indexOf(97)!=-1){
			System.out.println("字符串【"+str+"】包含子字符串"+s);
			if(str.indexOf(97)==fromIndex){
				System.out.println("字符串【"+str+"】的第"+fromIndex+"位是以【"+s+"】子字符串开头！");
			}
		}
		Calendar c = Calendar.getInstance();
		Calendar c1 = Calendar.getInstance();
		c1.set(2010, 6,5);
		long time = c1.getTimeInMillis() -c.getTimeInMillis();
		long t1 = 1000*60;
		int h = (int)(time/t1);
		System.out.println(h);
		
	}
	public boolean isHasEn(String str) {
		char cArr[] = str.toCharArray();//将字符串转换为字符数组
		boolean b =false;
		StringBuffer sb =new StringBuffer("");
		StringBuffer sb2 =new StringBuffer("");
		for(int i=0;i<cArr.length;i++){
			//调用String类的hashCode()方法也能获得字符的ASCII码
			//int ascii = String.valueOf(cArr[i]).hashCode();
			int ascii = (int)cArr[i];//强制转换可以直接得到字符的ASCII码
			System.out.println(ascii);
			//英文字符的 ASCII码范围，大写字母A-Z的范围65-90，小写字母a-z的范围97-122
			if((ascii>=65&&ascii<=90)||(ascii>=97&&ascii<=122)){
				sb.append(cArr[i]);	//将每个英文字母添加到StringBuffer对象中
			}
			else{
				sb2.append(cArr[i]);
			}
		}
		if(!sb.toString().equals(""))//如果保存英文字母的字符串不为""，说明该字符串包含英文字母
			return true;
		else
			return false;
	
	}

	/**
	 * 将整型值格式化为指定长度的字符串
	 * @param num : 要格式的整型值
	 * @param len : 格式长度
	 * @return 返回格式后的字符串
	 */
	public String getNumStr(int num,int len){
		String str = String.valueOf(num);//转换为字符串
		String numStr ="";
		int length = len -str.length();//在字符串之前补0的长度
		if(length<=0){
			numStr = str;
		}else{
			for(int i=0;i<length;i++){
				str = "0"+str;
			}
			numStr = str;
		}
		return numStr;
	}
}
