package com.lh.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class FileUtil {
	
	public void addNoteToRarFile(String note,File rarFile) {
	    int length = note.getBytes().length;// 获取注释文本长度
	    if (length > 32767) {// 限制文本长度
	        return;
	    }
	    try {
	    	String command = "rar c \"" + rarFile + "\"";
	        Process process = Runtime.getRuntime().exec(command);// 执行添加注释命令
	        // 把注释文本传递给注释命令
	        process.getOutputStream().write(note.getBytes());
	        process.getOutputStream().close();// 关闭输出流
	        process.getInputStream().close();// 关闭输入流
	    } catch (IOException e1) {
	        e1.printStackTrace();
	    }
	}

}
