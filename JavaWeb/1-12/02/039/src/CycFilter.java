public class CycFilter {
    public static void main(String[] args) {
        // ��������
        String[] array = new String[] { "����", "������", "���", "����", "��ѻ", "ϲȵ",
                "��ӥ", "������", "��ӥ", "������", "��ӥ", "������" };
        System.out.println("���ҵĻ�԰���кܶ����࣬����������˼�ֻ��ӥ������Ұ�����ץ�ߡ�");
        int eagleCount = 0;
        for (String string : array) {// foreach��������
            if (string.equals("��ӥ")) {// ���������ӥ
                System.out.println("����һֻ��ӥ���Ѿ�ץ�������");
                eagleCount++;
                continue;// �ж�ѭ��
            }
            System.out.println("�������࣬�����ˣ�" + string);// �����������Ԫ��
        }
        System.out.println("һ��׽���ˣ�" + eagleCount + "ֻ��ӥ��");
    }
}
