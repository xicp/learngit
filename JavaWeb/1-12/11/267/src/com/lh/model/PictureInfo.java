package com.lh.model;

import java.io.File;

public class PictureInfo {
	private int id;//±àºÅ
	private String pictureName;	//Í¼Æ¬Ãû³Æ
	private String pictureType;	//Í¼Æ¬ÀàÐÍ
	private File picturePath;	//Í¼Æ¬ÎÄ¼þ
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
	public File getPicturePath() {
		return picturePath;
	}
	public void setPicturePath(File picturePath) {
		this.picturePath = picturePath;
	}
	
}
