package com.lh.util;

import java.io.File;

public class FolderUtil {
	/**
	 * 创建文件夹
	 * @param filepath 创建文件夹的路径
	 * @return 创建成功返回true,否则返回false
	 */
	public static boolean createFolder(String filepath){
		boolean res =false;//声明一个布尔值变量，用于保存方法返回值 
		File file = new File(filepath);//根据路径字符串创建File对象
		res = file.mkdirs();//创建文件夹
		return res;
	}
	/**
	 * 删除文件夹
	 * @param filepath 删除文件夹的路径
	 * @return 删除成功返回true,否则返回false
	 */
	public static boolean deleteFolder(String filepath){
		
		boolean res = false;//声明一个布尔值变量，用于保存方法返回值
		File file = new File(filepath);//根据路径字符串创建File对象
		if(file.exists()&&file.isDirectory()){//判断是否存在此路径
			res =file.delete();			//删除文件夹
		}
		return res;
	}
}
