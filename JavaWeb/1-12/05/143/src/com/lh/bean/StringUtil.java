package com.lh.bean;

public class StringUtil {
	private String str;//Ҫ�жϵ��ַ���
	private boolean valid;//�Ƿ���Ч
	private String cue;//��ʾ��Ϣ
	public String getStr() {
		return str;
	}
	public void setStr(String str) {
		this.str = str;
	}
	public boolean isValid() {
		char cArr[] =str.toCharArray();		//�ַ���ת��Ϊ�ַ����� 
		int firstChar =(int) cArr[0];		//��һ���ַ���ASCII��
		StringBuffer sb = new StringBuffer("");
		//�ж����ַ��Ƿ�Ϊ��ĸ
		if((firstChar>=65&&firstChar<=90)||(firstChar>=97&&firstChar<=122)){
			for(int i=1;i<cArr.length;i++){
				int ascii =cArr[i];			//����ַ���ASCII��
				//�ж��ַ��Ƿ�Ϊ��ĸ�����ֻ��»��ߣ��»��ߵ�ASCII��Ϊ95
				if((ascii>=48&&ascii<=57)||(ascii>=65&&ascii<=90)||
						(ascii==95)||(ascii>=97&&ascii<=122)){
					sb.append(cArr[i]);		//����������㣬���ַ���ӵ�StringBuffer�ַ�����ĩβ
				}
			}
			int length = cArr.length-sb.toString().length();
			//������ж��ַ���������StringBuffer�ַ�����¼�ĳ��Ȳ�1����ȥ�����ַ��ĳ��ȣ�
			if(length==1){
				this.setCue("�û�����ʽ��ȷ��");
				valid=true;
				return valid;
			}else{
				this.setCue("�û�����ʽ����ֻ������ĸ�����ֻ��»�����ɣ�");
				valid=false;
				return valid;
			}
		}else{								//������ַ�������ĸ��ֱ�ӷ���false
			this.setCue("�û�����ʽ���ԣ����ַ�����Ϊ��ĸ��");
			valid=false;
			return valid;
		}
	}
	public void setValid(boolean valid) {
		this.valid = valid;
	}
	public String getCue() {
		return cue;
	}
	public void setCue(String cue) {
		this.cue = cue;
	}
	
}
