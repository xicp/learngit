import java.util.ArrayList;
import java.util.List;
public class UseForeach {
    public static void main(String[] args) {
        List<String> list=new ArrayList<String>();// ����list����
        list.add("abc");// ��ʼ��list����
        list.add("def");
        list.add("hij");
        list.add("klm");
        list.add("nop");
        list.add("qrs");
        System.out.print("foreach�������ϣ�\n\t");
        for (String string : list) {// ����list����
            System.out.print(string);// ������ϵ�Ԫ��ֵ
        }
        System.out.println();
        String[] strs=new String[list.size()];
        list.toArray(strs);// ��������
        System.out.print("foreach�������飺\n\t");
        for (String string : strs) {// ��������
            System.out.print(string);// �������Ԫ��ֵ
        }
    }
}
