import java.util.Scanner;
public class JudgeMonth {
    
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);// ����ɨ����
        // ��ʾ�û������·�
        System.out.println("������һ���·ݣ����ܸ������������ĸ����ڡ�");
        int month = scan.nextInt();// �����û�����
        switch (month) {// �ж��·������ĸ�����
            case 12:
            case 1:
            case 2:
                System.out.print("��������·����ڶ�����");
                break;
            case 3:
            case 4:
            case 5:
                System.out.print("��������·����ڴ���");
                break;
            case 6:
            case 7:
            case 8:
                System.out.print("��������·������ļ�");
                break;
            case 9:
            case 10:
            case 11:
                System.out.print("��������·������＾");
                break;
            default:
                System.out.print("������" + month + "�·���");
        }
    }
}
