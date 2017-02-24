package com.mr.filter;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import javax.servlet.ServletOutputStream;

public class OutputStream extends ServletOutputStream {

    ByteArrayOutputStream ostream;   // 创建字节数组输出流

    public OutputStream(ByteArrayOutputStream ostream) {
        this.ostream = ostream;       // 构造方法中初始化输出流
    }
    public void write(int b) throws IOException {
        ostream.write(b);            // 使用此类输出流替换父类的输出方法
    }
}

