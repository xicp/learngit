package com.lh.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

public class FileUtil {
	public static void zipFile(File folder, File targetZipFile) throws IOException {
		File[] txtFiles = folder.listFiles(new ExtendNameFilter());
		//���ø�����targetZipFile���󴴽��ļ����������
		FileOutputStream fos = new FileOutputStream(targetZipFile);
		ZipOutputStream zos = new ZipOutputStream(fos);//�����ļ����������ѹ�������
		byte[] buffer = new byte[1024];//����д��ѹ���ļ�������
		for (File file : txtFiles) {//����ȫ���ļ�
			ZipEntry entry = new ZipEntry(file.getName());//����ÿ���ļ������ִ���ZipEntry����
			System.out.println(entry.getName());
			FileInputStream fis = new FileInputStream(file);//����ÿ���ļ������ļ�����������
			zos.putNextEntry(entry);//��ѹ���ļ������һ��ZipEntry����
			int read = 0;
			while ((read = fis.read(buffer)) != -1) {
				zos.write(buffer, 0, read);//������д�뵽ѹ���ļ�
			}
			zos.closeEntry();//�ر�ZipEntry
			fis.close();//�ͷ���Դ
		}
		zos.close();
		fos.close();
	}

}
