package com.lh.bean;

public class OpenCenterWindow {
/****************************************
    *���ܣ��÷���������һ���ַ��������ַ�����������Զ����JavaScript����(�ú������ڴ�ָ����С���´��ڣ���������ʾ)
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
