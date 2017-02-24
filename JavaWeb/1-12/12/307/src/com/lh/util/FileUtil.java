package com.lh.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Enumeration;
import java.util.zip.ZipEntry;
import java.util.zip.ZipException;
import java.util.zip.ZipFile;
import java.util.zip.ZipOutputStream;

public class FileUtil {
	
	public void unZipFiles(String zipFilePath,String targetFolder){
		ZipFile zf = null;
		try {
			zf = new ZipFile(zipFilePath);//利用用户选择的ZIP文件创建ZipFile对象
			Enumeration e = zf.entries();//创建枚举变量
			while (e.hasMoreElements()) {//遍历枚举变量
				ZipEntry entry = (ZipEntry) e.nextElement();//获得ZipEntry对象
				if (!entry.getName().endsWith(".txt")) {//如果不是文本文件就不进行解压缩
					continue;
				}
				//利用用户选择的文件夹和ZipEntry对象名称创建解压后的文件
				File currentFile = new File(targetFolder + File.separator + entry.getName());
				FileOutputStream out = new FileOutputStream(currentFile);
				InputStream in = zf.getInputStream(entry);//利用获得的ZipEntry对象的输入流
				int buffer = 0;
				while ((buffer = in.read()) != -1) {//将输入流写入到本地文件
					out.write(buffer);
				}
				in.close();//释放资源
				out.close();	
			}
			zf.close();
		} catch (Exception e) {//捕获异常
			e.printStackTrace();
		}
		
	}
}
