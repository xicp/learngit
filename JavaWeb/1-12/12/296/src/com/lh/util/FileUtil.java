package com.lh.util;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

public class FileUtil {
	
	public List<File> searchFile(String path) {
		List<File> fileList = new ArrayList<File>();
		File dir = new File(path);
		File[] files = dir.listFiles();
		for (File file:files) {//遍历用户选择的文件夹
			if (file.isFile()) {//判断是否是一个文件
				fileList.add(file);
			}
			try {
				Thread.sleep(100);//线程休眠0.1秒实现动态加载
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
		return fileList;			
	}
}
