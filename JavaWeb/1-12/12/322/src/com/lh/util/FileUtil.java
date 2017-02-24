package com.lh.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class FileUtil {
	private List<String> filePaths = new ArrayList<String>();
	public void getFiles(String path) {
	    File dir = new File(path);      						//根据文件地址创建File对象
	    File files[] = dir.listFiles();  					//获取文件夹下的文件数组
	    for (File file:files ) {							//循环遍历数组
	        if (file.isDirectory())  						//判断文件是否是一个目录
	        	getFiles(file.getAbsolutePath());    			//如果为文件夹，继续执行本方法
	        else {
	        	filePaths.add(file.getAbsolutePath());    		//将文件路径添加到集合中
	        }
	    }
	}
	/**
	 * 文件夹压缩为RAR文档
	 * @param folderPath 文件路径
	 * @param rarFilePath 压缩的RAR文档
	 */

public boolean toRarFile(String folderPath,String rarFilePath,String pwd) {
    getFiles(folderPath);
	try {	
		// 创建临时文件，用于保存压缩文件列表       
		File listFile = File.createTempFile("fileList", ".tmp");
        StringBuffer fileList = new StringBuffer();
        for(String filePath:filePaths){
        	fileList.append(filePath+"\n");
        }   
        FileOutputStream fs = new FileOutputStream(listFile);
    	fs.write(fileList.toString().getBytes());
        fs.close();
        File rarFile = new File(rarFilePath); // 创建压缩命令字符串
        String passCommand = "-p\"" + pwd + "\" ";// 完成密码命令
        String command = "rar a " + passCommand+ rarFile.getPath() + " @" + listFile.getPath(); 
        new CompressThread(command).start(); 
        return true;
    } catch (IOException e) {
        e.printStackTrace();
        return false;
    }
}

private final class CompressThread extends Thread {
    private String command;
    public CompressThread(String command){
    	this.command = command;
    }
	public void run() {
        try {
        	 Runtime runtime = Runtime.getRuntime();// 获取Runtime对象
             Process process = runtime.exec(command.toString() + "\n");// 执行压缩命令
             process.getOutputStream().close();// 关闭进程输出流 
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}

}
