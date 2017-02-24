package com.mr.encoding;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class EncodingFilter implements Filter {

	private String Encoding;		//在醒置web.xml编码
	private boolean enabled;		//是否启用Filter


	public void init(FilterConfig config) throws ServletException {

		Encoding = config.getInitParameter("Encoding");//编码方式
		enabled = "true".equalsIgnoreCase(Encoding.trim()) //启用此FIlter
				|| "1".equalsIgnoreCase(Encoding.trim());
	}
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		if (enabled || Encoding != null) {//如果启用了此Filter
			request.setCharacterEncoding(Encoding);//request的编码
			response.setCharacterEncoding(Encoding);//response的编码
		}
		chain.doFilter(request, response);//继续执行下一个Filter
	}
	public void destroy() {
		Encoding = null;
	}
}
