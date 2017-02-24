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
	
	public static boolean findName(String pattern, String str) {
	    int patternLength = pattern.length(); 		// ��ȡ�����ַ����ĳ���
	    int strLength = str.length();
	    int strIndex = 0;
	    char eachCh;
	    for (int i = 0; i < patternLength; i++) { 	// ѭ���ַ������ַ����е�ÿ���ַ�
	        eachCh = pattern.charAt(i); 				// ��ȡ�ַ�����ÿ������λ�õ��ַ�
	        if (eachCh == '*') { 					// �������ַ���һ���Ǻ�
	            while (strIndex < strLength) {
	                if (findName(pattern.substring(i + 1), str
	                        .substring(strIndex))) { 	// ����ļ���������ģ��ƥ��
	                    return true;
	                }
	                strIndex++;
	            }
	        } else if (eachCh == '?') { 				// ��������ʺ�
	            strIndex++;
	            if (strIndex > strLength) { 			// ���str��û���ַ�����ƥ�䡰?����
	                return false;
	            }
	        } else { 									// ���ҪѰ�ҵ�����ͨ���ļ�
	        	// ���û�в��ҵ�ƥ����ļ�
	            if ((strIndex >= strLength) || (eachCh != str.charAt(strIndex))) { 
	                return false;
	            }
	            strIndex++;
	        }
	    }
	    return (strIndex == strLength);     
	}
	
	public static List<File> findFiles(String baseDirName, String targetFileName,String extendStr) {
	    List<File> fileList = new ArrayList<File>();        		//���屣�淵��ֵ��List����
	    File baseDir = new File(baseDirName);       	//���ݲ�������File����
	    if (!baseDir.exists() || !baseDir.isDirectory()) {//�����File���󲻴��ڻ��߲���һ��Ŀ¼
	        return fileList;        					//����List����
	    }
	    String tempName = null;
	    File[] files = baseDir.listFiles(new ExtendNameFilter(extendStr)); 		//��ȡ����Ŀ¼�µ��ļ�����
	    for (File file:files) {    //ѭ�������ļ�����
	        if (!file.isDirectory()) {      		//��������е��ļ�����һ��Ŀ¼
	            tempName = file.getName();  		//��ȡ�����������
	            if (findName(targetFileName, tempName)) { //�����ļ�ƥ�䷽��
	                fileList.add(file.getAbsoluteFile()); 	//��ָ�����ļ�����ӵ�������
	            }
	        }
	    }
	    return fileList;
	}


}
