package select;

public class HeapS {
	public static void sift(int[] r,int k,int m){
		int i=k;
		int j=2*i;
		while(j<=m){
			if(j<=m&&r[j]<r[j+1]){
				j++;}
			if(r[i]>r[j]) break;
			else{
				int temp;
				temp=r[i];
				r[i]=r[j];
				r[j]=temp;
				i=j;
				j=2*i;
			}
		}
	}
	public static void heasp(int r[],int n){
		int i;
		for(i=n/2;i>=0;i--){
			sift(r, i, n);
		}
		for(i=0;i<n;i++){
			int temp=r[0];
			r[0]=r[n-i+1];
			r[n-i+1]=temp;
			sift(r, 1, n-i);
		}
		for( i=0;i<8;i++){
			System.out.print("  "+r[i]);
		}
	}
	public static void main(String[] args) {
		int a[]={50,40,45,36,32,18,22,30};
		heasp(a,7);
		}
}
