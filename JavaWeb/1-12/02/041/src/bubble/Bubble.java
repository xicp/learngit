package bubble;
public class Bubble {
	public static void main(String[] args) {
		int a[]={10,23,11,56,45,26,59,28,84,79};       	//给出原始数的序列
		int temp=0;
		System.out.println("初始序列的数组为：");  	 	//堆排序好的数序列进行输出
	    for(int i=0;i<a.length;i++){  	
	        	System.out.print(a[i]+"  ");
	    }
	    for(int i=0;i<a.length;i++){
	    	for(int j=0;j<a.length-i-1;j++)
	    		if(a[j]>a[j+1]){     				//进行两两比较，下面进行符合条件的交换
	    			temp=a[j+1];
	            	a[j+1]=a[j];
	            	a[j]=temp;
	    		}   	
	    }
	    System.out.println("\n"+"排序好的数组为：");   //堆排序好的数序列进行输出
	    for(int i=0;i<a.length;i++){  	
	        	System.out.print(a[i]+"  ");
	    }
	}

}
