package com;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class DownTag extends SimpleTagSupport {

	private String fileName;
	private String fileType;
	private HttpServletResponse response;
	private HttpServletRequest request;
	private String filePath=null; 
	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}
	public void setFileName(String filePath) {
		this.fileName = filePath;
	}	
	public void setFileType(String fileType) {
		this.fileType = fileType;
	}	
	
	public void setResponse(HttpServletResponse response) {
		this.response = response;
	}	
	public void doTag() throws JspException{		
		filePath = request.getRealPath("/");
		response.setHeader("Content-disposition", "attachment; filename=" +	fileName + "." + fileType);
		try {			
			fileName = new String(fileName.getBytes("ISO-8859-1"),"GBK");		
			String convertfilepath = filePath.trim() + "download\\"  + fileName.trim() + "." + fileType.trim();
			File file = new File(convertfilepath.replaceAll("\\\\", "/"));	
			FileInputStream input = new FileInputStream(file);
		
			BufferedInputStream bufferinput = new BufferedInputStream(input);
			ServletOutputStream out = response.getOutputStream();
			BufferedOutputStream bufferoutput = new BufferedOutputStream(response.getOutputStream());
			byte[] temp = new byte[2048];
		
		    int bytesRead;
			while ((bytesRead = (input.read(temp, 0, temp.length))) != -1 ) {
				bufferoutput.write(temp, 0, bytesRead);
				
			}
			bufferoutput.flush();
			if (input != null) {
				input.close();
			}
			if (bufferoutput != null) {
				out.close();
				bufferoutput.close();
			}	
		} catch (Exception e) {		
			e.printStackTrace();
		} 
	}	
}
