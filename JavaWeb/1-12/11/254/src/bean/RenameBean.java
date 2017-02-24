package bean;

import java.io.File;

public class RenameBean {
	private String fileName;//Դ�ļ���
	private String newFileName;//���ļ���
	boolean fileInfo = false;
	public boolean renameFile() {
		File file = new File(fileName);//����Դ�ļ�������File����
		if (file.exists()) {//�ж��ļ��Ƿ����
			//����Դ�ļ��ĸ�Ŀ¼�����ļ�������ϴ���һ���µ�File����
			File newFile = new File(file.getParent()+File.separator+newFileName);
			boolean res = file.renameTo(newFile);//��Դ�ļ�����������
			if (res)
				fileInfo = true;//�������ɹ�������true
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
