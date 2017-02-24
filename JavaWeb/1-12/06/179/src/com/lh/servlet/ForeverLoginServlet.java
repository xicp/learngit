package com.lh.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lh.util.MakeMD5;

public class ForeverLoginServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ForeverLoginServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");	//������������ʽ
		response.setCharacterEncoding("UTF-8");	//������Ӧ�����ʽ
		String action = request.getParameter("action");//���action��������Ҫ�ж��ǵ�¼����ע��
		if("login".equals(action)){
			this.login(request, response);		//����login����
		}else if("logout".equals(action)){
			this.logout(request, response);		//����logout����
		}
	}
	/**
	 * �÷��������û���¼
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void login(HttpServletRequest request,HttpServletResponse response)
			throws ServletException, IOException{
		String account = request.getParameter("account");	//����˺�
		String pwd = request.getParameter("pwd");			//�������
		int timeout= Integer.parseInt(request.getParameter("timeout"));//��õ�¼����ʱ�������
		String md5Account = MakeMD5.getMD5(account);		//���˺ż���
		account = URLEncoder.encode(account,"UTF-8");		//����˺������ģ���Ҫת��Unicode���ܱ�����Cookie��
		Cookie accountCookie = new Cookie("account",account);//���˺ű�����Cookie��
		accountCookie.setMaxAge(timeout);					//�����˺�Cookie����󱣴�ʱ��
		Cookie md5AccountCookie = new Cookie("md5Account",md5Account);//�����ܺ���˺ű�����Cookie��
		md5AccountCookie.setMaxAge(timeout);				//���ü��ܺ���˺���󱣴�ʱ��
		response.addCookie(accountCookie);					//д���ͻ��˵�Cookie��
		response.addCookie(md5AccountCookie);				//д���ͻ��˵�Cookie��
		try {
			Thread.sleep(1000);								//�����߳���ͣ1������ִ��
		} catch (InterruptedException e) {	
			e.printStackTrace();
		}
		//��ҳ���ض����û���¼ҳ
		response.sendRedirect("index.jsp?"+System.currentTimeMillis());
	}
	/**
	 * �÷��������û�ע��
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void logout(HttpServletRequest request,HttpServletResponse response)
			throws ServletException, IOException{
		Cookie accountCookie = new Cookie("account","");	//����һ���յ�Cookie
		accountCookie.setMaxAge(0);							//���ô�Cookie����ʱ��Ϊ0
		Cookie md5AccountCookie = new Cookie("md5Account","");//����һ���յ�Cookie
		md5AccountCookie.setMaxAge(0);						//���ô�Cookie����ʱ��Ϊ0
		response.addCookie(accountCookie);		//д���ͻ���Cookie�У���������Ϊaccount��Cookie
		response.addCookie(md5AccountCookie);	//д���ͻ���Cookie�У���������Ϊmd5AccountCookie��Cookie
		try {
			Thread.sleep(1000);					//�����߳���ͣ1������ִ��
		} catch (InterruptedException e) {	
			e.printStackTrace();
		}
		//��ҳ���ض����û���¼ҳ
		response.sendRedirect("index.jsp?"+System.currentTimeMillis());
	}

	public void init() throws ServletException {
		
	}

}
