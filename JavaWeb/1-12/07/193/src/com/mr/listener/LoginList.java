package com.mr.listener;

import java.util.*;

public class LoginList {
    private static LoginList user = new LoginList();
    private Vector vector = null;
                         //private调用构造函数，
                         //防止被外界类调用产生新的instance对象  
    public LoginList() {
        this.vector = new Vector();
    }
                        //外界使用的instance对象
    public static LoginList getInstance() {
        return user;
    }
                       //用户登录
    public boolean addLoginList(String user) {
        if (user != null) {
            this.vector.add(user);
            return true;
        } else {
            return false;
        }
    }
                        //获取用户列表
    public Vector getList() {
        return vector;
    }
                        //删除用户
    public void removeLoginList(String user) {
        if (user != null) {
            vector.removeElement(user);
        }
    }
}
