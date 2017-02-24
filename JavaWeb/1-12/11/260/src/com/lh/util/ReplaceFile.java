package com.lh.util;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

public class ReplaceFile {
	/***
	 * 替换指定文件中的内容
	 * @param filepath  文件路径
	 * @param sourceStr 文件中包含的源内容
	 * @param targetStr 替换后的内容
	 * @return 替换成功返回true，否则返回false
	 */
	public static boolean replaceFileStr(String filepath,String sourceStr,String targetStr){
	    try {	
	        FileReader fis = new FileReader(filepath);	// 创建文件输入流
	        BufferedReader br = new BufferedReader(fis);
	        char[] data = new char[1024];				// 创建缓冲字符数组
	        int rn = 0;
	        StringBuilder sb=new StringBuilder();		// 创建字符串构建器
	        while ((rn = fis.read(data)) > 0) {			// 读取文件内容到字符串构建器
	            String str=String.valueOf(data,0,rn);
	            sb.append(str);
	        }
	        fis.close();// 关闭输入流
	        // 从构建器中生成字符串，并替换搜索文本
	        String str = sb.toString().replace(sourceStr, targetStr);
	        FileWriter fout = new FileWriter(filepath);// 创建文件输出流
	        fout.write(str.toCharArray());// 把替换完成的字符串写入文件内
	        fout.close();// 关闭输出流
	        return true;
	    } catch (FileNotFoundException e) {
	        e.printStackTrace();
	        return false;
	    } catch (IOException e) {
	        e.printStackTrace();
	        return false;
	    } 
		
	}
}
