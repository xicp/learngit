package com.lh.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;

public class ComminuteUtil {
	/**
	 * �����ļ����зָ�
	 * @param commFile �ָ��ļ��ĵ�ַ
	 * @param untieFile �ָ���ļ��ı����ַ
	 * @param filesize �ָ��ļ��Ĵ�С
	 */
	public static boolean splitFile(File commFile, File untieFile, int fileSize) {
	    FileInputStream fis = null;
	    int size = 1024 * 1024; 					// ����ָ���ָ��ļ�Ҫ��MBΪ��λ
	    try {
	        if (!untieFile.isDirectory()) { 		// ���Ҫ����ָ��ļ���ַ����·��
	            untieFile.mkdirs(); 				// ������·��
	        }
	        size = size * fileSize;
	        int length = (int) commFile.length(); 	// ��ȡ�ļ���С
	        int num = length / size; 				// ��ȡ�ļ���С����MB�ĵ���
	        int yu = length % size; 					// ��ȡ�ļ���С��MB���������
	        String newfengeFile = commFile.getAbsolutePath(); 	// ��ȡ�����ļ������·����Ϣ
	        int fileNew = newfengeFile.lastIndexOf(".");
	        String strNew = newfengeFile.substring(fileNew, newfengeFile
	                .length()); 						// ��ȡ�ַ���
	        fis = new FileInputStream(commFile); 	// ����FileInputStream�����
	        File[] fl = new File[num + 1]; 			// �����ļ�����
	        int begin = 0;
	        for (int i = 0; i < num; i++) { 			// ѭ����������
	            fl[i] = new File(untieFile.getAbsolutePath() + "\\" + (i + 1)
	                    + strNew + ".tem"); 			// ָ���ָ��С�ļ����ļ���
	            if (!fl[i].isFile()) {
	                fl[i].createNewFile(); 			// �������ļ�
	            }
	            FileOutputStream fos = new FileOutputStream(fl[i]);
	            byte[] bl = new byte[size];
	            fis.read(bl); 						// ��ȡ�ָ���С�ļ�
	            fos.write(bl); 						// д�ļ�
	            begin = begin + size * 1024 * 1024;
	            fos.close(); 							// �ر���
	        }
	        if (yu != 0) { 							// �ļ���С��ָ���ļ��ָ��С�����������Ϊ0
	            fl[num] = new File(untieFile.getAbsolutePath() + "\\"
	                    + (num + 1) + strNew + ".tem"); 	// ָ���ļ��ָ�����������һ���ļ���
	            if (!fl[num].isFile()) {
	                fl[num].createNewFile(); 				// �½��ļ�
	            }
	            FileOutputStream fyu = new FileOutputStream(fl[num]);
	            byte[] byt = new byte[yu];
	            fis.read(byt);
	            fyu.write(byt);
	            fyu.close();
	        }
	        return true;
	    } catch (Exception e) {
	        e.printStackTrace();
	        return false;
	    }
	}

}
