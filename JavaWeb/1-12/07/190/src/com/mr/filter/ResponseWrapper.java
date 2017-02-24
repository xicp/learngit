package com.mr.filter;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;

public class ResponseWrapper extends HttpServletResponseWrapper {

    private OutputStream ostream;              			//自定义输出流
    private ByteArrayOutputStream byteStream;   		//字节数组输出流
    private PrintWriter pw;                     		//打印输出流

    public ResponseWrapper(HttpServletResponse response) {
        super(response);
        byteStream = new ByteArrayOutputStream();   	//数据流初始化
        ostream = new OutputStream(byteStream);
        pw = new PrintWriter(byteStream);
    }
    public ServletOutputStream getOutputStream() throws IOException {
        return ostream;      							//返回字节输出流并重新父类方法
    }
    public PrintWriter getWriter() throws IOException {
        return pw;          							//返回打印输出流重写分类方法
    }
    public String getContent() throws UnsupportedEncodingException {
        return byteStream.toString();    				//自定义方法返回响应的数据
    }
}
