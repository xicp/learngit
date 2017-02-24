package wf;
public class Wflower {
	public static void main(String[] args) {
		int a=0,b=0,c=0;
		 System.out.println("水仙花数是："); 
		 for (int i = 100; i < 1000; i++)				//遍历所有3位数
		    {
		        a = i/100;				//获取3位数中百位的数
		        b=i%100/10;			    //获取3位数中十位的数
		      	c=i%100%10;				//获取3位数中个位的数		
		       
		        a = a * a * a;								//计算第一位数的立方
		        b = b * b * b;								//计算第二位数的立方
		        c = c * c * c;								//计算第3位数的立方
		        if ((a + b + c) == i)                       //如果符合水仙花数
                System.out.print("  "+i); 
		    }
	}
}
