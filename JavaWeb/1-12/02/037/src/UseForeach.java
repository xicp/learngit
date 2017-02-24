import java.util.ArrayList;
import java.util.List;
public class UseForeach {
    public static void main(String[] args) {
        List<String> list=new ArrayList<String>();// 创建list集合
        list.add("abc");// 初始化list集合
        list.add("def");
        list.add("hij");
        list.add("klm");
        list.add("nop");
        list.add("qrs");
        System.out.print("foreach遍历集合：\n\t");
        for (String string : list) {// 遍历list集合
            System.out.print(string);// 输出集合的元素值
        }
        System.out.println();
        String[] strs=new String[list.size()];
        list.toArray(strs);// 创建数组
        System.out.print("foreach遍历数组：\n\t");
        for (String string : strs) {// 遍历数组
            System.out.print(string);// 输出数组元素值
        }
    }
}
