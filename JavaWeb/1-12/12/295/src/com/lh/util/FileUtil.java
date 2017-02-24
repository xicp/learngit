package com.lh.util;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

public class FileUtil {
	//创建过滤器类，过滤temp文件
	private ExtendNameFilter tempFilter = new ExtendNameFilter();
	//创建List集合，用于保存搜索出的temp临时文件
	private List<File> temFiles = new ArrayList<File>();
	public List<File> getTemFiles() {
		return temFiles;
	}
	/**
	 * 删除temp临时文件
	 * @param files temp临时文件集合
	 * @return 删除成功返回true,否则返回false
	 */
	
	public boolean  deleteTmpFile(List<File> files){
	    try {
			for (File file:files) {	//遍历文件数组
				if(file.exists()){	//判断文件是否存在
					file.delete();	//删除temp临时文件
				}
			}
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	/**
	 * 递归方法，获取指定磁盘所有临时文件
	 * @param driver 磁盘路径
	 */
	
	public void listTempFiles(File driver) {
	    // 获取指定磁盘或文件夹的子列表
	    File[] files = driver.listFiles(tempFilter);
	    if (files == null)
	        return; 
	    for (File file : files) {// 遍历文件数组
	        if (file.isFile()) {// 处理文件
	          temFiles.add(file);//将文件添加到List集合	      
	        } else if (file.isDirectory()) {// 处理文件夹
	            listTempFiles(file);// 递归方法遍历文件夹
	        }
	    }
	}
}
