package com.lh.util;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

public class FileUtil {
	//����List���ϣ����ڱ����ļ��ƶ�������¼
	private List<String> workLogList = new ArrayList<String>();
	public List<String> getWorkLogList() {
		return workLogList;
	}
	/**
	 * ���������ƶ��ļ�
	 * @param sourcePath �ļ�Դ·��
	 * @param targetPath �ļ�Ŀ��·��
	 * @return �ƶ��ɹ�����true,���򷵻�false
	 */
	public boolean  moveFile(String sourcePath,String targetPath ){
	   try {
		   File sourceDir = new File(sourcePath);//����Դ·������File����
		   if(sourceDir.exists()){
			   for(File file :sourceDir.listFiles()){//�����ļ����µ������ļ�
				   File targetFile = new File(targetPath,file.getName());
				   file.renameTo(targetFile);//�����޸��ļ�·����ʵ���ļ��ƶ�
				   workLogList.add(file.getName()+" �ƶ��� "+targetPath+"--��ɣ�");
			   }
		   }
		   return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}  
	}
}
