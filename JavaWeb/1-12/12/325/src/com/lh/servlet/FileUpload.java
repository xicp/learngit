package com.lh.servlet;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jspsmart.upload.File;
import com.jspsmart.upload.Files;
import com.jspsmart.upload.SmartUpload;


public class FileUpload extends HttpServlet {
	public FileUpload() {
		super();
	}
	public void destroy() {
		super.destroy(); 
		
	}	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		SmartUpload smartUpload= new SmartUpload();			//�����ϴ��ļ��ĺ��Ķ���
		String res = "û��ȷ��Ҫ�ϴ����ļ���";			  	//���÷�����Ϣ�ַ���
		String uploadPath = this.getServletContext().getRealPath("/")+"upload";
		java.io.File uploadFolder = new java.io.File(uploadPath);
		if(!uploadFolder.exists())
			uploadFolder.mkdirs();
		long maxsize = 1024 * 1024 * 5;					  	//�����ϴ��ļ��Ĵ�С
		try {
			smartUpload.initialize(this.getServletConfig(), request, response); //��ʼ��SmartUpload����
			smartUpload.upload();							//����upload()����
			Files uploadFiles = smartUpload.getFiles();		//��ȡ�����ϴ��ļ�
			if (uploadFiles.getSize() > maxsize) {			//�ж��ϴ��ļ��ĳ����Ƿ�������õ�����ļ�����
				res = "�ļ���С������Χ��";	
			}
			for (int i = 0; i < uploadFiles.getCount(); i++) { //��ȡ�����ϴ��������ļ�
				File file = uploadFiles.getFile(i);		 	//��ȡÿ���ϴ����ļ�����
				if ((!file.isMissing()) && (uploadFiles.getSize() < maxsize)) {//����û�ѡ�����ϴ��ļ��������ϴ����ļ�С�����ƵĴ�С						
					String fileName = uploadFolder.getName()+"/" +file.getFileName();//�����ϴ��ļ�������
					file.saveAs(fileName, File.SAVEAS_VIRTUAL); //�����ļ�
					res = "�ļ��ϴ��ɹ���";
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("result", res);
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}	
	public void init() throws ServletException {
		
	}
}
