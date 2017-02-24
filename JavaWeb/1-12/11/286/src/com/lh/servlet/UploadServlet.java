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
		String uploadPath=getServletContext().getRealPath("/")+"upload";          //�����ϴ��ļ��ĵ�ַ 
		File folder = new File(uploadPath);
		if(!folder.exists())
			folder.mkdirs();
		String message=null;
		String content=null;
		String dtme=null;
		if(ServletFileUpload.isMultipartContent(request)){  //�ж��Ƿ��ȡ�����ļ�
			DiskFileItemFactory disk=new DiskFileItemFactory();
			disk.setSizeThreshold(20*1024);                 //�����ڴ�ɴ��ֽ���
			disk.setRepository(disk.getRepository());       //������ʱ�ļ�Ŀ¼
			ServletFileUpload up=new ServletFileUpload(disk);
			int maxsize=2*1024*1024;
			List list=null;
			try{
				list=up.parseRequest(request);              //��ȡ�ϴ��б�
			}
			catch(Exception e){
				e.printStackTrace();
			}
			Iterator i=list.iterator();                     //�����б�ĵ�����
			while(i.hasNext()){
				FileItem fm=(FileItem)i.next();             //�����б�
				
				if(!fm.isFormField()){
					String filePath = fm.getName();	//��ȡ�ļ�ȫ·����
					String fileName="";
					int startIndex = filePath.lastIndexOf("\\");
					if(startIndex!=-1){						//���ļ������н�ȡ
						fileName = filePath.substring(startIndex+1);
					}else{
						fileName=filePath;
					}
					if(fm.getSize()>maxsize){
						message="�ļ�̫���ˣ���Ҫ����2MB";
						break;
					}
					String fileSize=new Long(fm.getSize()).toString();
					if((fileName==null)||(fileName.equals(""))&&(fileSize.equals("0"))){
						message="�ļ�������Ϊ�գ��ļ���СҲ����Ϊ�㣡";
						break;
					}
					File saveFile=new File(uploadPath,fileName);
					try{
						fm.write(saveFile);                //���ļ���д������
						message="�ļ��ϴ��ɹ���";
					}
					catch(Exception e1){
						e1.printStackTrace();
					}
				}
				else{
					String foename=fm.getFieldName();     //��ȡ��Ԫ����
					String con=fm.getString("gbk");       //��ȡ�����ݣ�ע����뷽ʽ
					//��Ԫ��
					if(foename.equals("upDe")){
						 content = con;
					}
					else if(foename.equals("uptime")){
						 dtme = con;
					}
				}
			}
		}
		request.setAttribute("result",message);
		request.setAttribute("upDe",content);
		request.setAttribute("dtme",dtme);
		RequestDispatcher rd=request.getRequestDispatcher("message.jsp");
		rd.forward(request, response);
	}
	
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
	}

}
