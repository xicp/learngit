package com.lh.util;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

public class FileUtil {
	private  List<File> delFiles = new ArrayList<File>();
	public List<File> getDelFiles() {
		return delFiles;
	}
	public void setDelFiles(List<File> delFiles) {
		this.delFiles = delFiles;
	}
	/**
	 * 删除文件夹及其中内容
	 * @param rootFile
	 */
	
	public  void deleteDictionary(File rootFile) {
		if (rootFile.isFile()) {
			delFiles.add(rootFile);
			rootFile.delete();//如果给定的File对象是文件就直接删除
		} else {//如果是一个文件夹就将其转换成File数组
			File[] files = rootFile.listFiles();
			for (File file : files) {
				deleteDictionary(file);//如果不是空文件夹则就迭代deleteDictionary()方法
			}
			rootFile.delete();//如果是空文件夹就直接删除
		}
	}
	/**
	 * 删除文件夹下所有内容但保留给定文件夹
	 * @param rootFile
	 */
	public  void deleteFiles(File rootFile) {
		if (rootFile.listFiles().length == 0) {//如果用户给定的是空文件夹就退出方法
			return;
		} else {
			File[] files = rootFile.listFiles();//将非空文件夹转换成File数组
			for (File file : files) {
				if (file.isFile()) {
					delFiles.add(file);
					file.delete();//删除指定文件夹下的所有文件
				} else {
					if (file.listFiles().length == 0) {
						file.delete();//删除指定文件夹下的所有空文件夹
					} else {
						deleteDictionary(file);//删除指定文件夹下的所有非空文件夹
					}
				}
			}
		}
	}
}
