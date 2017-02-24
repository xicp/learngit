package com.lh.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

public class FileUtil {
	public static void zipFile(File folder, File targetZipFile) throws IOException {
		File[] txtFiles = folder.listFiles(new ExtendNameFilter());
		//利用给定的targetZipFile对象创建文件输出流对象
		FileOutputStream fos = new FileOutputStream(targetZipFile);
		ZipOutputStream zos = new ZipOutputStream(fos);//利用文件输出流创建压缩输出流
		byte[] buffer = new byte[1024];//创建写入压缩文件的数组
		for (File file : txtFiles) {//遍历全部文件
			ZipEntry entry = new ZipEntry(file.getName());//利用每个文件的名字创建ZipEntry对象
			System.out.println(entry.getName());
			FileInputStream fis = new FileInputStream(file);//利用每个文件创建文件输入流对象
			zos.putNextEntry(entry);//在压缩文件中添加一个ZipEntry对象
			int read = 0;
			while ((read = fis.read(buffer)) != -1) {
				zos.write(buffer, 0, read);//将输入写入到压缩文件
			}
			zos.closeEntry();//关闭ZipEntry
			fis.close();//释放资源
		}
		zos.close();
		fos.close();
	}

}
