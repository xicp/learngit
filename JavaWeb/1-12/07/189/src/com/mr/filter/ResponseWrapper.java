
package com.mr.filter;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;


public class ResponseWrapper extends HttpServletResponseWrapper {
    private OutputStream stream;              			// ����һ�������
    private ByteArrayOutputStream byteStream;   			// �����ֽ����������
    private PrintWriter pw;                     			// ������ӡ�����
    public ResponseWrapper(HttpServletResponse response) {
        super(response);
        byteStream = new ByteArrayOutputStream();   		// ��������ʼ��
        stream = new OutputStream(byteStream);
        pw = new PrintWriter(byteStream);
    }
    public ServletOutputStream getOutputStream() throws IOException {
        return stream;      							// �����ֽ�����������¸��෽��
    }
    public PrintWriter getWriter() throws IOException {
        return pw;          							// ���ش�ӡ�������д���෽��
    }
    public String getContent() throws UnsupportedEncodingException {
        return byteStream.toString();    				//������Ӧ����
    }
}