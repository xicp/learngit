package com.mr.listener;

import javax.servlet.ServletRequest;
import javax.servlet.ServletRequestAttributeEvent;
import javax.servlet.ServletRequestAttributeListener;
import javax.servlet.ServletRequestEvent;
import javax.servlet.ServletRequestListener;
import javax.servlet.http.HttpServlet;

public class LoginListener extends HttpServlet implements
		ServletRequestListener, ServletRequestAttributeListener {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void requestInitialized(ServletRequestEvent sre) {
		System.out.println("己经初始化");
		ServletRequest sr = sre.getServletRequest();
		System.out.println("远程访问机器的IP:" + sr.getRemoteAddr());
		System.out.println("本地访问机器的IP:" + sr.getLocalAddr());
		if (sr.getRemoteHost().equals(sr.getLocalAddr())) {
			sr.setAttribute("login", "true");
		} else {
			sr.setAttribute("login", "false");
		}
	}

	public void requestDestroyed(ServletRequestEvent sre) {
		System.out.println("正在销毁");
	}

	public void attributeAdded(ServletRequestAttributeEvent srae) {
		System.out.print("request范围内接收时 ---");
		System.out.println(srae.getName() + "=" + srae.getValue());
	}

	public void attributeRemoved(ServletRequestAttributeEvent srae) {
		System.out.print("request范围内取代另一个对象时  ---");
		System.out.println(srae.getName() + "=" + srae.getValue());
	}

	public void attributeReplaced(ServletRequestAttributeEvent srae) {
		System.out.print("request范围内移除时 ---");
		System.out.println(srae.getName() + "=" + srae.getValue());
	}

}
