import java.util.Scanner;
public class Example {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        System.out.println("������һ��Ӣ���ַ���������ַ���");
        String password = scan.nextLine();// ��ȡ�û�����
        char[] array = password.toCharArray();// ��ȡ�ַ�����
        for (int i = 0; i < array.length; i++) {// �����ַ�����
            array[i] = (char) (array[i] ^ 20000);// ��ÿ������Ԫ�ؽ����������
        }
        System.out.println("���ܻ���ܽ�����£�");
        System.err.println(new String(array));// �����Կ
    }
}
