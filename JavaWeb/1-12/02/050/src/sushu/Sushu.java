package sushu;
import java.util.Scanner;
public class Sushu {

	public static void main(String[] args) {
		Scanner s=new Scanner(System.in);
		System.out.println("请输入你要判断的数！");
		int x=s.nextInt();
		int i=2,flage=0;
		while(flage==0&&i<x){    //对除数进行遍历
			if(x%i==0){          //判断是否被整除
				flage=1;
			}
			else{
				i++;
			}
		}
		if(flage==0){            //对标记进行判断
			System.out.println(x+"是素数！");
		}
		else{
			System.out.println(x+"不是素数！");
		}
	}
}
