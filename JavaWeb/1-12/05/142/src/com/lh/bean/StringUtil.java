package com.lh.bean;

import java.util.Calendar;
import java.util.Date;

public class StringUtil {
	private String numStr;	//Ҫ�жϵ��ַ���
	private boolean number;	//�жϽ��
	private String cue ;	//��ʾ��Ϣ
	public String getCue() {
		return cue;
	}
	public void setCue(String cue) {
		this.cue = cue;
	}
	public String getNumStr() {
		return numStr;
	}
	public void setNumStr(String numStr) {
		numStr= numStr.replaceAll(" ", "");		//ȥ���ַ����еĿո�
		this.numStr = numStr;
	}
	public boolean isNumber() {
		char cArr[]= numStr.toCharArray();		//���ַ���ת��Ϊ�ַ�����
		StringBuffer sb = new StringBuffer("");	//������̬�ַ�������
		for(int i=0;i<cArr.length;i++){
			int ascii = (int)cArr[i];			//���ַ�ǿ��ת��Ϊintֵ����ֵΪ�ַ���ASCII��
			if(ascii>=48&&ascii<=57){			//����0-9��ASCII�뷶Χ��48-57֮��
				sb.append(cArr[i]);				//�������㣬���ַ������StringBuffer�ַ���ĩβ
			}
		}
		if(sb.length()==cArr.length){			//���StringBuffer�ַ����ĳ��ȵ����ַ�����ĳ���
			number=true;						//���ַ���Ϊ����
			this.setCue("������������֣�");
		}
		else{
			number=false;
			this.setCue("������Ĳ������֣�");
		}
		return number;
	}
	public void setNumber(boolean number) {
		this.number = number;
	}
}
