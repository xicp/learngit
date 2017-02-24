package lzwBean;

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

import javax.servlet.jsp.PageContext;


public class LzwUploadBean {
	private InputStream InputStreamState;

	private String driver = "com.microsoft.jdbc.sqlserver.SQLServerDriver";

	private String url = "jdbc:microsoft:sqlserver://localhost:1433;DatabaseName=db_database10";

	private String user = "root";

	private String password = "111";

	private Connection conn;

	private PageContext pageContext;

	private long fileSize;

	private String errorMessage = "";

	private Map<String, String> lzwParameter = new HashMap<String, String>();

	public LzwUploadBean() {
	}

	public LzwUploadBean(String driver, String url) {
		super();
		this.driver = driver;
		this.url = url;
	}

	/**
	 * <pre><h1>
	 * 解析Form表单
	 * </h1>
	 *                             
	 *                             form表单的enctype必须设置为：enctype=&quot;multipart/form-data&quot;
	 * </br>
	 *                             此方法为首方法，用于解析form表单中的属性。执行此方法解析表单值后，方可通过 {@link #getParameter(String)}方法获得表单的参数信息
	 * <br>
	 *                             
	 *                             @param contentType
	 *                                        传入内容类型信息。例如：request.getContentType();
	 *                             @param inputStream
	 *                                        传入请求的输入流。例如：request.getInputStream();
	 * </pre>
	 */
	private void resolverForm() {
		InputStream inputStream = null;
		try {
			inputStream = pageContext.getRequest().getInputStream();
		} catch (IOException e2) {
			e2.printStackTrace();
		}
		String contentType = pageContext.getRequest().getContentType();
		if (!isMultipar(contentType) || inputStream.equals(InputStreamState))
			return;
		if (contentType != null && inputStream != null) {
			InputStreamState = inputStream;
			int data;
			StringBuffer datastr = new StringBuffer();
			lzwParameter.clear();
			try {
				while ((data = inputStream.read()) != -1) {
					datastr.append((char) data);
					if (fileSize > 0 && datastr.length() > fileSize) {
						datastr = null;
						errorMessage = "文件超出大小限制。";
						lzwParameter.put("error", errorMessage);
						throw new Exception("文件超出大小限制。");
					} else
						lzwParameter.put("error", errorMessage);
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
									lzwParameter.put(arg, argContent);
								}
							}
							if (line.equals("\r")) {
								lzwParameter.put(name, formFileds[i].substring(
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
	 * 上传表单数据到数据库中
	 * </h1>
	 *                             应用实例：uploadToDB(driver,url,&quot;tab_oneFormUploadFile&quot;,&quot;钟尉&quot;,&quot;男&quot;,&quot;26&quot;)
	 *                             
	 *                             @param driver
	 *                                        JDBC驱动路径。
	 * <br>
	 *                                        例如SQLServer的“com.microsoft.jdbc.sqlserver.SQLServerDriver”
	 *                             @param url
	 *                                        数据库的访问路径。
	 * <br>
	 *                                        例如SQLServer的“jdbc:microsoft:sqlserver://localhost:1433;DatabaseName=db_database11;user=sa&quot;
	 * <br>
	 *                                             路径中需要包含数据库名称和用户名与密码。
	 *                             @param tabName
	 *                                        指定数据库中表的名称，表单数据将保存到这个数据表中。
	 *                             @param valuesArg
	 *                                        对应表的字段值。
	 * </pre>
	 */
	public boolean uploadToDB(String driver, String url, String tabName,
			String... valuesArg) {
		resolverForm();
		if (getParameter("Submit") != null && getParameter("file") != null) {
			try {
				Class.forName(driver);
				conn = DriverManager.getConnection(url, user, password);
				String values = " values(?";
				for (int i = 1; i < valuesArg.length; i++) {
					values += ",?";
				}
				values += ")";
				PreparedStatement pst = conn.prepareStatement("insert into "
						+ tabName +"(file)"+ values);
				for (int i = 0; i < valuesArg.length; i++)
					if (valuesArg[i] != null)
						pst
								.setBytes(i + 1, valuesArg[i]
										.getBytes("ISO-8859-1"));
					else {
						pst.setString(i + 1, null);
						throw new Exception("有参数为空");
					}
				pst.execute();
				pst.close();
				conn.close();
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return true;
		} else
			return false;
	}

	/**
	 * <pre><h1>
	 * 打印数据到输出流
	 * </h1>
	 *                             
	 *                             @param tabName
	 *                                        数据表的名称
	 *                             @param condition
	 *                                        查询条件。例如“name='李钟尉'”。
	 *                             @param column
	 *                                        要获取的字段，应选择存储图片信息的字段。例如：“file”。
	 *                             @param outputStream
	 *                                        输出流，获得的字段信息将输出到该流中，可通过request获得。
	 * <br>
	 *                                        例如：“request.getOutputStream()”。
	 * </pre>
	 */
	public void printOutputStreamFromDB(String tabName, String condition,
			String column, OutputStream outputStream) {
		Statement st = null;
		ResultSet rs = null;
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);
			st = conn.createStatement();
			rs = st.executeQuery("select " + column + " from " + tabName
					+ " where " + condition);
			while (rs.next()) {
				outputStream.write(rs.getBytes(1));
			}
			outputStream.close();
			rs.close();
			st.close();
			conn.close();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * <pre><h1>
	 * 上传文件到服务器
	 * </h1>
	 *                             
	 *                             @param filePath
	 *                                        服务器存放文件的路径
	 * </pre>
	 */
	public boolean uploadToFile(String filearg, String filename, String filePath) {
		if (filename == null || filename.equals("")) {
			filename = System.currentTimeMillis()
					+ new File(getParameter(filearg + "_filename")).getName();
		}
		String contentType = pageContext.getRequest().getContentType();
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
		return lzwParameter.get(param);
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
		return lzwParameter.keySet();
	}

	/**
	 * <pre><h1>
	 * 设置JDBC驱动
	 * </h1>
	 *                             @param driver JDBC的驱动。例如默认的：“com.microsoft.jdbc.sqlserver.SQLServerDriver”
	 * </pre>
	 */
	public void setDriver(String driver) {
		this.driver = driver;
	}

	/**
	 * <pre><h1>
	 * 设置JDBC访问路径
	 * </h1>
	 *                             @param url JDBC访问路径。例如默认的：
	 *                             “jdbc:microsoft:sqlserver://localhost:1433;DatabaseName=db_database11”
	 * </pre>
	 */
	public void setUrl(String url) {
		this.url = url;
	}

	/**
	 * <pre><h1>
	 * 设置登录数据库的用户密码
	 * </h1>
	 *                            @param password 用户密码，默认值为空
	 * </pre>
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * <pre><h1>
	 * 设置登录数据库的用户名称
	 * </h1>
	 *                            @param user 用户名称，默认值为“sa”
	 * </pre>
	 */
	public void setUser(String user) {
		this.user = user;
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
	public void setPageContext(PageContext pageContext) {
		this.pageContext = pageContext;
	}

	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}
}
