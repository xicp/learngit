package com.lh.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

public class FileUtil {
	
	
	/**
	 * ����һ���ļ���
	 * @param source Դ�ļ���
	 * @param target Ŀ���ļ���
	 * @throws IOException
	 */
	public static void copySingleFile(File source, File target) throws IOException {
		FileInputStream input = new FileInputStream(source);//���������
		FileOutputStream output = new FileOutputStream(target);//��������
		byte[] b = new byte[1024 * 5];
		int length;
		while ((length = input.read(b)) != -1) {//����ѭ����ȡ�������е�ȫ������
			output.write(b, 0, length);//���������е�����д�뵽�������
		}
		output.flush();//ˢ�������
		output.close();//�ͷ��������Դ
		input.close();//�ͷ���������Դ
	}
	/**
	 * ����һ���ļ���
	 * @param source Դ�ļ���
	 * @param target Ŀ���ļ���
	 * @throws IOException
	 */
	public static void copyDictionary(File source, File target) throws IOException {
		File[] files = source.listFiles();//��Դ�ļ���ת����File����
		for (File file : files) {
			if (file.isFile()) {//�����һ���ļ��͵��ø����ļ��ķ���
				copySingleFile(file, new File(target.getAbsolutePath() + "/" + file.getName()));
			} else if (file.listFiles().length == 0) {//�����һ�����ļ��о͵��ô����ļ��еķ���
				new File(target.getAbsolutePath() + "/" + file.getName()).mkdir();
			} else {//�����һ���ǿ��ļ��о͵����������е���
				new File(target.getAbsolutePath() + "/" + file.getName()).mkdir();
				copyDictionary(file, new File(target.getAbsolutePath() + "/" + file.getName()));
			}
		}
	}

}
