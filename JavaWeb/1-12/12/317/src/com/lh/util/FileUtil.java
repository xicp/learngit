package com.lh.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;
import java.util.Vector;


public class FileUtil {
	
	public Vector<String> getRarDetail(File rarFile) {
		Vector<String> fileDetails = new Vector<String>();
		try {
	        // ִ���ļ��б���ȡ����
	        Process process =Runtime. getRuntime()
	                .exec("rar v -c- \"" + rarFile + "\"");
	        process.getOutputStream().close();// �رս��������
	        Scanner sc = new Scanner(process.getInputStream());
	        int count = 0;// ���������� 
	        while (sc.hasNext()) {
	            String line = sc.nextLine();// ��ȡ�ļ��б���Ϣ��һ��
	            // �����ʼ��������
	            if (line.contains("----------------------")) {
	                count = (count == 0 ? count + 1 : -1);
	                continue;
	            }
	            if (count == 0)// ������ʼ���
	                continue;
	            if (count == -1)// �ڽ��������ֹѭ��
	                break;
	            if (++count % 2 == 0) {// ��ȡ�ļ�����
	            	fileDetails.add(line);
	            } else {// ��ȡ�ļ���ϸ��Ϣ    
	                fileDetails.add(line);
	            }  
	        }
	        process.getInputStream().close();// �ر�������
	    } catch (Exception e1) {
	        e1.printStackTrace();
	    }
	    return fileDetails;
	}

}
