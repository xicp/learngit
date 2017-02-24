package com.lh.util;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class FileUtil {
	private List<String> list = new ArrayList<String>();	//用list保存索引
	private String pathStr;
	public String getPathStr() {
		return pathStr;
	}
	public void setPathStr(String pathStr) {
		this.pathStr = pathStr;
	}
	public List<String> getList() {
		return list;
	}
	public void setList(List<String> list) {
		this.list = list;
	}
	
	public  void createIndexFile(String rootPath,String indexFilePath){	
		File rootFile = new File(rootPath);				//利用用户选择的磁盘创建File对象
		StringBuilder sb = new StringBuilder();			//利用StringBuilder对象保存写入的索引
		File indexFile = new File(indexFilePath);
		getFilePath(list, rootFile);					//获得磁盘上所有文件的路径
		for(String pathStr:list){						//遍历集合，将集合元素添加到StringBuffer中
			sb.append(pathStr+"\r\n");
		}
		pathStr = sb.toString();
		FileWriter fileWriter = null;
		try {
			fileWriter = new FileWriter(indexFile);
			fileWriter.write(sb.toString());			//向用户选择的文本文件写入数据
			fileWriter.flush();
		} catch (IOException e) {
			e.printStackTrace();
		} 
	}
	
	public  List<String> getFilePath(List<String> list, File rootFile) {
		File[] files = rootFile.listFiles();
		if (files == null)
			return list;
		for (File file : files) {
			if (file.isDirectory()) {
				getFilePath(list, file);
			} else {
				list.add(file.getAbsolutePath().replace("\\", "/"));
			}
		}
		return list;
	}
}
