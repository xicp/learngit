
package com.mr.filter;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import javax.servlet.ServletOutputStream;


public class OutputStream extends ServletOutputStream {
    ByteArrayOutputStream stream;       // 创建字节数组输出流
    public OutputStream(ByteArrayOutputStream stream) {
        this.stream = stream;           // 构造方法初始化输出流
    }
    public void write(int b) throws IOException {
        stream.write(b);                // 使用此类的输出流替换父类的输出方法
    }
}

