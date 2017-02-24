package com.lh.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;
import java.util.Vector;


public class FileUtil {
	/**
	 * ��RAR�ļ��в����ַ���
	 * @param rarFile RAR�ļ�
	 * @param searchStr �����ַ���
	 * @param extendStr �ļ���չ��
	 * @return
	 */
	
	public String searchRarInfo(File rarFile,String searchStr,String extendStr){
		StringBuffer str = new StringBuffer();
	    int count = 0;
	    try {
	        // ִ��rar����
	        Process process = Runtime.getRuntime().exec(
	                "rar i" + "i" + "=\"" + searchStr + "\" -c- \"" + rarFile
	                        + "\" " + extendStr);
	        // ��ȡ���̵�������ɨ����
	        Scanner scan = new Scanner(process.getInputStream());
	        while (scan.hasNext()) {// ��������ִ�н��
	            String line = scan.nextLine();// ��ȡ������Ϣ
	            if (line.isEmpty())
	                count++;
	            if (count < 2)// ���˷ǲ�ѯ���
	                continue;
	            str.append(line + "\n");// ��ѯ�����ӵ�StringBuffer
	        }
	    } catch (IOException e1) {
	        e1.printStackTrace();
	    }
	    return str.toString();
	}
}
