package com.mr.listener;

import java.util.*;

public class LoginList {
    private static LoginList user = new LoginList();
    private Vector vector = null;
                         //private���ù��캯����
                         //��ֹ���������ò����µ�instance����  
    public LoginList() {
        this.vector = new Vector();
    }
                        //���ʹ�õ�instance����
    public static LoginList getInstance() {
        return user;
    }
                       //�û���¼
    public boolean addLoginList(String user) {
        if (user != null) {
            this.vector.add(user);
            return true;
        } else {
            return false;
        }
    }
                        //��ȡ�û��б�
    public Vector getList() {
        return vector;
    }
                        //ɾ���û�
    public void removeLoginList(String user) {
        if (user != null) {
            vector.removeElement(user);
        }
    }
}
