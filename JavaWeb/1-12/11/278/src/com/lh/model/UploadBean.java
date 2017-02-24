package com.lh.model;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import javax.servlet.http.HttpServletRequest;
public class UploadBean {
	private InputStream InputStreamState;//������
	private HttpServletRequest request;//��JSPҳ�洫���Request
	private long fileSize;//�ļ���С
	private String errorMessage = "";//���ڱ��������Ϣ
	private Map<String, String> parameter = new HashMap<String, String>();//����Map����
	public UploadBean() {
	}


	/**
	 * <pre><h1>
	 * ����Form����
	 * form������enctype��������Ϊ��enctype=&quot;multipart/form-data&quot;
	 * �˷���Ϊ�׷��������ڽ���form�����е����ԡ�ִ�д˷�����������ֵ�󣬷���ͨ�� {@link #getParameter(String)}������ñ����Ĳ�����Ϣ
	 * <br>                            
	 * @param contentType
	 * ��������������Ϣ�����磺request.getContentType();
	 * @param inputStream
	 * ��������������������磺request.getInputStream();
	 * </pre>
	 */
	private void resolverForm() {
		InputStream inputStream = null;
		try {
			inputStream = request.getInputStream();
		} catch (IOException e2) {
			e2.printStackTrace();
		}
		String contentType = request.getContentType();
		if (!isMultipar(contentType) || inputStream.equals(InputStreamState))
			return;
		if (contentType != null && inputStream != null) {
			InputStreamState = inputStream;
			int data;
			StringBuffer datastr = new StringBuffer();
			parameter.clear();
			try {
				while ((data = inputStream.read()) != -1) {
					datastr.append((char) data);
					if (fileSize > 0 && datastr.length() > fileSize) {
						datastr = null;
						errorMessage = "�ļ�������С���ơ�";
						parameter.put("error", errorMessage);
						throw new Exception("�ļ�������С���ơ�");
					} else
						parameter.put("error", errorMessage);
				}
				inputStream.close();
				String split = "boundary=";
				String splitStr = "--"
						+ contentType.substring(contentType.indexOf(split)
								+ split.length());
				String[] formFileds = datastr.toString().split(
						"Content-Disposition: form-data; ");
				for (int i = 0; i < formFileds.length; i++) {
					int[] index = new int[4];
					if (!formFileds[i].startsWith(splitStr)) {
						index[0] = -1;
						index[1] = formFileds[i].indexOf("\n", index[0]);
						index[2] = formFileds[i].indexOf("\n", index[1] + 1);
						index[3] = formFileds[i].indexOf("\n", index[2] + 1);
						String name = "";
						for (int lc = 0; lc < index.length - 1; lc++) {
							String line = formFileds[i].substring(
									index[lc] + 1, index[lc + 1]);
							String[] lineFields = line.split("; ");
							for (int j = 0; j < lineFields.length; j++) {
								if (lineFields[j].startsWith("name=")) {
									name = lineFields[j].substring(
											lineFields[j].indexOf("\"") + 1,
											lineFields[j].lastIndexOf("\""));
								}
								if (j > 0) {
									String arg = name
											+ "_"
											+ lineFields[j].substring(0,
													lineFields[j].indexOf("="));
									String argContent = lineFields[j]
											.substring(lineFields[j]
													.indexOf("\"") + 1,
													lineFields[j]
															.lastIndexOf("\""));
									parameter.put(arg, argContent);
								}
							}
							if (line.equals("\r")) {
								parameter.put(name, formFileds[i].substring(
										index[lc + 1] + 1, formFileds[i]
												.lastIndexOf(splitStr) - 2));
								break;
							}
						}
					}
				}
			} catch (IOException e) {
				e.printStackTrace();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	/**
	 * <pre><h1>
	 * �ϴ��ļ���������
	 * </h1>
	 *                             
	 *                             @param filePath
	 *                                        ����������ļ���·��
	 * </pre>
	 */
	public boolean uploadToFile(String filearg, String filename, String filePath) {
		if (filename == null || filename.equals("")) {
			filename = System.currentTimeMillis()
					+ new File(getParameter(filearg + "_filename")).getName();
		}
		String contentType = request.getContentType();
		if (!isMultipar(contentType))
			return false;
		resolverForm();
		if (filePath.charAt(filePath.length() - 1) != File.separatorChar)
			filePath += File.separatorChar;
		String submit = getParameter("Submit");
		String file = getParameter(filearg);
		if (submit != null && file != null) {
			try {
				File newfile = new File(new String((filePath + new File(
						filename).getName()).getBytes("iso-8859-1")));
				newfile.createNewFile();
				FileOutputStream fout = new FileOutputStream(newfile);
				fout.write(file.getBytes("iso-8859-1"));
				fout.close();
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			return true;
		}
		return false;
	}

	/**
	 * <pre><h1>
	 * ��ȡ������ָ������
	 * </h1>
	 *                             ������� {@link #resolverForm(String, InputStream)}��������form�����Ժ󣬲ſ��Ե��ô˷������������Ϊ�ա�
	 *                             
	 *                             @param param
	 *                                        ��������
	 *                             @return String ��������
	 * </pre>
	 */
	public String getParameter(String param) {
		resolverForm();
		return parameter.get(param);
	}

	/**
	 * <pre><h1>
	 * ���form���������в������Ƶļ���
	 * </h1>
	 *                             
	 *                             @return java.util.Set
	 * </pre>
	 */
	public Set<String> getParameterNames() {
		resolverForm();
		return parameter.keySet();
	}
	private boolean isMultipar(String contentType) {
		try {
			if (contentType != null
					&& !contentType.startsWith("multipart/form-data")) {
				throw new Exception(
						"������Form������enctype����Ϊ��\"multipart/form-data\"");
			} else {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	/**
	 * <pre><h1>
	 * ����������
	 * </h1>
	 *         @param pageContext javax.servlet.jsp.PageContext���͵������ģ�
	 *         ����ֱ�Ӵ���JSPҳ���е�pageContext���ö���
	 * </pre>
	 */
	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}

	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}
}