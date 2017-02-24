package bean;

import java.io.File;

public class RenameBean {
	private String fileName;//源文件名
	private String newFileName;//新文件名
	boolean fileInfo = false;
	public boolean renameFile() {
		File file = new File(fileName);//根据源文件名创建File对象
		if (file.exists()) {//判断文件是否存在
			//根据源文件的父目录和新文件名，组合创建一个新的File对象
			File newFile = new File(file.getParent()+File.separator+newFileName);
			boolean res = file.renameTo(newFile);//对源文件进行重命名
			if (res)
				fileInfo = true;//重命名成功，返回true
		}
		return fileInfo;
	}

	public void setNewFileName(String newFileName) {
		this.newFileName = newFileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
}
