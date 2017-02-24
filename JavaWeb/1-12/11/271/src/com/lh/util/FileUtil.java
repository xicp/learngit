package com.lh.util;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import com.lh.dao.DBHelper;

public class FileUtil {
	
	public static List<Object[]> searchFilePathByKey(String key) {
		//ģ����ѯ��SQL���
		String sql = "select * from tb_directories where path like '%" + key + "%';";
		List<Object[]> results = DBHelper.query(sql);	//�����Զ���Ĳ�ѯ����������List����
		return results;
	}
	
	public static void createFileIndex(File folderPath) throws Exception {
		List<String> list = new ArrayList<String>();//����List����
		getFilePath(list, folderPath);//���ò�ѯ�����ļ�·���ķ��������ļ�·�����浽List������
		for (int i = 0; i < list.size(); i++) {//ѭ��List������
			//�����ļ�·���ַ����������ѯSQL���
			String sql = "select id from tb_directories where path = '" + list.get(i) + "';";
			int maxId = DBHelper.getMaxID("tb_directories");
			List<Object[]> results = DBHelper.query(sql);//�����Զ���Ĳ�ѯ����
			if (results.size() == 0) {//���û�з��ز�ѯ���
				//����ִ�������Ϣ��SQL���
				sql = "insert into tb_directories (path) values ('" + list.get(i) + "');";
				DBHelper.update(sql);//�����Զ���ķ��������ļ�·�����浽���ݿ�
			}
		}
	}

	public static List<String> getFilePath(List<String> list, File rootFile) {
		File[] files = rootFile.listFiles();
		if (files == null)
			return list;
		for (File file : files) {
			if (file.isDirectory()) {
				getFilePath(list, file);
			} else {
				list.add(file.getAbsolutePath().replace("\\", "/"));
			}
		}
		return list;
	}
}
