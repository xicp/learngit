package com.lh.util;

import java.io.File;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;

public class ReadXMLData {
	private static Document document;    	//����Document����
	private File xmlFile;					//����File����
	public File getXmlFile() {
		return xmlFile;
	}
	public void setXmlFile(File xmlFile) {
		this.xmlFile = xmlFile;
	}
	public ReadXMLData(File xmlFile){		//�������Ĺ��췽��
		this.xmlFile=xmlFile;
	}
	public  String readXml(String str) {
	//�����XMl�ĵ���ȡ����DOM����Ľ�����
	    DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
	    try {
	        DocumentBuilder builder = factory.newDocumentBuilder(); 
	        document = builder.parse(xmlFile); 		//����XML��ȡDOM�ĵ�ʵ��
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    String subNodeTag = document.getElementsByTagName(str).item(0)
	            .getFirstChild().getNodeValue();    //��ȡָ���ڵ㱣���ֵ
	   return subNodeTag;          				  //���ض�ȡ����Ϣ
	}

}
