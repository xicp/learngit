package com.lh.util;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

public class FileUtil {
	private  List<File> delFiles = new ArrayList<File>();
	public List<File> getDelFiles() {
		return delFiles;
	}
	public void setDelFiles(List<File> delFiles) {
		this.delFiles = delFiles;
	}
	/**
	 * ɾ���ļ��м���������
	 * @param rootFile
	 */
	
	public  void deleteDictionary(File rootFile) {
		if (rootFile.isFile()) {
			delFiles.add(rootFile);
			rootFile.delete();//���������File�������ļ���ֱ��ɾ��
		} else {//�����һ���ļ��оͽ���ת����File����
			File[] files = rootFile.listFiles();
			for (File file : files) {
				deleteDictionary(file);//������ǿ��ļ�����͵���deleteDictionary()����
			}
			rootFile.delete();//����ǿ��ļ��о�ֱ��ɾ��
		}
	}
	/**
	 * ɾ���ļ������������ݵ����������ļ���
	 * @param rootFile
	 */
	public  void deleteFiles(File rootFile) {
		if (rootFile.listFiles().length == 0) {//����û��������ǿ��ļ��о��˳�����
			return;
		} else {
			File[] files = rootFile.listFiles();//���ǿ��ļ���ת����File����
			for (File file : files) {
				if (file.isFile()) {
					delFiles.add(file);
					file.delete();//ɾ��ָ���ļ����µ������ļ�
				} else {
					if (file.listFiles().length == 0) {
						file.delete();//ɾ��ָ���ļ����µ����п��ļ���
					} else {
						deleteDictionary(file);//ɾ��ָ���ļ����µ����зǿ��ļ���
					}
				}
			}
		}
	}
}
