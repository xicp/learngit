package bubble;
public class Parti {
	public int partition(int[] r,int first,int end){
		int i,j;
		i=first;j=end;                        //初始化
		while(i<j){
			while(i<j&&r[i]<=r[j])  j--;      //右侧扫描
			if(i<j){                          //将较小的记录交换到前面
				int temp;
				temp=r[i];
				r[i]=r[j];
				r[j]=temp;
			}
			while(i<j&&r[i]<r[j]){
				i++;                           //左侧扫描
			}
			if(i<j){                           //将较大的记录换到后面
				int temp;
				temp=r[i];
				r[i]=r[j];
				r[j]=temp;
			}
		}
		return i;//
	}
}
