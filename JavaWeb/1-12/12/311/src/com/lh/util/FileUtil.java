package com.lh.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Enumeration;
import java.util.List;
import org.apache.tools.zip.ZipEntry;
import org.apache.tools.zip.ZipFile;

public class FileUtil {
	
	public static void unZipFile(File zipFile, File targetFile, List<String> list) throws IOException {
		ZipFile zf = new ZipFile(zipFile);//����ZipFile����
		Enumeration e = zf.getEntries();
		while (e.hasMoreElements()) {//��������ZipEntry����
			ZipEntry entry = (ZipEntry) e.nextElement();
			if (entry.isDirectory()) {//���ZipEntry������һ���ļ��оʹ�������ļ���
				new File(targetFile + entry.getName()).mkdir();
			} else {
				File file = new File(targetFile , entry.getName());//��ñ�ѹ�����ļ�
				File temp = new File(file.getParent());//��ñ�ѹ���ļ��ĸ��ļ���
				if(!temp.exists())//������ļ��в����ڣ��򴴽�
					temp.mkdirs();	
				if(!file.exists())//����ļ������ڣ��򴴽�
					file.createNewFile();
				list.add(file.getName());//���ļ���·�����浽�б���
				FileOutputStream out = new FileOutputStream(file);
				InputStream in = zf.getInputStream(entry);
				int b;
				while ((b = in.read()) != -1) {//������д�뵽�����õ��ļ�
					out.write(b);
				}
				out.close();//�ͷ���Դ
			}
		}
		zf.close();//�ͷ���Դ
	}

}
