package com.lh.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;
import java.util.Vector;


public class FileUtil {
	
	public static String createAutoExecFile(File rarFile) {
	    if (rarFile == null)
	        return "";
	    StringBuffer sb = new StringBuffer();
	    try {
	        Process process =Runtime. getRuntime().exec("rar s -y -c- " + rarFile);
	        Scanner scan=new Scanner(process.getInputStream());
	        int count=0;
	        while (scan.hasNext()) {// ��������ִ�н��
	            String line = scan.nextLine();// ��ȡ������Ϣ
	            if (line.isEmpty())
	                count++;
	            if (count < 2)// ���˷ǲ�ѯ���
	                continue;
	            sb.append(line + "\n");// ��ѯ�����ӵ�StringBuffer
	        }
	    } catch (IOException e1) {
	        e1.printStackTrace();
	    }
	    return sb.toString();//���ز�ѯ���
	}

}
