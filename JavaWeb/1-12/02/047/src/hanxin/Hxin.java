package hanxin;

public class Hxin {
	public static void main(String[] args){
		int a=0,b=0,c=0,preson;      //�����������͸���վ����ʣ������
		for(preson=0;preson<100;preson++){
			a=preson%3;              //ÿ������ʣ������
			b=preson%7;              //ÿ�����˵�ʣ������
			c=preson%5;              //ÿ�����˵�ʣ������
			if(a==1&&b==5&&c==0){     //����������ʱ������
				System.out.println("���Ŵ��ı����ǣ�"+preson);
			}
		}
	}
}
