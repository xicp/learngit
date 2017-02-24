package com.lh.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

public class FileUtil {
	private List<String> filePaths = new ArrayList<String>();	
	public void getFiles(String path) {
	    File dir = new File(path);      						//根据文件地址创建File对象
	    File files[] = dir.listFiles();  					//获取文件夹下的文件数组
	    for (File file:files ) {							//循环遍历数组
	        if (file.isDirectory())  						//判断文件是否是一个目录
	        	getFiles(file.getAbsolutePath());    			//如果为文件夹，继续执行本方法
	        else {
	        	filePaths.add(file.getAbsolutePath());    		//将文件路径添加到集合中
	        }
	    }
	}
	
	public static void zipWebPage(String url, String savePath) throws IOException {
		URLConnection conn = new URL(url).openConnection();//利用用户输入的网址创建URL连接对象
		InputStream in = conn.getInputStream();//获得输入流
		File zipFile = new File(savePath,"download.zip");
		if(!zipFile.exists())
			zipFile.createNewFile();
		FileOutputStream fos = new FileOutputStream(zipFile);
		ZipOutputStream zos = new ZipOutputStream(fos);
		byte[] buffer = new byte[1024];
		ZipEntry entry = new ZipEntry("download.html");//创建名为“download.html”的压缩条目
		zos.putNextEntry(entry);
		int read = 0;
		while ((read = in.read(buffer)) != -1) {//写入数据
			zos.write(buffer, 0, read);
		}
		zos.closeEntry();
		in.close();//释放资源
		zos.close();
		fos.close();
	}


}
