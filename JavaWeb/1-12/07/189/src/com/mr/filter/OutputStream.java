
package com.mr.filter;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import javax.servlet.ServletOutputStream;


public class OutputStream extends ServletOutputStream {
    ByteArrayOutputStream stream;       // �����ֽ����������
    public OutputStream(ByteArrayOutputStream stream) {
        this.stream = stream;           // ���췽����ʼ�������
    }
    public void write(int b) throws IOException {
        stream.write(b);                // ʹ�ô����������滻������������
    }
}

