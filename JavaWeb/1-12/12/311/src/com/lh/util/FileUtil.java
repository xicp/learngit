package com.lh.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Enumeration;
import java.util.List;
import org.apache.tools.zip.ZipEntry;
import org.apache.tools.zip.ZipFile;

public class FileUtil {
	
	public static void unZipFile(File zipFile, File targetFile, List<String> list) throws IOException {
		ZipFile zf = new ZipFile(zipFile);//创建ZipFile对象
		Enumeration e = zf.getEntries();
		while (e.hasMoreElements()) {//遍历所有ZipEntry对象
			ZipEntry entry = (ZipEntry) e.nextElement();
			if (entry.isDirectory()) {//如果ZipEntry对象是一个文件夹就创建这个文件夹
				new File(targetFile + entry.getName()).mkdir();
			} else {
				File file = new File(targetFile , entry.getName());//获得被压缩的文件
				File temp = new File(file.getParent());//获得被压缩文件的父文件夹
				if(!temp.exists())//如果父文件夹不存在，则创建
					temp.mkdirs();	
				if(!file.exists())//如果文件不存在，则创建
					file.createNewFile();
				list.add(file.getName());//将文件的路径保存到列表中
				FileOutputStream out = new FileOutputStream(file);
				InputStream in = zf.getInputStream(entry);
				int b;
				while ((b = in.read()) != -1) {//将数据写入到创建好的文件
					out.write(b);
				}
				out.close();//释放资源
			}
		}
		zf.close();//释放资源
	}

}
