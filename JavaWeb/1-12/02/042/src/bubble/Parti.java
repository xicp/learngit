package bubble;
public class Parti {
	public int partition(int[] r,int first,int end){
		int i,j;
		i=first;j=end;                        //��ʼ��
		while(i<j){
			while(i<j&&r[i]<=r[j])  j--;      //�Ҳ�ɨ��
			if(i<j){                          //����С�ļ�¼������ǰ��
				int temp;
				temp=r[i];
				r[i]=r[j];
				r[j]=temp;
			}
			while(i<j&&r[i]<r[j]){
				i++;                           //���ɨ��
			}
			if(i<j){                           //���ϴ�ļ�¼��������
				int temp;
				temp=r[i];
				r[i]=r[j];
				r[j]=temp;
			}
		}
		return i;//
	}
}
