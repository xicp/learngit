public class CycUtmost {
    public static void main(String[] args) {
        int end=Integer.MAX_VALUE;// ����ѭ����ֹ��
        int start=end-50;// ����ѭ����ʼ��
        int count=0;// ����ѭ��������
        for (int i = start; i <= end; i++) {// ִ��ѭ��
            count++;// ѭ������
        }
        // ���ѭ��������
        System.out.println("����ѭ������Ϊ��"+count);
    }
}