package com.lh.util;

import java.io.File;
import java.io.FileFilter;

public class ExtendNameFilter implements FileFilter {
	 @Override
     public boolean accept(File pathname) {
         if (pathname.getName().endsWith(".tmp") || pathname.isDirectory())
             return true;
         return false;
     }
}
