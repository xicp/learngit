package com.lh.model;
/**
 * ʵ���ࣺ�û���Ϣ��
 * @author lh
 */

public class User {
	private int id;       //���
	private String name;  //�û���
	private String pwd;   //����
	private int age;      //����
	private String sex;   //�Ա�
	
	public User(){}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	
}
