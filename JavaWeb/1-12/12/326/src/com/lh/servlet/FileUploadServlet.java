package com.lh.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.DiskFileUpload;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class FileUploadServlet extends HttpServlet {
	public FileUploadServlet() {
		super();
	}
	public void destroy() {
		super.destroy(); 
		
	}

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out
				.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the GET method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uploadPath = this.getServletContext().getRealPath("/")+"upload";//�����ϴ��ļ��ķ�����·��
		File uploadFolder = new File(uploadPath);//���ݸ�·������File����
		if(!uploadFolder.exists())//���·�������ڣ��򴴽�
			uploadFolder.mkdirs();
		String message = "�ļ��ϴ��ɹ���";
		try{
			if(ServletFileUpload.isMultipartContent(request)){
				DiskFileItemFactory factory = new DiskFileItemFactory();//�������̹��������������ϴ����ServletFileUpload
				factory.setSizeThreshold(20*1024); //�����ڴ�������洢���ֽ���
				factory.setRepository(factory.getRepository());//���ô����ʱ�ļ���Ŀ¼
				ServletFileUpload upload = new ServletFileUpload(factory);//�����µ��ϴ��ļ���� 	
				
				int maxSize = 5*1024*1024;//�����ϴ��ļ��Ĵ�С				
				upload.setFileSizeMax(maxSize);
				upload.setSizeMax(maxSize);
				List<FileItem> files = upload.parseRequest(request);//�������еõ������ϴ����б�			
				for(FileItem fileItem:files){//�����ϴ��ļ�����
					if(!fileItem.isFormField()){//�������������ļ�������б���Ϣ
						String name = fileItem.getName();
						
						String user="";
						if(fileItem.getFieldName().equals("userName"))
							user = fileItem.getString("UTF-8");
						if(fileItem.getSize()>upload.getFileSizeMax()){//�����ļ���С
		                     message = "�ϴ��ļ����ó���5MB��";
		                     break;
		                 }
						if((name == null) ||(name.equals(""))&&(fileItem.getSize()==0))
							continue;			
						File file = new File(uploadPath,name);//���ϴ�·�������ļ�����	
						fileItem.write(file);//���ļ�д����		
					}	
				}		
			}
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
		request.setAttribute("result", message);			//����ʾ��Ϣ������request������
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}
	public void init() throws ServletException {
		
	}
}
