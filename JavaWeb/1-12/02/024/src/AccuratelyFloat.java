import java.math.BigDecimal;
public class AccuratelyFloat {
    public static void main(String[] args) {
        double money = 2;// ���н��
        double price = 1.1;// ��Ʒ�۸�
        double result=money - price;
        System.out.println("�Ǿ�ȷ����");
        System.out.println("ʣ���"+result);// ���������
        // ��ȷ�������Ľ������
        BigDecimal money1 = new BigDecimal("2");// ���н��
        BigDecimal price1 = new BigDecimal("1.1");// ��Ʒ����
        BigDecimal result1=money1.subtract(price1);
        System.out.println("��ȷ����");
        System.out.println("ʣ���"+result1);// �����ȷ���
    }
}
