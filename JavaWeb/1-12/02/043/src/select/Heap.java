package select;
public class Heap {
	private static int leftChild(int i){
		return 2*i+1;
	}
	private static void perc(int[] a,int i,int n){   //调整堆的方法
		int child;
		int temp;
		for(temp=a[i];leftChild(i)<n;i=child){
			child=leftChild(i);
			if(child!=n-1&&a[child]<a[child+1])//比较左右孩子的大小
				child++;
			if(temp<(a[child]))                //根节点小于左右孩子
				a[i]=a[child];
			else
				break;
		}
		a[i]=temp;//
	}
	public static void heaps(int[] a){         //堆排序的地方法
		for(int i=a.length/2;i>=0;i--){        //初始化堆，从最后一个非终端节点至根节点
			perc(a,i,a.length);
		}
		for(int i=0;i<a.length;i++){           //重复执行移走对顶及重建堆的操作
			int temp=a[0];
			a[0]=a[a.length-i-1];
			a[a.length-i-1]=temp;
			perc(a, 0, a.length-i-1);          //重建堆
		}
	}
	public static void main(String[] args) {
		int r[]={50,40,45,36,32,18,22,30};
		System.out.println("原始的序列：");
		for(int i=0;i<8;i++){
        	System.out.print("  "+r[i]);
        }
		heaps(r);
		System.out.println("\n"+"排序好的序列：");
        for(int i=0;i<8;i++){
        	System.out.print("  "+r[i]);
        }
	}
}
