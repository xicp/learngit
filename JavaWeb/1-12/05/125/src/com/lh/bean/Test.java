package com.lh.bean;

import java.util.Calendar;
import java.util.Date;

public class Test {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		
		Test t= new Test();
		//System.out.println(t.getNumStr(115, 4));
		
		String str = "asdf";
		String s="�Ƽ�";
		int fromIndex=0;
		if(str.indexOf(97)!=-1){
			System.out.println("�ַ�����"+str+"���������ַ���"+s);
			if(str.indexOf(97)==fromIndex){
				System.out.println("�ַ�����"+str+"���ĵ�"+fromIndex+"λ���ԡ�"+s+"�����ַ�����ͷ��");
			}
		}
		Calendar c = Calendar.getInstance();
		Calendar c1 = Calendar.getInstance();
		c1.set(2010, 6,5);
		long time = c1.getTimeInMillis() -c.getTimeInMillis();
		long t1 = 1000*60;
		int h = (int)(time/t1);
		System.out.println(h);
		
	}
	public boolean isHasEn(String str) {
		char cArr[] = str.toCharArray();//���ַ���ת��Ϊ�ַ�����
		boolean b =false;
		StringBuffer sb =new StringBuffer("");
		StringBuffer sb2 =new StringBuffer("");
		for(int i=0;i<cArr.length;i++){
			//����String���hashCode()����Ҳ�ܻ���ַ���ASCII��
			//int ascii = String.valueOf(cArr[i]).hashCode();
			int ascii = (int)cArr[i];//ǿ��ת������ֱ�ӵõ��ַ���ASCII��
			System.out.println(ascii);
			//Ӣ���ַ��� ASCII�뷶Χ����д��ĸA-Z�ķ�Χ65-90��Сд��ĸa-z�ķ�Χ97-122
			if((ascii>=65&&ascii<=90)||(ascii>=97&&ascii<=122)){
				sb.append(cArr[i]);	//��ÿ��Ӣ����ĸ��ӵ�StringBuffer������
			}
			else{
				sb2.append(cArr[i]);
			}
		}
		if(!sb.toString().equals(""))//�������Ӣ����ĸ���ַ�����Ϊ""��˵�����ַ�������Ӣ����ĸ
			return true;
		else
			return false;
	
	}

	/**
	 * ������ֵ��ʽ��Ϊָ�����ȵ��ַ���
	 * @param num : Ҫ��ʽ������ֵ
	 * @param len : ��ʽ����
	 * @return ���ظ�ʽ����ַ���
	 */
	public String getNumStr(int num,int len){
		String str = String.valueOf(num);//ת��Ϊ�ַ���
		String numStr ="";
		int length = len -str.length();//���ַ���֮ǰ��0�ĳ���
		if(length<=0){
			numStr = str;
		}else{
			for(int i=0;i<length;i++){
				str = "0"+str;
			}
			numStr = str;
		}
		return numStr;
	}
}
