package digui;
import java.util.Scanner;
public class Hanoi {

	private static void move(char x,char y){
		System.out.printf("%c-->%c",x,y);
		System.out.print("\n");
	}
	private static void hanoit(int n,char one,char two,char three){     //��n�����Ӵӵ�һ�������ڶ����Ƶ�������
		if(n==1){                           //���ֻ��һ������
			move(one,three);
		}
		else{
			hanoit(n-1,one,three,two);      //��һ�ϵ����ӽ������Ƶ�����
			move(one,three);
			hanoit(n-1,two,one,three);      //�����ϵ����ӽ���һ�Ƶ�����
		}
	}
	public static void main(String[] args) {
		int m;
		System.out.println("��������Ҫ�ƶ�����������");
		Scanner s=new Scanner(System.in);
		m=s.nextInt();
		System.out.println("�ƶ�"+m+"�����ӵĲ�������");
		hanoit(m,'A','B','C');

	}
}
