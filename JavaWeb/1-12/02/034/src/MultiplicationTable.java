public class MultiplicationTable {
    public static void main(String[] args) {
        for(int i=1;i<=9;i++){// ѭ�����Ʊ�����1������9
            for(int j=1;j<=i;j++){// �ڶ���ѭ�����Ʊ������һ������������
                // �����������������
                System.out.print(j+"*"+i+"="+i*j+"\t");
            }
            System.out.println();// �����ѭ���л���
        }
    }
}
