package com.lh.bean;

public class UserInfo {
	private String userName;	//�û���
	private String userPwd;		//����
	private String userSex;		//�Ա�
	private int userAge;		//����
	private String email;		//�����ʼ�
	public UserInfo(){}			//Ĭ�ϵĹ��췽��
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	public String getUserSex() {
		return userSex;
	}
	public void setUserSex(String userSex) {
		this.userSex = userSex;
	}
	public int getUserAge() {
		return userAge;
	}
	public void setUserAge(int userAge) {
		this.userAge = userAge;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
}
