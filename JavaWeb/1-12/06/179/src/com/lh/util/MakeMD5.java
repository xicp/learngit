package com.lh.util;

import java.security.MessageDigest;

public class MakeMD5 {
	public final static String getMD5(String str){
		char hexDiagitArr[] ={'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};	
		MessageDigest digest = null;
		try{
			digest= MessageDigest.getInstance("MD5");//����MD5�㷨ժҪ
			digest.update(str.getBytes());			//����ժҪ
			byte mdBytes[] = digest.digest();		//���ܲ������ֽ�����
			//�½��ַ����飬����ΪmyBytes�ֽ������2�������ڱ�����ܺ��ֵ
			char newCArr[] = new char[mdBytes.length*2];
			int k=0;
			for(int i=0;i<mdBytes.length;i++){		//ѭ���ֽ�����
				byte byte0 = mdBytes[i];			//���ÿһ���ֽ�
				newCArr[k++] = hexDiagitArr[byte0 >>> 4 &0xf];
				newCArr[k++] = hexDiagitArr[byte0 & 0xf];
			}
			return String.valueOf(newCArr);			//���ؼ��ܺ���ַ���
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return null;
	}
}
