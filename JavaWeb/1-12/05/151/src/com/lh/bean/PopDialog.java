package com.lh.bean;

public class PopDialog {
	private String dialogStr;	//弹出对话框的代码
	private String message;		//弹出的提示消息
	private String url;			//重定向的链接地址
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getDialogStr() {
		dialogStr = "<script language ='javascript'>\r\n\t";
		dialogStr +="alert('"+message+"');\r\n\t";			//弹出对话框
		dialogStr +="window.location.href = '"+url+"';\r\n";//页面重定向
		dialogStr += "</script>";
		return dialogStr;
	}
	public void setDialogStr(String dialogStr) {
		this.dialogStr = dialogStr;
	}
}
