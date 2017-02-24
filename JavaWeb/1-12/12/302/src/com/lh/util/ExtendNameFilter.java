package com.lh.util;

import java.io.File;
import java.io.FileFilter;

public class ExtendNameFilter implements FileFilter {
	 private String extendName;//用于过滤的文件扩展名
	 public ExtendNameFilter(String extend){
		 this.extendName = extend;
	 }

     public boolean accept(File pathname) {
         if (pathname.getName().toLowerCase().endsWith(extendName.toLowerCase())
        		 ||pathname.isDirectory())//判断文件的扩展名是否符合指定扩展名
             return true;
         return false;
     }
}
