package com.lh.bean;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class StringUtil {
	private String name;	//�û���
	private String pwd ;	//����
	private String cue;		//HTML��ʾ��Ϣ
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getCue() {
		//����û���������Ϊnull��""
		if((name==null||name.equals(""))||(pwd==null||pwd.equals(""))){
			cue= "�������û��������룡";
		}else{//����û��������벻Ϊ��
			if(name.equals("mr")&&pwd.equals("123")){
				cue= "��¼�ɹ���";
			}else{
				cue= "��¼ʧ�ܣ� <b>�û���</b>��<b>����</b>����ȷ��";
			}
		}
		return cue;
	}
	public void setCue(String cue) {
		this.cue = cue;
	}
}
