package com.lh.bean;

public class StringUtil {
	private String str;		//Ҫ�жϵ��ַ���
	private boolean hasEn;	//�Ƿ����Ӣ���ַ�
	private String cnStr;	//ȥ��Ӣ����ĸ����ַ���
	public String getCnStr() {
		return cnStr;
	}
	public void setCnStr(String cnStr) {
		this.cnStr = cnStr;
	}
	public String getStr() {
		return str;
	}
	public void setStr(String str) {
		this.str = str;
	}
	public boolean isHasEn() {
		char cArr[] = str.toCharArray();//���ַ���ת��Ϊ�ַ�����
		StringBuffer sb =new StringBuffer("");
		StringBuffer sb2 =new StringBuffer("");
		for(int i=0;i<cArr.length;i++){
			//����String���hashCode()����Ҳ�ܻ���ַ���ASCII��
			//int ascii = String.valueOf(cArr[i]).hashCode();
			int ascii = (int)cArr[i];//ǿ��ת������ֱ�ӵõ��ַ���ASCII��
			//Ӣ���ַ��� ASCII�뷶Χ����д��ĸA-Z�ķ�Χ65-90��Сд��ĸa-z�ķ�Χ97-122
			if((ascii>=65&&ascii<=90)||(ascii>=97&&ascii<=122)){
				sb.append(cArr[i]);//��ÿ��Ӣ����ĸ��ӵ�StringBuffer������
			}
			else{
				sb2.append(cArr[i]);
			}
		}
		this.setCnStr(sb2.toString());
		if(!sb.toString().equals(""))//�������Ӣ����ĸ���ַ�����Ϊ""��˵�����ַ�������Ӣ����ĸ
			hasEn=true;
		else
			hasEn=false;
		return hasEn;
	}
	public void setHasEn(boolean hasEn) {
		this.hasEn = hasEn;
	}
	
}
