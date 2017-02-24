package com.lh.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.tools.zip.ZipEntry;
import org.apache.tools.zip.ZipOutputStream;

public class FileUtil {
	private List<String> filePaths = new ArrayList<String>();
	public List<String> getFilePaths() {
		return filePaths;
	}
	public void setFilePaths(List<String> filePaths) {
		this.filePaths = filePaths;
	}
	/**
	 * ѹ���������ļ���
	 * @param path ����Ҫѹ�����ļ�·��
	 * @param targetZipFile ѹ���ļ��ı���λ��
	 * @param base ѹ���ļ��еĻ�·��
	 * @throws IOException
	 */
	
	public  void zipFile(String sourceFolder, File targetZipFile, String base) throws IOException {
		getFiles(sourceFolder);
		//���ݸ�����targetZipFile�����ļ����������
		FileOutputStream fos = new FileOutputStream(targetZipFile);
		ZipOutputStream zos = new ZipOutputStream(fos);//�����ļ���������󴴽�Zip���������
		byte[] buffer = new byte[1024];
		for (String filePath : filePaths) {//��������Ҫѹ���ļ���·��
			File currentFile = new File(filePath);
			ZipEntry entry = new ZipEntry(filePath.substring(base.length()+1, filePath.length()));//����Ҫѹ���ļ������·������ZipEntry����
			FileInputStream fis = new FileInputStream(currentFile);
			zos.putNextEntry(entry);
			int read = 0;
			while ((read = fis.read(buffer)) != -1) {//������д�뵽Zip�������
				zos.write(buffer, 0, read);
			}
			zos.closeEntry();//�ر�ZipEntry����
			fis.close();
		}
		zos.close();//�ͷ���Դ
		fos.close();
	}
	
	public void getFiles(String path) {
	    File dir = new File(path);      						//�����ļ���ַ����File����
	    File files[] = dir.listFiles();  					//��ȡ�ļ����µ��ļ�����
	    for (File file:files ) {							//ѭ����������
	        if (file.isDirectory())  						//�ж��ļ��Ƿ���һ��Ŀ¼
	        	getFiles(file.getAbsolutePath());    			//���Ϊ�ļ��У�����ִ�б�����
	        else {
	        	filePaths.add(file.getAbsolutePath());    	//���ļ�·����ӵ�������
	        }
	    }
	}

}
