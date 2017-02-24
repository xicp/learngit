package com.lh.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;

public class FileUtil {
	public static String getFileTxt(String filePath){
		File file = new File(filePath);		//����File����
		String fileTxt="";//�����ַ����������ڱ����ļ�����
		if (file.exists() && file.isFile()) {//�ж��Ƿ�Ϊ�ļ� 
			try {
				FileReader fr = new FileReader(file);//�����ַ�����������
				BufferedReader br = new BufferedReader(fr);//���ַ��������ж�ȡ�ı�
				String line = br.readLine();//��ȡһ���ı�
				StringBuffer sb = new StringBuffer("");
				while(line!=null){//�����ǰ�в�Ϊ��
					sb.append(line);//����ȡ�����ı���ӵ�StringBuffer������
					line = br.readLine();//��ȡ��һ��
				}
				br.close();//�ر���
				fr.close();
				fileTxt = sb.toString();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else{
			fileTxt = "�ļ�"+file.getName()+"�����ڣ�";
		}
		return fileTxt;
	}
}
