<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<jsp:useBean id="popdialog" class="com.lh.bean.PopDialog"></jsp:useBean>
<jsp:setProperty property="message" name="popdialog"  value="注册成功！"/>
<jsp:setProperty property="url"  name="popdialog" value="index.jsp"/>
<jsp:getProperty property="dialogStr" name="popdialog"/>
