import java.util.Scanner;
public class Example {
    public static void main(String[] args) {
        Scanner scan=new Scanner(System.in);// ����ɨ����
        System.out.println("������һ������");
        long number = scan.nextLong();// ��ȡ���������
        System.out.println("������������ǣ�"+number);
        System.out.println("�����ֳ���2��������Ϊ��"+(number<<1));
        System.out.println("�����ֳ���4��������Ϊ��"+(number<<2));
        System.out.println("�����ֳ���8��������Ϊ��"+(number<<3));
        System.out.println("�����ֳ���16��������Ϊ��"+(number<<4));
    }
}
