package bubble;

public class Tp {
	static Parti p=new Parti();

	public static void quick(int[] r,int first,int end){    //���õݹ鷴������
		if(first<end){
			int pivot=p.partition(r, first, end);           //���û��ֺ���
			quick(r,first,pivot-1);
			quick(r,pivot+1,end);
		}
	}
	public static void main(String[] args) {
		int r[]={12,25,36,63,21,32,56,11};
		System.out.println("������ļ�¼�����ǣ�");
		for(int i=0;i<8;i++){
			System.out.print(r[i]+"  ");
		}
		quick(r,0,7);
		System.out.println("\n"+"����õļ�¼�ǣ�");
		for(int i=0;i<8;i++){
			System.out.print(r[i]+"  ");
		}

	}

}
