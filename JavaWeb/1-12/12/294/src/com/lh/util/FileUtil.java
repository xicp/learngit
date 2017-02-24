package com.lh.util;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

public class FileUtil {
	//创建List集合，用于保存文件移动操作记录
	private List<String> workLogList = new ArrayList<String>();
	public List<String> getWorkLogList() {
		return workLogList;
	}
	/**
	 * 快速批量移动文件
	 * @param sourcePath 文件源路径
	 * @param targetPath 文件目标路径
	 * @return 移动成功返回true,否则返回false
	 */
	public boolean  moveFile(String sourcePath,String targetPath ){
	   try {
		   File sourceDir = new File(sourcePath);//根据源路径创建File对象
		   if(sourceDir.exists()){
			   for(File file :sourceDir.listFiles()){//遍历文件夹下的所有文件
				   File targetFile = new File(targetPath,file.getName());
				   file.renameTo(targetFile);//根据修改文件路径，实现文件移动
				   workLogList.add(file.getName()+" 移动到 "+targetPath+"--完成！");
			   }
		   }
		   return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}  
	}
}
