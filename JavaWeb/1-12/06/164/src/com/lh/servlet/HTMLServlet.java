package com.lh.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HTMLServlet extends HttpServlet {

	public HTMLServlet() {
		super();
	}
	public void destroy() {
		super.destroy(); 
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
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");	//������Ӧ���ַ�����ʽΪUTF-8
		response.setContentType("text/html");	//������Ӧ���ĵ�MIME����
		response.sendRedirect("aa.jsp");
		request.getRequestDispatcher("aa.jsp").forward(request, response);
		PrintWriter out = response.getWriter();	//����һ��PrintWriter����Servletʹ����������ַ�����ʽ����������
		//����Ϊ�����HTML��������
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>��̬���ɵ�HTML�ĵ�</TITLE></HEAD>");
		out.println("  <BODY>");
		out.println("    <table border='0' align='center'>");
		out.println("            <tr><td bgcolor='skyblue'colspan=2>��̬����HTML�ĵ�</td></tr>");
		out.println("     </table>");
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
	}

}
