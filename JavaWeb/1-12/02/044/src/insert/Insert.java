package insert;
public class Insert {
	public static void main(String[] args) {
		int r[]={49,27,65,97,76,13,38,5,12,56};     //给出原始数的序列
		int i,j,temp,k;                             //定义变量名称
		System.out.println("放置初始序列的数组为：");//输出初始序列
        for(i=0;i<10;i++){  	
        	System.out.print(r[i]+"  ");
        }
		for(i=1;i<10;i++){
			temp=r[i];                         //设置哨兵，暂存当前值
			for(j=i-1;j>=0&&temp<r[j];j--){    //寻找插入位置
				r[j+1]=r[j];
				}
			r[j+1]=temp;               //大于当前值的插到当前值后面
			}
		
		System.out.println("\n"+"排序好的数组为："); //输出新序列
        for(i=0;i<10;i++){  	
        	System.out.print(r[i]+"  ");
        }
	}
}
