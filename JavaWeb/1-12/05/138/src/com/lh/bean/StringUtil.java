package com.lh.bean;

public class StringUtil {
	private String startStr ;	//ָ����ͷ���ַ���
	private String str;			//���жϵ��ַ���
	private boolean check;		//�жϽ��
	public String getStartStr() {
		return startStr;
	}
	public void setStartStr(String startStr) {
		this.startStr = startStr;
	}
	public String getStr() {
		return str;
	}
	public void setStr(String str) {
		this.str = str;
	}
	public boolean isCheck() {
		//ʹ��startsWith�����ж��ַ����Ƿ����ƶ��ַ���ͷ��������򷵻�ture�����򷵻�false
		return str.startsWith(startStr);
	}
}
