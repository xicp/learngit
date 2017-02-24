package com.lh.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class FileUtil {
    public void enRarFile(String rarFilePath,String targetFolderPath) {    	
    		 File rarFile = new File(rarFilePath);
    		 File targetFolder = new File(targetFolderPath);
    		 if(!targetFolder.exists())//如果文件夹路径不存在，则创建
    			 targetFolder.mkdirs();
    		 //解压缩命令字符串
    		 String command = "rar x " + rarFile + " " + targetFolder + " /y";
    		 new DeCompressThread(command).start();// 创建并启动解压缩线程
     }
    
    private final class DeCompressThread extends Thread {
        private final String command;
        private DeCompressThread(String command) {
            this.command = command;
        }
        public void run() {
        	try {
                final Process process = Runtime.getRuntime().exec(command);
                process.getOutputStream().close(); 
            } catch (IOException e1) {
                e1.printStackTrace();
            }
        }
    }
}
