public class ProductPrice {
    public static void main(String[] args) {
        float money = 1206; // 金额
        float rebate = 0f; // 折扣
        if (money > 200) {
            int grade = (int) money / 200; // 等级
            switch (grade) { // 根据等级计算折扣比例
                case 1:
                    rebate = 0.95f;
                    break;
                case 2:
                    rebate = 0.90f;
                    break;
                case 3:
                    rebate = 0.85f;
                    break;
                case 4:
                    rebate = 0.83f;
                    break;
                case 5:
                    rebate = 0.80f;
                    break;
                case 6:
                    rebate = 0.78f;
                    break;
                case 7:
                    rebate = 0.75f;
                    break;
                case 8:
                    rebate = 0.73f;
                    break;
                case 9:
                    rebate = 0.70f;
                    break;
                case 10:
                    rebate = 0.65f;
                    break;
                default:
                    rebate = 0.60f;
            }
        }
        System.out.println("您的累计消费金额为：" + money);// 输出消费金额
        System.out.println("您将享受" + rebate + "折优惠！"); // 输出折扣比例
    }
}
