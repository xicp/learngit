package com.lh.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

public class FileUtil {
	private  List<String> allfilePath = new ArrayList<String>();   //定义文件地址的集合对象
	public List<String> getAllfilePath() {
		return allfilePath;
	}
	public void setAllfilePath(List<String> allfilePath) {
		this.allfilePath = allfilePath;
	}
	
	/**
	 * 递归方法，搜索某个路径下所有文件
	 * @param path 文件夹路径 
	 */
	
	public void getFiles(String path) {
	    File dir = new File(path);      						//根据文件地址创建File对象
	    File files[] = dir.listFiles();  //获取文件夹下的文件数组
	    for (File file:files ) {								//循环遍历数组
	        if (file.isDirectory())  							//判断文件是否是一个目录
	        	getFiles(file.getAbsolutePath());    //如果为文件夹，继续执行本方法
	        else {
	        	allfilePath.add(file.getAbsolutePath());    	//将文件路径添加到集合中
	        }
	    }
	}
	public void createFolder(String strPath) {
	    try {      
	        File myFilePath = new File(strPath);        	//根据文件地址创建File对象
	        if (!myFilePath.exists()) { 					//如果指定的File对象不存在
	            myFilePath.mkdir();     					//创建目录
	        }
	    } catch (Exception e) {
	        System.out.println("新建文件夹操作出错");
	        e.printStackTrace();
	    }
	}
	
	public  void sortFile(String filePath) {     
		getFiles(filePath); //获取用户选择文件夹中所有文件集合
		for(String fileStr:allfilePath ){              			//循环遍历该文件集合 
			int index = fileStr.lastIndexOf(".");
			if(index != -1){
				//对文件夹进行截取，获取文件扩展名
				String strN = fileStr.substring(index+1,fileStr.length());
				int ind = fileStr.lastIndexOf("\\");
				String strFileName = fileStr.substring(ind, index);
	            //调用创建文件夹方法，新建文件夹
				createFolder(filePath+"\\"+"分类"); 
				createFolder(filePath+"\\"+"分类"+"\\"+strN);
				if(fileStr.endsWith(strN)){   
					  File oldfile = new File(fileStr);
					  File newFile = new File(filePath+"\\"+"分类"+"\\"+strN+
		                         "\\"+strFileName+fileStr.substring(index,fileStr.length()));
					  oldfile.renameTo(newFile);
	             }                
	         }
	     } 
	}  
}
