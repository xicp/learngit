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
				FileInputStream in = new FileInputStream(new File(fileName));//创建输入流完成读取文件
				BufferedInputStream bufferin = new BufferedInputStream(in);//创建缓冲输入的流参数为上面定的in
				OutputStream out  = response.getOutputStream();		//向客户端输出流
				BufferedOutputStream bufferout = new BufferedOutputStream(out);//创建缓 冲输出流参数为out
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
