package com.mr;
import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class firstFilter implements Filter {
	
	private FilterConfig filterConfig;
							//初始化方法
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		this.filterConfig = filterConfig;
		
	}
			//具体执行的方法
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain filterChain) throws IOException{
		// TODO Auto-generated method stub
		
		try {
			System.out.println("客户端的请求经过这里！！！！");
			filterChain.doFilter(request, response);
			System.out.println("帐号和密码请求处理经过这里");
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			System.out.println("客户端请求失败");
		}catch(IOException io){
			System.out.println("帐号和密码请失败");
		}
	}
				//销毁过滤器
	public void destroy() {
		// TODO Auto-generated method stub
		this.filterConfig=null;
	}
}
