package com.lh.model;

import java.io.File;

public class PictureInfo {
	private int id;//���
	private String pictureName;	//ͼƬ����
	private String pictureType;	//ͼƬ����
	private byte[] picByte;		//ͼƬ���ֽ�
	public byte[] getPicByte() {
		return picByte;
	}
	public void setPicByte(byte[] picByte) {
		this.picByte = picByte;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPictureName() {
		return pictureName;
	}
	public void setPictureName(String pictureName) {
		this.pictureName = pictureName;
	}
	public String getPictureType() {
		return pictureType;
	}
	public void setPictureType(String pictureType) {
		this.pictureType = pictureType;
	}
	
}
