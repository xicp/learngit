package com.lh.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jspsmart.upload.Files;
import com.jspsmart.upload.SmartUpload;

	public class UploadServlet extends HttpServlet {
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		doPost(request,response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String path = this.getServletContext().getRealPath("/")+"/upload";
		File folder = new File(path);
		if(!folder.exists())
			folder.mkdirs();
		String result = null;
		long maxsize=2*1024*1024;
		try{
			SmartUpload upfile=new SmartUpload();       //ʵ�������� 
			upfile.initialize(this.getServletConfig(),request,response);     //ִ�г�ʼ������ 
			upfile.upload();                            //�ϴ��ļ���������
		
			Files file=upfile.getFiles();              // ��ȡ�ļ���
			if(file.getSize()>maxsize){                 //�ж��ļ���С�Ƿ����
				result="̫���ˣ�";
			}
			com.jspsmart.upload.File files=file.getFile(0);                  //ʵ�����ļ�����
			
			if((!files.isMissing())&&(file.getSize()<maxsize)){
				String fname=files.getFileName();       //��ȡ�ļ��� 
				//String s= URLEncoder.encode(fname,"utf-8");
				upfile.save("/upload/");                //�����ϴ����ļ�
				result="�ϴ��ɹ���";
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		//����Ϣ���͵�ָ��ҳ�� 
		request.setAttribute("result", result);
		RequestDispatcher rd=request.getRequestDispatcher("secc.jsp");
		rd.forward(request, response);		
	}
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
	}

}
