
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
        ((HttpServletResponse) response).setHeader("Cache-Control", "no-cache");    //HTTP��Ϣͷ��������ҳ�Ļ���
        ((HttpServletResponse) response).setHeader("Pragma", "no-cache");   //��ֹ������ӱ��ػ��Ļ����е���ҳ������
        ((HttpServletResponse) response).setHeader("Expires", "-1");    //ָ����ҳ�ڻ����еĹ���ʱ��
        filterchain.doFilter(request, response);
    }
    public void destroy() {
    }
}
