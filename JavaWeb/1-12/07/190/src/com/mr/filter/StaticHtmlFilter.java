package com.mr.filter;

import static java.text.DateFormat.FULL;

import java.io.DataOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.DateFormat;
import java.util.Date;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class StaticHtmlFilter implements Filter {

    private boolean variable = true;               //定义一个变量variable时，每次都生成HTML首页
    String strs = "";
    private FilterConfig filterConfig = null;

    public void init(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
    }

    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
        HttpServletResponse httpRes = (HttpServletResponse) response;
        String path = ((HttpServletRequest) request).getServletPath();
        strs = path.substring(1);                             //获取文件名

                                                              //创建定义的应答对象
        ResponseWrapper responseWrapper = new ResponseWrapper(httpRes);
        chain.doFilter(request, responseWrapper);             // 完成过滤的操作
        responseWrapper.getWriter().flush();

        int len = strs.length();                              //获取文件名长度
        String str = strs.substring(0, len - 4) + ".html";    //定义静态页文件的名称
        String jspPath = request.getRealPath(str);            //获取文件的真实存储路径
        File jspFile = new File(jspPath);                     //创建页面文件对象
        String static_path = jspFile.getParent() + "\\";      //定义静态页文件存储的位置
        File htmlFile = new File(static_path, str);           //创建静态页文件对象
        Date htmlDate = null;
        Date now = new Date();

        if (htmlFile.exists()) {
            htmlDate = new Date(htmlFile.lastModified());
        } else {
            htmlFile.createNewFile();
        }
                                               //如果已生成的HTML文件不是当前的，就重新生成一个
        if (variable || htmlDate == null || htmlDate.getDate() != now.getDate()) {
                                               //创建HTML文件的输出流
            FileOutputStream fileStream = new FileOutputStream(htmlFile);
                                               //创建数据输出流
            DataOutputStream fout = new DataOutputStream(fileStream);
                                               //创建日期格式器
            DateFormat dateFormat = DateFormat.getDateTimeInstance(FULL, FULL);
            fout.writeChars(" ");              //输出一个空字符
                                               //使用UTF格式输出注释信息，标注html文档生成事件
            fout.writeUTF("生成时间：" + dateFormat.format(new Date()));
                                               //使用UTF格式输出HTML内容，保存到html文件中
            fout.writeUTF(responseWrapper.getContent());
            fout.close();
        }
                                        // 如果当天己经生成过了的html文件，直接把请求转发给html文件。
        System.out.println("/"+str+"");
        request.getRequestDispatcher("/"+str+"").forward(request,response);
    }
    public void destroy() {
    }
    public void log(String msg) {
        filterConfig.getServletContext().log(msg);
    }
}
