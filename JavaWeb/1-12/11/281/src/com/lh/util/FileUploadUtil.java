package com.lh.util;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

public class FileUploadUtil {
	private InputStream InputStreamState;//输入流
	private HttpServletRequest request;	//从JSP页面传入的Request
	private long fileSize;				//文件大小
	private String errorMessage = "";	//用于保存错误信息
	private Map<String, String> parameter = new HashMap<String, String>();//创建Map集合
	public FileUploadUtil() {
	}


	/**
	 * <pre><h1>
	 * 解析Form表单
	 * form表单的enctype必须设置为：enctype=&quot;multipart/form-data&quot;
	 * 此方法为首方法，用于解析form表单中的属性。执行此方法解析表单值后，方可通过 {@link #getParameter(String)}方法获得表单的参数信息
	 * <br>                            
	 * @param contentType
	 * 传入内容类型信息。例如：request.getContentType();
	 * @param inputStream
	 * 传入请求的输入流。例如：request.getInputStream();
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
	 * 上传文件到服务器
	 * @param file 文件本身
	 * @param filename 文件名
	 * @param uploadPath 上传路径
	 * @return 上传成功返回true,否则返回false
	 * @throws Exception 
	 */
	
	public boolean uploadToServer(String file, String filename, String uploadPath) throws Exception {
		if (file.length() > fileSize) {//判断文件大小是否超过指定的值
			file = null;
			errorMessage = "文件超出大小限制。";
			parameter.put("error", errorMessage);
			throw new Exception("文件超出大小限制。");
		}
		filename = System.currentTimeMillis()+ "_"+filename;//文件重命名
		resolverForm();
		try {
			File dir = new File(uploadPath+"/upload/");
			if(!dir.exists())//测试此目录是否存在
				dir.mkdir();//创建文件夹
			File newFile = new File(dir.getAbsolutePath()+"/"+filename);//创建文件
			if(!newFile.exists())//测试此文件是否存在
				newFile.createNewFile();//创建文件
			FileOutputStream fos = new FileOutputStream(newFile);//创建文件输出流对象
			fos.write(file.getBytes("iso-8859-1"));//向文件输出流中输出文件字节数据
			fos.close();//关闭流
			return true;
		} catch (Exception ex) {
			ex.printStackTrace();
			return false;
		} 
			
	}
	/**
	 * <pre><h1>
	 * 获取表单的指定参数
	 * </h1>
	 *                             必须调用 {@link #resolverForm(String, InputStream)}方法解析form表单以后，才可以调用此方法，否则参数为空。
	 *                             
	 *                             @param param
	 *                                        参数名称
	 *                             @return String 返回类型
	 * </pre>
	 */
	public String getParameter(String param) {
		resolverForm();
		return parameter.get(param);
	}

	/**
	 * <pre><h1>
	 * 获得form表单的所有参数名称的集合
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
						"请设置Form表单的enctype属性为：\"multipart/form-data\"");
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
	 * 设置上下文
	 * </h1>
	 *         @param pageContext javax.servlet.jsp.PageContext类型的上下文，
	 *         可以直接传入JSP页面中的pageContext内置对象。
	 * </pre>
	 */
	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}

	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}
}