package sushu;
import java.util.Scanner;
public class Sushu {

	public static void main(String[] args) {
		Scanner s=new Scanner(System.in);
		System.out.println("��������Ҫ�жϵ�����");
		int x=s.nextInt();
		int i=2,flage=0;
		while(flage==0&&i<x){    //�Գ������б���
			if(x%i==0){          //�ж��Ƿ�����
				flage=1;
			}
			else{
				i++;
			}
		}
		if(flage==0){            //�Ա�ǽ����ж�
			System.out.println(x+"��������");
		}
		else{
			System.out.println(x+"����������");
		}
	}
}
