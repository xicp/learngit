package com.lh.bean;

public class PopDialog {
	private String dialogStr;	//�����Ի���Ĵ���
	private String message;		//��������ʾ��Ϣ
	private String url;			//�ض�������ӵ�ַ
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
		dialogStr +="alert('"+message+"');\r\n\t";			//�����Ի���
		dialogStr +="window.location.href = '"+url+"';\r\n";//ҳ���ض���
		dialogStr += "</script>";
		return dialogStr;
	}
	public void setDialogStr(String dialogStr) {
		this.dialogStr = dialogStr;
	}
}
