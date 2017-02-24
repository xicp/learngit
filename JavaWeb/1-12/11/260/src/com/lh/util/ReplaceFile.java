package com.lh.util;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

public class ReplaceFile {
	/***
	 * �滻ָ���ļ��е�����
	 * @param filepath  �ļ�·��
	 * @param sourceStr �ļ��а�����Դ����
	 * @param targetStr �滻�������
	 * @return �滻�ɹ�����true�����򷵻�false
	 */
	public static boolean replaceFileStr(String filepath,String sourceStr,String targetStr){
	    try {	
	        FileReader fis = new FileReader(filepath);	// �����ļ�������
	        BufferedReader br = new BufferedReader(fis);
	        char[] data = new char[1024];				// ���������ַ�����
	        int rn = 0;
	        StringBuilder sb=new StringBuilder();		// �����ַ���������
	        while ((rn = fis.read(data)) > 0) {			// ��ȡ�ļ����ݵ��ַ���������
	            String str=String.valueOf(data,0,rn);
	            sb.append(str);
	        }
	        fis.close();// �ر�������
	        // �ӹ������������ַ��������滻�����ı�
	        String str = sb.toString().replace(sourceStr, targetStr);
	        FileWriter fout = new FileWriter(filepath);// �����ļ������
	        fout.write(str.toCharArray());// ���滻��ɵ��ַ���д���ļ���
	        fout.close();// �ر������
	        return true;
	    } catch (FileNotFoundException e) {
	        e.printStackTrace();
	        return false;
	    } catch (IOException e) {
	        e.printStackTrace();
	        return false;
	    } 
		
	}
}
