package bubble;
public class Bubble {
	public static void main(String[] args) {
		int a[]={10,23,11,56,45,26,59,28,84,79};       	//����ԭʼ��������
		int temp=0;
		System.out.println("��ʼ���е�����Ϊ��");  	 	//������õ������н������
	    for(int i=0;i<a.length;i++){  	
	        	System.out.print(a[i]+"  ");
	    }
	    for(int i=0;i<a.length;i++){
	    	for(int j=0;j<a.length-i-1;j++)
	    		if(a[j]>a[j+1]){     				//���������Ƚϣ�������з��������Ľ���
	    			temp=a[j+1];
	            	a[j+1]=a[j];
	            	a[j]=temp;
	    		}   	
	    }
	    System.out.println("\n"+"����õ�����Ϊ��");   //������õ������н������
	    for(int i=0;i<a.length;i++){  	
	        	System.out.print(a[i]+"  ");
	    }
	}

}
