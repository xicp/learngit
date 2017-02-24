package com.lh.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class FileUtil {
	/**
	 * 合并多个txt文件
	 * @param txtPath 用户选择的需要合并的所有文本文件的路径
	 * @param savePath 合并后的保存路径
	 */
	public void writeFiles(String[] txtPath, String savePath) {  
		try {	
			//根据文件保存地址创建FileOutputStream对象
	        FileOutputStream fo = new FileOutputStream(savePath, true); 
	        for (String path:txtPath) {		//循环遍历要数组         
	        	File file = new File(path);	//创建File对象
	        	FileInputStream fi1 = new FileInputStream(file); //创建FileInputStream对象
	            byte[] b1 = new byte[fi1.available()];    		//从流中获取字节数
	            fi1.read(b1);               				//读取数据
	            fo.write(b1);               				//向文件中写数据
	            fi1.close();
	        }
	        fo.close();
	    } catch (Exception e) { 
	        e.printStackTrace();
	    }        
	}
}
