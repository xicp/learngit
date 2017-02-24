package com.lh.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

public class FileUtil {
	private  List<String> allfilePath = new ArrayList<String>();   //�����ļ���ַ�ļ��϶���
	public List<String> getAllfilePath() {
		return allfilePath;
	}
	public void setAllfilePath(List<String> allfilePath) {
		this.allfilePath = allfilePath;
	}
	
	/**
	 * �ݹ鷽��������ĳ��·���������ļ�
	 * @param path �ļ���·�� 
	 */
	
	public void getFiles(String path) {
	    File dir = new File(path);      						//�����ļ���ַ����File����
	    File files[] = dir.listFiles();  //��ȡ�ļ����µ��ļ�����
	    for (File file:files ) {								//ѭ����������
	        if (file.isDirectory())  							//�ж��ļ��Ƿ���һ��Ŀ¼
	        	getFiles(file.getAbsolutePath());    //���Ϊ�ļ��У�����ִ�б�����
	        else {
	        	allfilePath.add(file.getAbsolutePath());    	//���ļ�·����ӵ�������
	        }
	    }
	}
	public void createFolder(String strPath) {
	    try {      
	        File myFilePath = new File(strPath);        	//�����ļ���ַ����File����
	        if (!myFilePath.exists()) { 					//���ָ����File���󲻴���
	            myFilePath.mkdir();     					//����Ŀ¼
	        }
	    } catch (Exception e) {
	        System.out.println("�½��ļ��в�������");
	        e.printStackTrace();
	    }
	}
	
	public  void sortFile(String filePath) {     
		getFiles(filePath); //��ȡ�û�ѡ���ļ����������ļ�����
		for(String fileStr:allfilePath ){              			//ѭ���������ļ����� 
			int index = fileStr.lastIndexOf(".");
			if(index != -1){
				//���ļ��н��н�ȡ����ȡ�ļ���չ��
				String strN = fileStr.substring(index+1,fileStr.length());
				int ind = fileStr.lastIndexOf("\\");
				String strFileName = fileStr.substring(ind, index);
	            //���ô����ļ��з������½��ļ���
				createFolder(filePath+"\\"+"����"); 
				createFolder(filePath+"\\"+"����"+"\\"+strN);
				if(fileStr.endsWith(strN)){   
					  File oldfile = new File(fileStr);
					  File newFile = new File(filePath+"\\"+"����"+"\\"+strN+
		                         "\\"+strFileName+fileStr.substring(index,fileStr.length()));
					  oldfile.renameTo(newFile);
	             }                
	         }
	     } 
	}  
}
