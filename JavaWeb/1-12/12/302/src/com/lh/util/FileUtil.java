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
	 * �ݹ鷽��������ĳ��·��������ָ�����͵��ļ�
	 * @param path �ļ���·�� 
	 * @param extendName ָ���ļ�����չ��
	 */
	public void getFiles(String path,String extendName) {
	    File dir = new File(path);      						//�����ļ���ַ����File����
	    File files[] = dir.listFiles(new ExtendNameFilter(extendName));  //��ȡ�ļ����µ��ļ�����
	    for (File file:files ) {								//ѭ����������
	        if (file.isDirectory())  							//�ж��ļ��Ƿ���һ��Ŀ¼
	        	getFiles(file.getAbsolutePath(),extendName);    //���Ϊ�ļ��У�����ִ�б�����
	        else {
	        	allfilePath.add(file.getAbsolutePath());    	//���ļ�·����ӵ�������
	        }
	    }
	}
	/**
	 * ʵ���ļ�����
	 * @param allOldPath ��Ҫ���Ƶ������ļ���ɵļ���
	 * @param newPath �ļ�����·��
	 */
	public void  copyFile(List<String> allOldPath, String newPath) {
		for(String oldPath:allOldPath){
		    try {
		        int bytesum = 0;
		        int byteread = 0;
		        File oldfile = new File(oldPath);
		        if (oldfile.exists()) { 										// �ļ�����ʱ
		            InputStream inStream = new FileInputStream(oldPath); 		// ����ԭ�ļ�
		            File newFile = new File(newPath,oldfile.getName());
		            newFile.createNewFile();
		            FileOutputStream fs = new FileOutputStream(newFile);
		            byte[] buffer = new byte[1444];
		            while ((byteread = inStream.read(buffer)) != -1) {  		//ѭ����ȡ�ļ�
		                bytesum += byteread; 									// ��ȡ�ļ���С
		                fs.write(buffer, 0, byteread);  						//���ļ���д����
		            }
		            fs.close();
		            inStream.close();
		        }
		     
		    } catch (Exception e) {
		        e.printStackTrace();
		    }
		}
	}    
}
