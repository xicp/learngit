import java.util.Scanner;
public class LeapYear {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        System.out.println("������һ����ݣ�");
        long year = scan.nextLong();// �����û�����
        if (year % 4 == 0 && year % 100 != 0 || year % 400 == 0) { // ������
            System.out.print(year + "�����꣡");
        } else { // ��������
            System.out.print(year + "�������꣡");
        }
    }
}
