<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="/WEB-INF/tabletag.tld" prefix="tagtable"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>�Զ���ͼƬ�����ǩ</title>
<style>
TABLE {
	BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px
}
TD{
	FONT: 12px ����;
}
</style>
</head>
<body>
<%!
  	String[] tableTitle = {"����","�Ա�","����","���֤��","������ò","��ͥ�绰","��ͥ��ַ"};
	String 	sqlSelect = "SELECT top 6 name, sex, age, sfzhm, zzmm, jtdh, jtdz FROM docu_stu_info ";
  %>
<tagtable:tbg tableTitle="<%=tableTitle %>" sqlSelect="<%=sqlSelect %>"/>
</body>
</html>
