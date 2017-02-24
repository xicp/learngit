package com.lh.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class FileUtil {
	
	public String searchFile(String indexFilePath){	
		FileReader fileReader = null;
		BufferedReader bufferedReader = null;
		try {
			fileReader = new FileReader(indexFilePath);//�����û�ѡ����ļ�����FileReader����
			bufferedReader = new BufferedReader(fileReader);
			StringBuilder builder = new StringBuilder();//����StringBuilder���󱣴�����
			String temp = null;
			while ((temp = bufferedReader.readLine()) != null) {//�����ı��ļ�
				builder.append(temp);
				builder.append("\n");//��ÿһ�е�ĩβ���һ���ָ���
			}
			String[] rows = builder.toString().split("\n");//�����������з��ָ�
			StringBuffer sb = new StringBuffer();
			for(String row:rows) {//����������ı��ļ�
				if(row.endsWith(".txt")) {//�ж϶�����ı��ļ��Ƿ����ָ���Ĺؼ���
					sb.append(row+"\n");//���ؽ��
				}
			}
			bufferedReader.close();
			fileReader.close();
			return sb.toString();
		} catch (IOException e) {
			e.printStackTrace();
			return "";
		}
		
	}
}
