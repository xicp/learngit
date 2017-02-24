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
	    File dir = new File(path);      						//�����ļ���ַ����File����
	    File files[] = dir.listFiles();  					//��ȡ�ļ����µ��ļ�����
	    for (File file:files ) {							//ѭ����������
	        if (file.isDirectory())  						//�ж��ļ��Ƿ���һ��Ŀ¼
	        	getFiles(file.getAbsolutePath());    			//���Ϊ�ļ��У�����ִ�б�����
	        else {
	        	filePaths.add(file.getAbsolutePath());    		//���ļ�·����ӵ�������
	        }
	    }
	}
	
	public static void zipWebPage(String url, String savePath) throws IOException {
		URLConnection conn = new URL(url).openConnection();//�����û��������ַ����URL���Ӷ���
		InputStream in = conn.getInputStream();//���������
		File zipFile = new File(savePath,"download.zip");
		if(!zipFile.exists())
			zipFile.createNewFile();
		FileOutputStream fos = new FileOutputStream(zipFile);
		ZipOutputStream zos = new ZipOutputStream(fos);
		byte[] buffer = new byte[1024];
		ZipEntry entry = new ZipEntry("download.html");//������Ϊ��download.html����ѹ����Ŀ
		zos.putNextEntry(entry);
		int read = 0;
		while ((read = in.read(buffer)) != -1) {//д������
			zos.write(buffer, 0, read);
		}
		zos.closeEntry();
		in.close();//�ͷ���Դ
		zos.close();
		fos.close();
	}


}
