import java.math.BigDecimal;
public class Example {
    public static void main(String args[]) {
        BigDecimal sum = new BigDecimal(0.0); // ��
        BigDecimal factorial = new BigDecimal(1.0); // �׳���ļ�����
        int i = 1; // ѭ������
        while (i <= 20) {
            sum = sum.add(factorial); // �ۼӸ���׳˵ĺ�
            ++i; // i��1
            factorial = factorial.multiply(new BigDecimal(1.0 / i)); // ����׳���
        }
        System.out.println("1+1��2!+1��3!������1��20!�ļ��������ڣ�\n" + sum); // ���������
    }
}
