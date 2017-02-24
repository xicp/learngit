package com.lh.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;

public class EncryptFile {
	public static boolean encry(String sourceFile, String targetFile) {
	    try {
	        File f = new File(sourceFile);   		//���ݼ����ļ���ַ�����ļ�����
	        //����FileInputStream����
	        FileInputStream fileInputStream = new FileInputStream(f); 
	        byte[] buffer = new byte[fileInputStream.available()];  	//�����ж�ȡ�ֽ�
	        fileInputStream.read(buffer);       						//�����ж�ȡ�ֽ�
	        fileInputStream.close();            						//��������ر�
	        for (int i = 0; i < buffer.length; i++) {   				//ѭ�����������ж�ȡ������
	            int ibt = buffer[i];
	            ibt += 100;                     						//���������������������
	            ibt %= 256;
	            buffer[i] = (byte) ibt;
	        }
	        FileOutputStream fileOutputStream = new FileOutputStream(new File(
	                targetFile));                 		//���ݼ��ܺ��ļ������ַ�������������
	        fileOutputStream.write(buffer, 0, buffer.length);   		//���������д����
	        fileOutputStream.close();   				//�����ر�
	        return true;
	    } catch (Exception e) {
	        e.printStackTrace();
	        return false;
	    }
	}
	public static boolean unEncry(String sourceFile, String targetFile) {
	    try {
	        File f = new File(sourceFile);              		//����Ҫ��ѹ���ļ�����
	        FileInputStream fileInputStream = new FileInputStream(f);   	//�����ļ�����������
	        byte[] buffer = new byte[fileInputStream.available()];  	//�����л�ȡ�ɶ����ֽ���
	        fileInputStream.read(buffer);         			//�����ж�ȡ�ֽ�
	        fileInputStream.close();                			//�ر���
	        for (int i = 0; i < buffer.length; i++) {   	
	            int ibt = buffer[i];    
	            ibt -= 100;             						//�Դ����ж�ȡ�����ݽ������㴦��
	            ibt += 256;
	            ibt %= 256;
	            buffer[i] = (byte) ibt;
	        } //����Ҫд����ļ���ַ���������
	        FileOutputStream fileOutputStream = new FileOutputStream(new File(targetFile));  
	        fileOutputStream.write(buffer, 0, buffer.length); //���������д����
	        fileOutputStream.close();      			 		//�����ر�
	        return true;
	    } catch (Exception e) {
	        e.printStackTrace();
	        return false;
	    }
	}

}
