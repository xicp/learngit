package com.lh.util;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

public class FileUtil {
	
	public List<File> searchFile(String path) {
		List<File> fileList = new ArrayList<File>();
		File dir = new File(path);
		File[] files = dir.listFiles();
		for (File file:files) {//�����û�ѡ����ļ���
			if (file.isFile()) {//�ж��Ƿ���һ���ļ�
				fileList.add(file);
			}
			try {
				Thread.sleep(100);//�߳�����0.1��ʵ�ֶ�̬����
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
		return fileList;			
	}
}
