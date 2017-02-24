package com.lh.util;

import java.io.File;
import java.io.FileFilter;

public class ExtendNameFilter implements FileFilter {
	private String extName;
    public ExtendNameFilter(String extName) {
        this.extName = extName;// 保存文件扩展名
    }
	@Override
	public boolean accept(File pathname) {
	  if (pathname.getName().toUpperCase()
                .endsWith(extName.toUpperCase()))
            return true;
      return false;

	}

}
