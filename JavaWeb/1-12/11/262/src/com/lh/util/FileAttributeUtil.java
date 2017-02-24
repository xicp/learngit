package com.lh.util;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Scanner;

public class FileAttributeUtil {
	private boolean read = false;//只读
	private boolean hidden = false;//隐藏
	private boolean sys = false;//系统
	private boolean doc = false;//归档
	private String fileName="";//文件名
	private String filePath="";//文件路径
	/**
	 * 读取文件属性
	 * @param filepath 文件路径
	 */
	public  void setFileAttribute(String filepath){
       File file = new File(filepath);// 获取用户选择文件
       fileName = file.getName();
       filePath = file.getAbsolutePath();
        // 创建命令文本     
        String command = "attrib " + file.getAbsolutePath();
        try {
            // 执行命令文本
            Process exec = Runtime.getRuntime().exec(command);
            // 创建命令执行环境的文本扫描器
            Scanner in = new Scanner(exec.getInputStream());
            if (in.hasNextLine()) {
                // 读取命令执行结果
                String line = in.nextLine();
                int of = line.indexOf(file.getPath());
                // 截取命令结果中文件的属性信息
                String attribStr = line.substring(0, of).trim();
                // 根据属性设置个复选框选择状态
                doc = attribStr.contains("A");
                hidden = attribStr.contains("H");
                read = attribStr.contains("R");
                sys = attribStr.contains("S");
            }
        } catch (IOException e1) {
            e1.printStackTrace();
	    }    
	}
	/**
	 * 保存文件的属性设置
	 * @param filepath 文件路径
	 * @param str 文件属性的命令字符串
	 * @return 保存成功返回true，否则返回false
	 */
	public static boolean saveFileAttribute(String filepath,String str){
		File file = new File(filepath);//根据文件路径创建File对象
		String command = "attrib "+file.getPath()+str;//设置文件属性的命令
		try {
			Runtime.getRuntime().exec(command);// 执行命令
			return true;
		} catch (IOException e1) {
			e1.printStackTrace();
			return false;
		}

	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public boolean isRead() {
		return read;
	}
	public void setRead(boolean read) {
		this.read = read;
	}
	public boolean isHidden() {
		return hidden;
	}
	public void setHidden(boolean hidden) {
		this.hidden = hidden;
	}
	public boolean isSys() {
		return sys;
	}
	public void setSys(boolean sys) {
		this.sys = sys;
	}
	public boolean isDoc() {
		return doc;
	}
	public void setDoc(boolean doc) {
		this.doc = doc;
	}
}
