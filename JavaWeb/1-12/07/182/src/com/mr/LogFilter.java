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

		filterName = config.getFilterName();//获取 Filter的 name，启动Filter
		log.info("启动 Filter: " + filterName);//
	}
	public void doFilter(ServletRequest req, ServletResponse res,
			FilterChain chain) throws IOException, ServletException {

		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) res;

		long startTime = System.currentTimeMillis();//运行前的时间
		String requestURI = request.getRequestURI();//获取访问的URI

		requestURI = request.getQueryString() == null ? requestURI//所有的地址栏参数对比
				: (requestURI + "?" + request.getQueryString());

		chain.doFilter(request, response);

		long endTime = System.currentTimeMillis();
													//消耗的总时间
		log.info(request.getRemoteAddr() + " 访问了 " + requestURI + ", 总用时 "
				+ (endTime - startTime) + " 毫秒。");
	}
	public void destroy() {						 //销毁时记录日志
	}
}
