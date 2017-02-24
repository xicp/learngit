package com.lh.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

public class FileUtil {
	
	public static void unZipFile(File zipFile, File targetFile, List<String> list) throws IOException {
		//�����û�ѡ���ZIP�ļ�����ZipInputStream����
		ZipInputStream in = new ZipInputStream(new FileInputStream(zipFile));
		ZipEntry entry;
		while ((entry = in.getNextEntry()) != null) {//��������ZipEntry����
			if (entry.isDirectory()) {//���ZipEntry������һ���ļ��оͽ��е���
				new File(targetFile+entry.getName()).mkdirs();
				
			} else {//������ļ��ͽ���д�뵽ָ�����ļ�����
				File file = new File(targetFile , entry.getName());
				File folder = new File(file.getParent());//�����ļ���Ŀ¼����File����
				if(!folder.exists())//���Ŀ¼�����ڣ��򴴽�Ŀ¼
					folder.mkdirs();
				if(!file.exists())//����ļ������ڣ��򴴽��ļ�
					file.createNewFile();
				list.add(file.getName());//�������ɵ��ļ���·����ӵ��б���
				FileOutputStream out = new FileOutputStream(file);
				int b;
				while ((b = in.read()) != -1) {//д������
					out.write(b);
				}
				out.close();//�ͷ���Դ
			}
			entry.clone();
		}
		in.close();	
	}

}
