package com.mr.filter;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import com.mr.exception.LoginException;

public class PriorityFilter implements Filter {

	private Properties pts = new Properties();

	public void init(FilterConfig config) throws ServletException {
		                          //�ӳ�ʼ������ �л�ȡȨ�������ļ���λ��
		String file = config.getInitParameter("file");
		String realPath = config.getServletContext().getRealPath(file);
		try {
			pts.load(new FileInputStream(realPath));
		} catch (Exception e) {
			config.getServletContext().log("��ȡȨ���ļ�����", e);
		}
	}
	public void doFilter(ServletRequest req, ServletResponse res,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;
		                           //��ȡ���ʵ�·��
		String requestURI = request.getRequestURI().replace(
				request.getContextPath() + "/", "");
		                           //��ȡ action�Ĳ���
		String action = req.getParameter("action");
		action = action == null ? "" : action;
		                           // ��ϳ��µ� URI
		String uri = requestURI + "?action=" + action;
		                           //��session�л�ȡ�û�Ȩ��
		String role = (String) request.getSession(true).getAttribute("role");
		role = role == null ? "guest" : role;
		boolean authentificated = false;
		                           //����û��Ƿ���Ȩ�޵�¼����
		for (Object obj : pts.keySet()) {
			String key = ((String) obj);
			                       //ʹ��������ʽ��֤ ��Ҫ�� ? . �滻һ�£�����ͨ��� * ����һ��
			if (uri.matches(key.replace("?", "\\?").replace(".", "\\.")
					.replace("*", ".*"))) {
				                   //���role��ɫƥ��
				if (role.equals(pts.get(key))) {
					authentificated = true;
					break;
				}
			}
		}
		if (!authentificated) {
			throw new RuntimeException(new LoginException(
					"����Ȩ���ʸ�ҳ�档���Ժ��ʵ���ݵ�¼��鿴��"));
		}
		                            //��һ������������Servlet
		chain.doFilter(req, res);
	}
	public void destroy() {
		pts = null;
	}
}
