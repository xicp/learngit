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
		System.out.println("������ʼ��");
		ServletRequest sr = sre.getServletRequest();
		System.out.println("Զ�̷��ʻ�����IP:" + sr.getRemoteAddr());
		System.out.println("���ط��ʻ�����IP:" + sr.getLocalAddr());
		if (sr.getRemoteHost().equals(sr.getLocalAddr())) {
			sr.setAttribute("login", "true");
		} else {
			sr.setAttribute("login", "false");
		}
	}

	public void requestDestroyed(ServletRequestEvent sre) {
		System.out.println("��������");
	}

	public void attributeAdded(ServletRequestAttributeEvent srae) {
		System.out.print("request��Χ�ڽ���ʱ ---");
		System.out.println(srae.getName() + "=" + srae.getValue());
	}

	public void attributeRemoved(ServletRequestAttributeEvent srae) {
		System.out.print("request��Χ��ȡ����һ������ʱ  ---");
		System.out.println(srae.getName() + "=" + srae.getValue());
	}

	public void attributeReplaced(ServletRequestAttributeEvent srae) {
		System.out.print("request��Χ���Ƴ�ʱ ---");
		System.out.println(srae.getName() + "=" + srae.getValue());
	}

}
