package com.lh.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class FileUtil {
	private Process process = null;
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
	/**
	 * �ļ���ѹ��ΪRAR�ĵ�
	 * @param folderPath �ļ�·��
	 * @param rarFilePath ѹ����RAR�ĵ�
	 */
	
    public void toRarFile(String folderPath,String rarFilePath) {
        getFiles(folderPath);
    	try {	
    		// ������ʱ�ļ������ڱ���ѹ���ļ��б�       
    		File listFile = File.createTempFile("fileList", ".tmp");
            StringBuffer fileList = new StringBuffer();
            for(String filePath:filePaths){
            	fileList.append(filePath+"\n");
            }   
            FileOutputStream fs = new FileOutputStream(listFile);
        	fs.write(fileList.toString().getBytes());
            fs.close();
            File rarFile = new File(rarFilePath); // ����ѹ�������ַ���
            String command = "rar a " + rarFile.getPath() + " @" + listFile.getPath();
            System.out.println(command);
            Runtime runtime = Runtime.getRuntime();// ��ȡRuntime����
            process = runtime.exec(command.toString() + "\n");// ִ��ѹ������
            process.getOutputStream().close();// �رս�������� 
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
