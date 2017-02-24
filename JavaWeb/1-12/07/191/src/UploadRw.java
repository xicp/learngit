

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.apache.commons.fileupload.DiskFileUpload;
import org.apache.commons.fileupload.FileItem;

public class UploadRw extends HttpServletRequestWrapper {

	private static final String MULTIPART_HEADER = "Content-type";//文件类型

	private boolean multipart;	//确认上传文件
								//保存提交的数据
	private Map<String, Object> param = new HashMap<String, Object>();

	@SuppressWarnings("all")
	public UploadRw(HttpServletRequest request) {

		super(request);
		                        //判断是否为上传文件
		multipart = request.getHeader(MULTIPART_HEADER)!= null
				&& request.getHeader(MULTIPART_HEADER).startsWith(
						"multipart/form-data");
		if (multipart){
			try {
				                //使用apAche自带的工具解析
				DiskFileUpload upload = new DiskFileUpload();
				upload.setHeaderEncoding("utf8");

								//获得所有的文本域与文件域
				List<FileItem> fileItems = upload.parseRequest(request);

				for (Iterator<FileItem> it = fileItems.iterator(); it.hasNext();) {
					            //使用遍历
					FileItem item = it.next();
					if (item.isFormField()) {
						        //如果是文本域直接放到map里也就是保存内容
						param.put(item.getFieldName(), item.getString("utf8"));
					} else {
						        //否则为文件先获取文件名称
						String filename = item.getName().replace("\\", "/");
							    //替换特殊字符或字符串
						filename = filename.substring(filename.lastIndexOf("/") + 1);
						        //保存到系统临时文件夹中
						File file = new File(System.getProperty("java.io.tmpdir"), filename);
						        //保存文件内容
						OutputStream ous = new FileOutputStream(file);
						ous.write(item.get());
						ous.close();
						        //放入map中
						param.put(item.getFieldName(), file);
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	public Object getAttribute(String name) {

		// 如果是上传文件就到map中取值
		if (multipart && param.containsKey(name)) {
			return param.get(name);
		}
		return super.getAttribute(name);
	}
	public String getParameter(String name) {
		if (multipart && param.containsKey(name)) {
			return param.get(name).toString();
		}
		return super.getParameter(name);
	}
	public static void main(String[] args) {
		System.out.println(System.getProperties().toString().replace(", ",
				"\r\n"));
	}
}
