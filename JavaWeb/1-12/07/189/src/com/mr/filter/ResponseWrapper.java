
package com.mr.filter;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;


public class ResponseWrapper extends HttpServletResponseWrapper {
    private OutputStream stream;              			// 声明一个输出流
    private ByteArrayOutputStream byteStream;   			// 声明字节数组输出流
    private PrintWriter pw;                     			// 声明打印输出流
    public ResponseWrapper(HttpServletResponse response) {
        super(response);
        byteStream = new ByteArrayOutputStream();   		// 数据流初始化
        stream = new OutputStream(byteStream);
        pw = new PrintWriter(byteStream);
    }
    public ServletOutputStream getOutputStream() throws IOException {
        return stream;      							// 返回字节输出流并重新父类方法
    }
    public PrintWriter getWriter() throws IOException {
        return pw;          							// 返回打印输出流重写分类方法
    }
    public String getContent() throws UnsupportedEncodingException {
        return byteStream.toString();    				//返回响应数据
    }
}
