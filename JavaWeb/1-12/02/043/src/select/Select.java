package select;
public class Select {
	public static void main(String[] args) {
		int r[]={49,27,65,97,76,13,38,5,12,56};
		int i,j,index,temp;
		System.out.println("初始序列的数组为：");   
        for(i=0;i<10;i++){  	          //对n个记录进行n-1趟的选择排序
        	System.out.print(r[i]+"  ");
        }
		for(i=0;i<9;i++){
			index=i;                      //初始化第i趟选择排序的最小记录的指针
			for(j=i+1;j<10;j++){          //在无序区选取最小记录
				if(r[j]<r[index]){
					index=j;
				}
			}
			if(index!=i){                 //将最小记录与r[i]交换
				 temp=r[i];
				 r[i]=r[index];
				 r[index]=temp;
			}
		}
		System.out.println("\n"+"排序好的数组为：");
        for(i=0;i<10;i++){  	
        	System.out.print(r[i]+"  ");
        }
	}
}
