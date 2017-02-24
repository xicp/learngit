package com.lh.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;
import java.util.Vector;


public class FileUtil {
	
	public Vector<String> getRarDetail(File rarFile) {
		Vector<String> fileDetails = new Vector<String>();
		try {
	        // 执行文件列表提取命令
	        Process process =Runtime. getRuntime()
	                .exec("rar v -c- \"" + rarFile + "\"");
	        process.getOutputStream().close();// 关闭进程输出流
	        Scanner sc = new Scanner(process.getInputStream());
	        int count = 0;// 创建行索引 
	        while (sc.hasNext()) {
	            String line = sc.nextLine();// 获取文件列表信息的一行
	            // 标记起始结束索引
	            if (line.contains("----------------------")) {
	                count = (count == 0 ? count + 1 : -1);
	                continue;
	            }
	            if (count == 0)// 跳过起始标记
	                continue;
	            if (count == -1)// 在结束标记终止循环
	                break;
	            if (++count % 2 == 0) {// 获取文件名称
	            	fileDetails.add(line);
	            } else {// 获取文件详细信息    
	                fileDetails.add(line);
	            }  
	        }
	        process.getInputStream().close();// 关闭输入流
	    } catch (Exception e1) {
	        e1.printStackTrace();
	    }
	    return fileDetails;
	}

}
