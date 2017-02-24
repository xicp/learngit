package com.mr.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ImageFilter implements Filter {

	public void init(FilterConfig config) throws ServletException {
	}
	public void doFilter(ServletRequest req, ServletResponse res,
			FilterChain chain) throws IOException, ServletException {
		
		HttpServletRequest request = (HttpServletRequest) req;	//request����
		HttpServletResponse response = (HttpServletResponse) res;//response����
		String imurl = request.getHeader("imurl");    //���ӵ���Դ��ַ
		if (imurl == null || !imurl.contains(request.getServerName())) {//�жϷ�����Դ
			request.getRequestDispatcher("/errorimage.gif").forward(request,//��ʾ����ͼƬ
					response);
		} else {
			chain.doFilter(req, res); //������ʾͼƬ
		}
	}
	public void destroy() {
	}
}
