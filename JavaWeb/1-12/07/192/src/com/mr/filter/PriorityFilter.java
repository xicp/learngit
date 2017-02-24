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
		                          //从初始化参数 中获取权限配置文件的位置
		String file = config.getInitParameter("file");
		String realPath = config.getServletContext().getRealPath(file);
		try {
			pts.load(new FileInputStream(realPath));
		} catch (Exception e) {
			config.getServletContext().log("读取权限文件错误", e);
		}
	}
	public void doFilter(ServletRequest req, ServletResponse res,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;
		                           //获取访问的路径
		String requestURI = request.getRequestURI().replace(
				request.getContextPath() + "/", "");
		                           //获取 action的参数
		String action = req.getParameter("action");
		action = action == null ? "" : action;
		                           // 组合成新的 URI
		String uri = requestURI + "?action=" + action;
		                           //在session中获取用户权限
		String role = (String) request.getSession(true).getAttribute("role");
		role = role == null ? "guest" : role;
		boolean authentificated = false;
		                           //审核用户是否有权限登录访问
		for (Object obj : pts.keySet()) {
			String key = ((String) obj);
			                       //使用正则表达式验证 需要将 ? . 替换一下，并将通配符 * 处理一下
			if (uri.matches(key.replace("?", "\\?").replace(".", "\\.")
					.replace("*", ".*"))) {
				                   //如果role角色匹配
				if (role.equals(pts.get(key))) {
					authentificated = true;
					break;
				}
			}
		}
		if (!authentificated) {
			throw new RuntimeException(new LoginException(
					"您无权访问该页面。请以合适的身份登录后查看。"));
		}
		                            //下一个过滤器或者Servlet
		chain.doFilter(req, res);
	}
	public void destroy() {
		pts = null;
	}
}
