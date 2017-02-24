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
		
		HttpServletRequest request = (HttpServletRequest) req;	//request对象
		HttpServletResponse response = (HttpServletResponse) res;//response对象
		String imurl = request.getHeader("imurl");    //链接的来源地址
		if (imurl == null || !imurl.contains(request.getServerName())) {//判断访问来源
			request.getRequestDispatcher("/errorimage.gif").forward(request,//显示错误图片
					response);
		} else {
			chain.doFilter(req, res); //正常显示图片
		}
	}
	public void destroy() {
	}
}
