package bubble;

public class Tp {
	static Parti p=new Parti();

	public static void quick(int[] r,int first,int end){    //利用递归反复划分
		if(first<end){
			int pivot=p.partition(r, first, end);           //调用划分函数
			quick(r,first,pivot-1);
			quick(r,pivot+1,end);
		}
	}
	public static void main(String[] args) {
		int r[]={12,25,36,63,21,32,56,11};
		System.out.println("待排序的记录序列是：");
		for(int i=0;i<8;i++){
			System.out.print(r[i]+"  ");
		}
		quick(r,0,7);
		System.out.println("\n"+"排序好的记录是：");
		for(int i=0;i<8;i++){
			System.out.print(r[i]+"  ");
		}

	}

}
