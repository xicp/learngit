package bean;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class ShowFileInfoBean {
	private String filePath;//�ļ�·���ַ���
	Map<String, String> fileInfo = new HashMap<String, String>();//����洢�ļ������Map����
	public Map getFileInfo() {
		try {
			File file = new File(filePath);//�����ļ�����
			if (!file.isFile())//�ж��Ƿ�Ϊ�ļ�
				return null;
			//���´����ʾ���ļ���Ϣ��ӵ�Map������
			fileInfo.put("name", file.getName());
			fileInfo.put("absPath", file.getCanonicalPath());
			fileInfo.put("parentDir", file.getParentFile().getParent());
			fileInfo.put("hidden", file.isHidden()?"����":"δ����");
			fileInfo.put("readOnly", file.canWrite()?"��д":"ֻ��");
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
