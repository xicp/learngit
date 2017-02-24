package com.lh.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lh.dao.UserDao;

public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;  
    public UserServlet() {
        super();
       
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType( "text/xml;charset=UTF-8" );//������Ӧ��ʽΪtest/xml
		//��ֹ����
		response.addHeader( "Cache-Control", "no-store,no-cache,must-revalidate" );
		response.addHeader( "Cache-Control", "post-check=0,pre-check=0" );
		response.addHeader( "Expires", "0" );
		response.addHeader( "Pragma", "no-cache" );
		PrintWriter out = response.getWriter();
		out.println( "<?xml version=\"1.0\" encoding=\"utf-8\"?>" );
		out.println( "<userName>" );
		String name = request.getParameter( "name" );	//��ȡ�û���
		name= java.net.URLDecoder.decode(name,"UTF-8");	//����UTF-8���ַ�������
		boolean result=UserDao.getInstance().checkUserName(name.trim());//�������ݿ��Ƿ���ڸ��û���
		if(!result) 
			out.println("<noIterance id=\"ok\"/>");
		else
			out.println("<iterance>"+name+"</iterance>");
		out.println( "</userName>" );
		out.close();
	}
	
}
