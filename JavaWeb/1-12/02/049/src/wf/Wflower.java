package wf;
public class Wflower {
	public static void main(String[] args) {
		int a=0,b=0,c=0;
		 System.out.println("ˮ�ɻ����ǣ�"); 
		 for (int i = 100; i < 1000; i++)				//��������3λ��
		    {
		        a = i/100;				//��ȡ3λ���а�λ����
		        b=i%100/10;			    //��ȡ3λ����ʮλ����
		      	c=i%100%10;				//��ȡ3λ���и�λ����		
		       
		        a = a * a * a;								//�����һλ��������
		        b = b * b * b;								//����ڶ�λ��������
		        c = c * c * c;								//�����3λ��������
		        if ((a + b + c) == i)                       //�������ˮ�ɻ���
                System.out.print("  "+i); 
		    }
	}
}
