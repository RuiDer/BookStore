<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="banner.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>bookstore</title>
</head>
<%@include file="common.jsp" %>

<center>
	<p><b> <a href="<%=request.getContextPath() %>/catalog.jsp>">查看所有目录 </a></b>
	
	<form action=bookdetails.jsp method="POST">
	<h3> 请输入查询信息 </h3>
	<b> 书的编号 </b>
	<input type="text" size="20" name="bookId" value=""><br><br>
	<center> <input type=submit value="查询"></center>
	</form>
</center>


</body>
</html>