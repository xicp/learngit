package com.lh.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.ObjectInputStream;
import java.util.Enumeration;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;

public class FileUtil {
	public static void unzipSerializationObject(File file) 
		throws IOException, ClassNotFoundException {
		ZipFile zipFile = new ZipFile(file);//创建ZipFile对象
		File currentFile = null;
		Enumeration e = zipFile.entries();
		while (e.hasMoreElements()) {
			ZipEntry entry = (ZipEntry) e.nextElement();
			if (!entry.getName().endsWith(".dat")) {//遇到后缀名是.dat的文件就进行解压缩
				continue;
			}
			currentFile = new File(file.getParent() , entry.getName());
			if(!currentFile.exists())
				currentFile.createNewFile();
			FileOutputStream out = new FileOutputStream(currentFile);
			InputStream in = zipFile.getInputStream(entry);
			int buffer = 0;
			while ((buffer = in.read()) != -1) {//写入文件
				out.write(buffer);
			}
			in.close();//释放资源
			out.close();
		}
		
		FileInputStream in = new FileInputStream(currentFile);
		ObjectInputStream ois = new ObjectInputStream(in);//读入解压缩后的文件
		currentFile.delete();//删除解压缩产生的文件
	}

}
