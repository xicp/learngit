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
	public  void zipFile( File targetZipFile, String base) throws IOException {
		//根据给定的targetZipFile创建文件输出流对象
		FileOutputStream fos = new FileOutputStream(targetZipFile);
		ZipOutputStream zos = new ZipOutputStream(fos);//利用文件输出流对象创建Zip输出流对象
		byte[] buffer = new byte[1024];
		for (String filePath : filePaths) {	//遍历所有要压缩文件的路径
			File currentFile = new File(filePath);
			ZipEntry entry = new ZipEntry(filePath.substring(base.length() + 1, filePath.length()));//利用要压缩文件的相对路径创建ZipEntry对象
			FileInputStream fis = new FileInputStream(currentFile);
			zos.putNextEntry(entry);
			int read = 0;
			while ((read = fis.read(buffer)) != -1) {//将数据写入到Zip输出流中
				zos.write(buffer, 0, read);
			}
			zos.closeEntry();					//关闭ZipEntry对象
			fis.close();
		}
		zos.close();						//释放资源
		fos.close();
	}

	public boolean backupServerFile(String uri ,String targetFolder) {
		try {
			File sourceFile = new File(new URI(uri));//根据用户输入的URI创建File对象	
			getFiles(sourceFile.getAbsolutePath());//获得文件地址
			//根据用户选择的文件夹和网络文件夹的名字创建压缩文件
			File targetFile = new File(targetFolder + sourceFile.getName() + ".zip");
			zipFile(targetFile, sourceFile.getAbsolutePath());//实现压缩功能
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

}
