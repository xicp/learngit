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
	 * ����Form��
	 * </h1>
	 *                             
	 *                             form����enctype��������Ϊ��enctype=&quot;multipart/form-data&quot;
	 * </br>
	 *                             �˷���Ϊ�׷��������ڽ���form���е����ԡ�ִ�д˷���������ֵ�󣬷���ͨ�� {@link #getParameter(String)}������ñ��Ĳ�����Ϣ
	 * <br>
	 *                             
	 *                             @param contentType
	 *                                        ��������������Ϣ�����磺request.getContentType();
	 *                             @param inputStream
	 *                                        ��������������������磺request.getInputStream();
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
						errorMessage = "�ļ�������С���ơ�";
						lzwParameter.put("error", errorMessage);
						throw new Exception("�ļ�������С���ơ�");
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
	 * �ϴ������ݵ����ݿ���
	 * </h1>
	 *                             Ӧ��ʵ����uploadToDB(driver,url,&quot;tab_oneFormUploadFile&quot;,&quot;��ξ&quot;,&quot;��&quot;,&quot;26&quot;)
	 *                             
	 *                             @param driver
	 *                                        JDBC����·����
	 * <br>
	 *                                        ����SQLServer�ġ�com.microsoft.jdbc.sqlserver.SQLServerDriver��
	 *                             @param url
	 *                                        ���ݿ�ķ���·����
	 * <br>
	 *                                        ����SQLServer�ġ�jdbc:microsoft:sqlserver://localhost:1433;DatabaseName=db_database11;user=sa&quot;
	 * <br>
	 *                                             ·������Ҫ�������ݿ����ƺ��û��������롣
	 *                             @param tabName
	 *                                        ָ�����ݿ��б�����ƣ������ݽ����浽������ݱ��С�
	 *                             @param valuesArg
	 *                                        ��Ӧ����ֶ�ֵ��
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
						throw new Exception("�в���Ϊ��");
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
	 * ��ӡ���ݵ������
	 * </h1>
	 *                             
	 *                             @param tabName
	 *                                        ���ݱ������
	 *                             @param condition
	 *                                        ��ѯ���������硰name='����ξ'����
	 *                             @param column
	 *                                        Ҫ��ȡ���ֶΣ�Ӧѡ��洢ͼƬ��Ϣ���ֶΡ����磺��file����
	 *                             @param outputStream
	 *                                        ���������õ��ֶ���Ϣ������������У���ͨ��request��á�
	 * <br>
	 *                                        ���磺��request.getOutputStream()����
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
	 * ��ȡ����ָ������
	 * </h1>
	 *                             ������� {@link #resolverForm(String, InputStream)}��������form���Ժ󣬲ſ��Ե��ô˷������������Ϊ�ա�
	 *                             
	 *                             @param param
	 *                                        ��������
	 *                             @return String ��������
	 * </pre>
	 */
	public String getParameter(String param) {
		resolverForm();
		return lzwParameter.get(param);
	}

	/**
	 * <pre><h1>
	 * ���form�������в������Ƶļ���
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
	 * ����JDBC����
	 * </h1>
	 *                             @param driver JDBC������������Ĭ�ϵģ���com.microsoft.jdbc.sqlserver.SQLServerDriver��
	 * </pre>
	 */
	public void setDriver(String driver) {
		this.driver = driver;
	}

	/**
	 * <pre><h1>
	 * ����JDBC����·��
	 * </h1>
	 *                             @param url JDBC����·��������Ĭ�ϵģ�
	 *                             ��jdbc:microsoft:sqlserver://localhost:1433;DatabaseName=db_database11��
	 * </pre>
	 */
	public void setUrl(String url) {
		this.url = url;
	}

	/**
	 * <pre><h1>
	 * ���õ�¼���ݿ���û�����
	 * </h1>
	 *                            @param password �û����룬Ĭ��ֵΪ��
	 * </pre>
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * <pre><h1>
	 * ���õ�¼���ݿ���û�����
	 * </h1>
	 *                            @param user �û����ƣ�Ĭ��ֵΪ��sa��
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
						"������Form����enctype����Ϊ��\"multipart/form-data\"");
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
	public void setPageContext(PageContext pageContext) {
		this.pageContext = pageContext;
	}

	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}
}
