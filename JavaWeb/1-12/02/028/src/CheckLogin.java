import java.util.Scanner;
public class CheckLogin {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);// ����ɨ����
        System.out.println("�������¼�û�����");
        String username = scan.nextLine();// �����û������¼��
        System.out.println("�������¼���룺");
        String password = scan.nextLine();// �����û������¼����
        if (!username.equals("mr")) {// �ж��û����Ϸ���
            System.out.println("�û����Ƿ���");
        } else if (!password.equals("mrsoft")) {// �ж�����Ϸ���
            System.out.println("��¼�������");
        } else {// ͨ���������������ж���Ĭ��ͨ����¼��֤
            System.out.println("��ϲ������¼��Ϣͨ����֤��");
        }
    }
}
