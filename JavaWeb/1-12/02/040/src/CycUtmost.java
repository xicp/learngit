public class CycUtmost {
    public static void main(String[] args) {
        int end=Integer.MAX_VALUE;// 定义循环终止数
        int start=end-50;// 定义循环起始数
        int count=0;// 定义循环计数器
        for (int i = start; i <= end; i++) {// 执行循环
            count++;// 循环计数
        }
        // 输出循环计数器
        System.out.println("本次循环次数为："+count);
    }
}