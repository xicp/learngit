package com.lh.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class CounterServlet extends HttpServlet {
	/**
	 * Constructor of the object.
	 */
	public CounterServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//���ServletContext����
		ServletContext context = getServletContext();
		//��ServletContext�л�ü���������
		Integer count = (Integer)context.getAttribute("counter");
		if(count==null){//���Ϊ�գ�����ServletContext������һ��������������
			count=1;
			context.setAttribute("counter", count);
		}else{			//�����Ϊ�գ������øü�����������ֵ��1
			context.setAttribute("counter", count+1);
		}
		response.setContentType("text/html");	//��Ӧ���ĵ�MIME����
		response.setCharacterEncoding("UTF-8");	//��Ӧ�ı����ʽ
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>ͳ����վ���ʴ���</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    <h2><font color='gray'> ");
		out.print("���ǵ�  "+context.getAttribute("counter")+" λ�ÿͣ�");
		out.println("</font></h2>");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		
		out.close();
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
