package com.lh.util;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class FileUtil {
	private List<String> list = new ArrayList<String>();	//��list��������
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
		File rootFile = new File(rootPath);				//�����û�ѡ��Ĵ��̴���File����
		StringBuilder sb = new StringBuilder();			//����StringBuilder���󱣴�д�������
		File indexFile = new File(indexFilePath);
		getFilePath(list, rootFile);					//��ô����������ļ���·��
		for(String pathStr:list){						//�������ϣ�������Ԫ����ӵ�StringBuffer��
			sb.append(pathStr+"\r\n");
		}
		pathStr = sb.toString();
		FileWriter fileWriter = null;
		try {
			fileWriter = new FileWriter(indexFile);
			fileWriter.write(sb.toString());			//���û�ѡ����ı��ļ�д������
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
