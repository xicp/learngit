package com.lh.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;

public class FileUtil {
	public static String getFileTxt(String filePath){
		File file = new File(filePath);		//创建File对象
		String fileTxt="";//声明字符串对象，用于保存文件内容
		if (file.exists() && file.isFile()) {//判断是否为文件 
			try {
				FileReader fr = new FileReader(file);//创建字符输入流对象
				BufferedReader br = new BufferedReader(fr);//从字符输入流中读取文本
				String line = br.readLine();//读取一行文本
				StringBuffer sb = new StringBuffer("");
				while(line!=null){//如果当前行不为空
					sb.append(line);//将读取出的文本添加到StringBuffer对象中
					line = br.readLine();//读取下一行
				}
				br.close();//关闭流
				fr.close();
				fileTxt = sb.toString();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else{
			fileTxt = "文件"+file.getName()+"不存在！";
		}
		return fileTxt;
	}
}
