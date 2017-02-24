package com.lh.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class FileUtil {
	/**
	 * �ϲ����txt�ļ�
	 * @param txtPath �û�ѡ�����Ҫ�ϲ��������ı��ļ���·��
	 * @param savePath �ϲ���ı���·��
	 */
	public void writeFiles(String[] txtPath, String savePath) {  
		try {	
			//�����ļ������ַ����FileOutputStream����
	        FileOutputStream fo = new FileOutputStream(savePath, true); 
	        for (String path:txtPath) {		//ѭ������Ҫ����         
	        	File file = new File(path);	//����File����
	        	FileInputStream fi1 = new FileInputStream(file); //����FileInputStream����
	            byte[] b1 = new byte[fi1.available()];    		//�����л�ȡ�ֽ���
	            fi1.read(b1);               				//��ȡ����
	            fo.write(b1);               				//���ļ���д����
	            fi1.close();
	        }
	        fo.close();
	    } catch (Exception e) { 
	        e.printStackTrace();
	    }        
	}
}
