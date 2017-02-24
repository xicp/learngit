package com.lh.util;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import com.lh.dao.DBHelper;

public class FileUtil {
	
	public static List<Object[]> searchFilePathByKey(String key) {
		//模糊查询的SQL语句
		String sql = "select * from tb_directories where path like '%" + key + "%';";
		List<Object[]> results = DBHelper.query(sql);	//调用自定义的查询方法，返回List集合
		return results;
	}
	
	public static void createFileIndex(File folderPath) throws Exception {
		List<String> list = new ArrayList<String>();//创建List集合
		getFilePath(list, folderPath);//调用查询所有文件路径的方法，将文件路径保存到List集合中
		for (int i = 0; i < list.size(); i++) {//循环List集合中
			//根据文件路径字符串，定义查询SQL语句
			String sql = "select id from tb_directories where path = '" + list.get(i) + "';";
			int maxId = DBHelper.getMaxID("tb_directories");
			List<Object[]> results = DBHelper.query(sql);//调用自定义的查询方法
			if (results.size() == 0) {//如果没有返回查询结果
				//定义执行添加信息的SQL语句
				sql = "insert into tb_directories (path) values ('" + list.get(i) + "');";
				DBHelper.update(sql);//调用自定义的方法，将文件路径保存到数据库
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
