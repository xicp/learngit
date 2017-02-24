package com.mr.listener;
import javax.servlet.http.HttpSessionBindingEvent;

public class LoginNote implements javax.servlet.http.HttpSessionBindingListener {
  private String user;
  private LoginList container = LoginList.getInstance();
  public LoginNote() {
    user = "";
  }
  public void setUser(String user) {
    this.user = user;
  }
  public String getUser() {
    return this.user;
  }
  public void valueBound(HttpSessionBindingEvent arg0) {
    System.out.println(this.user+"该用户己经上线" );
  }
  public void valueUnbound(HttpSessionBindingEvent arg0) {
    System.out.println(this.user+"该用户己经下线");
    if (user != "") {
    container.removeLoginList(user);
    }
  }
}
