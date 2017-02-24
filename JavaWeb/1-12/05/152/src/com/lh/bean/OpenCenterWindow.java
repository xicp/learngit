package com.lh.bean;

public class OpenCenterWindow {
/****************************************
    *功能：该方法将生成一个字符串，该字符串用于输出自定义的JavaScript函数(该函数用于打开指定大小的新窗口，并居中显示)
****************************************/
    public String open(String url,String w,String h,String no){
        String str="<script language='javascript'>function openwin"+no+"(){";
        str=str+"if ("+w+"=='0'){var winhdc=window.open('"+url+"');";
        str=str+"var width=0;var height=0;}else{";
        str=str+"var winhdc=window.open('"+url+"','','width="+w+",height="+h+"');";
        str=str+"var width=(screen.width-"+w+")/2;";
        str=str+"var height=(screen.height-"+h+")/2;}";
        str=str+"winhdc.moveTo(width,height);";
        str=str+"}</script>";
        return str;
    }
}
