package select;
public class Select {
	public static void main(String[] args) {
		int r[]={49,27,65,97,76,13,38,5,12,56};
		int i,j,index,temp;
		System.out.println("��ʼ���е�����Ϊ��");   
        for(i=0;i<10;i++){  	          //��n����¼����n-1�˵�ѡ������
        	System.out.print(r[i]+"  ");
        }
		for(i=0;i<9;i++){
			index=i;                      //��ʼ����i��ѡ���������С��¼��ָ��
			for(j=i+1;j<10;j++){          //��������ѡȡ��С��¼
				if(r[j]<r[index]){
					index=j;
				}
			}
			if(index!=i){                 //����С��¼��r[i]����
				 temp=r[i];
				 r[i]=r[index];
				 r[index]=temp;
			}
		}
		System.out.println("\n"+"����õ�����Ϊ��");
        for(i=0;i<10;i++){  	
        	System.out.print(r[i]+"  ");
        }
	}
}
