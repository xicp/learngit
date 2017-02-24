package com.lh.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;

public class UniteUtil {
	
	/**
	 * �ļ��ϲ�
	 * @param file 	Ҫ�ϲ����ļ�����
	 * @param cunDir �ļ�����·��
	 * @param hz �ϲ����ļ��ĸ�ʽ
	 * @return
	 */
	public static boolean heBing(File[] file, File cunDir, String hz) {
	    try { 
	    	// ָ���ָ���ļ����ļ���
	        File heBingFile = new File(cunDir.getAbsoluteFile() + "\\UNTIE" + hz); 
	        if (!heBingFile.isFile()) {
	            heBingFile.createNewFile();
	        }
	        // ����FileOutputStream����
	        FileOutputStream fos = new FileOutputStream(heBingFile); 
	        for (int i = 0; i < file.length; i++) { 	// ѭ������Ҫ���кϲ����ļ��������
	            FileInputStream fis = new FileInputStream(file[i]);
	            int len = (int) file[i].length(); 	// ��ȡ�ļ�����
	            byte[] bRead = new byte[len];
	            fis.read(bRead); 						// ��ȡ�ļ�
	            fos.write(bRead); 					// д���ļ�
	            fis.close();							// �����ر�
	        }
	        fos.close();    
	        return true;
	    } catch (Exception e) {
	        e.printStackTrace();
	        return false;
	    }
	}
	public static void main(String []args){
		File file = new File("E:/test");
		File files[] = file.listFiles();
		for(int i=0;i<files.length;i++){
			System.out.println(files[i].getName());
		}
	}

}
