package select;
public class Heap {
	private static int leftChild(int i){
		return 2*i+1;
	}
	private static void perc(int[] a,int i,int n){   //�����ѵķ���
		int child;
		int temp;
		for(temp=a[i];leftChild(i)<n;i=child){
			child=leftChild(i);
			if(child!=n-1&&a[child]<a[child+1])//�Ƚ����Һ��ӵĴ�С
				child++;
			if(temp<(a[child]))                //���ڵ�С�����Һ���
				a[i]=a[child];
			else
				break;
		}
		a[i]=temp;//
	}
	public static void heaps(int[] a){         //������ĵط���
		for(int i=a.length/2;i>=0;i--){        //��ʼ���ѣ������һ�����ն˽ڵ������ڵ�
			perc(a,i,a.length);
		}
		for(int i=0;i<a.length;i++){           //�ظ�ִ�����߶Զ����ؽ��ѵĲ���
			int temp=a[0];
			a[0]=a[a.length-i-1];
			a[a.length-i-1]=temp;
			perc(a, 0, a.length-i-1);          //�ؽ���
		}
	}
	public static void main(String[] args) {
		int r[]={50,40,45,36,32,18,22,30};
		System.out.println("ԭʼ�����У�");
		for(int i=0;i<8;i++){
        	System.out.print("  "+r[i]);
        }
		heaps(r);
		System.out.println("\n"+"����õ����У�");
        for(int i=0;i<8;i++){
        	System.out.print("  "+r[i]);
        }
	}
}
