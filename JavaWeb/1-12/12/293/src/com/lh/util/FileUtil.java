package com.lh.util;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

public class FileUtil {
	//创建List集合，用于保存所有旧文件名
	private List<String> oldNameList = new ArrayList<String>();
	//创建List集合，用于保存所有新文件名
	private List<String> newNameList = new ArrayList<String>();
	public List<String> getOldNameList() {
		return oldNameList;
	}
	public List<String> getNewNameList() {
		return newNameList;
	}
	/**
	 * 文件批量重命名
	 * @param filePath 文件路径
	 * @param templet 文件命名模板
	 * @param extName 文件扩展名
	 */
	public void renameFile(String filePath,String templet ,String extName){
		   	File dir = new File(filePath); //根据文件路径创建File对象
		    int bi =1;//起始编号
		    int index = templet.indexOf("#");// 获取第一个“#”的索引
		    String code = templet.substring(index);// 获取模板中数字占位字符串
		    // 把模板中数字占位字符串替换为指定格式
		    templet = templet.replace(code, "%0" + code.length() + "d");
		    extName = extName.toLowerCase();
		    if (extName.indexOf(".") == -1)
		        extName = "." + extName;
		    // 获取文件夹中文件列表数组
		    File[] files = dir.listFiles(new ExtendNameFilter(extName));
		    for (File file : files) {// 变量文件数组
		        // 格式化每个文件名称
		        String name = templet.format(templet, bi++) + extName;
		        oldNameList.add(file.getName());//将旧文件名添加到List集合中
		        newNameList.add(name);			//将新文件名添加到List集合中     
		        File parentFile = file.getParentFile();// 获取文件所在文件夹对象
		        File newFile = new File(parentFile, name);
		        file.renameTo(newFile);// 文件重命名
		    }
	}
}
