package com.lh.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GetPathServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public GetPathServlet() {
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
		String scheme = request.getScheme();			//��ȡ����Э�飨http��
		String serverName = request.getServerName();	//��ȡ���������ƣ�localhost��
		int serverPort = request.getServerPort();		//��ȡ�������˿ں�
		String contextPath = request.getContextPath();	//����WebӦ�õ�URL���
		//������Щ������ϳ�һ��վ��·����http://localhost:8080/149/��
		String path = scheme+"://"+serverName+":"+serverPort+contextPath+"/";
		//getRealPath()��������һ����������·������ʵ·��
		String realPath = this.getServletContext().getRealPath("index.jsp");
		//����HTTP��Ӧ�����ĵ�MIME�����Լ��ַ������ʽ
		request.setAttribute("path", path);				//��Web·����ӵ�request������
		request.setAttribute("realPath", realPath);		//����ʵ·����ӵ�request������
	
		request.getRequestDispatcher("path.jsp").forward(request, response);
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
