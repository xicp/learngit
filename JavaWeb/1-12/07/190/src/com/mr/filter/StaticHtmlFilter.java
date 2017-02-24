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

    private boolean variable = true;               //����һ������variableʱ��ÿ�ζ�����HTML��ҳ
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
        strs = path.substring(1);                             //��ȡ�ļ���

                                                              //���������Ӧ�����
        ResponseWrapper responseWrapper = new ResponseWrapper(httpRes);
        chain.doFilter(request, responseWrapper);             // ��ɹ��˵Ĳ���
        responseWrapper.getWriter().flush();

        int len = strs.length();                              //��ȡ�ļ�������
        String str = strs.substring(0, len - 4) + ".html";    //���徲̬ҳ�ļ�������
        String jspPath = request.getRealPath(str);            //��ȡ�ļ�����ʵ�洢·��
        File jspFile = new File(jspPath);                     //����ҳ���ļ�����
        String static_path = jspFile.getParent() + "\\";      //���徲̬ҳ�ļ��洢��λ��
        File htmlFile = new File(static_path, str);           //������̬ҳ�ļ�����
        Date htmlDate = null;
        Date now = new Date();

        if (htmlFile.exists()) {
            htmlDate = new Date(htmlFile.lastModified());
        } else {
            htmlFile.createNewFile();
        }
                                               //��������ɵ�HTML�ļ����ǵ�ǰ�ģ�����������һ��
        if (variable || htmlDate == null || htmlDate.getDate() != now.getDate()) {
                                               //����HTML�ļ��������
            FileOutputStream fileStream = new FileOutputStream(htmlFile);
                                               //�������������
            DataOutputStream fout = new DataOutputStream(fileStream);
                                               //�������ڸ�ʽ��
            DateFormat dateFormat = DateFormat.getDateTimeInstance(FULL, FULL);
            fout.writeChars(" ");              //���һ�����ַ�
                                               //ʹ��UTF��ʽ���ע����Ϣ����עhtml�ĵ������¼�
            fout.writeUTF("����ʱ�䣺" + dateFormat.format(new Date()));
                                               //ʹ��UTF��ʽ���HTML���ݣ����浽html�ļ���
            fout.writeUTF(responseWrapper.getContent());
            fout.close();
        }
                                        // ������켺�����ɹ��˵�html�ļ���ֱ�Ӱ�����ת����html�ļ���
        System.out.println("/"+str+"");
        request.getRequestDispatcher("/"+str+"").forward(request,response);
    }
    public void destroy() {
    }
    public void log(String msg) {
        filterConfig.getServletContext().log(msg);
    }
}
