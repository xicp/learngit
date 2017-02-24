package com.lh.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.ObjectInputStream;
import java.util.Enumeration;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;

public class FileUtil {
	public static void unzipSerializationObject(File file) 
		throws IOException, ClassNotFoundException {
		ZipFile zipFile = new ZipFile(file);//����ZipFile����
		File currentFile = null;
		Enumeration e = zipFile.entries();
		while (e.hasMoreElements()) {
			ZipEntry entry = (ZipEntry) e.nextElement();
			if (!entry.getName().endsWith(".dat")) {//������׺����.dat���ļ��ͽ��н�ѹ��
				continue;
			}
			currentFile = new File(file.getParent() , entry.getName());
			if(!currentFile.exists())
				currentFile.createNewFile();
			FileOutputStream out = new FileOutputStream(currentFile);
			InputStream in = zipFile.getInputStream(entry);
			int buffer = 0;
			while ((buffer = in.read()) != -1) {//д���ļ�
				out.write(buffer);
			}
			in.close();//�ͷ���Դ
			out.close();
		}
		
		FileInputStream in = new FileInputStream(currentFile);
		ObjectInputStream ois = new ObjectInputStream(in);//�����ѹ������ļ�
		currentFile.delete();//ɾ����ѹ���������ļ�
	}

}
