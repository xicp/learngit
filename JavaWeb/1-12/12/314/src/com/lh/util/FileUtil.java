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
    		 if(!targetFolder.exists())//����ļ���·�������ڣ��򴴽�
    			 targetFolder.mkdirs();
    		 //��ѹ�������ַ���
    		 String command = "rar x " + rarFile + " " + targetFolder + " /y";
    		 new DeCompressThread(command).start();// ������������ѹ���߳�
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
