package com.lh.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;
import java.util.Vector;


public class FileUtil {
	
	public static String createAutoExecFile(File rarFile) {
	    if (rarFile == null)
	        return "";
	    StringBuffer sb = new StringBuffer();
	    try {
	        Process process =Runtime. getRuntime().exec("rar s -y -c- " + rarFile);
	        Scanner scan=new Scanner(process.getInputStream());
	        int count=0;
	        while (scan.hasNext()) {// 遍历进程执行结果
	            String line = scan.nextLine();// 获取单行信息
	            if (line.isEmpty())
	                count++;
	            if (count < 2)// 过滤非查询结果
	                continue;
	            sb.append(line + "\n");// 查询结果添加到StringBuffer
	        }
	    } catch (IOException e1) {
	        e1.printStackTrace();
	    }
	    return sb.toString();//返回查询结果
	}

}
