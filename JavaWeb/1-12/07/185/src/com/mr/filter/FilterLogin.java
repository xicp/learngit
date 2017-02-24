package com.mr.filter;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;

public class FilterLogin extends HttpServlet implements Filter {
    private FilterConfig filterConfig;

    public void init(FilterConfig filterConfig) throws ServletException {
        this.filterConfig = filterConfig;
    }
    public void doFilter(ServletRequest request, ServletResponse response,
                         FilterChain filterChain) throws ServletException,
            IOException {
       HttpSession session=((HttpServletRequest)request).getSession();
       response.setCharacterEncoding("gb2312");	//响应客户端类型
       if(session.getAttribute("user")==null){		//判断session中是否有user这个对象
       PrintWriter out=response.getWriter();		//创建一个输出流
       	//如果为空则通过javaScript脚本出输出提示并跳转到index.jsp页面
       out.print("<script language=javascript>alert('您还没有登录！！！');window.location.href='../index.jsp';</script>");
       }else{
    	  filterChain.doFilter(request, response);//否则继续执行
       }
    }
    public void destroy() {
    }
}
