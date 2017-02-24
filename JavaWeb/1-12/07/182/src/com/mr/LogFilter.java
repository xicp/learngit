package com.mr;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class LogFilter implements Filter {

	private Log log = LogFactory.getLog(this.getClass());

	private String filterName;

	public void init(FilterConfig config) throws ServletException {

		filterName = config.getFilterName();//��ȡ Filter�� name������Filter
		log.info("���� Filter: " + filterName);//
	}
	public void doFilter(ServletRequest req, ServletResponse res,
			FilterChain chain) throws IOException, ServletException {

		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) res;

		long startTime = System.currentTimeMillis();//����ǰ��ʱ��
		String requestURI = request.getRequestURI();//��ȡ���ʵ�URI

		requestURI = request.getQueryString() == null ? requestURI//���еĵ�ַ�������Ա�
				: (requestURI + "?" + request.getQueryString());

		chain.doFilter(request, response);

		long endTime = System.currentTimeMillis();
													//���ĵ���ʱ��
		log.info(request.getRemoteAddr() + " ������ " + requestURI + ", ����ʱ "
				+ (endTime - startTime) + " ���롣");
	}
	public void destroy() {						 //����ʱ��¼��־
	}
}
