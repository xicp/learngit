package com.mr.filter;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import javax.servlet.ServletOutputStream;

public class OutputStream extends ServletOutputStream {

    ByteArrayOutputStream ostream;   // �����ֽ����������

    public OutputStream(ByteArrayOutputStream ostream) {
        this.ostream = ostream;       // ���췽���г�ʼ�������
    }
    public void write(int b) throws IOException {
        ostream.write(b);            // ʹ�ô���������滻������������
    }
}

