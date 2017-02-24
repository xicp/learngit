package hanxin;

public class Hxin {
	public static void main(String[] args){
		int a=0,b=0,c=0,preson;      //定义总人数和各种站法的剩余人数
		for(preson=0;preson<100;preson++){
			a=preson%3;              //每排三人剩余人数
			b=preson%7;              //每排七人的剩余人数
			c=preson%5;              //每排五人的剩余人数
			if(a==1&&b==5&&c==0){     //都符合条件时的人数
				System.out.println("韩信带的兵数是："+preson);
			}
		}
	}
}
