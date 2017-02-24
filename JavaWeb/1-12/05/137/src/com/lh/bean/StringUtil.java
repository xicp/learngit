package com.lh.bean;

public class StringUtil {
	private String sourceStr;								//Դ�ַ���			
	private String shortPhonetic="";						//��ú��ֵ�ƴ�������ַ���	
	public String getSourceStr() {
		return sourceStr;
	}
	public void setSourceStr(String sourceStr) {
		this.sourceStr = sourceStr;
	}
	public String getShortPhonetic() {
		char cArr[] = sourceStr.toCharArray();				//���ַ���ת��Ϊ����
		byte b[] ;								
		String sp = "";										//�ñ���������ѭ���б��浥���ֵ�ƴ������ĸ
		for(int i=0;i<cArr.length;i++){
			b =String.valueOf(cArr[i]).getBytes();
			if(b.length>1){									//����ַ����ֽڳ��ȴ���1����Ϊ����
				int code = 256*(b[0]+256)+(b[1]+256);		//�����ֽ�ֵ��ú��ֵ�Unicode����
				/**���´�����ݺ��ֵı��뷶Χָ�����ֵ�����ĸ*/
				if (code >= 45217 && code <= 45252) {		
					sp="A";
				} else if (code >= 45253 && code <= 45760) {
					sp="B";
				} else if (code >= 45761 && code <= 46317) {
					sp="C";
				} else if (code >= 46318 && code <= 46825) {
					sp="D";
				} else if (code >= 46826 && code <= 47009) {
					sp="E";
				} else if (code >= 47010 && code <= 47296) {
					sp="F";
				} else if (code >= 47297 && code <= 47613) {
					sp="G";
				} else if (code >= 47614 && code <= 48118) {
					sp="H";
				} else if (code >= 48119 && code <= 49061) {
					sp="J";
				} else if (code >= 49062 && code <= 49323) {
					sp="K";
				} else if (code >= 49324 && code <= 49895) {
					sp="L";
				} else if (code >= 49896 && code <= 50370) {
					sp="M";
				} else if (code >= 50371 && code <= 50613) {
					sp="N";
				} else if (code >= 50614 && code <= 50621) {
					sp="O";
				} else if (code >= 50622 && code <= 50905) {
					sp="P";
				} else if (code >= 50906 && code <= 51386) {
					sp="Q";
				} else if (code >= 51387 && code <= 51445) {
					sp="R";
				} else if (code >= 51446 && code <= 52217) {
					sp="S";
				} else if (code >= 52218 && code <= 52697) {
					sp="T";
				} else if (code >= 52698 && code <= 52979) {
					sp="W";
				} else if (code >= 52980 && code <= 53640) {
					sp="X";
				} else if (code >= 53689 && code <= 54480) {
					sp="Y";
				} else if (code >= 54481 && code <= 62289) {
					sp="Z";
				}
			}
			else{							//���ΪӢ����ĸ��ֱ�ӷ�����ĸ����
				sp=String.valueOf(cArr[i]);
			}
			shortPhonetic +=sp;				//��ת�����ÿ������ƴ���������ӳ�һ���ַ���
		}
		return shortPhonetic;
	}
}
