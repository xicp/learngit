package com.lh.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class FileUtil {
	
	public void addNoteToRarFile(String note,File rarFile) {
	    int length = note.getBytes().length;// ��ȡע���ı�����
	    if (length > 32767) {// �����ı�����
	        return;
	    }
	    try {
	    	String command = "rar c \"" + rarFile + "\"";
	        Process process = Runtime.getRuntime().exec(command);// ִ�����ע������
	        // ��ע���ı����ݸ�ע������
	        process.getOutputStream().write(note.getBytes());
	        process.getOutputStream().close();// �ر������
	        process.getInputStream().close();// �ر�������
	    } catch (IOException e1) {
	        e1.printStackTrace();
	    }
	}

}
