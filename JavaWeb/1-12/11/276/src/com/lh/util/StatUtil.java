package com.lh.util;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.StreamTokenizer;

public class StatUtil {
	public static int[] statis(String filePath) {
	    FileReader fileReader = null;
	    try {
	        fileReader = new FileReader(filePath);  	//创建FileReader对象
	        StreamTokenizer stokenizer = new StreamTokenizer(new BufferedReader(
	                fileReader));                  		//创建StreamTokenizer对象
	        stokenizer.ordinaryChar('\'');          	//将单引号当作是普通字符
	        stokenizer.ordinaryChar('\"');          	//将双引号当作是普通字符
	        stokenizer.ordinaryChar('/');           	//将“/”当作是普通字符
	        int[] length = new int[4];              	//定义保存计算结果的int型数组
	        String str;
	        int numberSum = 0;                     		//定义保存数字的变量
	        int symbolSum = 0;                      	//定义保存英文标点数的变量
	        int wordSum = 0;    
	        int sum = 0;                            		//定义保存总字符数的变量
	        while (stokenizer.nextToken() != StreamTokenizer.TT_EOF) { //如果没有读到文件的末尾
	            switch (stokenizer.ttype) {         	//判断读取标记的类型                   
	                case StreamTokenizer.TT_NUMBER: 	//如果用户读取的是一个数字标记
	                    str = String.valueOf(stokenizer.nval);       		//获取读取的数字值              
	                    numberSum += 1; 				//计算数字个数
	                    length[0] = numberSum;          //设置数组中的元素
	                    break;                         	//退出语句
	                case StreamTokenizer.TT_WORD:		//如果读取的是文字标记
	                    str = stokenizer.sval;   		//获取该标记                     
	                    System.out.println(str);
	                    wordSum += str.length();  		//计算该文字的长度
	                    length[1] = wordSum;
	                    break;
	                default:                            	//如果读取的是其他标记
	                    str = String.valueOf((char) stokenizer.ttype);  //读取该标记
	                    System.out.println(str);
	                    symbolSum += str.length();      //计算该标记的长度
	                    length[2] = symbolSum;           //设置int数组中的元素
	            }
	        }            
	        sum = symbolSum + numberSum + wordSum;  	 //获取总字符数
	        length[3] = sum;
	        return length;
	    } catch (Exception e) {
	        e.printStackTrace();
	       return null;
	    }
	}    

}
