package com.lh.util;

import java.io.File;

import java.io.FileFilter;

public class CustomFilter implements FileFilter {
	private String extentName;//�û����õ�ָ����չ��
	@Override
	public boolean accept(File pathname) {	  
        if (extentName == null || extentName.isEmpty())
            return false;
        if (!extentName.startsWith("."))	//�ж���չ��ǰ׺
        	extentName = "." + extentName;	//�����չ��ǰ׺
        extentName = extentName.toLowerCase();
        // �ж���չ��������ļ����Ƿ����Ҫ��
        if (pathname.getName().toLowerCase().endsWith(extentName))
            return true;
        return false;
	}
	public String getExtentName() {
		return extentName;
	}
	public void setExtentName(String extentName) {
		this.extentName = extentName;
	}
}
