import java.io.FileNotFoundException;
import java.io.PrintStream;

public class RedirectOutputStream {
    public static void main(String[] args) {
        try {
            PrintStream out = System.out;// ����ԭ�����
            PrintStream ps=new PrintStream("./log.txt");// �����ļ������
            System.setOut(ps);// ����ʹ���µ������
            int age=18;// �������α���
            System.out.println("��������ɹ����壬��ʼֵΪ18");
            String sex="Ů";// �����ַ�������
            System.out.println("�Ա�����ɹ����壬��ʼֵΪŮ");
            // ������������
            String info="���Ǹ�"+sex+"���ӣ�Ӧ����"+age+"���ˡ�";
            System.out.println("������������Ϊinfo�ַ��������������ǣ�"+info);
            System.setOut(out);// �ָ�ԭ�������
            System.out.println("����������ϣ���鿴��־�ļ���");
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
    }
}
