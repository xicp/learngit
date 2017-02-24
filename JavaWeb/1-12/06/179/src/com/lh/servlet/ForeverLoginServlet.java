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
		request.setCharacterEncoding("UTF-8");	//设置请求编码格式
		response.setCharacterEncoding("UTF-8");	//设置响应编码格式
		String action = request.getParameter("action");//获得action参数，主要判断是登录还是注销
		if("login".equals(action)){
			this.login(request, response);		//调用login方法
		}else if("logout".equals(action)){
			this.logout(request, response);		//调用logout方法
		}
	}
	/**
	 * 该方法处理用户登录
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void login(HttpServletRequest request,HttpServletResponse response)
			throws ServletException, IOException{
		String account = request.getParameter("account");	//获得账号
		String pwd = request.getParameter("pwd");			//获得密码
		int timeout= Integer.parseInt(request.getParameter("timeout"));//获得登录保存时间的期限
		String md5Account = MakeMD5.getMD5(account);		//将账号加密
		account = URLEncoder.encode(account,"UTF-8");		//如果账号是中文，需要转换Unicode才能保存在Cookie中
		Cookie accountCookie = new Cookie("account",account);//将账号保存在Cookie中
		accountCookie.setMaxAge(timeout);					//设置账号Cookie的最大保存时间
		Cookie md5AccountCookie = new Cookie("md5Account",md5Account);//将加密后的账号保存在Cookie中
		md5AccountCookie.setMaxAge(timeout);				//设置加密后的账号最大保存时间
		response.addCookie(accountCookie);					//写到客户端的Cookie中
		response.addCookie(md5AccountCookie);				//写到客户端的Cookie中
		try {
			Thread.sleep(1000);								//将此线程暂停1秒后继续执行
		} catch (InterruptedException e) {	
			e.printStackTrace();
		}
		//将页面重定向到用户登录页
		response.sendRedirect("index.jsp?"+System.currentTimeMillis());
	}
	/**
	 * 该方法处理用户注销
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void logout(HttpServletRequest request,HttpServletResponse response)
			throws ServletException, IOException{
		Cookie accountCookie = new Cookie("account","");	//创建一个空的Cookie
		accountCookie.setMaxAge(0);							//设置此Cookie保存时间为0
		Cookie md5AccountCookie = new Cookie("md5Account","");//创建一个空的Cookie
		md5AccountCookie.setMaxAge(0);						//设置此Cookie保存时间为0
		response.addCookie(accountCookie);		//写到客户端Cookie中，将覆盖名为account的Cookie
		response.addCookie(md5AccountCookie);	//写到客户端Cookie中，将覆盖名为md5AccountCookie的Cookie
		try {
			Thread.sleep(1000);					//将此线程暂停1秒后继续执行
		} catch (InterruptedException e) {	
			e.printStackTrace();
		}
		//将页面重定向到用户登录页
		response.sendRedirect("index.jsp?"+System.currentTimeMillis());
	}

	public void init() throws ServletException {
		
	}

}
