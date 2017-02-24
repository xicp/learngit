package com.lh.servlet;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class CounterListener implements ServletContextListener {

	/**
	 * Web��������ֹʱ�����ø÷���
	 * �򱣴�������ļ���дһ����ǰ��վ�ķ��ʴ���
	 */
	@Override
	public void contextDestroyed(ServletContextEvent contextEvent) {
		ServletContext context = contextEvent.getServletContext();
		Integer count = (Integer)context.getAttribute("counter");
		if(count!=null){
			try{
				String path =context.getRealPath("/count.txt");
				File file = new File(path);
				FileWriter fw = new FileWriter(file);
				BufferedWriter bw = new BufferedWriter(fw);
				bw.write(context.getAttribute("counter").toString());
				bw.flush();
				bw.close();
				fw.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
	}
	/**
	 * ��Web����������ʱ�����ø÷���
	 * ��ȡ�������ļ��б������վ���ʴ���
	 */
	@Override
	public void contextInitialized(ServletContextEvent contextEvent) {
		Integer count = 0;
		ServletContext context = contextEvent.getServletContext();
		try{
			String path  =context.getRealPath("");
			File file = new File(path,"count.txt");
			System.out.println(file.getPath());
			if(!file.exists()){
				
				file.createNewFile();
				FileWriter fw = new FileWriter(file);
				BufferedWriter bw = new BufferedWriter(fw);
				bw.write("0");
				bw.flush();
				bw.close();
				fw.close();
			}else{
				FileReader fr = new FileReader(file);
				BufferedReader br = new BufferedReader(fr);
				count = new Integer(br.readLine());	
				context.setAttribute("counter", count);
				br.close();
				fr.close();
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}
	}
}
