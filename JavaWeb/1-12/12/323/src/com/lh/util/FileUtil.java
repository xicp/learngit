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
	public  void zipFile( File targetZipFile, String base) throws IOException {
		//���ݸ�����targetZipFile�����ļ����������
		FileOutputStream fos = new FileOutputStream(targetZipFile);
		ZipOutputStream zos = new ZipOutputStream(fos);//�����ļ���������󴴽�Zip���������
		byte[] buffer = new byte[1024];
		for (String filePath : filePaths) {	//��������Ҫѹ���ļ���·��
			File currentFile = new File(filePath);
			ZipEntry entry = new ZipEntry(filePath.substring(base.length() + 1, filePath.length()));//����Ҫѹ���ļ������·������ZipEntry����
			FileInputStream fis = new FileInputStream(currentFile);
			zos.putNextEntry(entry);
			int read = 0;
			while ((read = fis.read(buffer)) != -1) {//������д�뵽Zip�������
				zos.write(buffer, 0, read);
			}
			zos.closeEntry();					//�ر�ZipEntry����
			fis.close();
		}
		zos.close();						//�ͷ���Դ
		fos.close();
	}

	public boolean backupServerFile(String uri ,String targetFolder) {
		try {
			File sourceFile = new File(new URI(uri));//�����û������URI����File����	
			getFiles(sourceFile.getAbsolutePath());//����ļ���ַ
			//�����û�ѡ����ļ��к������ļ��е����ִ���ѹ���ļ�
			File targetFile = new File(targetFolder + sourceFile.getName() + ".zip");
			zipFile(targetFile, sourceFile.getAbsolutePath());//ʵ��ѹ������
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

}
