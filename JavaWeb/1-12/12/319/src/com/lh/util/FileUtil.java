package com.lh.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;
import java.util.Vector;


public class FileUtil {
	/**
	 * 在RAR文件中查找字符串
	 * @param rarFile RAR文件
	 * @param searchStr 搜索字符串
	 * @param extendStr 文件扩展名
	 * @return
	 */
	
	public String searchRarInfo(File rarFile,String searchStr,String extendStr){
		StringBuffer str = new StringBuffer();
	    int count = 0;
	    try {
	        // 执行rar命令
	        Process process = Runtime.getRuntime().exec(
	                "rar i" + "i" + "=\"" + searchStr + "\" -c- \"" + rarFile
	                        + "\" " + extendStr);
	        // 获取进程的输入流扫描器
	        Scanner scan = new Scanner(process.getInputStream());
	        while (scan.hasNext()) {// 遍历进程执行结果
	            String line = scan.nextLine();// 获取单行信息
	            if (line.isEmpty())
	                count++;
	            if (count < 2)// 过滤非查询结果
	                continue;
	            str.append(line + "\n");// 查询结果添加到StringBuffer
	        }
	    } catch (IOException e1) {
	        e1.printStackTrace();
	    }
	    return str.toString();
	}
}
