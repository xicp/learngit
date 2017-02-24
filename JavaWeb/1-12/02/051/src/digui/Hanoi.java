package digui;
import java.util.Scanner;
public class Hanoi {

	private static void move(char x,char y){
		System.out.printf("%c-->%c",x,y);
		System.out.print("\n");
	}
	private static void hanoit(int n,char one,char two,char three){     //将n个盘子从第一座借助第二座移到第三座
		if(n==1){                           //如果只有一个盘子
			move(one,three);
		}
		else{
			hanoit(n-1,one,three,two);      //将一上的盘子借助三移到二上
			move(one,three);
			hanoit(n-1,two,one,three);      //将二上的盘子借助一移到三上
		}
	}
	public static void main(String[] args) {
		int m;
		System.out.println("请输入你要移动的盘子数：");
		Scanner s=new Scanner(System.in);
		m=s.nextInt();
		System.out.println("移动"+m+"个盘子的步骤如下");
		hanoit(m,'A','B','C');

	}
}
