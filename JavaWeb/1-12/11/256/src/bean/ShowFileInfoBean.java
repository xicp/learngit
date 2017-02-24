package bean;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class ShowFileInfoBean {
	private String filePath;//文件路径字符串
	Map<String, String> fileInfo = new HashMap<String, String>();//定义存储文件对象的Map集合
	public Map getFileInfo() {
		try {
			File file = new File(filePath);//创建文件对象
			if (!file.isFile())//判断是否为文件
				return null;
			//以下代码表示将文件信息添加到Map集合中
			fileInfo.put("name", file.getName());
			fileInfo.put("absPath", file.getCanonicalPath());
			fileInfo.put("parentDir", file.getParentFile().getParent());
			fileInfo.put("hidden", file.isHidden()?"隐藏":"未隐藏");
			fileInfo.put("readOnly", file.canWrite()?"可写":"只读");
			fileInfo.put("lastModified", new Date(file.lastModified()).toLocaleString());
			fileInfo.put("length", String.format("%#,.2fK",file.length()/1024.0));
		} catch (IOException e) {
			e.printStackTrace();
		}
		return fileInfo;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
}
