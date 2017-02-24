package com.lh.util;

import java.security.MessageDigest;

public class MakeMD5 {
	public final static String getMD5(String str){
		char hexDiagitArr[] ={'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};	
		MessageDigest digest = null;
		try{
			digest= MessageDigest.getInstance("MD5");//创建MD5算法摘要
			digest.update(str.getBytes());			//更新摘要
			byte mdBytes[] = digest.digest();		//加密并返回字节数组
			//新建字符数组，长度为myBytes字节数组的2倍，用于保存加密后的值
			char newCArr[] = new char[mdBytes.length*2];
			int k=0;
			for(int i=0;i<mdBytes.length;i++){		//循环字节数组
				byte byte0 = mdBytes[i];			//获得每一个字节
				newCArr[k++] = hexDiagitArr[byte0 >>> 4 &0xf];
				newCArr[k++] = hexDiagitArr[byte0 & 0xf];
			}
			return String.valueOf(newCArr);			//返回加密后的字符串
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return null;
	}
}
