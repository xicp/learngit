import java.util.Scanner;

public class VariableExchange {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);// ����ɨ����
        System.out.println("���������A��ֵ");
        long A = scan.nextLong();// ���յ�һ������ֵ
        System.out.println("���������B��ֵ");
        long B = scan.nextLong();// ���յڶ�������ֵ
        System.out.println("A=" + A + "\tB=" + B);
        System.out.println("ִ�б�������...");
        A = A ^ B;// ִ�б�������
        B = B ^ A;
        A = A ^ B;
        System.out.println("A=" + A + "\tB=" + B);
    }
}
