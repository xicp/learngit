package com.lh.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;

public class UniteUtil {
	
	/**
	 * 文件合并
	 * @param file 	要合并的文件数组
	 * @param cunDir 文件保存路径
	 * @param hz 合并后文件的格式
	 * @return
	 */
	public static boolean heBing(File[] file, File cunDir, String hz) {
	    try { 
	    	// 指定分割后文件的文件名
	        File heBingFile = new File(cunDir.getAbsoluteFile() + "\\UNTIE" + hz); 
	        if (!heBingFile.isFile()) {
	            heBingFile.createNewFile();
	        }
	        // 创建FileOutputStream对象
	        FileOutputStream fos = new FileOutputStream(heBingFile); 
	        for (int i = 0; i < file.length; i++) { 	// 循环遍历要进行合并的文件数组对象
	            FileInputStream fis = new FileInputStream(file[i]);
	            int len = (int) file[i].length(); 	// 获取文件长度
	            byte[] bRead = new byte[len];
	            fis.read(bRead); 						// 读取文件
	            fos.write(bRead); 					// 写入文件
	            fis.close();							// 将流关闭
	        }
	        fos.close();    
	        return true;
	    } catch (Exception e) {
	        e.printStackTrace();
	        return false;
	    }
	}
	public static void main(String []args){
		File file = new File("E:/test");
		File files[] = file.listFiles();
		for(int i=0;i<files.length;i++){
			System.out.println(files[i].getName());
		}
	}

}
