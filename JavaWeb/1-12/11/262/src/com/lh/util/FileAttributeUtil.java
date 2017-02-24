package com.lh.util;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Scanner;

public class FileAttributeUtil {
	private boolean read = false;//ֻ��
	private boolean hidden = false;//����
	private boolean sys = false;//ϵͳ
	private boolean doc = false;//�鵵
	private String fileName="";//�ļ���
	private String filePath="";//�ļ�·��
	/**
	 * ��ȡ�ļ�����
	 * @param filepath �ļ�·��
	 */
	public  void setFileAttribute(String filepath){
       File file = new File(filepath);// ��ȡ�û�ѡ���ļ�
       fileName = file.getName();
       filePath = file.getAbsolutePath();
        // ���������ı�     
        String command = "attrib " + file.getAbsolutePath();
        try {
            // ִ�������ı�
            Process exec = Runtime.getRuntime().exec(command);
            // ��������ִ�л������ı�ɨ����
            Scanner in = new Scanner(exec.getInputStream());
            if (in.hasNextLine()) {
                // ��ȡ����ִ�н��
                String line = in.nextLine();
                int of = line.indexOf(file.getPath());
                // ��ȡ���������ļ���������Ϣ
                String attribStr = line.substring(0, of).trim();
                // �����������ø���ѡ��ѡ��״̬
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
	 * �����ļ�����������
	 * @param filepath �ļ�·��
	 * @param str �ļ����Ե������ַ���
	 * @return ����ɹ�����true�����򷵻�false
	 */
	public static boolean saveFileAttribute(String filepath,String str){
		File file = new File(filepath);//�����ļ�·������File����
		String command = "attrib "+file.getPath()+str;//�����ļ����Ե�����
		try {
			Runtime.getRuntime().exec(command);// ִ������
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
