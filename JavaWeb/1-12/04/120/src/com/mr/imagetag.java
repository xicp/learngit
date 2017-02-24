package com.mr;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class imagetag extends SimpleTagSupport {
		private String fileName;
		private HttpServletResponse response;
		public void setFileName(String fileName) {
			this.fileName = fileName;
		}
		public void setResponse(HttpServletResponse response) {
			this.response = response;
		}
		public void doTag(){		
			try {
				FileInputStream in = new FileInputStream(new File(fileName));//������������ɶ�ȡ�ļ�
				BufferedInputStream bufferin = new BufferedInputStream(in);//�������������������Ϊ���涨��in
				OutputStream out  = response.getOutputStream();		//��ͻ��������
				BufferedOutputStream bufferout = new BufferedOutputStream(out);//������ �����������Ϊout
				byte b[] = new byte[1024*5];     
				for(int i =bufferin.read(b);i!=-1;){
					bufferout.write(b);
					bufferin.read(b);  
				}
				bufferout.flush();
				bufferout.close();
				bufferin.close();
				out.close();
				in.close();		
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
		}	
	}	
}
