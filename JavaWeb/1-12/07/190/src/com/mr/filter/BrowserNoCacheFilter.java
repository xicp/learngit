
package com.mr.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;


public class BrowserNoCacheFilter implements Filter {

    public void init(FilterConfig filterconfig) throws ServletException {
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterchain) throws IOException, ServletException {
        ((HttpServletResponse) response).setHeader("Cache-Control", "no-cache");    //HTTP消息头，控制网页的缓存
        ((HttpServletResponse) response).setHeader("Pragma", "no-cache");   //禁止浏览器从本地机的缓存中调阅页面内容
        ((HttpServletResponse) response).setHeader("Expires", "-1");    //指定网页在缓存中的过期时间
        filterchain.doFilter(request, response);
    }
    public void destroy() {
    }
}
