package com.lh.util;

import java.io.File;

import java.io.FileFilter;

public class CustomFilter implements FileFilter {
	private String extentName;//用户设置的指定扩展名
	@Override
	public boolean accept(File pathname) {	  
        if (extentName == null || extentName.isEmpty())
            return false;
        if (!extentName.startsWith("."))	//判断扩展名前缀
        	extentName = "." + extentName;	//添加扩展名前缀
        extentName = extentName.toLowerCase();
        // 判断扩展名与过滤文件名是否符合要求
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
