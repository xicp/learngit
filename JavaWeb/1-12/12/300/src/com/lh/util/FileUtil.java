package com.lh.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class FileUtil {
	
	public String searchFile(String indexFilePath){	
		FileReader fileReader = null;
		BufferedReader bufferedReader = null;
		try {
			fileReader = new FileReader(indexFilePath);//利用用户选择的文件创建FileReader对象
			bufferedReader = new BufferedReader(fileReader);
			StringBuilder builder = new StringBuilder();//利用StringBuilder对象保存索引
			String temp = null;
			while ((temp = bufferedReader.readLine()) != null) {//读入文本文件
				builder.append(temp);
				builder.append("\n");//在每一行的末尾添加一个分隔符
			}
			String[] rows = builder.toString().split("\n");//将索引按换行符分割
			StringBuffer sb = new StringBuffer();
			for(String row:rows) {//遍历读入的文本文件
				if(row.endsWith(".txt")) {//判断读入的文本文件是否包含指定的关键字
					sb.append(row+"\n");//返回结果
				}
			}
			bufferedReader.close();
			fileReader.close();
			return sb.toString();
		} catch (IOException e) {
			e.printStackTrace();
			return "";
		}
		
	}
}
