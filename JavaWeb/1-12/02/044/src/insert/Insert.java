package insert;
public class Insert {
	public static void main(String[] args) {
		int r[]={49,27,65,97,76,13,38,5,12,56};     //����ԭʼ��������
		int i,j,temp,k;                             //�����������
		System.out.println("���ó�ʼ���е�����Ϊ��");//�����ʼ����
        for(i=0;i<10;i++){  	
        	System.out.print(r[i]+"  ");
        }
		for(i=1;i<10;i++){
			temp=r[i];                         //�����ڱ����ݴ浱ǰֵ
			for(j=i-1;j>=0&&temp<r[j];j--){    //Ѱ�Ҳ���λ��
				r[j+1]=r[j];
				}
			r[j+1]=temp;               //���ڵ�ǰֵ�Ĳ嵽��ǰֵ����
			}
		
		System.out.println("\n"+"����õ�����Ϊ��"); //���������
        for(i=0;i<10;i++){  	
        	System.out.print(r[i]+"  ");
        }
	}
}
