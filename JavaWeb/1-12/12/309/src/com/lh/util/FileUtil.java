package com.lh.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

public class FileUtil {
	
	public static void unZipFile(File zipFile, File targetFile, List<String> list) throws IOException {
		//利用用户选择的ZIP文件创建ZipInputStream对象
		ZipInputStream in = new ZipInputStream(new FileInputStream(zipFile));
		ZipEntry entry;
		while ((entry = in.getNextEntry()) != null) {//遍历所有ZipEntry对象
			if (entry.isDirectory()) {//如果ZipEntry对象是一个文件夹就进行迭代
				new File(targetFile+entry.getName()).mkdirs();
				
			} else {//如果是文件就将它写入到指定的文件夹中
				File file = new File(targetFile , entry.getName());
				File folder = new File(file.getParent());//根据文件父目录创建File对象
				if(!folder.exists())//如果目录不存在，则创建目录
					folder.mkdirs();
				if(!file.exists())//如果文件不存在，则创建文件
					file.createNewFile();
				list.add(file.getName());//将新生成的文件的路径添加到列表中
				FileOutputStream out = new FileOutputStream(file);
				int b;
				while ((b = in.read()) != -1) {//写入数据
					out.write(b);
				}
				out.close();//释放资源
			}
			entry.clone();
		}
		in.close();	
	}

}
