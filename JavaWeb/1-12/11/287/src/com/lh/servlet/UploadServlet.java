package com.lh.servlet;

import java.io.*;
import java.util.*;
import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FileCleaningTracker;
import org.apache.commons.io.filefilter.SuffixFileFilter;

import javax.servlet.*;
import javax.servlet.http.*;

public class UploadServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request,response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uploadPath = this.getServletContext().getRealPath("/")+"upload";	//�����ϴ��ļ��ķ�����·��
		File uploadFolder = new File(uploadPath);					//���ݸ�·������File����
		if(!uploadFolder.exists())								//���·�������ڣ��򴴽�
			uploadFolder.mkdirs();
		String message = "�ļ��ϴ��ɹ���";
		try{
			if(ServletFileUpload.isMultipartContent(request)){
				DiskFileItemFactory factory = new DiskFileItemFactory();	//�������̹��������������ϴ����ServletFileUpload
				factory.setSizeThreshold(20*1024); 				//�����ڴ�������洢���ֽ���
				factory.setRepository(factory.getRepository());			//���ô����ʱ�ļ���Ŀ¼
				ServletFileUpload upload = new ServletFileUpload(factory);	//�����µ��ϴ��ļ����
				int maxSize = 5*1024*1024;					//�����ϴ��ļ��Ĵ�С
				List<FileItem> files = upload.parseRequest(request);		//�������еõ������ϴ����б�
				String[] suffixs =new String[]{".exe",".bat",".jsp"};//�����ϴ����ļ�����
				SuffixFileFilter filter = new SuffixFileFilter(suffixs);
				for(FileItem fileItem:files){					//�����ϴ��ļ�����
					if(!fileItem.isFormField())	{				//�������������ļ�������б���Ϣ
						String filePath = fileItem.getName();	//��ȡ�ļ�ȫ·����
						String fileName="";
						int startIndex = filePath.lastIndexOf("\\");
						if(startIndex!=-1){						//���ļ������н�ȡ
							fileName = filePath.substring(startIndex+1);
						}else{
							fileName=filePath;
						}
						if(fileItem.getSize()>maxSize){			//�����ļ���С
							message = "�ϴ��ļ����ó���5MB��";
							break;
						}
						if((fileName == null) ||(fileName.equals(""))&&(fileItem.getSize()==0))
							continue;			
						File file = new File(uploadPath,fileName);		//���ϴ�·�������ļ�����
						boolean res = filter.accept(file);
						if(res){
							message = "��ֹ�ϴ� *.exe��*.jsp��*.bat�ļ���";
							break;
						}else{
							fileItem.write(file);					//���ļ�д����
						}
					}	
				}		
			}
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
		request.setAttribute("result", message);						//����ʾ��Ϣ������request������
		request.getRequestDispatcher("index.jsp").forward(request, response);

	}
	
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
	}

}
