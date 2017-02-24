package com.lh.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Enumeration;
import java.util.zip.ZipEntry;
import java.util.zip.ZipException;
import java.util.zip.ZipFile;
import java.util.zip.ZipOutputStream;

public class FileUtil {
	
	public void unZipFiles(String zipFilePath,String targetFolder){
		ZipFile zf = null;
		try {
			zf = new ZipFile(zipFilePath);//�����û�ѡ���ZIP�ļ�����ZipFile����
			Enumeration e = zf.entries();//����ö�ٱ���
			while (e.hasMoreElements()) {//����ö�ٱ���
				ZipEntry entry = (ZipEntry) e.nextElement();//���ZipEntry����
				if (!entry.getName().endsWith(".txt")) {//��������ı��ļ��Ͳ����н�ѹ��
					continue;
				}
				//�����û�ѡ����ļ��к�ZipEntry�������ƴ�����ѹ����ļ�
				File currentFile = new File(targetFolder + File.separator + entry.getName());
				FileOutputStream out = new FileOutputStream(currentFile);
				InputStream in = zf.getInputStream(entry);//���û�õ�ZipEntry�����������
				int buffer = 0;
				while ((buffer = in.read()) != -1) {//��������д�뵽�����ļ�
					out.write(buffer);
				}
				in.close();//�ͷ���Դ
				out.close();	
			}
			zf.close();
		} catch (Exception e) {//�����쳣
			e.printStackTrace();
		}
		
	}
}
