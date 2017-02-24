package com.lh.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.util.Date;

public class SerializeObject {
	static class Bowel implements Serializable{
	    private int number1,number2;  						//������ͨ��ʵ������
	    private transient int number3;  						//���岻�ᱻ���л��ͷ����л��Ķ���
	    private static int number4;    
	    public Bowel(int number1 ,int number2,int c,int number3){  //���췽��
	        this.number1 = number1;
	        this.number2 = number2;
	        this.number3 = number3;
	        this.number4 = number4;
	    }       
	}
	/**
	 * ʵ�ֶ������л�
	 * @param filePath �ļ�·��
	 */
	public static void serialize(String filePath){
	    try {
	        File file = new File(filePath);    	 //�����ļ���ַ�����ļ�����
	        if(!file.exists()){                		 //����ö��󲻴���
	            file.createNewFile();         		 //�������ļ�����
	        }
	        //�����������������
	        ObjectOutputStream out = new ObjectOutputStream(new FileOutputStream(filePath));    
	        out.writeObject("������:");    		//���ļ���д������
	        out.writeObject(new Date());    
	        Bowel my1 = new Bowel(5,6,7,3);		//�����ڲ������
	        out.writeObject(my1);       			//������д�뵽�ļ���
	        out.close();                			//�����ر�
	    } catch (Exception e) {        
	        e.printStackTrace();
	    } 
	}
	/**
	 * ʵ�ֶ������л�
	 * @param filePath �ļ�·��
	 * @return ���ض�������
	 */
	public static Object[] deserialize(String filePath){
	    try {
	        File file = new File(filePath); 		//�����ļ���ַ�����ļ�����
	        if(!file.exists()){            	 	//������ļ�������
	            file.createNewFile();       		//�½��ļ�
	        } //��������������
	        ObjectInputStream in = new ObjectInputStream(new FileInputStream(filePath));   
	        String today = (String)(in.readObject());       //�����ж�ȡ��Ϣ   
	        Date date = (Date)(in.readObject());  
	        Bowel my1 = (Bowel)(in.readObject());
	        Object[] object = {today,date,my1};          
	        in.close();     									//�ر���
	        return object;
	    } catch (Exception e) {           
	        e.printStackTrace();
	        return null;    
	    }           
	}   

}
