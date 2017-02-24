package com.lh.util;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

public class FileUtil {
	//����List���ϣ����ڱ������о��ļ���
	private List<String> oldNameList = new ArrayList<String>();
	//����List���ϣ����ڱ����������ļ���
	private List<String> newNameList = new ArrayList<String>();
	public List<String> getOldNameList() {
		return oldNameList;
	}
	public List<String> getNewNameList() {
		return newNameList;
	}
	/**
	 * �ļ�����������
	 * @param filePath �ļ�·��
	 * @param templet �ļ�����ģ��
	 * @param extName �ļ���չ��
	 */
	public void renameFile(String filePath,String templet ,String extName){
		   	File dir = new File(filePath); //�����ļ�·������File����
		    int bi =1;//��ʼ���
		    int index = templet.indexOf("#");// ��ȡ��һ����#��������
		    String code = templet.substring(index);// ��ȡģ��������ռλ�ַ���
		    // ��ģ��������ռλ�ַ����滻Ϊָ����ʽ
		    templet = templet.replace(code, "%0" + code.length() + "d");
		    extName = extName.toLowerCase();
		    if (extName.indexOf(".") == -1)
		        extName = "." + extName;
		    // ��ȡ�ļ������ļ��б�����
		    File[] files = dir.listFiles(new ExtendNameFilter(extName));
		    for (File file : files) {// �����ļ�����
		        // ��ʽ��ÿ���ļ�����
		        String name = templet.format(templet, bi++) + extName;
		        oldNameList.add(file.getName());//�����ļ�����ӵ�List������
		        newNameList.add(name);			//�����ļ�����ӵ�List������     
		        File parentFile = file.getParentFile();// ��ȡ�ļ������ļ��ж���
		        File newFile = new File(parentFile, name);
		        file.renameTo(newFile);// �ļ�������
		    }
	}
}
