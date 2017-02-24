package com.lh.util;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.StreamTokenizer;

public class StatUtil {
	public static int[] statis(String filePath) {
	    FileReader fileReader = null;
	    try {
	        fileReader = new FileReader(filePath);  	//����FileReader����
	        StreamTokenizer stokenizer = new StreamTokenizer(new BufferedReader(
	                fileReader));                  		//����StreamTokenizer����
	        stokenizer.ordinaryChar('\'');          	//�������ŵ�������ͨ�ַ�
	        stokenizer.ordinaryChar('\"');          	//��˫���ŵ�������ͨ�ַ�
	        stokenizer.ordinaryChar('/');           	//����/����������ͨ�ַ�
	        int[] length = new int[4];              	//���屣���������int������
	        String str;
	        int numberSum = 0;                     		//���屣�����ֵı���
	        int symbolSum = 0;                      	//���屣��Ӣ�ı�����ı���
	        int wordSum = 0;    
	        int sum = 0;                            		//���屣�����ַ����ı���
	        while (stokenizer.nextToken() != StreamTokenizer.TT_EOF) { //���û�ж����ļ���ĩβ
	            switch (stokenizer.ttype) {         	//�ж϶�ȡ��ǵ�����                   
	                case StreamTokenizer.TT_NUMBER: 	//����û���ȡ����һ�����ֱ��
	                    str = String.valueOf(stokenizer.nval);       		//��ȡ��ȡ������ֵ              
	                    numberSum += 1; 				//�������ָ���
	                    length[0] = numberSum;          //���������е�Ԫ��
	                    break;                         	//�˳����
	                case StreamTokenizer.TT_WORD:		//�����ȡ�������ֱ��
	                    str = stokenizer.sval;   		//��ȡ�ñ��                     
	                    System.out.println(str);
	                    wordSum += str.length();  		//��������ֵĳ���
	                    length[1] = wordSum;
	                    break;
	                default:                            	//�����ȡ�����������
	                    str = String.valueOf((char) stokenizer.ttype);  //��ȡ�ñ��
	                    System.out.println(str);
	                    symbolSum += str.length();      //����ñ�ǵĳ���
	                    length[2] = symbolSum;           //����int�����е�Ԫ��
	            }
	        }            
	        sum = symbolSum + numberSum + wordSum;  	 //��ȡ���ַ���
	        length[3] = sum;
	        return length;
	    } catch (Exception e) {
	        e.printStackTrace();
	       return null;
	    }
	}    

}
