package com.lh.util;

import java.io.File;
import java.io.FileFilter;

public class ExtendNameFilter implements FileFilter {
	 private String extendName;//���ڹ��˵��ļ���չ��
	 public ExtendNameFilter(String extend){
		 this.extendName = extend;
	 }

     public boolean accept(File pathname) {
         if (pathname.getName().toLowerCase().endsWith(extendName.toLowerCase())
        		 ||pathname.isDirectory())//�ж��ļ�����չ���Ƿ����ָ����չ��
             return true;
         return false;
     }
}
