package com.lh.util;

import java.io.File;

public class FolderUtil {
	/**
	 * �����ļ���
	 * @param filepath �����ļ��е�·��
	 * @return �����ɹ�����true,���򷵻�false
	 */
	public static boolean createFolder(String filepath){
		boolean res =false;//����һ������ֵ���������ڱ��淽������ֵ 
		File file = new File(filepath);//����·���ַ�������File����
		res = file.mkdirs();//�����ļ���
		return res;
	}
	/**
	 * ɾ���ļ���
	 * @param filepath ɾ���ļ��е�·��
	 * @return ɾ���ɹ�����true,���򷵻�false
	 */
	public static boolean deleteFolder(String filepath){
		
		boolean res = false;//����һ������ֵ���������ڱ��淽������ֵ
		File file = new File(filepath);//����·���ַ�������File����
		if(file.exists()&&file.isDirectory()){//�ж��Ƿ���ڴ�·��
			res =file.delete();			//ɾ���ļ���
		}
		return res;
	}
}
