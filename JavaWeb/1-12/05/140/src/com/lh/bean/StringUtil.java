package com.lh.bean;

public class StringUtil {
	private String  str;		//Ҫ�����ַ���
	private boolean hasNum;		//�Ƿ��������
	private String othersStr;	//ȥ�����ֺ���ַ���
	public String getOthersStr() {
		return othersStr;
	}
	public void setOthersStr(String othersStr) {
		this.othersStr = othersStr;
	}
	public String getStr() {
		return str;
	}
	public void setStr(String str) {
		this.str = str;
	}
	public boolean isHasNum() {
		char cArr[] = str.toCharArray();//���ַ���ת��Ϊ�ַ�����
		StringBuffer sbNum =new StringBuffer("");
		StringBuffer sbOthers =new StringBuffer("");
		for(int i=0;i<cArr.length;i++){
			//����String���hashCode()����Ҳ�ܻ���ַ���ASCII��
			//int ascii = String.valueOf(cArr[i]).hashCode();
			int ascii = (int)cArr[i];//ǿ��ת������ֱ�ӵõ��ַ���ASCII��
			//���ֵ� ASCII�뷶Χ��48-57֮��
			if(ascii>=48&&ascii<=57){
				sbNum.append(cArr[i]);//��ÿ��������ӵ�StringBuffer������
			}
			else{
				sbOthers.append(cArr[i]);
			}
		}
		this.setOthersStr(sbOthers.toString());
		if(!sbNum.toString().equals(""))
			hasNum=true;
		else
			hasNum=false;
		return hasNum;
	}
	public void setHasNum(boolean hasNum) {
		this.hasNum = hasNum;
	}
}
