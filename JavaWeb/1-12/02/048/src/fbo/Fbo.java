package fbo;
import java.util.Scanner;
public class Fbo {
	private static void f(int x){
		int f1=1,f2=1,i=3;
		if(x==1)System.out.print(f1);
		if(x==2)System.out.print(f1+"  "+f2);
		if(x>=3){                 //��λ�ô�����������
			System.out.print(f1+"  "+f2);
		    while(x>=i){         //������
		    	f1=f2+f1;        //������֮��
		    	System.out.print("  "+f1);
		    	i++;
			    f2=f2+f1;
			    System.out.print("  "+f2);			    
		    }
		}  
	}
	public static void main(String[] args) {
		Scanner s=new Scanner(System.in);
		System.out.println("����������鿴��쳲��������У�");
        int num=s.nextInt();
        System.out.println("���뿴��쳲��������У�");
        f(num/2+1);
	}
}
