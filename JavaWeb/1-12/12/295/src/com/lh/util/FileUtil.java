package com.lh.util;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

public class FileUtil {
	//�����������࣬����temp�ļ�
	private ExtendNameFilter tempFilter = new ExtendNameFilter();
	//����List���ϣ����ڱ�����������temp��ʱ�ļ�
	private List<File> temFiles = new ArrayList<File>();
	public List<File> getTemFiles() {
		return temFiles;
	}
	/**
	 * ɾ��temp��ʱ�ļ�
	 * @param files temp��ʱ�ļ�����
	 * @return ɾ���ɹ�����true,���򷵻�false
	 */
	
	public boolean  deleteTmpFile(List<File> files){
	    try {
			for (File file:files) {	//�����ļ�����
				if(file.exists()){	//�ж��ļ��Ƿ����
					file.delete();	//ɾ��temp��ʱ�ļ�
				}
			}
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	/**
	 * �ݹ鷽������ȡָ������������ʱ�ļ�
	 * @param driver ����·��
	 */
	
	public void listTempFiles(File driver) {
	    // ��ȡָ�����̻��ļ��е����б�
	    File[] files = driver.listFiles(tempFilter);
	    if (files == null)
	        return; 
	    for (File file : files) {// �����ļ�����
	        if (file.isFile()) {// �����ļ�
	          temFiles.add(file);//���ļ���ӵ�List����	      
	        } else if (file.isDirectory()) {// �����ļ���
	            listTempFiles(file);// �ݹ鷽�������ļ���
	        }
	    }
	}
}
