package com.mr.encoding;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class EncodingFilter implements Filter {

	private String Encoding;		//������web.xml����
	private boolean enabled;		//�Ƿ�����Filter


	public void init(FilterConfig config) throws ServletException {

		Encoding = config.getInitParameter("Encoding");//���뷽ʽ
		enabled = "true".equalsIgnoreCase(Encoding.trim()) //���ô�FIlter
				|| "1".equalsIgnoreCase(Encoding.trim());
	}
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		if (enabled || Encoding != null) {//��������˴�Filter
			request.setCharacterEncoding(Encoding);//request�ı���
			response.setCharacterEncoding(Encoding);//response�ı���
		}
		chain.doFilter(request, response);//����ִ����һ��Filter
	}
	public void destroy() {
		Encoding = null;
	}
}
