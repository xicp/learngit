package com.lh.util;

import java.io.File;
import java.io.FileFilter;

public class ExtendNameFilter implements FileFilter {
	 @Override
     public boolean accept(File pathname) {
         if (pathname.getName().toLowerCase().endsWith(".txt".toLowerCase())
        		 ||pathname.isDirectory())//�ж��ļ�����չ���Ƿ����ָ����չ��
             return true;
         return false;
     }
}
